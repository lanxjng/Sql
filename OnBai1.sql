--Cau1
create database QL_HocSinh
create table HocSinh
(MaHs varchar(10) primary key,
HoDem nvarchar(10),
Ten nvarchar(20),
NgaySinh date,
NoiSinh nvarchar(50),
DiemDauVao float)
--Cau2
create procedure Nhap
(@MaHs varchar(10),@HoDem nvarchar(10),@Ten nvarchar(20),@NgaySinh date,@NoiSinh nvarchar(50),@DiemDauVao float)
as
Insert into HocSinh
values(@MaHs,@HoDem,@Ten,@NgaySinh,@NoiSinh,@DiemDauVao)
---
exec Nhap 'hs10','Pham','Hai','04/03/2007','Lang Son',5

--Cau3
create procedure Diem
@Diem float
as
select *  from HocSinh
where DiemDauVao >= @Diem
---
exec Diem 9

--Cau4
create procedure Xoa
@Diem float
as
delete from HocSinh
where DiemDauVao <@Diem
select * from HocSinh
---
exec Diem 6
--Cau5
create procedure SuaNoiSinh
(@MaHs varchar(10), @NoiSinh nvarchar(50))
as
update HocSinh
set NoiSinh = @NoiSinh
where MaHs = @MaHs
select * from HocSinh
---
exec SuaNoiSinh 'hs01','Hai Phong'



	




