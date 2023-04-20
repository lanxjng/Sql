create database QL_DiemSv
---Tạo bảng
create table SinhVien
(
MaSv varchar(10) primary key,
HoDem nvarchar(10),
Ten nvarchar(20),
NgaySinh date
NoiSinh nvarchar(50)
)
create table MonHoc
(
MaMon varchar(10) primary key,
TenMon nvarchar(30),
Sodvht float
)
create table Diem
(
MaSv varchar(10) references SinhVien,
MaMon varchar(10) references MonHoc,
Diem float
)
---Cau1
alter table SinhVien
add constraint PK_SinhVien primary key (MaSv)

---Cau2
alter table MonHoc
add HocKy float

--Cau3
Insert into SinhVien
values('sv01','Man', 'Lan', '05/10/2003','Bac Ninh'),
('sv02','Nguyen', 'Ky', '05/10/2005','Bac Giang'),
('sv03','Hoang', 'Khuong', '05/10/2006','Bac Kan'),
('sv04','Tran', 'Dat', '05/10/2004','Ha Noi'),
('sv05','Doan', 'Truong', '05/10/2001','Hai Duong')
--
Insert into MonHoc
values('Sql','Sql Server',7.8,3),
('C#','Lap Trinh Windows',8,2),
('Android','Lap Trinh Android',7.8,1),
('Web','Lap Trinh Web',10,2),
('PT','Phan Tich Thiet Ke He Thong',5,4)
--
Insert into Diem
values('sv01', 'Sql',9),
('sv02', 'C#',5),
('sv03', 'Web',7),
('sv04', 'PT',4),
('sv05', 'Sql',10)

--Cau4
alter table SinhVien
add DiemDauVao float,
DiaChi nvarchar(50)

update SinhVien
set DiemDauVao = '8',
DiaChi ='BN'
where MaSv ='sv01'

create procedure CapNhat
(@DiemDauVao float, @DiaChi nvarchar(50), @MaSv varchar(10))
as
update SinhVien
set DiemDauVao = @DiemDauVao,
DiaChi = @DiaChi
where MaSv = @MaSv
---
exec CapNhat 10,'BN','sv05'

---Cau5
alter table SinhVien
drop column DiaChi

---Cau6
update SinhVien
set NoiSinh ='Ha Noi'
where MaSv ='sv04'

---Cau7
alter table SinhVien
add DienThoai varchar(10)

---Cau8
delete from SinhVien
where DiemDauVao < 8 and NgaySinh = '05/10/2003'

---Cau9
select HocKy, COUNT(*) as SoLgMonHoc
from MonHoc
group by HocKy

---Cau10
select HocKy, SUM(Sodvht) as TongSoDvht
from MonHoc
group by HocKy

---Cau11
select HoDem, Ten, DiemDauVao
from SinhVien
where DiemDauVao =(select MAX(DiemDauVao)
from SinhVien
where MaSv = MaSv)

---Cau12
select top 2 TenMon, Sodvht
from MonHoc
order by Sodvht desc

---Cau13
select TenMon
from MonHoc
where Sodvht = (select MIN(Sodvht) from MonHoc)

---Cau14
create procedure DuaRaTenMon_TheoSodvht
@Sodvht float
as
begin
select TenMon
from MonHoc
where Sodvht = @Sodvht
end
--
exec DuaRaTenMon_TheoSodvht 5

---Cau15
create proc DuaRaHoTen_TheoNgaySinh
@NgaySinh varchar(10)
as
begin
select HoDem, Ten
from SinhVien
where NgaySinh Like '%' + @NgaySinh
end
exec DuaRaHoTen_TheoNgaySinh '2001-05-10'

---Dự án 50m
--LanXing--
--










