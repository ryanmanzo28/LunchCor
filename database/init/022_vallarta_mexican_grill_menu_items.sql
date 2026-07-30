-- Generated from data/vallarta.csv; safe to re-run.
INSERT INTO restaurants (name, cuisine, description, icon, color, active)
SELECT 'Vallarta Mexican Grill', 'Mexican', 'Authentic Mexican tacos, burritos, sides, and salsas.', 'VM', '#dd6b20', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Vallarta Mexican Grill');

SET @restaurant_id := (SELECT id FROM restaurants WHERE name = 'Vallarta Mexican Grill' LIMIT 1);

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, '4 oz Hot Tomatillo Sauce', 'Side of Hot tomatillo sauce', 'Menu', '150', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('4 oz Hot Tomatillo Sauce')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, '4 oz Mild Tomatillo Salsa', 'Side of tomatillo salsa', 'Menu', '150', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('4 oz Mild Tomatillo Salsa')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, '8 oz Mild Tomatillo salsa', NULL, 'Menu', '325', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('8 oz Mild Tomatillo salsa')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, '8oz Hot tomatillo salsa', NULL, 'Menu', '325', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('8oz Hot tomatillo salsa')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Extra hot Arbol salsa', NULL, 'Menu', '150', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Extra hot Arbol salsa')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Large Side of beans 24oz', NULL, 'Menu', '499', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Large Side of beans 24oz')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Large Side of rice 24oz', NULL, 'Menu', '499', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Large Side of rice 24oz')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side de chile toreado', NULL, 'Menu', '75', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side de chile toreado')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side Flour tortilla', NULL, 'Menu', '25', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side Flour tortilla')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side handmade corn tortilla', NULL, 'Menu', '50', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side handmade corn tortilla')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side of Chipotle Crema', NULL, 'Menu', '199', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side of Chipotle Crema')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side of Consome (birria Sauce)', 'Complete your Birria meal with a delicious side of consome served in a 8oz container.', 'Menu', '225', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side of Consome (birria Sauce)')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side Of Fajita Veggie', NULL, 'Menu', '375', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side Of Fajita Veggie')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side of french fries', NULL, 'Menu', '350', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side of french fries')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side of Guacamole Salsa / Avocado crema', 'Try a side of our delicious guacamole salsa made with avocado, lime, cilantro, serrano peppers, onion garlic and seasoned to perfection served in a 3.25 oz container.', 'Menu', '250', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side of Guacamole Salsa / Avocado crema')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'side of pickled onion 4 oz', NULL, 'Menu', '175', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('side of pickled onion 4 oz')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side of Pickled Onion 8oz', NULL, 'Menu', '325', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side of Pickled Onion 8oz')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side of pico de gallo', 'small side of Pico de Gallo', 'Menu', '150', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side of pico de gallo')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side of Rice and Beans', NULL, 'Menu', '499', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side of Rice and Beans')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side of Salsa Verde', NULL, 'Menu', '199', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side of Salsa Verde')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side of Shredded cheese', NULL, 'Menu', '199', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side of Shredded cheese')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Side of sour cream', NULL, 'Menu', '175', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Side of sour cream')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Small side of beans 8oz', NULL, 'Menu', '275', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Small side of beans 8oz')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Small side of rice 8oz', NULL, 'Menu', '275', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Small side of rice 8oz')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );
