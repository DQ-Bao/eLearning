delete from [role];
delete from [account];
delete from [category];
delete from [manager_details];
delete from [teacher_details];
delete from [course_content];
delete from [payment];
delete from [enrollment];
delete from [student_quiz_result];
delete from [teacher_assign_course];
delete from [course];
delete from [user];
delete from [request];

DBCC CHECKIDENT ('role', RESEED, 0);
GO
DBCC CHECKIDENT ('account', RESEED, 0);
GO
DBCC CHECKIDENT ('category', RESEED, 0);
GO
DBCC CHECKIDENT ('manager_details', RESEED, 0);
GO
DBCC CHECKIDENT ('teacher_details', RESEED, 0);
GO
DBCC CHECKIDENT ('course_content', RESEED, 0);
GO
DBCC CHECKIDENT ('payment', RESEED, 0);
GO
DBCC CHECKIDENT ('enrollment', RESEED, 0);
GO
DBCC CHECKIDENT ('course', RESEED, 0);
GO
DBCC CHECKIDENT ('user', RESEED, 0);
GO
DBCC CHECKIDENT ('request', RESEED, 0);
GO

insert into [role]([name])
values (N'Manager'), (N'Teacher'), (N'Student');