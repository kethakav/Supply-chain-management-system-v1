INSERT INTO Customer (customer_id, user_name, password, customer_first_name, customer_last_name, customer_type, customer_contact, customer_email, customer_address, customer_image_URL)
VALUES 
(1, 'ashan23', NULL, 'Ashan', 'Perera', 'end customer', 774123456, 'ashan.perera@email.com', '123, Galle Road, Colombo 03', NULL),
(2, 'janaki89', NULL, 'Janaki', 'Silva', 'retailer', 772987654, 'janaki.silva@email.com', '45, Temple Road, Kandy', NULL),
(3, 'kasun_k10', NULL, 'Kasun', 'Kumara', 'wholesaler', 777654321, 'kasun.kumara@biz.com', '78, Main Street, Negombo', NULL),
(4, 'nirosha_s1', NULL, 'Nirosha', 'Fernando', 'end customer', 779876543, 'nirosha.fernando@email.com', '90, St. Josephs Lane, Gampaha', NULL),
(5, 'uditha_biz', NULL, 'Uditha', 'Wickramasinghe', 'wholesaler', 771234567, 'uditha.wickramasinghe@biz.com', '105, Green Park, Dehiwala', NULL),
(6, 'niluka_w', NULL, 'Niluka', 'Weerasinghe', 'retailer', 773456789, 'niluka.weerasinghe@email.com', '88, Lake Road, Ratnapura', NULL),
(7, 'ranjith_99', NULL, 'Ranjith', 'Bandara', 'wholesaler', 771987654, 'ranjith.bandara@email.com', '101, High Street, Anuradhapura', NULL),
(8, 'sriya_m', NULL, 'Sriya', 'Mendis', 'end customer', 772345678, 'sriya.mendis@email.com', '200, Main Road, Panadura', NULL),
(9, 'harsha_d', NULL, 'Harsha', 'Dissanayake', 'retailer', 775432109, 'harsha.dissanayake@email.com', '57, Park Avenue, Matara', NULL),
(10, 'kavinda_l', NULL, 'Kavinda', 'Lakmal', 'end customer', 777321654, 'kavinda.lakmal@email.com', '32, Flower Road, Nugegoda', NULL),
(11, 'samitha_45', NULL, 'Samitha', 'Jayasinghe', 'wholesaler', 771654789, 'samitha.jayasinghe@biz.com', '67, Lake Drive, Nawala', NULL),
(12, 'maheshi_t', NULL, 'Maheshi', 'Tharanga', 'retailer', 778765432, 'maheshi.tharanga@email.com', '201, Mahaweli Gardens, Kurunegala', NULL),
(13, 'nuwan_k', NULL, 'Nuwan', 'Karunaratne', 'end customer', 774567890, 'nuwan.karunaratne@email.com', '150, Sea Breeze Avenue, Moratuwa', NULL),
(14, 'sanduni_p', NULL, 'Sanduni', 'Perera', 'wholesaler', 776543210, 'sanduni.perera@biz.com', '92, Hill Side Road, Nuwara Eliya', NULL),
(15, 'chathura_d', NULL, 'Chathura', 'Dahanayake', 'retailer', 772234567, 'chathura.dahanayake@email.com', '78, Kingsway Road, Galle', NULL),
(16, 'ayesha_s', NULL, 'Ayesha', 'Samarasinghe', 'end customer', 775678901, 'ayesha.samarasinghe@email.com', '45, New Town, Jaffna', NULL),
(17, 'isuru_m', NULL, 'Isuru', 'Mendis', 'wholesaler', 773987654, 'isuru.mendis@biz.com', '12, D. S. Senanayake Mawatha, Colombo 07', NULL),
(18, 'kasuni_k', NULL, 'Kasuni', 'Kariyawasam', 'retailer', 779876543, 'kasuni.kariyawasam@email.com', '101, Gampaha Road, Gampaha', NULL),
(19, 'suraj_j', NULL, 'Suraj', 'Jayawardena', 'end customer', 774567321, 'suraj.jayawardena@email.com', '23, Ambepussa Lane, Kandy', NULL),
(20, 'manuja_p', NULL, 'Manuja', 'Pathirana', 'wholesaler', 778654321, 'manuja.pathirana@biz.com', '34, Lotus Grove, Batticaloa', NULL);

-- ******************************************************************************************
INSERT INTO Product (product_id, product_name, product_price, Product_capacity,product_image_url)
VALUES
(1,'Hisence UHD TV',20000,100,'/images/product/tv1.png'),
(2,'INNOVEX 32 Inch TV',9600,200,'/images/product/tv2.png'),
(3,'Abans 42 Inch TV',13000,300,'/images/product/tv3.png'),
(4,'Abans 32 Inch HD TV',10000,250,'/images/product/tv4.png'),
(5,'Samsung Smart TV',20000,150,'/images/product/tv5.png');


-- ******************************************************************************************
INSERT INTO FinanceAndOrder_Manager (finance_manager_ID, user_name, password, manager_first_name, manager_last_name, manager_contact, manager_email, manager_image_URL)
VALUES 
(1, 'fm_senura', NULL, 'Senura', 'Wijesinghe', 772345678, 'senura.wijesinghe@email.com', NULL),
(2, 'fm_sachini', NULL, 'Sachini', 'Fernando', 773456789, 'sachini.fernando@email.com', NULL),
(3, 'fm_ravindu', NULL, 'Ravindu', 'Perera', 774567890, 'ravindu.perera@email.com', NULL),
(4, 'fm_kasun', NULL, 'Kasun', 'Jayawardena', 775678901, 'kasun.jayawardena@email.com', NULL),
(5, 'fm_nisansala', NULL, 'Nisansala', 'Bandara', 776789012, 'nisansala.bandara@email.com', NULL);

-- ******************************************************************************************
INSERT INTO HR_Manager (hr_manager_ID, user_name, password, manager_first_name, manager_last_name, manager_contact, manager_email, manager_image_URL)
VALUES 
(1, 'priya_silva', NULL, 'Priya', 'Silva', 947, 'priya.silva@example.lk', NULL),
(2, 'amal_perera', NULL, 'Amal', 'Perera', 947, 'amal.perera@example.lk', NULL),
(3, 'kumari_fernando', NULL, 'Kumari', 'Fernando', 947, 'kumari.fernando@example.lk', NULL),
(4, 'nimal_gunawardena', NULL, 'Nimal', 'Gunawardena', 947, 'nimal.gunawardena@example.lk', NULL),
(5, 'chamathka_rajapaksa', NULL, 'Chamathka', 'Rajapaksa', 947, 'chamathka.rajapaksa@example.lk', NULL);

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
INSERT INTO Manager (manager_ID, store_ID, user_name, password, manager_first_name, manager_last_name, manager_contact, manager_email, manager_image_URL)
VALUES 
(1, 1, 'lakshman_p', NULL, 'Lakshman', 'Perera', 0771234567, 'lakshman.p@sricompany.lk', NULL),
(2, 2, 'malini_s', NULL, 'Malini', 'Silva', 0772345678, 'malini.s@sricompany.lk', NULL),
(3, 3, 'asela_g', NULL, 'Asela', 'Gunawardena', 0773456789, 'asela.g@sricompany.lk', NULL),
(4, 4, 'chamathka_f', NULL, 'Chamathka', 'Fernando', 0774567890, 'chamathka.f@sricompany.lk', NULL),
(5, 5, 'dinesh_r', NULL, 'Dinesh', 'Rajapaksa', 0775678901, 'dinesh.r@sricompany.lk', NULL),
(6, 6, 'priyanka_j', NULL, 'Priyanka', 'Jayawardena', 0776789012, 'priyanka.j@sricompany.lk', NULL);

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
-- Trucks for Colombo (Store ID: 001)
INSERT INTO Truck (truck_id, store_id, vehicle_number, availability)
VALUES 
(1, 1, 5678, 1),
(2, 1, 1234, 1),
(3, 1, 3456, 1);
-- Trucks for Negombo (Store ID: 002)
INSERT INTO Truck (truck_id, store_id, vehicle_number, availability)
VALUES 
(4, 2, 7890, 1),
(5, 2, 2345, 1),
(6, 2, 6789, 1);
-- Trucks for Galle (Store ID: 003)
INSERT INTO Truck (truck_id, store_id, vehicle_number, availability)
VALUES 
(7, 3, 1357, 1),
(8, 3, 2468, 1),
(9, 3, 9876, 1);
-- Trucks for Matara (Store ID: 004)
INSERT INTO Truck (truck_id, store_id, vehicle_number, availability)
VALUES 
(10, 4, 5432, 1),
(11, 4, 8765, 1),
(12, 4, 1359, 1);
-- Trucks for Jaffna (Store ID: 005)
INSERT INTO Truck (truck_id, store_id, vehicle_number, availability)
VALUES 
(13, 5, 9638, 1),
(14, 5, 8524, 1),
(15, 5, 7412, 1);
-- Trucks for Trincomalee (Store ID: 006)
INSERT INTO Truck (truck_id, store_id, vehicle_number, availability)
VALUES 
(16, 6, 9517, 1),
(17, 6, 8423, 1),
(18, 6, 7539, 1);

