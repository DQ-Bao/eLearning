create or alter procedure spGetAllContentsOfCourse
	@Id int
as
begin
	select * from [lesson] where [course_id] = @Id;
	select * from [quiz] where [course_id] = @Id;
end
go