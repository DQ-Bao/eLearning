create or alter procedure spGetUserByEmail
	@Email varchar(max)
as
begin
	select u.[id], u.[first_name], u.[last_name], u.[gender], u.[date_of_birth], u.[profile_image],
	acc.[id] as [account_id], acc.[email], acc.[password_hash], acc.[activated], acc.[created_at], r.[name] as [role_name]
	from [user] as u
	join [account] as acc on u.[account_id] = acc.[id]
	join [role] as r on acc.[role_id] = r.[id]
	where acc.[email] = @Email;
end
go

create or alter procedure spGetUserByLoginToken
	@Token char(64)
as
begin
	select u.[id], u.[first_name], u.[last_name], u.[gender], u.[date_of_birth], u.[profile_image],
	acc.[id] as [account_id], acc.[email], acc.[password_hash], acc.[activated], acc.[created_at], r.[name] as [role_name]
	from [user] as u
	join [account] as acc on u.[account_id] = acc.[id]
	join [role] as r on acc.[role_id] = r.[id]
	where acc.[login_token] = @Token;
end
go

create or alter procedure spRegisterAccount
	@Email varchar(max),
	@Password char(69),
	@Role nvarchar(255),
	@Success bit output
as
begin
	select @Success = 0;
	declare @output table (account_id int);
	-- insert unactivated account
	insert into [account]([email], [password_hash], [activated], [role_id])
	output inserted.[id] into @output(account_id)
	values(
		@Email, @Password, 0, (select [id] from [role] where [name] = @Role)
	);
	
	-- insert empty user profile
	declare @account_id int;
	select @account_id = [account_id] from @output;
	if @account_id is not null
	begin
		insert into [user]([account_id]) values(@account_id);
		select @Success = 1;
	end
end
go

create or alter procedure spAddAccountList
	@AccountList AccountData readonly,
	@Success bit output
as
begin
	set nocount on;
	begin try
		begin transaction;
		-- Add manager and student first then teachers
		declare @added_accounts table ([account_id] int);

		insert into [account]([email], [activated], [role_id])
		output inserted.[id] into @added_accounts([account_id])
		select al.[email], 0, (select [id] from [role] where [name] = al.[role])
		from @AccountList as al where al.[role] in (N'Manager', N'Student');

		insert into [user]([account_id])
		select [account_id] from @added_accounts;

		insert into [manager_details]([user_id], [org_name], [country])
		select u.[id], al.[manager], al.[country]
		from @AccountList as al
		join [account] as acc on al.[email] = acc.[email]
		join [user] as u on acc.[id] = u.[account_id]
		where al.[role] = N'Manager';

		-- Add teachers
		declare @valid_teachers table (
			[email] varchar(255) unique not null,
			[role] nvarchar(255) not null,
			[manager] nvarchar(255),
			[country] nvarchar(255),
			[position] nvarchar(255)
		);
		
		-- Filter out invalid teachers whose manager doesn't exist
		insert into @valid_teachers([email], [role], [manager], [country], [position])
		select *
		from @AccountList as al
		where al.[role] = N'Teacher'
		and al.[manager] is not null
		and exists (select 1 from [manager_details] as md where md.[org_name] = al.[manager]);

		declare @added_teachers table ([account_id] int);
		insert into [account]([email], [activated], [role_id])
		output inserted.[id] into @added_teachers([account_id])
		select al.[email], 0, (select [id] from [role] where [name] = al.[role])
		from @valid_teachers as al;

		insert into [user]([account_id])
		select [account_id] from @added_teachers;

		insert into [teacher_details]([user_id], [manager_id], [position])
		select u.[id], md.[id], al.[position]
		from @valid_teachers as al
		join [account] as acc on al.[email] = acc.[email]
		join [user] as u on acc.[id] = u.[account_id]
		join [manager_details] as md on al.[manager] = md.[org_name];

		commit transaction;
		set @Success = 1;
	end try
	begin catch
		rollback transaction;
		set @Success = 0;
	end catch;
end
go

create or alter procedure spActivateAccount
	@Email varchar(max),
	@Success bit output
as
begin
	select @Success = 0;
	update [account]
	set [activated] = 1
	where [email] = @Email;

	declare @act bit;
	select @act = [activated] from [account] where [email] = @Email;
	if @act = 1
	begin
		select @Success = 1;
	end
end
go