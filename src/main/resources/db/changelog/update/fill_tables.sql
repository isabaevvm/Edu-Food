INSERT INTO users (email, password)
VALUES ('qwe@qwe.qwe', '$2a$12$WB2YUbFcCN0tm44SBcKUjua9yiFBsfB3vW02IjuwzY7HGtlQIKzy2'),
       ('ewq@ewq.com', '$2a$12$WB2YUbFcCN0tm44SBcKUjua9yiFBsfB3vW02IjuwzY7HGtlQIKzy2'),
       ('string@gmail.com', '$2a$12$WB2YUbFcCN0tm44SBcKUjua9yiFBsfB3vW02IjuwzY7HGtlQIKzy2');


INSERT INTO restaurants (name)
VALUES ('Cafe Roma'),
       ('Bella Italia'),
       ('Sushi World'),
       ('Taco Palace'),
       ('Pizza Planet'),
       ('Burger Haven'),
       ('Mediterranean Delight'),
       ('Vegetarian Oasis'),
       ('BBQ Shack'),
       ('Thai Spice');

INSERT INTO dishes (restaurant_id, name, description, price)
VALUES (1, 'Margherita Pizza', 'Classic margherita pizza with tomato, mozzarella, and basil', 12.99),
       (1, 'Pasta Carbonara', 'Spaghetti with creamy carbonara sauce and pancetta', 14.99),
       (2, 'Sashimi Platter', 'Assorted sashimi slices with soy sauce and wasabi', 18.99),
       (2, 'Teriyaki Chicken', 'Grilled chicken with teriyaki sauce and steamed rice', 15.99),
       (3, 'Taco Sampler', 'A variety of tacos with different fillings', 9.99),
       (3, 'California Roll', 'Avocado, cucumber, crab, and tobiko sushi roll', 8.99),
       (4, 'BBQ Ribs', 'Slow-cooked BBQ ribs with coleslaw and cornbread', 17.99),
       (4, 'Beef Tacos', 'Grilled beef tacos with salsa and guacamole', 11.99),
       (5, 'Cheeseburger', 'Classic cheeseburger with lettuce, tomato, and fries', 10.99),
       (5, 'Vegetarian Pizza', 'Pizza with a variety of fresh vegetables and cheese', 13.99);

INSERT INTO dishes (restaurant_id, name, description, price)
VALUES
    -- Блюда для первого заведения
    (1, 'Spaghetti Carbonara', 'Spaghetti with creamy carbonara sauce and pancetta', 12.99),
    (1, 'Margherita Pizza', 'Classic margherita pizza with tomato, mozzarella, and basil', 14.99),
    (1, 'Tiramisu', 'Italian dessert made with mascarpone cheese, ladyfingers, and coffee', 8.99),
    (1, 'Caprese Salad', 'Fresh tomato, mozzarella, and basil salad drizzled with balsamic glaze', 9.99),
    (1, 'Lasagna', 'Layers of pasta, meat sauce, and cheese baked to perfection', 15.99),
    (1, 'Ravioli', 'Stuffed pasta pillows with your choice of filling and sauce', 11.99),
    (1, 'Panna Cotta', 'Italian dessert with sweetened cream and fruit coulis', 7.99),
    (1, 'Bruschetta', 'Toasted bread topped with fresh tomatoes, garlic, and basil', 6.99),
    (1, 'Ossobuco', 'Braised veal shanks with gremolata and risotto alla milanese', 19.99),
    (1, 'Gnocchi', 'Soft potato dumplings served with various sauces', 13.99),

    -- Блюда для второго заведения
    (2, 'Sashimi Assortment', 'Assorted sashimi slices with soy sauce and wasabi', 22.99),
    (2, 'Teriyaki Salmon', 'Grilled salmon with teriyaki sauce and steamed rice', 18.99),
    (2, 'Tempura', 'Lightly battered and fried seafood and vegetables', 16.99),
    (2, 'Unagi Nigiri', 'Grilled eel on top of seasoned rice', 10.99),
    (2, 'Dragon Roll', 'Sushi roll with eel, avocado, cucumber, and eel sauce', 14.99),
    (2, 'Miso Soup', 'Traditional Japanese soybean paste soup with tofu and seaweed', 4.99),
    (2, 'Edamame', 'Steamed soybean pods with sea salt', 5.99),
    (2, 'Gyoza', 'Pan-fried dumplings with pork and vegetable filling', 7.99),
    (2, 'Rainbow Roll', 'Colorful sushi roll with assorted sashimi on top', 19.99),
    (2, 'Matcha Ice Cream', 'Green tea-flavored ice cream', 6.99);