-- ******************************************************************************************
-- Drivers for Store ID 1 (Colombo)
INSERT INTO Driver (driver_id, user_name, password, driver_first_name, driver_last_name, driver_contact, driver_email, driver_image_URL, store_ID, worked_hours, availability)
VALUES 
(1, NULL, NULL, 'Amal', 'Perera', 771234567, 'amal.perera@email.com', NULL, 1, 0, 1),
(2, NULL, NULL, 'Nimal', 'Fernando', 772345678, 'nimal.fernando@email.com', NULL, 1, 0, 1),
(13, NULL, NULL, 'Asela', 'Kumara', 779123456, 'asela.kumara@email.com', NULL, 1, 0, 1);  -- New Driver for Store ID 1

-- Drivers for Store ID 2 (Negombo)
INSERT INTO Driver (driver_id, user_name, password, driver_first_name, driver_last_name, driver_contact, driver_email, driver_image_URL, store_ID, worked_hours, availability)
VALUES 
(3, NULL, NULL, 'Sunil', 'Weerasinghe', 773456789, 'sunil.weerasinghe@email.com', NULL, 2, 0, 1),
(4, NULL, NULL, 'Saman', 'Jayasinghe', 774567890, 'saman.jayasinghe@email.com', NULL, 2, 0, 1),
(14, NULL, NULL, 'Chamara', 'Perera', 771234569, 'chamara.perera@email.com', NULL, 2, 0, 1);  -- New Driver for Store ID 2

-- Drivers for Store ID 3 (Galle)
INSERT INTO Driver (driver_id, user_name, password, driver_first_name, driver_last_name, driver_contact, driver_email, driver_image_URL, store_ID, worked_hours, availability)
VALUES 
(5, NULL, NULL, 'Kamal', 'Gunawardena', 775678901, 'kamal.gunawardena@email.com', NULL, 3, 0, 1),
(6, NULL, NULL, 'Dinesh', 'Ranasinghe', 776789012, 'dinesh.ranasinghe@email.com', NULL, 3, 0, 1),
(15, NULL, NULL, 'Indika', 'Senanayake', 772345670, 'indika.senanayake@email.com', NULL, 3, 0, 1);  -- New Driver for Store ID 3

-- Drivers for Store ID 4 (Matara)
INSERT INTO Driver (driver_id, user_name, password, driver_first_name, driver_last_name, driver_contact, driver_email, driver_image_URL, store_ID, worked_hours, availability)
VALUES 
(7, NULL, NULL, 'Ruwan', 'Abeysekara', 777890123, 'ruwan.abeysekara@email.com', NULL, 4, 0, 1),
(8, NULL, NULL, 'Mahesh', 'Edirisinghe', 778901234, 'mahesh.edirisinghe@email.com', NULL, 4, 0, 1),
(16, NULL, NULL, 'Sujith', 'Bandara', 773456781, 'sujith.bandara@email.com', NULL, 4, 0, 1);  -- New Driver for Store ID 4

-- Drivers for Store ID 5 (Jaffna)
INSERT INTO Driver (driver_id, user_name, password, driver_first_name, driver_last_name, driver_contact, driver_email, driver_image_URL, store_ID, worked_hours, availability)
VALUES 
(9, NULL, NULL, 'Ajith', 'De Silva', 779012345, 'ajith.desilva@email.com', NULL, 5, 0, 1),
(10, NULL, NULL, 'Prasanna', 'Rathnayake', 771234568, 'prasanna.rathnayake@email.com', NULL, 5, 0, 1),
(17, NULL, NULL, 'Ramesh', 'Kumar', 774567892, 'ramesh.kumar@email.com', NULL, 5, 0, 1);  -- New Driver for Store ID 5

-- Drivers for Store ID 6 (Trincomalee)
INSERT INTO Driver (driver_id, user_name, password, driver_first_name, driver_last_name, driver_contact, driver_email, driver_image_URL, store_ID, worked_hours, availability)
VALUES
(11, NULL, NULL, 'Bandara', 'Seneviratne', 772345679, 'bandara.seneviratne@email.com', NULL, 6, 0, 1),
(12, NULL, NULL, 'Sarath', 'Liyanage', 773456780, 'sarath.liyanage@email.com', NULL, 6, 0, 1),
(18, NULL, NULL, 'Nuwan', 'Jayalath', 775678903, 'nuwan.jayalath@email.com', NULL, 6, 0, 1);  -- New Driver for Store ID 6


-- Assistant Drivers for Store ID 1 (Colombo)
INSERT INTO Assistant_Driver (ast_driver_id, user_name, password, ast_driver_first_name, ast_driver_last_name, ast_driver_contact, ast_driver_email, ast_driver_image_URL, store_ID, worked_hours, availability)
VALUES 
(1, NULL, NULL, 'Ruwan', 'Perera', 761234567, 'ruwan.perera@email.com', NULL, 1, 0, 1),
(2, NULL, NULL, 'Sarath', 'Fernando', 762345678, 'sarath.fernando@email.com', NULL, 1, 0, 1),
(13, NULL, NULL, 'Suresh', 'Perera', 764567891, 'suresh.perera@email.com', NULL, 1, 0, 1);  -- New Assistant Driver for Store ID 1

-- Assistant Drivers for Store ID 2 (Negombo)
INSERT INTO Assistant_Driver (ast_driver_id, user_name, password, ast_driver_first_name, ast_driver_last_name, ast_driver_contact, ast_driver_email, ast_driver_image_URL, store_ID, worked_hours, availability)
VALUES 
(3, NULL, NULL, 'Pradeep', 'Weerasinghe', 763456789, 'pradeep.weerasinghe@email.com', NULL, 2, 0, 1),
(4, NULL, NULL, 'Thilina', 'Jayasinghe', 764567890, 'thilina.jayasinghe@email.com', NULL, 2, 0, 1),
(14, NULL, NULL, 'Sanjaya', 'Perera', 765678902, 'sanjaya.perera@email.com', NULL, 2, 0, 1);  -- New Assistant Driver for Store ID 2

-- Assistant Drivers for Store ID 3 (Galle)
INSERT INTO Assistant_Driver (ast_driver_id, user_name, password, ast_driver_first_name, ast_driver_last_name, ast_driver_contact, ast_driver_email, ast_driver_image_URL, store_ID, worked_hours, availability)
VALUES 
(5, NULL, NULL, 'Chathura', 'Gunawardena', 765678901, 'chathura.gunawardena@email.com', NULL, 3, 0, 1),
(6, NULL, NULL, 'Rasika', 'Ranasinghe', 766789012, 'rasika.ranasinghe@email.com', NULL, 3, 0, 1),
(15, NULL, NULL, 'Lahiru', 'Perera', 766789013, 'lahiru.perera@email.com', NULL, 3, 0, 1);  -- New Assistant Driver for Store ID 3

-- Assistant Drivers for Store ID 4 (Matara)
INSERT INTO Assistant_Driver (ast_driver_id, user_name, password, ast_driver_first_name, ast_driver_last_name, ast_driver_contact, ast_driver_email, ast_driver_image_URL, store_ID, worked_hours, availability)
VALUES
(7, NULL, NULL, 'Chaminda', 'Abeysekara', 767890123, 'chaminda.abeysekara@email.com', NULL, 4, 0, 1),
(8, NULL, NULL, 'Upul', 'Edirisinghe', 768901234, 'upul.edirisinghe@email.com', NULL, 4, 0, 1),
(16, NULL, NULL, 'Saman', 'Perera', 767890124, 'saman.perera@email.com', NULL, 4, 0, 1);  -- New Assistant Driver for Store ID 4

