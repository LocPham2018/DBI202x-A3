-- Tổng hợp các Video cùng lượng Like và Comment theo User
create procedure GetVidStatsByUser (@User_ID int)
as
begin
	set nocount on;

	select
		Title,
		(select count([User_ID]) from dbo.[Like] l where v.Video_ID = l.Video_ID) as Likes,
		(select count([User_ID]) from dbo.[Comment] c where v.Video_ID = c.Video_ID) as Comments
	from dbo.Video v
	where v.[User_ID] = @User_ID;
end

-- Test case
exec GetVidStatsByUser 1;
exec GetVidStatsByUser 2;
exec GetVidStatsByUser 4;
exec GetVidStatsByUser 5;