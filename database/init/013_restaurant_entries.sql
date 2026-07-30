INSERT INTO restaurants (name, cuisine, description, times_ordered, times_voted, average_rating, icon, color, active)
SELECT 'Maddies', 'American', 'Sandwiches, salads, and all-day comfort food.', 42, 0, 4.70, 'M', '#f6c177', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Maddies' AND active = TRUE);

INSERT INTO restaurants (name, cuisine, description, times_ordered, times_voted, average_rating, icon, color, active)
SELECT 'Windham Junction', 'Cafe', 'Fresh bowls, wraps, and a great daily special.', 35, 0, 4.50, 'W', '#9ccfd8', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Windham Junction' AND active = TRUE);

INSERT INTO restaurants (name, cuisine, description, times_ordered, times_voted, average_rating, icon, color, active)
SELECT 'Pressed Cafe', 'Mediterranean', 'Bright, quick Mediterranean plates and pita.', 29, 0, 4.80, 'P', '#c4a7e7', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Pressed Cafe' AND active = TRUE);