-- Assistant Drivers for Store ID 5 (Jaffna)
INSERT INTO Assistant_Driver (ast_driver_id, user_name, password, ast_driver_first_name, ast_driver_last_name, ast_driver_contact, ast_driver_email, ast_driver_image_URL, store_ID, worked_hours, availability)
VALUES
(9, NULL, NULL, 'Kannan', 'Selvarajah', 769012345, 'kannan.selvarajah@email.com', NULL, 5, 0, 1),
(10, NULL, NULL, 'Sutharsan', 'Murugesu', 761234568, 'sutharsan.murugesu@email.com', NULL, 5, 0, 1),
(17, NULL, NULL, 'Prasad', 'De Silva', 769012346, 'prasad.desilva@email.com', NULL, 5, 0, 1);  -- New Assistant Driver for Store ID 5

-- Assistant Drivers for Store ID 6 (Trincomalee)
INSERT INTO Assistant_Driver (ast_driver_id, user_name, password, ast_driver_first_name, ast_driver_last_name, ast_driver_contact, ast_driver_email, ast_driver_image_URL, store_ID, worked_hours, availability)
VALUES
(11, NULL, NULL, 'Rajapaksha', 'Seneviratne', 762345679, 'rajapaksha.seneviratne@email.com', NULL, 6, 0, 1),
(12, NULL, NULL, 'Kumara', 'Liyanage', 763456780, 'kumara.liyanage@email.com', NULL, 6, 0, 1);

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

