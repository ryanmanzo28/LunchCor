-- Generated from data/grandfanallys.csv; safe to re-run.
INSERT INTO restaurants (name, cuisine, description, icon, color, active)
SELECT 'Granfanally''s', 'Italian', 'New York-style pizza, Italian classics, and subs.', 'GF', '#e53e3e', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Granfanally''s');

SET @restaurant_id := (SELECT id FROM restaurants WHERE name = 'Granfanally''s' LIMIT 1);

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Tenders', 'Please choose one sauce to come on the side.', 'Appetizers', '1730', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Tenders')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Garlic Knots', 'Fresh pizza dough tied up, baked until golden, then smothered in parmesan cheese with our famous garlic-olive oil.', 'Appetizers', '755', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Garlic Knots')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Buffalo Chicken Calzone', 'Buffalo chicken, chunky bleu cheese dressing & spicy buffalo sauce.', 'Calzones', '2523', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Buffalo Chicken Calzone')
      AND COALESCE(mi.category, '') = COALESCE('Calzones', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Cheese Calzone', 'A Classic Italian favorite.', 'Calzones', '1960', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Cheese Calzone')
      AND COALESCE(mi.category, '') = COALESCE('Calzones', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Hand Cut Fries & 6 Wings Combo', 'Sweet potato or regular.', 'Combo Meals', '1960', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Hand Cut Fries & 6 Wings Combo')
      AND COALESCE(mi.category, '') = COALESCE('Combo Meals', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sweet Potato Fries & 6 Wings Combo', NULL, 'Combo Meals', '2190', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sweet Potato Fries & 6 Wings Combo')
      AND COALESCE(mi.category, '') = COALESCE('Combo Meals', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, '3 Little Pigs Burger', 'Cheeseburger topped with pulled pork, bacon, and sausage with Sriracha aioli.', 'Gourmet Burgers', '2075', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('3 Little Pigs Burger')
      AND COALESCE(mi.category, '') = COALESCE('Gourmet Burgers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Cheeseburger Popular Choice', NULL, 'Gourmet Burgers', '1730', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Cheeseburger Popular Choice')
      AND COALESCE(mi.category, '') = COALESCE('Gourmet Burgers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kid''s Cheeseburger & Fries', NULL, 'Kids Menu', '1015', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kid''s Cheeseburger & Fries')
      AND COALESCE(mi.category, '') = COALESCE('Kids Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kid''s Chicken Tenders & Fries', NULL, 'Kids Menu', '1265', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kid''s Chicken Tenders & Fries')
      AND COALESCE(mi.category, '') = COALESCE('Kids Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Medium Cheese Pizza & Full Order of Wings Monday Special', NULL, 'Monday Special', '2305', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Medium Cheese Pizza & Full Order of Wings Monday Special')
      AND COALESCE(mi.category, '') = COALESCE('Monday Special', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Cheese Pizza', 'Classic cheese or create your own pizza.', 'Pizza', '1615', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Cheese Pizza')
      AND COALESCE(mi.category, '') = COALESCE('Pizza', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Gluten Free Pizza', 'Cooked to perfection with our famous sauce and cheese.', 'Pizza', '1730', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Gluten Free Pizza')
      AND COALESCE(mi.category, '') = COALESCE('Pizza', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Apple Walnut Salad', 'Grilled chicken, crumbled Bleu cheese, raisins, cranberries & walnuts.', 'Salads', '1325', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Apple Walnut Salad')
      AND COALESCE(mi.category, '') = COALESCE('Salads', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'House Salad', 'Fresh mixed greens topped with carrot, tomato, red onion, cucumber & croutons.', 'Salads', '960', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('House Salad')
      AND COALESCE(mi.category, '') = COALESCE('Salads', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Granfanally''s Baby Clam Sicilian Pizza', 'Mozzarella, plum tomatoes, baby clams, white wine, and herbs on our homemade pizza dough. Simply a taste bud party.', 'Sicilian Pizza', '2885', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Granfanally''s Baby Clam Sicilian Pizza')
      AND COALESCE(mi.category, '') = COALESCE('Sicilian Pizza', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Mascarpone Sicilian Pizza', 'Mascarpone cheese, sausage, broccoli, roasted red peppers, garlic & mozzarella.', 'Sicilian Pizza', '2885', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Mascarpone Sicilian Pizza')
      AND COALESCE(mi.category, '') = COALESCE('Sicilian Pizza', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Garlic Knots Pizza', 'Straight out of the long island, NY, and like no other.', 'Specialty Pizza', '1960', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Garlic Knots Pizza')
      AND COALESCE(mi.category, '') = COALESCE('Specialty Pizza', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Mimi Pizza', 'Fresh eggplant and dollops of ricotta cheese.', 'Specialty Pizza', '2075', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Mimi Pizza')
      AND COALESCE(mi.category, '') = COALESCE('Specialty Pizza', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Stuffed Pizza with Ricotta & Mozzarella', NULL, 'Specialty Pizza', '1960', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Stuffed Pizza with Ricotta & Mozzarella')
      AND COALESCE(mi.category, '') = COALESCE('Specialty Pizza', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Purchase any Specialty Pizza & Receive a Large Cheese Pizza Absolutely Free', NULL, 'Sunday Thursday Specials', '1960', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Purchase any Specialty Pizza & Receive a Large Cheese Pizza Absolutely Free')
      AND COALESCE(mi.category, '') = COALESCE('Sunday Thursday Specials', '')
  );
