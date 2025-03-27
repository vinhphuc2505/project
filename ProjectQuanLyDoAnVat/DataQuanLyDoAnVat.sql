create database Data_QLDA
go

use Data_QLDA
go

-- món ăn: DS các món ăn
-- bàn: Lưu bàn
-- tài khoản: quản lý quyền Admin và Staff
-- hóa đơn: QL thời gian ra vào, vị trí bàn
-- chi tiết hóa đơn: QL số lượng và món đã oder

create table ban(
	id int identity primary key,
	ten nvarchar(100) not null default N'bàn chưa có tên',
	trangthai nvarchar(100)not null default N'trống',  
	-- trống || có người
)
go

create table taikhoan(
	tennguoidung nvarchar(100) primary key,
	tengiaodien nvarchar(100) not null default N'user',
	matkhau nvarchar(1000) not null,
	type int not null default 0
	--type: loai tai khoan NV=0 || ADMIN =1 
)
go


create table mon(
	id int primary key,
	tenmon nvarchar(100) not null default N'chưa đặt tên',
	gia float not null default 0
)

create table hoadon(
	id int identity primary key, --ID hóa đơn
	datecheckin date not null default getdate() , --Xác định thời gian vào
	datecheckout date, --Thời gian ra
	idban int not null,
	trangthai int not null default 0 -- trạng thái: 1: đã thanh toán || 0: chưa thanh toán 
	foreign key (idban) references dbo.ban(id)
)
go

create table chitiethoadon(
	id int identity primary key,
	idhoadon int not null,
	idmonan int not null,
	count int not null default 0 -- số lượng đồ uống
	foreign key (idhoadon) references dbo.hoadon(id),
	foreign key (idmonan) references dbo.mon(id)
)
go

INSERT INTO mon (id,tenmon,gia)
VALUES 
(1,N'Bánh tráng',10000),
(2,N'Xúc xích',20000), 
(3,N'Cá viên chiên',15000), 
(4,N'Bò viên chiên',15000), 
(5,N'Gà rán',25000),
(6,N'Tôm viên chiên',15000),
(7,N'Ốc nhồi chiên',18000),
(8,N'Phô mai viên',22000),
(9,N'Coca',9000),
(10,N'Sting',9000),
(11,N'Sprite',9000),
(12,N'Pepsi',9000),
(13,N'Trà sữa thái',20000),
(14,N'Trà trái cây',15000),
(15,N'Trà đá',5000);
go

INSERT INTO taikhoan (tennguoidung,tengiaodien,matkhau,type)
VALUES 
(N'Staff123',N'Staff',N'123456789',0),
(N'Admin123',N'Admin',N'987654321',1);