-- ******************************************************************************************
-- Truck_Delivery
INSERT INTO truck_delivery (delivery_id, truck_id, driver_id, ast_driver_id, route_id, compleated)
VALUES
(1, 1, 1, 1, 1, 0),
(2, 2, 2, 2, 2, 0),
(3, 3, 3, 3, 3, 0),
(4, 4, 4, 4, 4, 0),
(5, 5, 5, 5, 5, 0),
(6, 6, 6, 6, 6, 0),
(7, 7, 7, 7, 7, 0),
(8, 8, 8, 8, 8, 0),
(9, 9, 9, 9, 9, 0),
(10, 10, 10, 10, 10, 0),
(11, 11, 11, 11, 11, 0),
(12, 12, 12, 12, 12, 0),
(13, 13, 13, 13, 13, 0),
(14, 14, 14, 14, 14, 0);
-- ******************************************************************************************
-- Train_Delivery
INSERT INTO train_delivery (train_delivery_id, train_id, allocated_capacity, sent)
VALUES
(1,1,5,0),
(2,1,4,0),
(3,2,4,0),
(4,3,10,0),
(5,4,4,0),
(6,5,4,0),
(7,5,14,0);
-- ******************************************************************************************
-- Order 
INSERT INTO `Orders` (order_id, customer_id, ordered_date_time, total_amount, payment_documents, order_capacity, expecting_delivery_date, nearest_store_id, route_description_input, finance_manager_id, confirm_payments, sent_by_train, train_delivery_id, recieved_to_store, delivery_id, delivered_confirmation, delivered_date_time) VALUES
-- Delivered orders
(1, 1, '2024-10-01 08:30:00', 17500, 'online_payment_201.jpg', 2, '2024-10-04', 1, 'From Technical Junction, pass Panchikawatta, then continue along Baseline Road to reach Kelaniya', 1, 1, 1, 1, 1, 1, 1, '2024-10-05 12:30:00'),
(2, 2, '2024-10-01 09:45:00', 18000, 'bank_transfer_102.jpg', 3, '2024-10-05', 1, 'From Mount Lavinia, continue along Galle Road to reach the address in Moratuwa', 1, 1, 1, 1, 1, 2, 1, '2024-10-05 2:30:00'),
-- Received to the store but not delivered
(3, 3, '2024-10-02 10:20:00', 22000, 'cash_on_delivery_103.jpg', 4, '2024-10-06',1, 'From Borella, pass Narahenpita, then follow High Level Road to reach Maharagama', 1, 1, 1, 2, 1, 3, 0, NULL),
(4, 4, '2024-10-02 11:00:00', 12000, 'online_payment_104.jpg', 1, '2024-10-03', 2, 'From Kurana, continue along Negombo Road to reach Seeduwa', 4, 1, 1, 3, 1, 4, 0, NULL),
(5, 4, '2024-10-02 12:15:00', 16500, 'online_payment_205.jpg', 3, '2024-10-05', 2, 'From Koppara Junction, continue along Giriulla Road to reach Kandawala', 5, 1, 1, 3, 1, 5, 0, NULL),
(6, 5, '2024-10-03 08:45:00', 15500, 'bank_transfer_206.jpg', 2, '2024-10-06', 2, 'From Kattuwa, take the Puttalam-Colombo main road and continue to reach Kochchikade', 2, 1, 1, 3, 1, 6, 0, NULL),
(7, 6, '2024-10-03 09:30:00', 17000, 'online_payment_207.jpg', 3, '2024-10-05', 3, 'From Hapugala, continue towards Wakwella and then reach Ginimellagaha', 3, 1, 1, 4, 1, 7, 0, NULL),
(8, 7, '2024-10-03 10:15:00', 18500, 'bank_transfer_208.jpg', 3, '2024-10-06', 3, 'From Galle, passing Bossa, turn left onto Kumarakanda Road to reach the address in Hikkaduwa', 4, 1, 1, 4, 1, 8, 0, NULL),
(9, 8, '2024-10-04 07:50:00', 16000, 'online_payment_209.jpg', 4, '2024-10-05', 3, 'From Galle, passing Unawatuna and Thalpe, turn right onto Kabalana Beach Road to reach Ahangama', 2, 1, 1, 4, 1, 9, 0, NULL),
(10, 8, '2024-10-04 08:00:00', 14000, 'cash_on_delivery_210.jpg', 3, '2024-10-05', 4, 'From Matara, pass Mirissa Junction, and take Mirissa Road to reach Weligama', 5, 1, 1, 5, 1, 10, 0, NULL),
(11, 8, '2024-10-04 09:25:00', 17500, 'online_payment_211.jpg', 4, '2024-10-05', 4, 'From Matara, pass Malimbada Junction and take Akuressa Road to reach Thelijjawila', 3, 1, 1, 5, 1, 11, 0, NULL),
(12, 9, '2024-10-04 10:35:00', 16000, 'bank_transfer_212.jpg', 3, '2024-10-05', 4, 'From Matara, pass Gandara Junction and continue on New Tangalle Road to reach Dikwella', 4, 1, 1, 5, 1, 12, 0, NULL),
-- Sent by train but yet to be received to the store
(13, 10, '2024-10-05 11:00:00', 17000, 'online_payment_213.jpg', 2, '2024-10-05', 5, 'From Jaffna, pass Eluppayady Junction, then proceed on KKS Road to reach Tellippalai', 3, 1, 1, 6, 0, 13, 0, NULL),
-- Assigned a train and a truck but yet to be sent
(14, 11, '2024-10-05 12:45:00', 13500, 'cash_on_delivery_214.jpg', 3, '2024-10-05', 5, 'From Jaffna, pass Jayanthan Junction, continue along Karativu Road to reach Vaddukoddai', 1, 1, 0, 7, 0, 14, 0, NULL),
-- Confirmed but yet to be assigned a train and a truck
(15, 12, '2024-10-05 13:30:00', 16500, 'online_payment_215.jpg', 4, '2024-10-05', 5, 'From Jaffna, pass Nallur Junction, and continue along Thondaimanaru Road to reach Nelliady', 2, 1, 0, NULL, 0, NULL, 0, NULL),
(16, 13, '2024-10-05 14:15:00', 15000, 'bank_transfer_216.jpg', 3, '2024-10-05', 6, 'From Trincomalee, continue along Kandy Road, crossing Kinniya Bridge to reach the address', 3, 1, 0, NULL, 0, NULL, 0, NULL),
-- Yet to be confirmed
(17, 14, '2024-10-05 15:50:00', 15500, 'online_payment_217.jpg', 2, '2024-10-05', 6, 'From Trincomalee, pass Sampur, and continue on Trincomalee-Muttur Road to reach Muttur Town', 5, 0, 0, NULL, 0, NULL, 0, NULL),
(18, 15, '2024-10-05 16:30:00', 14000, 'cash_on_delivery_218.jpg', 2, '2024-10-05', 6, 'From Trincomalee, pass Nilaveli on Pulmoddai Road to reach Kuchchaveli', 4, 0, 0, NULL, 0, NULL, 0, NULL);


-- ******************************************************************************************
-- Ordered_products
