create database QLDSV
create table SinhVien(
MaSv varchar(10) primary key,
HoDem nvarchar (30),
Ten nvarchar(30),
NgaySinh int,
NoiSinh nvarchar(50),
DiaChi nvarchar(50),
DienThoai int
)
create table MonHoc(
MaMon varchar(10) primary key,
TenMon nvarchar(30),
Sodvht int,
HocKy int
)
create table Diem(
MaSv varchar(10) foreign key references SinhVien ,
MaMon varchar(10) foreign key references MonHoc,
Diem float
)


insert into SinhVien
values('sv04', 'Nguyen Dang','Khuong',2009,'Hai Duong','Ba Dinh','0123689125' )

insert into MonHoc
values('LSD','Lich Su DCS Viet Nam',2,1)

insert into Diem
values('sv02','C#',13)

---cau1
 update SinhVien
 set NoiSinh ='Ha Noi'
 where MaSv = 'sv04'

 --- cau2

 Delete from Diem from SinhVien
 where Diem.Diem <15 and SinhVien.NgaySinh =2003

 ---cau 3

select MonHoc.HocKy,COUNT(MonHoc.MaMon) as 'So_luong_mon_hocc' from MonHoc
group by MonHoc.HocKy

 ---cau 4
 select MonHoc.HocKy ,SUM (MonHoc.Sodvht) as 'So_dvht'
 from MonHoc
 group by MonHoc.HocKy

 ---cau 5

 select SinhVien.HoDem, SinhVien.Ten
 from SinhVien, Diem,MonHoc
 where Diem.MaSv = SinhVien.MaSv and Diem.MaMon = MonHoc.MaMon
 and Diem.Diem = (select MAX (Diem.Diem) from Diem)