-- Блюда для третьего заведения
INSERT INTO dishes (restaurant_id, name, description, price)
VALUES (3, 'Taco Platter', 'Assorted tacos with various fillings and toppings', 12.99),
       (3, 'Guacamole and Chips', 'Freshly made guacamole with tortilla chips', 7.99),
       (3, 'Enchiladas', 'Rolled tortillas filled with meat, cheese, and sauce', 14.99),
       (3, 'Churros', 'Deep-fried dough pastries with cinnamon sugar', 6.99),
       (3, 'Salsa Verde', 'Spicy green salsa made with tomatillos and chili peppers', 4.99),
       (3, 'Mexican Street Corn', 'Grilled corn on the cob with mayonnaise and chili powder', 5.99),
       (3, 'Tamales', 'Steamed corn dough filled with meat and sauce', 11.99),
       (3, 'Quesadillas', 'Tortillas filled with cheese, grilled to perfection', 8.99),
       (3, 'Horchata', 'Sweet rice milk beverage with cinnamon', 3.99),
       (3, 'Barbacoa Tacos', 'Slow-cooked beef tacos with savory sauce', 13.99);

-- Блюда для четвёртого заведения
INSERT INTO dishes (restaurant_id, name, description, price)
VALUES (4, 'BBQ Sampler', 'Assorted BBQ meats with a variety of sauces', 19.99),
       (4, 'Pulled Pork Sandwich', 'Tender pulled pork on a bun with coleslaw', 10.99),
       (4, 'Brisket Platter', 'Smoked brisket served with BBQ beans and cornbread', 17.99),
       (4, 'Ribs and Fries', 'BBQ ribs with seasoned fries and pickles', 15.99),
       (4, 'Cornbread', 'Homemade cornbread with honey butter', 5.99),
       (4, 'Mac and Cheese', 'Creamy macaroni and cheese side dish', 7.99),
       (4, 'BBQ Chicken', 'Grilled chicken with BBQ sauce and coleslaw', 12.99),
       (4, 'Collard Greens', 'Southern-style collard greens with ham hock', 6.99),
       (4, 'Sweet Tea', 'Classic southern sweet tea', 3.99),
       (4, 'Pecan Pie', 'Traditional pecan pie with a flaky crust', 8.99);

-- Блюда для пятого заведения
INSERT INTO dishes (restaurant_id, name, description, price)
VALUES (5, 'Pepperoni Pizza', 'Pizza with pepperoni, cheese, and tomato sauce', 13.99),
       (5, 'Pasta Alfredo', 'Fettuccine pasta with creamy Alfredo sauce', 12.99),
       (5, 'Caesar Salad', 'Romaine lettuce, croutons, Parmesan cheese, and Caesar dressing', 8.99),
       (5, 'Garlic Knots', 'Garlic-flavored bread knots with marinara dipping sauce', 5.99),
       (5, 'Calzone', 'Folded pizza dough filled with cheese, sauce, and toppings', 14.99),
       (5, 'Mushroom Risotto', 'Creamy risotto with mushrooms and Parmesan cheese', 11.99),
       (5, 'Tiramisu', 'Classic Italian dessert with coffee-soaked ladyfingers', 7.99),
       (5, 'Cannoli', 'Sweet ricotta-filled pastry tubes with chocolate chips', 6.99),
       (5, 'Italian Wedding Soup', 'Chicken broth with meatballs and greens', 5.99),
       (5, 'Limoncello', 'Italian lemon liqueur', 9.99);

-- Блюда для шестого заведения
INSERT INTO dishes (restaurant_id, name, description, price)
VALUES (6, 'Classic Cheeseburger', 'Beef patty with cheese, lettuce, tomato, and fries', 10.99),
       (6, 'Chicken Tenders', 'Crispy chicken tenders with a choice of dipping sauce', 8.99),
       (6, 'Veggie Wrap', 'Wrap filled with assorted vegetables and hummus', 9.99),
       (6, 'Mushroom Swiss Burger', 'Beef patty with mushrooms, Swiss cheese, and onion rings', 12.99),
       (6, 'Caesar Wrap', 'Wrap with grilled chicken, romaine lettuce, and Caesar dressing', 11.99),
       (6, 'Onion Rings', 'Crispy battered onion rings with ketchup', 4.99),
       (6, 'Milkshake', 'Thick and creamy milkshake with various flavors', 6.99),
       (6, 'BLT Sandwich', 'Bacon, lettuce, tomato, and mayo on toasted bread', 9.99),
       (6, 'Sweet Potato Fries', 'Crispy sweet potato fries with dipping sauce', 5.99),
       (6, 'Apple Pie', 'Classic apple pie with a flaky crust', 7.99);

