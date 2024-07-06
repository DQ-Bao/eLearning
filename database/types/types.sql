create type AccountData as table (
    [email] varchar(255) unique not null,
    [role] nvarchar(255) not null,
	-- For manager account
	[manager] nvarchar(255),
	[country] nvarchar(255),
	-- For teacher account
	[position] nvarchar(255)
);