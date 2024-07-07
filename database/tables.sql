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
	[created_at] datetime2 not null default getutcdate(),
	[login_token] char(64)
);

create table [user] (
	[id] int primary key identity,
	[account_id] int foreign key references [account]([id]) on delete set null, -- This means when user delete their account, the profile doesn't get deleted.
	[first_name] nvarchar(255),
	[last_name] nvarchar(255),
	[gender] bit default(0), --0 is male, 1 is female
	[date_of_birth] date,
	[profile_image] nvarchar(max)
);

create table [category] (
	[id] int primary key identity,
	[name] nvarchar(255) unique not null
);

create table [manager_details](
	[id] int primary key identity,
	[user_id] int foreign key references [user]([id]), -- user doesn't get deleted when account is deleted so this live too.
	[org_name] nvarchar(255) unique not null,
	[description] nvarchar(max),
	[country] nvarchar(255),
	[logo_path] nvarchar(max)
);

-- If manager remove a teacher, only the [teacher_details] record get deleted, so teacher go back to normal user (student) because they still have their [user] record.
-- Manager often use company email address for their employee (eg: fpt.edu.vn); that means if they remove a teacher, they also take back the email address.
-- This means the [account] record of that teacher still in the database, but they can't login.
create table [teacher_details](
	[id] int primary key identity,
	[user_id] int foreign key references [user]([id]), -- user doesn't get deleted when account is deleted so this live too.
	[manager_id] int foreign key references [manager_details]([id]) on delete cascade, -- manager doesn't get delete by deleting account, so this only happen when the admin explicitly cause it.
	[position] nvarchar(255),
	[bio] nvarchar(max)
);

--TODO: create trigger to cascade course related info when delete course
create table [course] (
	[id] int primary key identity,
	[manager_id] int not null foreign key references [manager_details]([id]) on delete cascade,
	[title] nvarchar(255) not null,
	[description] nvarchar(max),
	[language] nvarchar(255),
	[category_id] int foreign key references [category]([id]) on delete set null,
	[price] decimal(19, 4) not null,
	[image_path] nvarchar(max),
	[active] bit not null default(0),
	[archived] bit not null default(0),
	[created_at] datetime2 not null default getutcdate(),
	[updated_at] datetime2 not null default getutcdate()
);

create table [course_content](
	[id] int primary key identity,
	[course_id] int not null foreign key references [course]([id]),
	[type] varchar(255) not null check([type] in ('Lesson', 'Quiz')),
	[title] nvarchar(255) not null,
	[quiz_description] nvarchar(max),
	[content] ntext not null,
	[quiz_weight] decimal(3, 2) default(0.00) check([quiz_weight] >= 0.00 and [quiz_weight] <= 1.00),
	[created_by] int foreign key references [teacher_details]([id]) on delete set null,
	[created_at] datetime2 not null default getutcdate(),
	[updated_at] datetime2 not null default getutcdate()
);

create table [payment](
	[id] int primary key identity,
	[course_id] int foreign key references [course]([id]) on delete set null,
	[student_id] int not null foreign key references [account]([id]) on delete cascade,
	[purchase_price] decimal(19, 4) not null,
	[created_at] datetime2 not null default getutcdate(),
);

create table [enrollment](
	[id] int primary key identity,
	[course_id] int foreign key references [course]([id]) on delete set null,
	[student_id] int not null foreign key references [user]([id]) on delete cascade,
	[grade] decimal(19, 4),
	[passed] bit not null default(0),
);

--TODO: create trigger to cascade this when delete quiz or user
create table [student_quiz_result](
	[quiz_id] int foreign key references [course_content]([id]),
	[student_id] int foreign key references [user]([id]),
	[grade] decimal(19, 4) not null,
	[passed] bit not null,
	primary key([quiz_id], [student_id])
);

--TODO: create trigger to cascade this when delete course or teacher details
create table [teacher_assign_course](
	[course_id] int foreign key references [course]([id]),
	[teacher_id] int foreign key references [teacher_details]([id])
	primary key([course_id], [teacher_id])
);

create table [request](
	[id] int primary key identity,
	[requester_id] int foreign key references [manager_details]([id]) on delete set null, -- This is available when there is manager sending request
	[type] varchar(255) not null check([type] in ('Contact', 'Account')),
	[requester_name] nvarchar(255),
	[message] nvarchar(max),
	[reply_message] nvarchar(max),
	[status] varchar(255) not null check([status] in ('Pending', 'Accepted', 'Rejected')),
	[requested_at] datetime2 not null default getutcdate(),
	[contact_representative_name] nvarchar(255),
	[contact_email] varchar(255),
	[contact_phone] varchar(22),
	[account_data] ntext -- this is raw json
	-- eg: [ 
	--         {
	--             "email": "abc@gmail.com",
	--             "role": "Teacher",
	--             "manager": "FPT University",
	--             "country": null,
	--             "position": "Lecturer"
	--         }
	--     ]
);