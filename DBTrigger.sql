-- Trigger này hạn chế độ tuổi người dùng được phép đăng tải nội dung (tối thiểu 18 chẳng hạn)
create trigger CheckAge on dbo.Video
	after insert 
as
begin
	set nocount on;

	declare @User_ID int;
	set @User_ID = (select [User_ID] from inserted)

	declare @new_B_date date;
	set @new_B_date = (select B_date from dbo.[User] where ID = @User_ID)

	if (datediff(year, @new_B_date, GETDATE()) < 18)
	begin
		print 'This user is not old enough to upload video.'
		rollback
	end
end

-- test case
-- in this case, the user with id 5 is over 18, while the user with id = 6 is under 18
insert into dbo.Video (Title, [Description], [User_ID])
values ('Overwatch demo', 'Gameplay demo', '5');

insert into dbo.Video (Title, [Description], [User_ID])
values ('Minecraft demo', 'Gameplay demo', '6');