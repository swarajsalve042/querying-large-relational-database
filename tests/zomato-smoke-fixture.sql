CREATE TABLE IF NOT EXISTS zomato (
    restaurant_name VARCHAR(150) NOT NULL,
    cuisines VARCHAR(150) NOT NULL,
    votes INT NOT NULL,
    rating DECIMAL(3,1) NOT NULL,
    restaurant_type VARCHAR(80) NOT NULL,
    average_cost_for_two DECIMAL(10,2) NOT NULL
);

INSERT INTO zomato
    (restaurant_name, cuisines, votes, rating, restaurant_type, average_cost_for_two)
VALUES
    ('CI Fictional Chicken House', 'Chicken', 120, 4.5, 'Quick Bites', 450.00),
    ('CI Fictional Garden Cafe', 'Cafe', 80, 3.8, 'Cafe', 600.00),
    ('CI Fictional Spice Kitchen', 'Indian', 45, 3.2, 'Casual Dining', 900.00),
    ('CI Fictional Family Diner', 'North Indian', 20, 2.5, 'Casual Dining', 1100.00),
    ('CI Fictional Express', 'Fast Food', 120, 4.0, 'Quick Bites', 350.00);
