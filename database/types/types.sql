create type Account as table (
    [email] varchar(255) unique not null,
    [activated] bit not null,
    [role_name] nvarchar(255) not null
);