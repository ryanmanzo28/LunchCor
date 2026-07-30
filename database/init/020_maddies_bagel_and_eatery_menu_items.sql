-- Generated from data/maddiesnh.csv; safe to re-run.
INSERT INTO restaurants (name, cuisine, description, icon, color, active)
SELECT 'Maddie''s Bagel & Eatery', 'American', 'Bagels, breakfast, sandwiches, and comfort food.', 'MB', '#f6c177', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Maddie''s Bagel & Eatery');

SET @restaurant_id := (SELECT id FROM restaurants WHERE name = 'Maddie''s Bagel & Eatery' LIMIT 1);

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Bacon, Ham, Sausage, Chicken Sausage', NULL, 'Add Ons', '399', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Bacon, Ham, Sausage, Chicken Sausage')
      AND COALESCE(mi.category, '') = COALESCE('Add Ons', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Baked Beans', NULL, 'Add Ons', '299', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Baked Beans')
      AND COALESCE(mi.category, '') = COALESCE('Add Ons', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Berries', NULL, 'Add Ons', '525', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Berries')
      AND COALESCE(mi.category, '') = COALESCE('Add Ons', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Corned Beef Hash', NULL, 'Add Ons', '449', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Corned Beef Hash')
      AND COALESCE(mi.category, '') = COALESCE('Add Ons', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Fruit Cup', NULL, 'Add Ons', '450', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Fruit Cup')
      AND COALESCE(mi.category, '') = COALESCE('Add Ons', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Home Fries', NULL, 'Add Ons', '299', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Home Fries')
      AND COALESCE(mi.category, '') = COALESCE('Add Ons', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kielbasa', NULL, 'Add Ons', '425', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kielbasa')
      AND COALESCE(mi.category, '') = COALESCE('Add Ons', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Muffins', NULL, 'Add Ons', '375', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Muffins')
      AND COALESCE(mi.category, '') = COALESCE('Add Ons', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Scones', NULL, 'Add Ons', '399', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Scones')
      AND COALESCE(mi.category, '') = COALESCE('Add Ons', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Tea Bread', NULL, 'Add Ons', '425', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Tea Bread')
      AND COALESCE(mi.category, '') = COALESCE('Add Ons', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Black Forest Benedict', 'Poached eggs, hash browns, and bacon on an English muffin, topped with hollandaise and a side of home fries.', 'Benedicts', '1275', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Black Forest Benedict')
      AND COALESCE(mi.category, '') = COALESCE('Benedicts', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Irish Eggs', NULL, 'Benedicts', '1375', 'USD', 'https://static.spotapps.co/web/placeholder.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Irish Eggs')
      AND COALESCE(mi.category, '') = COALESCE('Benedicts', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Pesto Benedict', 'Poached eggs, spinach, tomatoes, and mushrooms, on an English muffin, topped with hollandaise and a side of fruit.', 'Benedicts', '1399', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Pesto Benedict')
      AND COALESCE(mi.category, '') = COALESCE('Benedicts', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sausage Benedict', 'Poached eggs, corned beef hash on an English muffin, topped with hollandaise and a side of home fries.', 'Benedicts', '1275', 'USD', 'https://static.spotapps.co/web/placeholder.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sausage Benedict')
      AND COALESCE(mi.category, '') = COALESCE('Benedicts', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Veggie Benedict', 'Poached eggs, and sausage patties on a grilled English muffin, topped with hollandaise and a side of home fries.', 'Benedicts', '1349', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Veggie Benedict')
      AND COALESCE(mi.category, '') = COALESCE('Benedicts', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Woodsmen’s Benedict', 'Poached eggs, spinach, and roasted red peppers, on an English muffin, topped with pesto and asiago cheese, and a side of home fries', 'Benedicts', '1399', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Woodsmen’s Benedict')
      AND COALESCE(mi.category, '') = COALESCE('Benedicts', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Artisan', 'Fried egg, spinach, tomato, basil pesto, and Swiss on a grilled ciabatta.', 'Breakfast On Bread', '675', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Artisan')
      AND COALESCE(mi.category, '') = COALESCE('Breakfast On Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mc Brit', 'Fried egg, sausage, and cheddar on a grilled cinnamon raisin bagel.', 'Breakfast On Bread', '875', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mc Brit')
      AND COALESCE(mi.category, '') = COALESCE('Breakfast On Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mc Foxy', 'Fried egg, grilled hash browns, sausage, and cheddar cheese on grilled Texas toast.', 'Breakfast On Bread', '799', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mc Foxy')
      AND COALESCE(mi.category, '') = COALESCE('Breakfast On Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mc Maddie''s', 'Two eggs scrambled, fire-roasted corn, peppers, onions, black beans, tomatoes, cheddar jack, and salsa in a flour tortilla.', 'Breakfast On Bread', '950', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mc Maddie''s')
      AND COALESCE(mi.category, '') = COALESCE('Breakfast On Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mc Manders', 'Fried egg and melted cheddar on a breakfast ciabatta. Add Ham, Bacon, or Sausage +$1.24', 'Breakfast On Bread', '950', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mc Manders')
      AND COALESCE(mi.category, '') = COALESCE('Breakfast On Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mc Reed''s', 'Fried egg, cheddar, Black Forest ham, and bacon on grilled Texas toast.', 'Breakfast On Bread', '975', 'USD', 'https://static.spotapps.co/web/placeholder.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mc Reed''s')
      AND COALESCE(mi.category, '') = COALESCE('Breakfast On Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Southwest Breakfast Wrap', 'Fried egg, bacon, and American on an English muffin grilled with spinach, avocado spread, and tomatoes.', 'Breakfast On Bread', '925', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Southwest Breakfast Wrap')
      AND COALESCE(mi.category, '') = COALESCE('Breakfast On Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Western Breakfast Wrap', 'Two eggs scrambled with peppers, onions, diced ham, and cheddar cheese in a flour tortilla.', 'Breakfast On Bread', '925', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Western Breakfast Wrap')
      AND COALESCE(mi.category, '') = COALESCE('Breakfast On Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Daisy Scrambler', 'Three eggs with peppers, onions, and cheddar over grilled corned beef hash and hashbrowns, topped with hollandaise.', 'Classic Scramblers', '1425', 'USD', 'https://static.spotapps.co/web/placeholder.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Daisy Scrambler')
      AND COALESCE(mi.category, '') = COALESCE('Classic Scramblers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Irish Scrambler', NULL, 'Classic Scramblers', '1450', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Irish Scrambler')
      AND COALESCE(mi.category, '') = COALESCE('Classic Scramblers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Belgian Waffle', 'Grilled kielbasa served with two eggs any style, home fries, beans, and grilled tea bread.', 'Gourmet Griddle', '1185', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Belgian Waffle')
      AND COALESCE(mi.category, '') = COALESCE('Gourmet Griddle', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Breakfast Bowl', NULL, 'Gourmet Griddle', '1350', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Breakfast Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Gourmet Griddle', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Cinnamon Roll French Toast', 'French toast grilled and topped with maple butter, berries, and whipped cream.', 'Gourmet Griddle', '1249', 'USD', 'https://static.spotapps.co/web/placeholder.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Cinnamon Roll French Toast')
      AND COALESCE(mi.category, '') = COALESCE('Gourmet Griddle', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Eggs in A Basket', 'Cinnamon roll cut in half dipped in French toast batter and topped with berries and powdered sugar.', 'Gourmet Griddle', '1250', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Eggs in A Basket')
      AND COALESCE(mi.category, '') = COALESCE('Gourmet Griddle', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Huevos Rancheros', 'Three eggs scrambled with corn, peppers, onions, black beans, tomatoes, and cheddar, topped with chili and served with home fries and grilled cornbread.', 'Gourmet Griddle', '1399', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Huevos Rancheros')
      AND COALESCE(mi.category, '') = COALESCE('Gourmet Griddle', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Nana''s Lemon French Toast', NULL, 'Gourmet Griddle', '1299', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Nana''s Lemon French Toast')
      AND COALESCE(mi.category, '') = COALESCE('Gourmet Griddle', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'New England Breakfast', 'Two fried eggs in grilled Texas toast. Served with home fries and corned beef hash.', 'Gourmet Griddle', '1499', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('New England Breakfast')
      AND COALESCE(mi.category, '') = COALESCE('Gourmet Griddle', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Southwest Breakfast Quesadilla', 'Two scrambled eggs with peppers, onions, mushrooms, tomatoes, broccoli, and cheddar cheese in a grilled spinach tortilla. Served with a side of salsa and sour cream.', 'Gourmet Griddle', '1250', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Southwest Breakfast Quesadilla')
      AND COALESCE(mi.category, '') = COALESCE('Gourmet Griddle', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Veggie Breakfast Quesadilla', 'Belgium waffle topped with blueberries, strawberries, powder sugar, and whipped cream.', 'Gourmet Griddle', '1275', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Veggie Breakfast Quesadilla')
      AND COALESCE(mi.category, '') = COALESCE('Gourmet Griddle', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Vienna Toast', 'Two scrambled eggs with corn, onions, peppers, black beans, tomatoes, and cheddar cheese in a grilled flour tortilla. Served with a side of salsa and sour cream.', 'Gourmet Griddle', '1249', 'USD', 'https://static.spotapps.co/web/placeholder.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Vienna Toast')
      AND COALESCE(mi.category, '') = COALESCE('Gourmet Griddle', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Avocado Toast', 'Low-fat vanilla yogurt topped with granola, berries, and honey.', 'Light & Tasty', '1025', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Avocado Toast')
      AND COALESCE(mi.category, '') = COALESCE('Light & Tasty', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Lite Breakfast', 'Organic steel-cut oatmeal served with a side of brown sugar, craisins, and candied walnuts.', 'Light & Tasty', '1049', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Lite Breakfast')
      AND COALESCE(mi.category, '') = COALESCE('Light & Tasty', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mc Healthy', NULL, 'Light & Tasty', '975', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mc Healthy')
      AND COALESCE(mi.category, '') = COALESCE('Light & Tasty', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Organic Oatmeal', 'Two egg whites scrambled with tomatoes, broccoli, spinach, cheddar cheese, and salsa and served in a wheat wrap.', 'Light & Tasty', '779', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Organic Oatmeal')
      AND COALESCE(mi.category, '') = COALESCE('Light & Tasty', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Yogurt Parfait', 'Low-fat vanilla yogurt with granola, topped with berries and honey. Served with fresh fruit or grilled tea bread.', 'Light & Tasty', '825', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Yogurt Parfait')
      AND COALESCE(mi.category, '') = COALESCE('Light & Tasty', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Addie Cake', 'Chocolate chip, banana, blueberry or plain.', 'Mini Maddie''s', '699', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Addie Cake')
      AND COALESCE(mi.category, '') = COALESCE('Mini Maddie''s', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Amelia’s Sandwich', 'Topped with strawberries.', 'Mini Maddie''s', '699', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Amelia’s Sandwich')
      AND COALESCE(mi.category, '') = COALESCE('Mini Maddie''s', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'French Toast Sticks', 'One egg any style & toast.', 'Mini Maddie''s', '699', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('French Toast Sticks')
      AND COALESCE(mi.category, '') = COALESCE('Mini Maddie''s', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Little Egg', 'Fried egg, American cheese on an English muffin. Add Bacon, Sausage, or Ham +$0.75', 'Mini Maddie''s', '699', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Little Egg')
      AND COALESCE(mi.category, '') = COALESCE('Mini Maddie''s', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mickey Mouse Pancake', 'Topped with powdered sugar.', 'Mini Maddie''s', '699', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mickey Mouse Pancake')
      AND COALESCE(mi.category, '') = COALESCE('Mini Maddie''s', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mini Oatmeal', 'Low-fat vanilla yogurt, topped with granola and strawberries.', 'Mini Maddie''s', '699', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mini Oatmeal')
      AND COALESCE(mi.category, '') = COALESCE('Mini Maddie''s', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mini Parfait', 'One buttermilk pancake.', 'Mini Maddie''s', '699', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mini Parfait')
      AND COALESCE(mi.category, '') = COALESCE('Mini Maddie''s', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Bacon & Cheese', 'American, swiss, or cheddar.', 'Omelets & Scramblers', '1225', 'USD', 'https://static.spotapps.co/web/placeholder.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Bacon & Cheese')
      AND COALESCE(mi.category, '') = COALESCE('Omelets & Scramblers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Cheese', 'Fire-roasted corn, onions, peppers, black beans, tomatoes, cheddar jack, and salsa.', 'Omelets & Scramblers', '999', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Cheese')
      AND COALESCE(mi.category, '') = COALESCE('Omelets & Scramblers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Greek', 'Diced ham and cheddar.', 'Omelets & Scramblers', '1275', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Greek')
      AND COALESCE(mi.category, '') = COALESCE('Omelets & Scramblers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Ham & Cheese', 'Hickory smoked bacon and cheddar.', 'Omelets & Scramblers', '1225', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Ham & Cheese')
      AND COALESCE(mi.category, '') = COALESCE('Omelets & Scramblers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Hash & Cheese', NULL, 'Omelets & Scramblers', '1349', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Hash & Cheese')
      AND COALESCE(mi.category, '') = COALESCE('Omelets & Scramblers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Lumberjack', NULL, 'Omelets & Scramblers', '1375', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Lumberjack')
      AND COALESCE(mi.category, '') = COALESCE('Omelets & Scramblers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Portabella', 'Portabella mushrooms, roasted red peppers, baby spinach, and feta.', 'Omelets & Scramblers', '1275', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Portabella')
      AND COALESCE(mi.category, '') = COALESCE('Omelets & Scramblers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Southwestern', 'Peppers, onions, mushrooms, broccoli, tomatoes, spinach and cheddar.', 'Omelets & Scramblers', '1249', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Southwestern')
      AND COALESCE(mi.category, '') = COALESCE('Omelets & Scramblers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Veggie', 'Diced ham, peppers, onions and cheddar.', 'Omelets & Scramblers', '1325', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Veggie')
      AND COALESCE(mi.category, '') = COALESCE('Omelets & Scramblers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Western', 'Spinach, kalamata olives, tomatoes, and feta.', 'Omelets & Scramblers', '1249', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Western')
      AND COALESCE(mi.category, '') = COALESCE('Omelets & Scramblers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'One Egg + Toast', 'White, Wheat, Sourdough, Rye, Multigrain, Cinnamon Raisin, English Muffin, Texas Toast, Gluten-Free (+$0.99)', 'The Good Egg', '699', 'USD', 'https://static.spotapps.co/spots/a4/77f5cd6e004b0a9168b86e014927f6/full', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('One Egg + Toast')
      AND COALESCE(mi.category, '') = COALESCE('The Good Egg', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Three Eggs + Three Pancakes or French Toast', NULL, 'The Good Egg', '1399', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Three Eggs + Three Pancakes or French Toast')
      AND COALESCE(mi.category, '') = COALESCE('The Good Egg', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Three Eggs, Sausage, Bacon, Ham + Toast', NULL, 'The Good Egg', '1445', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Three Eggs, Sausage, Bacon, Ham + Toast')
      AND COALESCE(mi.category, '') = COALESCE('The Good Egg', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Toast', NULL, 'The Good Egg', '249', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Toast')
      AND COALESCE(mi.category, '') = COALESCE('The Good Egg', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Two Eggs + Toast', NULL, 'The Good Egg', '799', 'USD', 'https://static.spotapps.co/web/placeholder.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Two Eggs + Toast')
      AND COALESCE(mi.category, '') = COALESCE('The Good Egg', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Two Eggs, Belgian Waffle Topped with Berries and Whipped Cream', NULL, 'The Good Egg', '1349', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Two Eggs, Belgian Waffle Topped with Berries and Whipped Cream')
      AND COALESCE(mi.category, '') = COALESCE('The Good Egg', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Two Eggs, Choice of Two Pancakes or French Toast', NULL, 'The Good Egg', '1195', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Two Eggs, Choice of Two Pancakes or French Toast')
      AND COALESCE(mi.category, '') = COALESCE('The Good Egg', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Three Pancakes', NULL, 'Toast & Cakes', '949', 'USD', 'https://static.spotapps.co/spots/b8/c3bcb67e6e4fa7b12e392be75ab3b4/full', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Three Pancakes')
      AND COALESCE(mi.category, '') = COALESCE('Toast & Cakes', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Three Pieces of French Toast', NULL, 'Toast & Cakes', '949', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Three Pieces of French Toast')
      AND COALESCE(mi.category, '') = COALESCE('Toast & Cakes', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Three Strawberry, Blueberry, Banana, or Chocolate Chip Pancakes', NULL, 'Toast & Cakes', '1095', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Three Strawberry, Blueberry, Banana, or Chocolate Chip Pancakes')
      AND COALESCE(mi.category, '') = COALESCE('Toast & Cakes', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Two Pieces of French Toast + Two Pancakes', NULL, 'Toast & Cakes', '1245', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Two Pieces of French Toast + Two Pancakes')
      AND COALESCE(mi.category, '') = COALESCE('Toast & Cakes', '')
  );
