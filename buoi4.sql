use QLBH1
select * from NhomSanPham
go
select * from SanPham
go
 select * from CT_HoaDon
 go
  select * from HoaDon
  go
   select * from KhachHang
go
 select * from NhaCungCap
 go
 delete from [dbo].[NhomSanPham] where MaNhom = 3
 go
insert into NhomSanPham(MaNhom, TenNhom) values(3,N'Dụng Cụ Gia Đình')
go
alter table NhomSanPham alter column TenNhom nvarchar(20) not null
go
insert into NhomSanPham (MaNhom,TenNhom ) values(4, N'Các Mặt Hàng Khác')
go
insert into NhaCungCap (MaNCC, TenNCC,DiaChi,Phone,SoFax,DCMail) values(1,N'Công ty TNHH Nam Phương', N'1 Lê Lợi Phường 4 Quận Gò Vấp', '083843456', '32343434','NamPhuong@yahoo.com')
go
insert into NhaCungCap (MaNCC, TenNCC,DiaChi,Phone,SoFax,DCMail) values(2,N'Công ty Lan Ngọc', N'12 Cao Bá Quát Quận 1 Tp.Hồ Chí Minh', '086234567', '83434355','LanNgoc@gmail.com')
go
insert into SanPham(MaSP,TenSp,DonViTinh,GiaGoc,SLTon,MaNhom,NaNCC,MoTa) values(1,N'Máy Tính', N'Cái', 7000, 100, 1, 1, N'Máy Sony Ram 2GB')
go
insert into SanPham(MaSP,TenSp,DonViTinh,GiaGoc,SLTon,MaNhom,NaNCC,MoTa) values(2,N'Bàn Phím', N'Cái', 1000, 50, 1, 1, N'Bàn Phím 101 phím')
go
insert into SanPham(MaSP,TenSp,DonViTinh,GiaGoc,SLTon,MaNhom,NaNCC,MoTa) values(3,N'Chuột', N'Cái', 800, 150, 1, 1, N'Chuột không dây')
go
insert into SanPham(MaSP,TenSp,DonViTinh,GiaGoc,SLTon,MaNhom,NaNCC,MoTa) values(5,N'USB', N'Cái', 500, 100, 1, 1, N'8GB')
go
insert into SanPham(MaSP,TenSp,DonViTinh,GiaGoc,SLTon,MaNhom,NaNCC,MoTa) values(4,N'CPU', N'Cái', 3000, 200, 1, 1, N'CPU')
go

insert into SanPham(MaSP,TenSp,DonViTinh,GiaGoc,SLTon,MaNhom,NaNCC) values(6,N'Lò Vi Sóng', N'Cái', 1000000, 20, 3, 2)
alter table KhachHang add SoFax nvarchar(24) null 
go
 insert into KhachHang(MaKH,TenKH,DiaChi,Phone,LoaiKH) values('KH1', N'Nguyễn Thu Hằng', N'12 Nguyễn Du', '','VL')
 go
  insert into KhachHang(MaKH,TenKH,DiaChi,Phone,LoaiKH, DCMail,  DiemTL) values('KH2', N'Lê Minh', N'34 Điện Biên Phủ', '0123943455','TV','LeMinh@yahoo.com',100)
go

  insert into KhachHang(MaKH,TenKH,DiaChi,Phone,LoaiKH, DCMail,  DiemTL) values('KH3', N'Nguyễn Minh Trung', N'3 Lê Lợi Quận Gò Vấp', '098343434','VIP','Trung@gmail.com',800)
go
insert into HoaDon(MaHD, NgayLapHD, MakH, NgayGiao, NoiChuyen) values(1, '2024-09-30 00:00:00', 'KH1', '2024-10-05 00:00:00', N'Cửa Hàng ABC 3 Lý Chính Thắng Quận 3')
insert into HoaDon(MaHD, NgayLapHD, MakH, NgayGiao, NoiChuyen) values(2, '2025-07-29 00:00:00', 'KH2', '2025-08-10 00:00:00', N'23 Lê Lợi Quận Gò Vấp')
insert into HoaDon(MaHD, NgayLapHD, MakH, NgayGiao, NoiChuyen) values(3, '2024-10-01 00:00:00', 'KH3', '2024-10-01 00:00:00', N'2 Nguyễn Du Quận Gò Vấp')


go
insert into CT_HoaDon(MaHD, MaSP, DonGia, SoLuong) values(1,1,8000, 5)
insert into CT_HoaDon(MaHD, MaSP, DonGia, SoLuong) values(1,2,1200, 4)
insert into CT_HoaDon(MaHD, MaSP, DonGia, SoLuong) values(1,3,1000, 15)
insert into CT_HoaDon(MaHD, MaSP, DonGia, SoLuong) values(2,2,1200, 9)
insert into CT_HoaDon(MaHD, MaSP, DonGia, SoLuong) values(2,4,800, 5)
insert into CT_HoaDon(MaHD, MaSP, DonGia, SoLuong) values(3,2,3500, 20)
insert into CT_HoaDon(MaHD, MaSP, DonGia, SoLuong) values(3,3,1000, 15)

select * from SanPham
go
update SanPham set SLTon = 100 where SanPham.MaNhom = 3 and SanPham.NaNCC = 2
go
select * from SanPham
go
update SanPham set MoTa = N'Duc nguyen dep trai' where SanPham.TenSp = N'Lò Vi Sóng'
go
