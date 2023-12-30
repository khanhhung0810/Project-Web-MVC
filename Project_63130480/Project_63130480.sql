DROP DATABASE Project_63130480;
CREATE DATABASE Project_63130480
use Project_63130480
GO
CREATE TABLE LoaiSanPham (
    MaLoaiSP VARCHAR(10) PRIMARY KEY,
    TenLoaiSP NVARCHAR(50) NOT NULL,
)
GO
CREATE TABLE SanPham (
    MaSP VARCHAR(10) PRIMARY KEY,
    TenSP NVARCHAR(50) NOT NULL,
    MoTaSP nvarchar(100) NOT NULL,
    DonViTinh NVARCHAR(50) NOT NULL,
    AnhSanPham nvarchar(50) NOT NULL,
    DonGia int,
    MaLoaiSP VARCHAR(10) NOT NULL,
    FOREIGN KEY (MaLoaiSP) REFERENCES LoaiSanPham(MaLoaiSP)
)
GO
CREATE TABLE KhachHang (
    MaKH VARCHAR(10) PRIMARY KEY,
    HoTen nvarchar(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    MatKhau VARCHAR(50)NOT NULL,
	GioiTinh bit default (1),
	VaiTro VARCHAR(20) NOT NULL
)
GO
CREATE TABLE QuanLy (
	TaiKhoan varchar(8) primary key,
	MatKhau varchar(30)NOT NULL,
	HoTen nvarchar(40)NOT NULL,
	GioiTinh bit default (1),
	NgaySinh date,
	AnhQL nvarchar(300) NOT NULL,
	SoDienThoaiQL varchar(15) NOT NULL,
	Email varchar(100) NOT NULL,
	VaiTro varchar(20) NOT NULL
)
GO
CREATE TABLE GioHang (
	MaSP VARCHAR(10),
    MaKH VARCHAR(10),
    SoLuong INT,
	DiaChi nvarchar(50),
    PRIMARY KEY (MaSP, MaKH),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
	
)
GO
-- Dữ liệu cho bảng Loại sản phẩm
insert into LoaiSanPham values
('TV', N'Tivi'),
('ML', N'Máy lạnh'),
('TL', N'Tủ lạnh')

-- Dữ liệu cho bảng quản lý
insert into QuanLy values
('admin', '123', N'Lữ Huỳnh Khánh Hưng', 1, '2003-10-08', N'employee.png', '0965479040', 'hung.lhk.63cntt@ntu.edu.vn','Admin')
-- Dữ liệu cho bảng Khách hàng
insert into KhachHang values
('KH02', N'Nguyễn Thị Mai', 'mai.ntm@example.com', '456',  0, 'User'),
('KH03', N'Trần Văn Sỹ', 'a.tv@example.com', '789',   1, 'User'),
('KH04', N'Lê Thị Bình', 'binh.lt@example.com', '101',   0, 'User'),
('KH05', N'Phạm Văn Cường', 'cuong.pv@example.com', '202', 1, 'User'),
('KH06', N'Đặng Thị Dung', 'dung.dt@example.com', '303',   0, 'User')
-- Dữ liệu cho bảng Sản phẩm
insert into SanPham values
('TV01', N'Tivi Sony 4K', N'Tivi Sony 4K 55 inch', N'Chiếc', N'sony4k.jpg', 20000000, 'TV'),
('TV02', N'Tivi LG OLED', N'Tivi LG OLED 65 inch', N'Chiếc', N'lgoled.jpg', 25000000, 'TV'),
('TV03', N'Tivi Sony 4K', N'Tivi Sony 4K 55 inch', N'Chiếc', N'sony4k.jpg', 20000000, 'TV'),
('TV04', N'Tivi LG OLED', N'Tivi LG OLED 65 inch', N'Chiếc', N'lgoled.jpg', 25000000, 'TV'),
('TV05', N'Tivi Sony 4K', N'Tivi Sony 4K 55 inch', N'Chiếc', N'sony4k.jpg', 20000000, 'TV'),
('TV06', N'Tivi LG OLED', N'Tivi LG OLED 65 inch', N'Chiếc', N'lgoled.jpg', 25000000, 'TV'),
('TV07', N'Tivi Sony 4K', N'Tivi Sony 4K 55 inch', N'Chiếc', N'sony4k.jpg', 20000000, 'TV'),
('TV08', N'Tivi LG OLED', N'Tivi LG OLED 65 inch', N'Chiếc', N'lgoled.jpg', 25000000, 'TV'),
('TV09', N'Tivi Sony 4K', N'Tivi Sony 4K 55 inch', N'Chiếc', N'sony4k.jpg', 20000000, 'TV'),
('TV10', N'Tivi LG OLED', N'Tivi LG OLED 65 inch', N'Chiếc', N'lgoled.jpg', 25000000, 'TV'),

('ML01', N'Máy lạnh Toshiba',N'Máy lạnh Toshiba Inverter 1.5 HP', N'Chiếc', N'toshiba.jpg', 12000000, 'ML'),
('ML02', N'Máy lạnh Daikin', N'Máy lạnh Daikin Inverter 1 HP',	  N'Chiếc', N'daikin.jpg', 10000000, 'ML'),
('ML03', N'Máy lạnh Toshiba',N'Máy lạnh Toshiba Inverter 1.5 HP', N'Chiếc', N'toshiba.jpg', 12000000, 'ML'),
('ML04', N'Máy lạnh Daikin', N'Máy lạnh Daikin Inverter 1 HP',    N'Chiếc', N'daikin.jpg', 10000000, 'ML'),
('ML05', N'Máy lạnh Toshiba',N'Máy lạnh Toshiba Inverter 1.5 HP', N'Chiếc', N'toshiba.jpg', 12000000, 'ML'),
('ML06', N'Máy lạnh Daikin', N'Máy lạnh Daikin Inverter 1 HP',    N'Chiếc', N'daikin.jpg', 10000000, 'ML'),
('ML07', N'Máy lạnh Toshiba',N'Máy lạnh Toshiba Inverter 1.5 HP', N'Chiếc', N'toshiba.jpg', 12000000, 'ML'),
('ML08', N'Máy lạnh Daikin', N'Máy lạnh Daikin Inverter 1 HP',    N'Chiếc', N'daikin.jpg', 10000000, 'ML'),
('ML09', N'Máy lạnh Toshiba',N'Máy lạnh Toshiba Inverter 1.5 HP', N'Chiếc', N'toshiba.jpg', 12000000, 'ML'),
('ML10', N'Máy lạnh Daikin', N'Máy lạnh Daikin Inverter 1 HP',    N'Chiếc', N'daikin.jpg', 10000000, 'ML'),

('TL01', N'Tủ lạnh Samsung', N'Tủ lạnh Samsung Inverter 200 lít', N'Chiếc', N'samsungfridge.jpg', 15000000, 'TL'),
('TL02', N'Tủ lạnh LG',		 N'Tủ lạnh LG Inverter 180 lít',      N'Chiếc', N'lgfridge.jpg', 14000000, 'TL'),
('TL03', N'Tủ lạnh Samsung', N'Tủ lạnh Samsung Inverter 200 lít', N'Chiếc', N'samsungfridge.jpg', 15000000, 'TL'),
('TL04', N'Tủ lạnh LG',      N'Tủ lạnh LG Inverter 180 lít',      N'Chiếc', N'lgfridge.jpg', 14000000, 'TL'),
('TL05', N'Tủ lạnh Samsung', N'Tủ lạnh Samsung Inverter 200 lít', N'Chiếc', N'samsungfridge.jpg', 15000000, 'TL'),
('TL06', N'Tủ lạnh LG',      N'Tủ lạnh LG Inverter 180 lít',      N'Chiếc', N'lgfridge.jpg', 14000000, 'TL'),
('TL07', N'Tủ lạnh Samsung', N'Tủ lạnh Samsung Inverter 200 lít', N'Chiếc', N'samsungfridge.jpg', 15000000, 'TL'),
('TL08', N'Tủ lạnh LG',      N'Tủ lạnh LG Inverter 180 lít',      N'Chiếc', N'lgfridge.jpg', 14000000, 'TL'),
('TL09', N'Tủ lạnh Samsung', N'Tủ lạnh Samsung Inverter 200 lít', N'Chiếc', N'samsungfridge.jpg', 15000000, 'TL'),
('TL10', N'Tủ lạnh LG',      N'Tủ lạnh LG Inverter 180 lít',      N'Chiếc', N'lgfridge.jpg', 14000000, 'TL')
