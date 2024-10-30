-- ******************************************************************************************
INSERT INTO Product (product_id, product_name, product_price, Product_capacity,product_image_url)
VALUES
(1,'Hisence UHD TV',20000,100,'/images/product/tv1.png'),
(2,'INNOVEX 32 Inch TV',9600,200,'/images/product/tv2.png'),
(3,'Abans 42 Inch TV',13000,300,'/images/product/tv3.png'),
(4,'Abans 32 Inch HD TV',10000,250,'/images/product/tv4.png'),
(5,'Samsung Smart TV',20000,150,'/images/product/tv5.png');



-- ******************************************************************************************
INSERT INTO Store (store_id,store_city,truck_count)
VALUES 
(1, 'Colombo',5),
(2, 'Negombo',3),
(3, 'Galle',3 ),
(4, 'Matara',3),
(5, 'Jaffna',4),
(6, 'Trincomalee',3);


-- ******************************************************************************************
-- Train
INSERT INTO Train (train_id, destination_store_id, total_capacity, departure_day, departure_time, arrival_day, arrival_time)
VALUES 
(1, 1, 1000, '2024-10-14', '08:00:00', '2024-10-14', '10:00:00'),  -- Colombo
(2, 2, 800, '2024-10-15', '09:30:00', '2024-10-15', '11:00:00'),   -- Negombo
(3, 3, 1200, '2024-10-16', '07:45:00', '2024-10-16', '09:45:00'),  -- Galle
(4, 4, 500, '2024-10-17', '06:00:00', '2024-10-17', '08:30:00'),   -- Matara
(5, 5, 600, '2024-10-18', '05:30:00', '2024-10-18', '08:30:00'),  -- Jaffna
(6, 6, 1000, '2024-10-19', '07:15:00', '2024-10-19', '10:15:00');  -- Trincomalee




-- ******************************************************************************************
-- Routes for Store ID 1 (Colombo)
INSERT INTO Route (route_id, store_id, end_point, route_description, distance, max_time)
VALUES 
(1, 1, 'Wattala', 'From Colombo Fort,passing Technical Junction, Panchikawatta, along base line road to Sedawatta, along Negambo road to Wattala', 10, 30),
(2, 1, 'Moratuwa', 'From Colombo Fort, passing Mount Lavinia and Ratmalana, along Galle Road to Moratuwa', 20, 60),
(3, 1, 'Maharagama', 'From Colombo Fort, passing Borella and Narahenpita, along the High Level Road to Maharagama', 15, 40);

-- Routes for Store ID 2 (Negombo)
INSERT INTO Route (route_id, store_id, end_point, route_description, distance, max_time)
VALUES 
(4, 2, 'Seeduwa', 'From Negombo, along Negombo Road passing Kurana to reach Seeduwa', 11, 25),
(5, 2, 'Katana', 'From Negombo, along Giriulla Road via Koppara Junction and Kandawala to reach Katana', 10, 20),
(6, 2, 'Kochchikade', 'From Negombo, via Periyamulla along Puttalama-Colombo main road passing Kattuwa to reach Kochchikade', 8, 18);

-- Routes for Store ID 3 (Galle)
INSERT INTO Route (route_id, store_id, end_point, route_description, distance, max_time)
VALUES 
(7, 3, 'Beddegama', 'From Galle, passing Hapugala and Wakwella to reach Ginimellagaha and then Beddegama', 20, 40),
(8, 3, 'Hikkaduwa', 'From Galle, along Galle Road passing Bossa to reach Hikkaduwa', 20, 40),
(9, 3, 'Koggala', 'From Galle, along Matara Road via Unawatuna and Thalpe to reach Koggala', 22, 40);

-- Routes for Store ID 4 (Matara)
INSERT INTO Route (route_id, store_id, end_point, route_description, distance, max_time)
VALUES 
(10, 4, 'Weligama', 'From Matara, along Matara Road passing Mirissa to reach Weligama', 20, 30),
(11, 4, 'Akuressa', 'From Matara, via Malimbada and Thelijjawila to reach Akuressa', 25, 40),
(12, 4, 'Dikwella', 'From Matara, along New Thangalla Road passing Gandara and Pathegama to reach Dikwella', 23, 40);

-- Routes for Store ID 5 (Jaffna)
INSERT INTO Route (route_id, store_id, end_point, route_description, distance, max_time)
VALUES 
(13, 5, 'Tellippalai', 'From Jaffna, along Eluppayady Junction and Jaffna Kankasanthurai Road passing Chunnakkam to reach Tellippalai', 17, 30),
(14, 5, 'Vaddukoddai', 'From Jaffna, via Jayanthan and Karativu Road to reach Vaddukoddai', 14, 25),
(15, 5, 'Nelliady', 'From Jaffna, along Nallur and Jaffna Point Pedro Road passing Neervely to reach Nelliady', 25, 40);

-- Routes for Store ID 6 (Trincomalee)
INSERT INTO Route (route_id, store_id, end_point, route_description, distance, max_time)
VALUES 
(16, 6, 'Kinniya', 'From Trincomalee, along Kandy Road and crossing Kinniya Bridge to reach Kinniya', 20, 35),
(17, 6, 'Mutur', 'From Trincomalee, via Trincomalee-Muttur Road passing Sampur to reach Mutur', 30, 50),
(18, 6, 'Kuchchaveli', 'From Trincomalee, along Pulmoddai Road passing Nilaveli to reach Kuchchaveli', 35, 55);

