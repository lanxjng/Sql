create database QLDSV1
create table SinhVien
(
MaSv varchar(10) primary key,
HoDem nvarchar(20),
Ten nvarchar(10),
NgaySing date,
GioiTinh bit,
NoiSinh nvarchar(100),
DiaChi nvarchar(100),
DiemDauVao float,
DoiTuong nvarchar(20),
KhuVuc nvarchar(10)
)

create table MonHoc
(
MaMon varchar(10) primary key,
TenMon nvarchar(30),
SoTinChi int,
HoKy int
)
create table Diem
(
PRIMARY KEY (MaSv, MaMon),
MaSv varchar(10) FOREIGN KEY (MaSv) REFERENCES Sinhvien(MaSv),
MaMon varchar(10) FOREIGN KEY (MaMon) REFERENCES Monhoc(MaMon),
Diem float
)

insert into SinhVien
values('sv1','Nguyen','Van A','2003',1,'Bac Ninh','BN',7,'01','NT1'),
('sv2','Tran','Van B','2005',1,'Ha Noi','HN',7.8,'02','NT1'),
('sv3','Pham','Van C','2003',1,'Hai Duong','HD',5,'01','NT2'),
('sv4','Hoang','Van D','2001',1,'Bac Giang','BG',9,'02','NT2')

insert into MonHoc
values('m1','Toan',3,1),
('m2','Van',2,3),
('m3','Anh',5,2),
('m4','Ly',4,1)

insert into Diem
values('sv1','m1',8),
('sv2','m2',5),
('sv3','m3',7),
('sv4','m4',9)

---Cau1
select SinhVien.HoDem, SinhVien.Ten, SinhVien.NgaySing, SinhVien.NoiSinh,MonHoc.TenMon,Diem.Diem
from SinhVien
join Diem on SinhVien.MaSv = Diem.MaSv
join MonHoc on Diem.MaMon = MonHoc.MaMon
where SinhVien.NoiSinh <> 'Ha Noi' and Diem.Diem >8

---Cau2
select HoDem, Ten
from SinhVien
where NgaySing >2003 and NgaySing < 2005

---Cau3
select MAX(DiemDauVao) as Diem_Dau_Vao_Cao_Nhat
from SinhVien

---Cau4
select top 2 SinhVien.DiemDauVao
from SinhVien
order by SinhVien.DiemDauVao desc

