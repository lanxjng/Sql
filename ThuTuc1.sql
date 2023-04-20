
----Tong
create procedure TinhTong
@a int, @b int, @Tong int out
as
begin
set @Tong = @a + @b
end
--
declare @Sum int
Exec TinhTong 20,50, @Sum out
select 'Tong la : '= @Sum

---Hieu
create procedure TinhHieu
@a int, @b int, @Hieu int out
as
begin
set @Hieu = @a - @b
end
--
declare @Kq int
Exec TinhHieu 50, 20, @Kq out
select 'Hieu la : '= @Kq

---Tich
create procedure TinhTich
@a float, @b float, @Tich float out
as
begin
set @Tich = @a * @b
end
--
declare @Kq float
Exec TinhTich 5, 3, @Kq out
select 'Tich la : '= @Kq

---Thuong
create procedure TinhThuong
@a float, @b float, @Thuong float out
as
begin
set @Thuong = @a / @b
end
--
declare @Kq float
Exec TinhThuong 52560,5 , @Kq out
select 'Thuong la : '= ROUND(@Kq,2)

----Tim Max
create procedure TimMax
--alter procedure TimMax
@a int, @b int, @c int,@d int, @Max int output
as
begin
set @Max =@a
if @Max < @b
	set @Max = @b
if @Max <@c
	set @Max = @c
if @Max <@d
	set @Max = @d
end
--
declare @Kq int
exec TimMax 2,12,26,38, @Kq output
select 'Max la : '=@Kq

--Tim Min
create procedure TimMin
@a int, @b int, @c int, @Min int output
as
begin
set @Min =@a
if @Min > @b
	set @Min = @b
if @Min >@c
	set @Min = @c
end
--
declare @Kq int
exec TimMin 2,12,6, @Kq output
select 'Min la : '=@Kq

---Ktra Snt
alter procedure KtraSNT
@n int
as
begin
declare @i int, @kt bit
set @i =2
set @kt =1
while @i < @n
	begin
	if @n % @i =0
	begin
		set @kt =0
		break
		end
	set @i+=1
	end
return @kt
end

--
declare @kq bit
exec @kq =KtraSNT 5
select @kq












