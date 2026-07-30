-- Generated from data/windhamjunction.csv; safe to re-run.
INSERT INTO restaurants (name, cuisine, description, icon, color, active)
SELECT 'Windham Junction', 'Deli', 'Fresh deli sandwiches and classic lunch favorites.', 'WJ', '#4299e1', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Windham Junction');

SET @restaurant_id := (SELECT id FROM restaurants WHERE name = 'Windham Junction' LIMIT 1);

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Big Club Sandwich', 'Toasted wheat triple decker with your choice of', 'Menu', '1399', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_5963-2-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Big Club Sandwich')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'BLT', 'On toasted wheat with mayo.', 'Menu', '999', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_5956-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('BLT')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Buffalo Chicken Finger Wrap', 'With bleu cheese dressing, spicy sauce and romaine lettuce.', 'Menu', '1099', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_5955-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Buffalo Chicken Finger Wrap')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Salad Sandwich', 'House-made chicken salad with dried Cranberries, and sprinkled with toasted almonds on a hearty wheat berry bread. Served with chips.', 'Menu', '1099', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_6071-2-scaled-e1772118961642-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Salad Sandwich')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Egg Salad Sandwich', 'On country white bread with lettuce.', 'Menu', '1099', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_6080-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Egg Salad Sandwich')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Fresh Angus Burger', NULL, 'Menu', '999', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/02/IMG_1235-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Fresh Angus Burger')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Fresh Veggie Wheat Wrap', 'Seasonal vegetables grilled with cheese or wrapped up cold with a hummus mayo spread.', 'Menu', '1099', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/02/IMG_5928-2-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Fresh Veggie Wheat Wrap')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Grilled Cheese with Tomato', 'Grilled cheese with fresh tomato slices.', 'Menu', '899', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/02/IMG_5927-2-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Grilled Cheese with Tomato')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Grilled Chicken Caesar Wrap', 'All white chicken breast on a white wrap with romaine lettuce, shredded parmesan cheese and homemade croutons.', 'Menu', '1099', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_5949-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Grilled Chicken Caesar Wrap')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Grilled Meatloaf Sandwich', 'Generations'' favorite, old fashioned flavor served on a grilled onion roll with bacon and ketchup.', 'Menu', '1099', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_6077-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Grilled Meatloaf Sandwich')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Grilled Reuben Sandwich', 'Juicy corned beef or turkey grilled on marbled rye with sauerkraut and melted Swiss topped with 1000 island dressing.', 'Menu', '1199', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_6073-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Grilled Reuben Sandwich')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Hometown Italian Sub', 'Delicious blend of mortadella, capicola ham, and salami with provolone cheese on a toasted sub roll, topped with chopped lettuce, tomato, onion and seasoned Italian oil.', 'Menu', '1199', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_6086-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Hometown Italian Sub')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Hot Pastrami Rachel Sandwich', 'With coleslaw, Swiss cheese, 1000 island dressing on marbled rye bread.', 'Menu', '1299', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_6050-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Hot Pastrami Rachel Sandwich')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Hot Pastrami Sandwich', 'Grilled to perfection with Swiss cheese on marbled rye with spicy brown mustard.', 'Menu', '1199', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_5948-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Hot Pastrami Sandwich')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Jon''s Homemade Meatball Sub', 'Topped with provolone cheese.', 'Menu', '1099', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_5967-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Jon''s Homemade Meatball Sub')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sliced Roast Beef Onion Roll', 'On a soft homemade onion roll with provolone cheese, lettuce, tomato and seasoned with a horseradish spread.', 'Menu', '1199', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_5968-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sliced Roast Beef Onion Roll')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Smokey BBQ Pulled Pork Sub', 'Slow-cooked pulled pork with BBQ sauce.', 'Menu', '999', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_5965-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Smokey BBQ Pulled Pork Sub')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Roast Turkey Feast', 'Grilled stuffing, cranberry sauce, lettuce, mayo and roasted turkey on our home baked sub roll.', 'Menu', '1099', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/02/IMG_5952-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Roast Turkey Feast')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Rooster Wrap', 'Fried or grilled chicken, bacon, hard-boiled egg, lettuce, tomato and avocado dressed with honey mustard dressing in a flour tortilla wrap.', 'Menu', '1199', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_5945-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Rooster Wrap')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Tuna Salad Sandwich', 'The best of albacore white tuna, simply mixed with mayo and our special seasoning. Served on wheat bread with lettuce and tomato.', 'Menu', '1099', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_6085-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Tuna Salad Sandwich')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Turkey BLT', 'House roasted Turkey breast, sliced with bacon, lettuce and tomato on toasted wheat with mayo.', 'Menu', '1299', 'USD', 'https://windhamjunction.com/wp-content/uploads/2026/01/IMG_6049-600x600.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Turkey BLT')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );
