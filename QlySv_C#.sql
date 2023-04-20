create database QLSV_C#
create table Lop (MaLop varchar(10) primary key,
TenLop nvarchar(30))

create table SinhVien (MaSv varchar(10) primary key,
HoTen nvarchar(50),
NgaySinh date,
MaLop varchar(10), foreign key(MaLop) references Lop(Malop))


