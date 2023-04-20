create database QLyThucTap
create table Khoa (
MaKhoa varchar(10) primary key,
TenKhoa nvarchar(30),
DienThoai varchar(10)

)
create table GiangVien(
MaGv varchar(10) primary key,
HoTenGv nvarchar (30),
Luong float,
MaKhoa varchar(10) foreign key references Khoa
)
create table SinhVien(
MaSv varchar(10) primary key,
HoTenSv nvarchar(30),
MaKhoa varchar(10) foreign key references Khoa,
NamSinh int,
QueQuan nvarchar (70)
)
create table DeTai(
MaDt varchar(10) primary key,
TenDt nvarchar(50),
KinhPhi float,
NoiThucTap nvarchar(70)
)
create table HuongDan(
MaSv varchar(10) primary key ,
MaDt varchar(10) foreign key references Detai,
MaGv varchar (10)foreign key references GiangVien,
KetQua float
)

insert into Khoa
values('KT','Ke toan',0123789456)

insert into GiangVien 
values('GV05', 'Dao Thi Phuong',520,'YDK')

insert into SinhVien
values('SV08', 'Duong Thu Binh','CNTT', 2003,'Ha Noi')

insert into DeTai
values('DT05', 'Quan ly ban hang', 110, 'Ha Noi')

insert into HuongDan
values ('SV08','DT04','GV01',9)

---Cau 2
select GiangVien.MaGv, GiangVien.HoTenGv,Khoa.TenKhoa
from GiangVien, Khoa
where GiangVien.MaKhoa = Khoa.MaKhoa

---Cau 3
select GiangVien.MaGv, GiangVien.HoTenGv,Khoa.TenKhoa
from GiangVien join Khoa
on GiangVien.MaKhoa = Khoa.MaKhoa
where GiangVien.MaGv in (
select HuongDan.MaGv
from HuongDan
group by HuongDan.MaGv
having COUNT (HuongDan.MaGv)>1
)

---Cau 4
select *
from HuongDan
where KetQua  is null

---cau 5
select Khoa.DienThoai
from Khoa, SinhVien
where Khoa.MaKhoa = SinhVien.MaKhoa and SinhVien.HoTenSv ='Nguyen Duc Hoang'

--- cau 6
select DeTai.MaDt, DeTai.TenDt
from DeTai
where DeTai.MaDt in(
select HuongDan.MaDt
from HuongDan
group by HuongDan.MaDt
having COUNT (HuongDan.MaGv)>1
)

---cau 7
select DeTai.MaDt, DeTai.TenDt
from DeTai
where DeTai.KinhPhi = (select MAX(KinhPhi) from DeTai)

---cau 8

select Khoa.TenKhoa, COUNT(SinhVien.MaSv) as So_Sv
from SinhVien join Khoa
on SinhVien.MaKhoa = Khoa.MaKhoa
group by Khoa.TenKhoa
