create database QLBH
use QLBH

create table NhomSanPhanm(
MaNhom int primary key,
TenNhom nvarchar(15)
)

create table SanPham(
MaSP int primary key,
TenSp nvarchar(40) not null, 
NaNCC int,
MoTa nvarchar(50), 
MaNhom int,
DonViTinh nvarchar(20),
GiaGoc money constraint ck_GiaGoc check(GiaGoc > 0),
SLTon int constraint ck_SLT check (SLTon >= 0)
)

go
 
create table HoaDon(
MaHD int primary key,
NgayLapHD datetime default getDate() constraint ck_NgayLapHD check (NgayLapHD >= getDate()),
NgayGiao datetime,
NoiChuyen nvarchar(60) not null,
MakH char(5),
)
go
create table CT_HoaDon(
MaHD int, 
MaSp int,
SoLuong smallint constraint ck_soLuong check(SoLuong > 0),
DonGia money,
ChietKhau money constraint ck_ChietKhau check(ChietKhau >=0)
primary key(MaHD,MaSp)
)
go 
create table NhaCungCap (
MaNCC int primary key,
TenNCC nvarchar(40) not null,
DiaChi nvarchar(60),
Phone nvarchar(24),
SoFax nvarchar(24),
DCMail nvarchar(50)
)

create table KhachHang(
MaKH char(5) primary key,
TenKH nvarchar(40)not null,
LoaiKH nvarchar(3) constraint ck_LoaiKH check (LoaiKH in ('VIP','TV', 'VL')),
DiaChi nvarchar(60),
Phone nvarchar(24), 
DCMail nvarchar(50),
DiemTL int constraint ck_DiemTL check (DiemTL >= 0)
) 
go

alter table [dbo].[SanPham] add constraint FK_SanPham_NhomSanPham foreign key([MaNhom]) 
references [dbo].[NhomSanPhanm]([MaNhom])
go
alter table [dbo].[SanPham] add constraint FK_SanPham_NhaCungCap foreign key([MaNCC])
references [dbo].[NhaCungCap]([MaNCC])
go
 alter table [dbo].[HoaDon] add constraint FK_HoaDon_KhachHang foreign key([MakH])
 references [dbo].[KhachHang]([MaKH])
 go
 alter table [dbo].[CT_HoaDon] add constraint FK_CTHoaDon1_HoaDon foreign key ([MaHD])
 references [dbo].[HoaDon]([MaHD])
 go
  alter table [dbo].[CT_HoaDon] add constraint FK_CTHoaDon2_HoaDon foreign key ([MaSp])
 references [dbo].[SanPham]([MaSP])
 go
 alter table [dbo].[HoaDon] add LoaiHD char(1) default 'N' constraint ck_LoaiHD check(LoaiHD in ('N','X','C','T'))
 go
 alter table [dbo].[HoaDon] add constraint ck_NgayGiao_NgayLapHD check(NgayGiao >= NgayLapHD)