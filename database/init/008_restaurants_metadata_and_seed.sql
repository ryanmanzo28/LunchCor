SET @add_cuisine = (
  SELECT IF(
    COUNT(*) = 0,
    'ALTER TABLE restaurants ADD COLUMN cuisine VARCHAR(80) NOT NULL DEFAULT ''General'' AFTER name',
    'SELECT 1'
  )
  FROM information_schema.columns
  WHERE table_schema = DATABASE()
    AND table_name = 'restaurants'
    AND column_name = 'cuisine'
);
PREPARE stmt FROM @add_cuisine;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @add_icon = (
  SELECT IF(
    COUNT(*) = 0,
    'ALTER TABLE restaurants ADD COLUMN icon VARCHAR(8) NOT NULL DEFAULT ''R'' AFTER average_rating',
    'SELECT 1'
  )
  FROM information_schema.columns
  WHERE table_schema = DATABASE()
    AND table_name = 'restaurants'
    AND column_name = 'icon'
);
PREPARE stmt FROM @add_icon;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @add_color = (
  SELECT IF(
    COUNT(*) = 0,
    'ALTER TABLE restaurants ADD COLUMN color VARCHAR(24) NOT NULL DEFAULT ''#9aa5b1'' AFTER icon',
    'SELECT 1'
  )
  FROM information_schema.columns
  WHERE table_schema = DATABASE()
    AND table_name = 'restaurants'
    AND column_name = 'color'
);
PREPARE stmt FROM @add_color;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

UPDATE restaurants
SET cuisine = 'General'
WHERE cuisine IS NULL OR cuisine = '';

UPDATE restaurants
SET icon = UPPER(LEFT(name, 1))
WHERE icon IS NULL OR icon = '';

UPDATE restaurants
SET color = '#9aa5b1'
WHERE color IS NULL OR color = '';

INSERT INTO restaurants (name, cuisine, description, times_ordered, average_rating, icon, color, active)
SELECT 'Maddie''s', 'American', 'Sandwiches, salads, and all-day comfort food.', 42, 4.70, 'M', '#f6c177', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Maddie''s' AND active = TRUE);

INSERT INTO restaurants (name, cuisine, description, times_ordered, average_rating, icon, color, active)
SELECT 'Windham Junction', 'Cafe', 'Fresh bowls, wraps, and a great daily special.', 35, 4.50, 'W', '#9ccfd8', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Windham Junction' AND active = TRUE);

INSERT INTO restaurants (name, cuisine, description, times_ordered, average_rating, icon, color, active)
SELECT 'Pressed', 'Mediterranean', 'Bright, quick Mediterranean plates and pita.', 29, 4.80, 'P', '#c4a7e7', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Pressed' AND active = TRUE);

INSERT INTO restaurants (name, cuisine, description, times_ordered, average_rating, icon, color, active)
SELECT 'Saigon Kitchen', 'Vietnamese', 'Banh mi, pho, and rice bowls made to order.', 18, 4.60, 'S', '#a3be8c', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Saigon Kitchen' AND active = TRUE);
