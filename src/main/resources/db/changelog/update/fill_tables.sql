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