-- Блюда для седьмого заведения
INSERT INTO dishes (restaurant_id, name, description, price)
VALUES (7, 'Greek Salad', 'Salad with tomatoes, cucumbers, olives, feta cheese, and Greek dressing', 9.99),
       (7, 'Gyros Platter', 'Sliced lamb or chicken with pita, tzatziki, and vegetables', 11.99),
       (7, 'Spanakopita', 'Spinach and feta cheese wrapped in phyllo pastry', 7.99),
       (7, 'Moussaka', 'Layered dish with eggplant, ground meat, and béchamel sauce', 13.99),
       (7, 'Baklava', 'Sweet pastry with layers of phyllo dough, nuts, and honey', 6.99),
       (7, 'Tzatziki', 'Yogurt-based dip with cucumber and garlic', 4.99),
       (7, 'Souvlaki Skewers', 'Grilled skewers with marinated meat and vegetables', 10.99),
       (7, 'Dolmades', 'Grape leaves stuffed with rice and herbs', 8.99),
       (7, 'Greek Coffee', 'Strong coffee brewed with finely ground coffee beans', 3.99),
       (7, 'Retsina', 'Greek white wine with a unique pine resin flavor', 11.99);

-- Блюда для восьмого заведения
INSERT INTO dishes (restaurant_id, name, description, price)
VALUES (8, 'Vegetable Curry', 'Spicy curry with mixed vegetables and rice', 12.99),
       (8, 'Paneer Tikka', 'Grilled cottage cheese with Indian spices and yogurt', 11.99),
       (8, 'Chicken Biryani', 'Fragrant rice dish with chicken, spices, and saffron', 14.99),
       (8, 'Naan Bread', 'Traditional Indian flatbread baked in a tandoor oven', 3.99),
       (8, 'Saag Paneer', 'Creamy spinach curry with cubes of paneer cheese', 10.99),
       (8, 'Samosas', 'Deep-fried pastry filled with spiced potatoes and peas', 6.99),
       (8, 'Lassi', 'Refreshing yogurt-based drink with fruit flavors', 5.99),
       (8, 'Raita', 'Yogurt sauce with cucumber, mint, and spices', 4.99),
       (8, 'Masala Chai', 'Spiced tea with milk and aromatic Indian spices', 4.99),
       (8, 'Gulab Jamun', 'Sweet fried dough balls soaked in sugar syrup', 7.99);

-- Блюда для девятого заведения
INSERT INTO dishes (restaurant_id, name, description, price)
VALUES (9, 'Pad Thai', 'Stir-fried rice noodles with shrimp, tofu, and peanuts', 13.99),
       (9, 'Green Curry', 'Spicy green curry with chicken, eggplant, and Thai basil', 12.99),
       (9, 'Tom Yum Soup', 'Spicy and sour soup with shrimp, mushrooms, and lemongrass', 9.99),
       (9, 'Mango Sticky Rice', 'Sweet dessert with ripe mango and glutinous rice', 8.99),
       (9, 'Papaya Salad', 'Shredded green papaya salad with chili, lime, and fish sauce', 7.99),
       (9, 'Massaman Curry', 'Rich and aromatic curry with beef and potatoes', 14.99),
       (9, 'Spring Rolls', 'Fresh spring rolls with shrimp, herbs, and peanut sauce', 6.99),
       (9, 'Thai Iced Tea', 'Sweet and creamy iced tea with condensed milk', 4.99),
       (9, 'Sticky Rice with Durian', 'Sticky rice dessert with durian fruit', 10.99),
       (9, 'Som Tum', 'Spicy green papaya salad with tomatoes and peanuts', 9.99);

-- Блюда для десятого заведения
INSERT INTO dishes (restaurant_id, name, description, price)
VALUES (10, 'Sushi Boat', 'Assortment of sushi and sashimi on a wooden boat platter', 25.99),
       (10, 'Dragon Roll', 'Sushi roll with eel, avocado, cucumber, and eel sauce', 14.99),
       (10, 'Tempura Udon', 'Udon noodle soup with tempura shrimp and vegetables', 15.99),
       (10, 'Edamame', 'Steamed soybean pods with sea salt', 5.99),
       (10, 'Miso Soup', 'Traditional Japanese soybean paste soup with tofu and seaweed', 4.99),
       (10, 'Sashimi Platter', 'Assorted sashimi slices with soy sauce and wasabi', 18.99),
       (10, 'Nigiri Sushi', 'Individual sushi pieces with various toppings', 16.99),
       (10, 'Green Tea Ice Cream', 'Japanese green tea-flavored ice cream', 6.99),
       (10, 'Rainbow Roll', 'Colorful sushi roll with assorted sashimi on top', 19.99),
       (10, 'Sake', 'Japanese rice wine', 8.99);

INSERT INTO orders (user_id, order_date)
VALUES (1, '2023-09-09 12:00:00'),
       (2, '2023-09-08 14:30:00'),
       (3, '2023-09-07 10:15:00'),
       (1, '2023-09-06 19:45:00'),
       (2, '2023-09-05 17:30:00'),
       (3, '2023-09-04 15:20:00'),
       (1, '2023-09-03 11:10:00'),
       (2, '2023-09-02 16:55:00'),
       (3, '2023-09-01 13:40:00'),
       (1, '2023-08-31 18:25:00');
