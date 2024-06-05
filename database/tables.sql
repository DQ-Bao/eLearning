create table [role] (
	[id] int primary key identity,
	[name] nvarchar(255) unique not null
);

create table [account] (
	[id] int primary key identity,
	[email] varchar(255) unique not null,
	[password_hash] char(69),
	[activated] bit not null,
	[role_id] int foreign key references [role]([id]) on delete set null,
	[created_at] datetime2 not null default getutcdate()
);

create table [user] (
	[id] int primary key identity,
	[account_id] int foreign key references [account]([id]) on delete set null,
	[first_name] nvarchar(255),
	[last_name] nvarchar(255),
	[gender] bit default 0, --0 is male, 1 is female
	[date_of_birth] date default '1999-01-01',
	[profile_image] nvarchar(max)
);