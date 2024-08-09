CREATE DATABASE IF NOT EXISTS PRJ301;
USE PRJ301;


CREATE TABLE Category (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Product (
    ID INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DOUBLE NULL,
    cid INT NOT NULL,
    image VARCHAR(50) NULL,
    `describe` TEXT NULL,
    PRIMARY KEY (ID)
   
);
SELECT COUNT(*) AS category_count FROM Category;

SELECT COUNT(*) AS product_count FROM Product;

INSERT INTO `User` (name, fullname, email, phonenum, avatar, role, password, address) 
VALUES ('admin', 'User Fullname', 'user@example.com', '1234567890', 'avatar.png', 1, 'admin12345', '123 Example Street');
INSERT INTO `User` (name, fullname, email, phonenum, avatar, role, password, address) 
VALUES ('admin1', 'UserFullname', 'uer@example.com', '1234567890', 'avatar.png', 0, '12345','1234 Example Street');
select * from User;

CREATE TABLE `User` (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    fullname VARCHAR(50) NULL,
    email VARCHAR(50) NULL,
    phonenum VARCHAR(10) NULL,
    avatar VARCHAR(50) NULL,
    role INT NULL,
    password VARCHAR(36) NOT NULL,
    `address` VARCHAR(123) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Cart (
    id VARCHAR(50) NOT NULL,
    u_id INT NOT NULL,
    buyDate DATE NULL,
    PRIMARY KEY (id)

);

CREATE TABLE CartItem (
    id VARCHAR(50) NOT NULL,
    quantity INT NULL,
    unitPrice DOUBLE NULL,
    pro_id INT NOT NULL,
    cat_id VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
   
);

CREATE TABLE DateExp (
    id INT AUTO_INCREMENT NOT NULL,
    mfgDate DATE NOT NULL,
    expDate DATE NOT NULL,
    cid INT NOT NULL,
    PRIMARY KEY (id)
  
);

CREATE TABLE `Order` (
    id INT AUTO_INCREMENT NOT NULL,
    `date` DATE NOT NULL,
    cid INT NOT NULL,
    totalmoney INT NULL,
    PRIMARY KEY (id)
    
);

CREATE TABLE OrderLine (
    oid INT NOT NULL,
    pid INT NOT NULL,
    quantity DOUBLE NOT NULL,
    price DOUBLE NOT NULL,
    PRIMARY KEY (oid, pid)
   
);

CREATE TABLE emp (
    cdate DATETIME NULL
);


-- Insert data into Category table
INSERT INTO Category (id, name) VALUES 
(1, 'Cơm'), 
(2, 'Salad'), 
(3, 'Đồ Uống'), 
(4, 'Đồ ăn nhanh'), 
(6, 'Bánh Mì'), 
(10, 'Bún, Phở, Mì');

-- Insert data into DateExp table
INSERT INTO DateExp (id, mfgDate, expDate, cid) VALUES 
(3, '2022-11-01', '2022-11-02', 1), 
(4, '2022-11-01', '2022-11-02', 2), 
(5, '2022-11-01', '2022-11-08', 3), 
(6, '2022-11-01', '2022-11-02', 4), 
(7, '2022-11-01', '2022-11-02', 6), 
(8, '2022-11-01', '2022-11-02', 10);


-- Insert data into Order table
INSERT INTO `Order` (id, date, cid, totalmoney) VALUES 
(1, '2022-10-31', 2, 0), 
(2, '2022-10-31', 2, 0), 
(3, '2022-10-31', 2, 0), 
(4, '2022-10-31', 2, 35000), 
(5, '2022-10-31', 2, 70000), 
(6, '2022-10-31', 2, 253000), 
(1006, '2022-11-01', 1003, 117000), 
(1007, '2022-11-02', 2, 115000), 
(1008, '2022-11-02', 2, 495000), 
(1009, '2022-11-02', 2, 420000), 
(1010, '2022-11-02', 2, 200000), 
(1011, '2022-11-02', 2, 450000), 
(1012, '2022-11-02', 2, 50000), 
(1013, '2022-11-02', 2, 45000), 
(1014, '2022-11-02', 2, 40000), 
(2007, '2022-11-02', 2, 360000), 
(2008, '2022-11-02', 2, 20000), 
(2009, '2022-11-02', 2, 24690), 
(2010, '2022-11-02', 2, 20000), 
(2011, '2022-11-02', 2, 310000), 
(3009, '2022-11-03', 2, 40000), 
(3010, '2022-11-03', 2, 70000), 
(3011, '2022-11-03', 2, 72000), 
(3012, '2022-11-03', 2, 0), 
(3013, '2022-11-03', 2, 30000), 
(3014, '2022-11-03', 2, 48000), 
(3015, '2022-11-03', 2, 55000), 
(3016, '2022-11-03', 2, 0), 
(3017, '2022-11-03', 2, 12345), 
(3018, '2022-11-03', 2, 40000), 
(3019, '2022-11-03', 2, 30000), 
(3020, '2022-11-03', 2, 70000), 
(3021, '2022-11-03', 2, 1190000), 
(4009, '2022-11-04', 1003, 360000), 
(4010, '2022-11-04', 1003, 165000), 
(4011, '2022-11-04', 1003, 310000), 
(4012, '2022-11-04', 1003, 520000), 
(4013, '2022-11-04', 1003, 200000), 
(4014, '2022-11-04', 1003, 12345), 
(4015, '2022-11-04', 1003, 35000), 
(4016, '2022-11-05', 1003, 396000), 
(4017, '2022-11-05', 1003, 276000), 
(5016, '2022-11-06', 2, 50000), 
(5017, '2022-11-06', 2, 231725), 
(5018, '2022-11-06', 2, 955000), 
(5019, '2022-11-07', 2, 461070), 
(5020, '2022-11-07', 2, 312000), 
(5021, '2022-11-08', 2, 251035), 
(5022, '2022-11-08', 2, 260000), 
(5023, '2022-11-08', 2, 140000), 
(5024, '2022-11-08', 2, 125000);

-- Insert data into OrderLine table
INSERT INTO OrderLine (oid, pid, quantity, price) VALUES 
(4, 4, 1, 35000), 
(5, 7, 1, 35000), 
(5, 9, 1, 35000), 
(6, 1038, 11, 23000), 
(1006, 1030, 1, 37000), 
(1006, 1054, 2, 40000), 
(1007, 1038, 5, 23000), 
(1008, 1046, 9, 55000), 
(1009, 1032, 6, 35000), 
(1009, 1051, 7, 30000), 
(1010, 18, 20, 10000), 
(1011, 1036, 9, 50000), 
(1012, 1036, 1, 50000), 
(1013, 1028, 1, 45000), 
(1014, 1058, 1, 40000), 
(2007, 1040, 30, 12000), 
(2008, 20, 2, 10000), 
(2009, 1043, 2, 12345), 
(2010, 21, 2, 10000), 
(2011, 22, 31, 10000), 
(3009, 1035, 1, 40000), 
(3010, 1055, 2, 35000), 
(3011, 1039, 2, 36000), 
(3013, 1051, 1, 30000), 
(3014, 1048, 2, 24000), 
(3015, 1046, 1, 55000), 
(3017, 1049, 1, 12345), 
(3018, 1051, 1, 40000), 
(3019, 1048, 1, 30000), 
(3020, 1055, 2, 35000), 
(3021, 1029, 140, 8500), 
(3021, 1030, 140, 8500), 
(4009, 1044, 30, 12000), 
(4010, 1060, 2, 82500), 
(4011, 1053, 31, 10000), 
(4012, 1041, 26, 20000), 
(4013, 1061, 20, 10000), 
(4015, 1042, 1, 35000), 
(4016, 1045, 18, 22000), 
(4016, 1057, 6, 17000), 
(4017, 1053, 24, 11500), 
(5016, 1046, 1, 50000), 
(5017, 1036, 7, 33000), 
(5017, 1051, 3, 30000), 
(5018, 1030, 30, 37000), 
(5019, 1043, 15, 30738), 
(5019, 1053, 11, 12345), 
(5019, 1064, 6, 35000), 
(5020, 1060, 3, 104000), 
(5021, 1051, 2, 30000), 
(5021, 1063, 1, 191035), 
(5022, 1042, 4, 65000), 
(5023, 1062, 1, 140000), 
(5024, 1051, 1, 125000);

SELECT COUNT(*) AS product_count FROM Product;

-- Insert data into Product table
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (15, 'Cơm Rang Dưa Bò', 35000, 1, 'rangduabo.jpg', 'Cơm rang với vị chua của dưa cải, thơm ngọt từ thịt bò kết hợp cùng những hạt cơm vàng tươi nóng hổi chắc chắn sẽ khiến bạn phải thích mê.');
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (16, 'Salad Ức Gà', 25000, 2, 'saladucga.jpg', 'Ức gà là thực phẩm tuyệt vời xây dựng khối cơ bắp chắc khỏe. Đối với những gymer hay những người eat clean thì ức gà là một nguyên liệu đã quá quen thuộc và không thể thiếu mỗi ngày. Hay thậm chí với một số người còn gọi ức gà với cái tên “nhàm chán”.');
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (17, 'Salad Nấm', 25000, 2, 'saladnam.jpg', 'Salad nấm linh chi là món ăn lạ miệng, với sự kết hợp của nấm linh chi cùng một số nguyên liệu khác giúp cho món ăn vừa thơm ngon lại còn bổ dưỡng cung cấp nguồn năng lượng dồi dào cho các thành viên trong gia đình.');
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (18, '7 Up', 10000, 3, '7up.jpg', NULL);
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (19, 'Bò Húc', 15000, 3, 'bohucs.jpg', NULL);
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (20, 'Coca Cola', 10000, 3, 'coca.jpg', NULL);
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (21, 'Mirinda', 10000, 3, 'mirinda.jpg', NULL);
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (22, 'Sting Đỏ', 10000, 3, 'stingdo.jpg', NULL);
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (23, 'Sting Vàng', 10000, 3, 'stingvang.jpg', NULL);
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (24, 'Cơm Rang Thập Cẩm', 35000, 1, 'comrangthapcam.jpg', 'Cơm rang thập cẩm là một món vô cùng dễ ăn và thu hút mọi người. Đặc biệt là các bạn nhỏ.');
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (1028, 'Cơm Rang Hải Sản', 45000, 1, 'comranghaisan.jpg', 'Cơm chiên hải sản ngon hấp dẫn là sự kết hợp hoàn hảo của tôm, mực, các loại củ, hạt và cơm trắng tạo nên món ăn hấp dẫn khó cưỡng.');
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (1029, 'Cơm Rang Gà', 30000, 1, 'comrangga.jpg', 'Cơm chiên gà lúc lắc có mùi thơm thoang thoảng của mùi bơ lạc, vị đậm đà từ thịt gà, ớt chuông và hành tây.');
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (1030, 'Cơm Tấm Sườn', 37000, 1, 'tamsuon.jpg', 'Cơm Tấm là món ăn phổ biến ở miền Nam, đặc biệt là vào mỗi buổi sáng và buổi tối, trên con đường tấp nập đều thoang thoảng hương vị của sườn nướng. Thịt nướng được ướp thơm lừng, nướng vàng óng cùng nước mắm ngon tuyệt đã tạo nên một món ăn cực kì thơm ngon khiến ăn đã thử một lần chắc chắn sẽ không quên được hương vị ấy.');
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (1032, 'Cơm Tấm Gà', 35000, 1, 'comtamga.jpg', 'Món cơm tấm cánh gà nướng kết hợp cùng bì, dưa chua và mỡ hành cho bữa ăn đủ chất và không ngán.');
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (1033, 'Salad Cá Hồi', 40000, 2, 'saladcahoi.jpg', 'Món salad cá hồi rất thơm ngon và tốt cho sức khỏe. Salad cá hồi rất phù hợp làm món khai vị, giúp bữa ăn thêm ngon miệng.');
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (1035, 'Salad Bơ Trứng', 40000, 2, 'saladbotrung.jpg', 'Salad bơ vẫn luôn là sự lựa chọn hàng đầu trong thực đơn giảm cân của các chị em nhờ cách chế biến nhanh chóng, lại ngon miệng bổ dưỡng mà món salad này mang lại.');
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (1036, 'Basic Burger', 50000, 4, 'basicburger.jpg', 'Hamburger là một loại thức ăn bao gồm bánh mì kẹp thịt xay ở giữa. Miếng thịt có thể được nướng, chiên, hun khói hay nướng trên lửa. Hamburger thường ăn kèm với pho mát, rau diếp, cà chua, hành tây, dưa chuột muối chua, thịt xông khói, hoặc ớt; ngoài ra, các loại gia vị như sốt cà chua, mù tạt, sốt mayonnaise, đồ gia vị, hoặc "nước xốt đặc biệt", cũng có thể thể rưới lên món bánh.');
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (1037, 'Basic Sandwich', 32000, 4, 'basicsandwich.jpg', 'Bánh mì kẹp hoặc bánh mì lát là loại thức ăn thường có ít nhất là hai lát bánh mì mềm kẹp bên ngoài lớp nhân thường là từ nguyên liệu thịt, hải sản, trứng... kèm với pho mát cùng với các loại rau, và có thể có thêm nước sốt. Định nghĩa rộng hơn, bánh mì kẹp là thực phẩm bao gồm hai lát bánh mì bỏng ngọt, làm thịt, thịt ngọt, sốt mù chào, hay gia vị khác, hoặc bánh mì với rau diếp, thịt xông khói, thịt ba chỉ, pho mát, cà chua, dưa chuột chua hoặc các loại rau khác, cùng nhiều loại nước sốt thích hợp khác.');
INSERT INTO Product (ID, name, price, cid, image, `describe`) VALUES (1038, 'Bacon Burger', 55000, 4, 'baconburger.jpg', 'Bacon burger là một loại thức ăn bao gồm bánh mì kẹp thịt xay ở giữa, được chế biến từ thịt xay. Loại thức ăn này có thể được chế biến bằng cách nướng, chiên, hút khói hoặc nướng trên lửa. Thịt xay được sử dụng trong bánh mì kẹp thịt xay thường là từ bò hoặc lợn, thường được ướp gia vị và được nướng, nướng hay nướng. Miếng thịt xay có thể được chế biến ngay lập tức bằng cách nướng, chiên hoặc bắn dầu nóng; Hoặc bằng cách ướp gia vị và bỏ lò nướng trong một thời gian dài.');


-- Insert data into Category table
INSERT INTO Category (id, name) VALUES 
(1, 'Cơm'), 
(2, 'Salad'), 
(3, 'Nước'), 
(4, 'Bánh mì');


