---Ktra Snt
create procedure KtraSNT
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
exec @kq =KtraSNT 17
select "Kiem tra Snt: " = @kq
----TimSNT nho hon n , su dung thu tuc KtraSnt o tren

create procedure TimSnt
@n int
as
begin
declare @i int, @k bit
set @i =2
select 'So nguyen to nho hon ' + CAST (@n as varchar(5)) + ' La: '
while @i <@n
	begin
		exec @k =KtraSNT @i
		if @k =1
		select cast (@i as varchar(3)) + ':'
		set @i = @i+1
		end
end
---

exec  TimSnt 5

---Ktra chan le cach truc tiep
create procedure KtraChanLe
@n int
as
begin
if @n % 2 = 0
print cast (@n as varchar(5)) +' La so chan '
else 
print cast (@n as varchar(5)) +' La so le'
end
---
exec KtraChanLe 15

---Ktra Chan Le cach gian tiep

create proc KtraChanLe2
@n int
as
begin
declare @k bit
if @n %2 =0
set @k =0
else
set @k =1
return @k
end

---
declare @kq bit
exec @kq = KtraChanLe2 4
select " Ktra Chan Le " = @kq

---Tinh tong tu cac so tu 1 den n

alter proc TinhTongTu1DenN
@n int
as
begin
declare @Tong int =0, @i int =0

while @i <= @n
begin
	set @Tong += @i
	set @i +=1
end
return @Tong
end
---
declare @kq int
exec @kq = TinhTongTu1DenN 5
print " Tong tu 1 den n " = @kq

--- Viet thu tuc giai pt bac nhat
alter proc GiaiPtBac1
@a float, @b float
as
begin
declare @x float
if @a = 0
	print 'Phuong trinh vo nghiem'
else 
set @x = - (@b) / @a
	print @x
end
---
exec  GiaiPtBac1 0,6

---Nhap thang -> ngay trong nam

alter proc SoNgayTrongThang
@SoThang int, @SoNam int
as
begin
declare @SoNgay int
if @SoThang <1 and @SoThang >12
	print 'Ban nhap sai thang'
else
	begin 
	set @SoNgay =
	case
		when @SoThang in(1,3,5,7,8,10,12) then 31
		when @SoThang in(4,6,9,11) then 30
		when (@SoThang =2) and (@SoNam %4 =0) then 29
		else 28
	end
	end
print 'So ngay trong thang ' +cast(@SoThang as varchar(5)) +' la ' + cast (@SoNgay as varchar(5)) + ' ngay'
end

exec SoNgayTrongThang 10, 2003
