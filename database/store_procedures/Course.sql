create or alter procedure spGetAllContentsOfCourse
	@Id int
as
begin
	select * from [lesson] where [course_id] = @Id;
	select * from [quiz] where [course_id] = @Id;
end
go

create or alter procedure spSearchCourses
	@Query nvarchar(max)
as
begin
	select distinct c.*, cate.[name] as category_name, md.[org_name]
	from [course] as c
	left join [category] as cate on c.[category_id] = cate.[id]
	left join [manager_details] as md on c.[manager_id] = md.[id]
	left join [lesson] as l on l.[course_id] = c.[id]
	left join [quiz] as q on q.[course_id] = c.[id]
	left join [teacher_details] as td on td.[id] = l.[created_by] or td.[id] = q.[created_by]
	left join [user] as u on td.[user_id] = u.[id]
	where c.[title] like '%' + @Query + '%'
	or c.[description] like '%' + @Query + '%'
	or cate.[name] like '%' + @Query + '%'
	or md.[org_name] like '%' + @Query + '%'
	or u.[first_name] + u.[last_name] like '%' + @Query + '%';
end
go