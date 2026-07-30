-- Generated from data/blue-mango.csv; safe to re-run.
INSERT INTO restaurants (name, cuisine, description, icon, color, active)
SELECT 'Blue Mango', 'Thai', 'Thai favorites and modern Asian comfort food.', 'BM', '#38b2ac', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Blue Mango');

SET @restaurant_id := (SELECT id FROM restaurants WHERE name = 'Blue Mango' LIMIT 1);

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Brussel Sprouts', NULL, 'Appetizers', '1000', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/3ee1380d-528c-4d1d-9c75-d1524c859c89.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Brussel Sprouts')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Finger', 'Breaded chicken in Tempura batter mix then deep fried till golden brown, served with Thai chili garlic sauce', 'Appetizers', '1200', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/3ee1380d-528c-4d1d-9c75-d1524c859c89.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Finger')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Satay', 'Marinated tender chicken on skewers grilled to perfection served with Thai peanut sauce and cucumber sauce', 'Appetizers', '1300', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/173ca5fd-113f-422d-8079-5c10409da82b.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Satay')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Crab Rangoon', 'Fried marinated crab meat and cream cheese wrapped in wonton skin served with sweet and sour sauce', 'Appetizers', '800', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/3ee1380d-528c-4d1d-9c75-d1524c859c89.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Crab Rangoon')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Crispy Rolls', 'Crispy fried Thai-style spring rolls served with sweet and sour sauce', 'Appetizers', '700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/24e696ad-2091-4542-9285-80c953ff108b.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Crispy Rolls')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Crispy Wings', 'Served with sweet chili sauce', 'Appetizers', '1000', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/3ee1380d-528c-4d1d-9c75-d1524c859c89.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Crispy Wings')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Edamame', 'Steamed soybeans sprinkled with salt', 'Appetizers', '900', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/3ee1380d-528c-4d1d-9c75-d1524c859c89.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Edamame')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sassy Wings', 'Fried marinated chicken wings topped with scallion in a special sauce .', 'Appetizers', '1000', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/3ee1380d-528c-4d1d-9c75-d1524c859c89.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sassy Wings')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Scallion Pancake', 'Served with ginger sauce', 'Appetizers', '1200', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/3ee1380d-528c-4d1d-9c75-d1524c859c89.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Scallion Pancake')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Shrimp in the Blanket', NULL, 'Appetizers', '1400', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/3ee1380d-528c-4d1d-9c75-d1524c859c89.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Shrimp in the Blanket')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Spicy Edamame', NULL, 'Appetizers', '800', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/3ee1380d-528c-4d1d-9c75-d1524c859c89.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Spicy Edamame')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Vegetable Tempura', 'Home-Fried vegetables served with sweet and sour sauce', 'Appetizers', '800', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/3ee1380d-528c-4d1d-9c75-d1524c859c89.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Vegetable Tempura')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Boba Tea', NULL, 'Beverages', '600', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/58fa0606-a4c8-4900-b086-cacedecfde61.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Boba Tea')
      AND COALESCE(mi.category, '') = COALESCE('Beverages', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Coke', NULL, 'Beverages', '200', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/58fa0606-a4c8-4900-b086-cacedecfde61.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Coke')
      AND COALESCE(mi.category, '') = COALESCE('Beverages', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Diet Coke', NULL, 'Beverages', '200', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/58fa0606-a4c8-4900-b086-cacedecfde61.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Diet Coke')
      AND COALESCE(mi.category, '') = COALESCE('Beverages', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Lemonade', NULL, 'Beverages', '300', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/58fa0606-a4c8-4900-b086-cacedecfde61.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Lemonade')
      AND COALESCE(mi.category, '') = COALESCE('Beverages', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sparking Water', NULL, 'Beverages', '300', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/58fa0606-a4c8-4900-b086-cacedecfde61.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sparking Water')
      AND COALESCE(mi.category, '') = COALESCE('Beverages', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sparkling Lychee with boba', NULL, 'Beverages', '500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/58fa0606-a4c8-4900-b086-cacedecfde61.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sparkling Lychee with boba')
      AND COALESCE(mi.category, '') = COALESCE('Beverages', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sprite', NULL, 'Beverages', '200', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/58fa0606-a4c8-4900-b086-cacedecfde61.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sprite')
      AND COALESCE(mi.category, '') = COALESCE('Beverages', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Thai Iced Coffee', NULL, 'Beverages', '400', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/58fa0606-a4c8-4900-b086-cacedecfde61.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Thai Iced Coffee')
      AND COALESCE(mi.category, '') = COALESCE('Beverages', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Thai Iced Tea', NULL, 'Beverages', '400', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/58fa0606-a4c8-4900-b086-cacedecfde61.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Thai Iced Tea')
      AND COALESCE(mi.category, '') = COALESCE('Beverages', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Unsweetened Iced Tea', NULL, 'Beverages', '300', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/58fa0606-a4c8-4900-b086-cacedecfde61.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Unsweetened Iced Tea')
      AND COALESCE(mi.category, '') = COALESCE('Beverages', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Beef Bulgogi', 'Marinated beef thinly sliced and sautéed with onion, carrots, scallions served on a sizzling plate, complimented with kimchi on the side', 'Chef Special Entrees', '1700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/9f55cd11-72e1-44ec-bcd4-ed8dd8e3adf9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Beef Bulgogi')
      AND COALESCE(mi.category, '') = COALESCE('Chef Special Entrees', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Blue Mango Chicken', 'Battered chicken in house sweet chili sauce , fresh mango served with steamed broccoli', 'Chef Special Entrees', '1600', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/e8aa3d61-b772-4eb4-b797-d807bdb4c755.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Blue Mango Chicken')
      AND COALESCE(mi.category, '') = COALESCE('Chef Special Entrees', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Boston Chicken', NULL, 'Chef Special Entrees', '2000', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/9f55cd11-72e1-44ec-bcd4-ed8dd8e3adf9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Boston Chicken')
      AND COALESCE(mi.category, '') = COALESCE('Chef Special Entrees', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Cashew Nuts', NULL, 'Chef Special Entrees', '2400', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/9f55cd11-72e1-44ec-bcd4-ed8dd8e3adf9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Cashew Nuts')
      AND COALESCE(mi.category, '') = COALESCE('Chef Special Entrees', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Crispy Chicken Basils', 'Crispy chicken stir- fried with fresh basil, onion, green bean and bell pepper in a spicy basil sauce', 'Chef Special Entrees', '1800', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/9f55cd11-72e1-44ec-bcd4-ed8dd8e3adf9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Crispy Chicken Basils')
      AND COALESCE(mi.category, '') = COALESCE('Chef Special Entrees', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Delight of Two', 'Stir-fried chicken and shrimp with broccoli, carrots and mushroom in a light brown sauce', 'Chef Special Entrees', '2700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/9f55cd11-72e1-44ec-bcd4-ed8dd8e3adf9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Delight of Two')
      AND COALESCE(mi.category, '') = COALESCE('Chef Special Entrees', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Home Style Duck', 'Deep- fried half boneless duck with ginger, carrots, onion, bell peppers, mushroom, snow peas, celery and baby corn in our spicy sauce', 'Chef Special Entrees', '2000', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/9f55cd11-72e1-44ec-bcd4-ed8dd8e3adf9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Home Style Duck')
      AND COALESCE(mi.category, '') = COALESCE('Chef Special Entrees', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Hot and Spicy Beef', 'Beef sautéed with mushroom, carrots, ginger, onion, bell peppers, celery, baby corn in spicy house sauce', 'Chef Special Entrees', '1600', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/9f55cd11-72e1-44ec-bcd4-ed8dd8e3adf9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Hot and Spicy Beef')
      AND COALESCE(mi.category, '') = COALESCE('Chef Special Entrees', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mango Curry', 'Shrimp, chicken, onions, mango, carrots, yellow squash, bell peppers and tomato in a delicious yellow curry sauce', 'Chef Special Entrees', '1800', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/92d0d5ad-627b-4cbe-b24b-524bef11837a.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mango Curry')
      AND COALESCE(mi.category, '') = COALESCE('Chef Special Entrees', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Superior Duck', 'Deep-fried half boneless duck with sweet and tangy sauce on a bed of steamed mixed vegetable and fresh mango slices topped with crispy basils', 'Chef Special Entrees', '2700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/9f55cd11-72e1-44ec-bcd4-ed8dd8e3adf9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Superior Duck')
      AND COALESCE(mi.category, '') = COALESCE('Chef Special Entrees', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Teriyaki Chicken', NULL, 'Chef Special Entrees', '1700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/9f55cd11-72e1-44ec-bcd4-ed8dd8e3adf9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Teriyaki Chicken')
      AND COALESCE(mi.category, '') = COALESCE('Chef Special Entrees', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Thai Chicken Kra Pow (Beef or Pork available $18)', 'Ground chicken sautéed with green beans, onion, basil leaves and bell peppers in chili garlic sauce', 'Chef Special Entrees', '1800', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/9f55cd11-72e1-44ec-bcd4-ed8dd8e3adf9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Thai Chicken Kra Pow (Beef or Pork available $18)')
      AND COALESCE(mi.category, '') = COALESCE('Chef Special Entrees', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Green Curry', 'Stringbeans, bamboo strips, bell peppers, zucchini, eggplants and basil leaves', 'Curry Dishes', '1600', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/863a70b8-8dba-49b8-a0e3-6654ea078f7e.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Green Curry')
      AND COALESCE(mi.category, '') = COALESCE('Curry Dishes', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Massaman Curry', 'Sweet potatoes, onion, bell peppers, carrots and peanuts', 'Curry Dishes', '1600', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/863a70b8-8dba-49b8-a0e3-6654ea078f7e.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Massaman Curry')
      AND COALESCE(mi.category, '') = COALESCE('Curry Dishes', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Panang Curry', 'Stringbeans, babycorn, bell peppers, carrots and almond slices', 'Curry Dishes', '1600', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/863a70b8-8dba-49b8-a0e3-6654ea078f7e.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Panang Curry')
      AND COALESCE(mi.category, '') = COALESCE('Curry Dishes', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Red Curry', 'Stringbeans, bamboo strips, bell peppers, eggplants and basil leaves', 'Curry Dishes', '1600', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/863a70b8-8dba-49b8-a0e3-6654ea078f7e.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Red Curry')
      AND COALESCE(mi.category, '') = COALESCE('Curry Dishes', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Yellow Curry', 'Tomatoes, bell peppers, pineapple, yellow squash, onion and carrots', 'Curry Dishes', '1600', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/863a70b8-8dba-49b8-a0e3-6654ea078f7e.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Yellow Curry')
      AND COALESCE(mi.category, '') = COALESCE('Curry Dishes', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Fried Ice-cream', NULL, 'Desserts', '600', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/d3a2239c-a1a2-49dd-b98c-84c192a0ff6c.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Fried Ice-cream')
      AND COALESCE(mi.category, '') = COALESCE('Desserts', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Green Tea Cheesecake', NULL, 'Desserts', '500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/7d0a1418-3ade-4ea0-ad18-4da8bfc0da75.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Green Tea Cheesecake')
      AND COALESCE(mi.category, '') = COALESCE('Desserts', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mango Cheesecake', NULL, 'Desserts', '500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/7d0a1418-3ade-4ea0-ad18-4da8bfc0da75.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mango Cheesecake')
      AND COALESCE(mi.category, '') = COALESCE('Desserts', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mango w/ sticky rice', 'seasonal', 'Desserts', '1000', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/7d0a1418-3ade-4ea0-ad18-4da8bfc0da75.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mango w/ sticky rice')
      AND COALESCE(mi.category, '') = COALESCE('Desserts', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Pumpkin Custard', NULL, 'Desserts', '900', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/7d0a1418-3ade-4ea0-ad18-4da8bfc0da75.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Pumpkin Custard')
      AND COALESCE(mi.category, '') = COALESCE('Desserts', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Vanilla Crepe Cake', NULL, 'Desserts', '900', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/7d0a1418-3ade-4ea0-ad18-4da8bfc0da75.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Vanilla Crepe Cake')
      AND COALESCE(mi.category, '') = COALESCE('Desserts', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Bacon Fried Rice', 'Fried rice with egg , carrot, onion, bacon and scallion', 'Fried Rice', '1800', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/d9ae5982-cbe9-4135-835f-a7837ba42d9f.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Bacon Fried Rice')
      AND COALESCE(mi.category, '') = COALESCE('Fried Rice', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Basil Fried Rice', 'Fried rice with egg, fresh basil, onion, carrots and bell peppers', 'Fried Rice', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/d9ae5982-cbe9-4135-835f-a7837ba42d9f.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Basil Fried Rice')
      AND COALESCE(mi.category, '') = COALESCE('Fried Rice', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Garlic Fried Rice', NULL, 'Fried Rice', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/d9ae5982-cbe9-4135-835f-a7837ba42d9f.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Garlic Fried Rice')
      AND COALESCE(mi.category, '') = COALESCE('Fried Rice', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Korean Fried Rice', 'Spicy fried rice with Kim chee, carrots, onion, scallion, egg and sesame oil.', 'Fried Rice', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/d9ae5982-cbe9-4135-835f-a7837ba42d9f.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Korean Fried Rice')
      AND COALESCE(mi.category, '') = COALESCE('Fried Rice', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mango Fried Rice', 'Fried rice with egg, fresh mango, carrots, onion, snow pea and tomato with a touch of curry powder', 'Fried Rice', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/d9ae5982-cbe9-4135-835f-a7837ba42d9f.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mango Fried Rice')
      AND COALESCE(mi.category, '') = COALESCE('Fried Rice', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Pineapple Fried Rice', 'Fried rice with pineapple, raisins, egg, onion, carrots, snow pea and a touch of curry powder', 'Fried Rice', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/d9ae5982-cbe9-4135-835f-a7837ba42d9f.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Pineapple Fried Rice')
      AND COALESCE(mi.category, '') = COALESCE('Fried Rice', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sweet Chili Fried Rice', 'Fried rice with sweet chili sauce, egg, onion, bell peppers, carrots topped with cashew nuts', 'Fried Rice', '1800', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/d9ae5982-cbe9-4135-835f-a7837ba42d9f.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sweet Chili Fried Rice')
      AND COALESCE(mi.category, '') = COALESCE('Fried Rice', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Thai Fried Rice', 'House fried rice with egg, carrots, onion, broccoli, snow pea, scallion and tomato', 'Fried Rice', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/d9ae5982-cbe9-4135-835f-a7837ba42d9f.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Thai Fried Rice')
      AND COALESCE(mi.category, '') = COALESCE('Fried Rice', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Poke Nacho', 'Raw tuna, diced avocado, thin sliced jalapeño, edamame, nori, cilantro, scallion and sesame seeds on crispy wontons topped with soy ginger sauce and spicy mayo', 'From Sushi Bar', '1600', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8cad26fb-54a2-47ff-ae7a-9d0cbe846e9e.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Poke Nacho')
      AND COALESCE(mi.category, '') = COALESCE('From Sushi Bar', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Seaweed Salad', 'Seaweed, rice vinegar, soy sauce, pickled ginger &amp; sesame oil served on a bed of lettuce', 'From Sushi Bar', '700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8cad26fb-54a2-47ff-ae7a-9d0cbe846e9e.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Seaweed Salad')
      AND COALESCE(mi.category, '') = COALESCE('From Sushi Bar', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Takoyaki', 'Fried octopus balls with bonito flakes, Nori, Takoyaki sauce and mayo', 'From Sushi Bar', '1000', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8cad26fb-54a2-47ff-ae7a-9d0cbe846e9e.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Takoyaki')
      AND COALESCE(mi.category, '') = COALESCE('From Sushi Bar', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Torched Salmon', 'Seared Salmon Nigiri topped with scallion and Teriyaki Sauce', 'From Sushi Bar', '1400', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8cad26fb-54a2-47ff-ae7a-9d0cbe846e9e.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Torched Salmon')
      AND COALESCE(mi.category, '') = COALESCE('From Sushi Bar', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Tuna Stack', 'Diced tuna, avocado, seaweed salad, tempura flake, tobiko and sesame ginger dressing', 'From Sushi Bar', '1400', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8cad26fb-54a2-47ff-ae7a-9d0cbe846e9e.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Tuna Stack')
      AND COALESCE(mi.category, '') = COALESCE('From Sushi Bar', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Unagi Donburi', 'BBQ Eel, sesame, pickled ginger, pickled red onion and shredded seaweed over rice', 'From Sushi Bar', '2000', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8cad26fb-54a2-47ff-ae7a-9d0cbe846e9e.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Unagi Donburi')
      AND COALESCE(mi.category, '') = COALESCE('From Sushi Bar', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Duck Noodle Soup', 'Egg noodle with bok choy in a five spices broth topped with thin slices duck.', 'Noodle Soup', '1800', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/c68c7738-9401-4d2d-985c-990d9701c7a8.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Duck Noodle Soup')
      AND COALESCE(mi.category, '') = COALESCE('Noodle Soup', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kao Soi', 'Steamed egg noodles topped with chicken, red onion, pickled lettuce, cilantro and crispy noodle in yellow curry sauce.', 'Noodle Soup', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/d19ff735-ed2f-429f-a56b-46594e6a7f59.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kao Soi')
      AND COALESCE(mi.category, '') = COALESCE('Noodle Soup', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Pho', 'Rice Noodle, Slices onion &cilantro in a deeply aromatic, clear and savory soup.', 'Noodle Soup', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/c68c7738-9401-4d2d-985c-990d9701c7a8.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Pho')
      AND COALESCE(mi.category, '') = COALESCE('Noodle Soup', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Thai Noodle Soup', 'Traditional Thai noodle soup, rice noodle, bean sprouts, scallion, cilantro & fried garlic.', 'Noodle Soup', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/c98e01cd-5361-4af0-b6dd-f6b3e1d874b4.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Thai Noodle Soup')
      AND COALESCE(mi.category, '') = COALESCE('Noodle Soup', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Tom Yum Noodles Soup', 'Thai Style spicy noodle soup with your choice of meat. Contains peanuts.', 'Noodle Soup', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/c68c7738-9401-4d2d-985c-990d9701c7a8.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Tom Yum Noodles Soup')
      AND COALESCE(mi.category, '') = COALESCE('Noodle Soup', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Basil Pad Thai', 'Stir-fried noodles with egg, onion, bell peppers, zucchini, yellowsquash, carrots, basil leaves in house spicy sauce topped with crispy basil', 'Noodles', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/54e8c5b3-e5ce-456d-baea-398f9ae4e8fc.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Basil Pad Thai')
      AND COALESCE(mi.category, '') = COALESCE('Noodles', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Lomein Kra Pow(Beef or Pork available $17)', 'Lomein stir-fried with fresh chili, garlic, red pepper, onion and basil leaves', 'Noodles', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/54e8c5b3-e5ce-456d-baea-398f9ae4e8fc.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Lomein Kra Pow(Beef or Pork available $17)')
      AND COALESCE(mi.category, '') = COALESCE('Noodles', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Crispy Pad Thai', 'Crispy egg noodles with egg, beansprouts, scallion and ground peanut', 'Noodles', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/0eadbc24-04e5-4f9e-b42c-fd65653f5869.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Crispy Pad Thai')
      AND COALESCE(mi.category, '') = COALESCE('Noodles', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Drunken Noodles', 'Wide rice noodles stir- fried with egg, onion, carrot, green bean, babycorn, bell peppers and basil leaves', 'Noodles', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/54e8c5b3-e5ce-456d-baea-398f9ae4e8fc.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Drunken Noodles')
      AND COALESCE(mi.category, '') = COALESCE('Noodles', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Pad See You', 'Wide rice noodles stir- fried with egg, broccoli and carrot', 'Noodles', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/54e8c5b3-e5ce-456d-baea-398f9ae4e8fc.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Pad See You')
      AND COALESCE(mi.category, '') = COALESCE('Noodles', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Pad Thai', 'A famous stir-fried noodles with egg, beansprouts, scallion and ground peanut', 'Noodles', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/d3b1b44c-fbd6-4725-8123-d2295c486847.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Pad Thai')
      AND COALESCE(mi.category, '') = COALESCE('Noodles', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Stir-fried Udon', 'Udon stir fried with zucchini , carrots, egg, broccoli and garlic topped with scallion', 'Noodles', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/54e8c5b3-e5ce-456d-baea-398f9ae4e8fc.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Stir-fried Udon')
      AND COALESCE(mi.category, '') = COALESCE('Noodles', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Yaki Soba', 'Soba noodles stir-fried with scallion,cabbage, baby corn, carrot, onion, zucchini, yellow squash and beansprouts', 'Noodles', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/54e8c5b3-e5ce-456d-baea-398f9ae4e8fc.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Yaki Soba')
      AND COALESCE(mi.category, '') = COALESCE('Noodles', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Open Food', NULL, 'Open Food', '0', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Open Food')
      AND COALESCE(mi.category, '') = COALESCE('Open Food', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Combination Poke Bowl', NULL, 'Poke Bowls', '2000', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Combination Poke Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Poke Bowls', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Crab Stick Poke Bowl', 'All Poke Bowls come with your choice of protein, sushi rice, fresh mango cube, avocado, cucumber, seaweed salad, pickled ginger, pickled red onion, nori, sesame seeds and our delicious poke sauce', 'Poke Bowls', '1600', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Crab Stick Poke Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Poke Bowls', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Fried Tofu Poke Bowl', 'All Poke Bowls come with your choice of protein, sushi rice, fresh mango cube, avocado, cucumber, seaweed salad, pickled ginger, pickled red onion, nori, sesame seeds and our delicious poke sauce', 'Poke Bowls', '1500', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Fried Tofu Poke Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Poke Bowls', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Salmon Poke Bowl', 'All Poke Bowls come with your choice of protein, sushi rice, fresh mango cube, avocado, cucumber, seaweed salad, pickled ginger, pickled red onion, nori, sesame seeds and our delicious poke sauce', 'Poke Bowls', '1800', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Salmon Poke Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Poke Bowls', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Shrimp Tempura Poke Bowl', 'All Poke Bowls come with your choice of protein, sushi rice, fresh mango cube, avocado, cucumber, seaweed salad, pickled ginger, pickled red onion, nori, sesame seeds and our delicious poke sauce', 'Poke Bowls', '1600', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Shrimp Tempura Poke Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Poke Bowls', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Tuna Poke Bowl', 'All Poke Bowls come with your choice of protein, sushi rice, fresh mango cube, avocado, cucumber, seaweed salad, pickled ginger, pickled red onion, nori, sesame seeds and our delicious poke sauce', 'Poke Bowls', '1800', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Tuna Poke Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Poke Bowls', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Grilled chicken Salad', 'Served with peanut sauce', 'Salad', '1300', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/048539ae-c9d2-4bda-bcbf-1e7c6c8df9fa.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Grilled chicken Salad')
      AND COALESCE(mi.category, '') = COALESCE('Salad', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Larb', 'Spicy Thai-Style seasoning salad', 'Salad', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/a23cd8c3-498c-493c-be90-066d2d703e2f.png?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Larb')
      AND COALESCE(mi.category, '') = COALESCE('Salad', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Papaya Salad', 'Thai-Style salad comes with shrimps, raw papaya, tomatoes, green beans and carrots. Topped with peanuts', 'Salad', '1400', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/a23cd8c3-498c-493c-be90-066d2d703e2f.png?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Papaya Salad')
      AND COALESCE(mi.category, '') = COALESCE('Salad', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Seaweed Salad', NULL, 'Salad', '800', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/a23cd8c3-498c-493c-be90-066d2d703e2f.png?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Seaweed Salad')
      AND COALESCE(mi.category, '') = COALESCE('Salad', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Simple Green Salad', 'Mixed baby green salad served with our delicious peanut sauce', 'Salad', '700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/a23cd8c3-498c-493c-be90-066d2d703e2f.png?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Simple Green Salad')
      AND COALESCE(mi.category, '') = COALESCE('Salad', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Exotic Salmon', NULL, 'Seafood', '2000', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8724de4e-44f0-4f34-880b-a7cb138a9ba9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Exotic Salmon')
      AND COALESCE(mi.category, '') = COALESCE('Seafood', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Fillet Chili', 'Fried fish with sweet chili sauce on a bed of lettuce topped with cilantro', 'Seafood', '1700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8724de4e-44f0-4f34-880b-a7cb138a9ba9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Fillet Chili')
      AND COALESCE(mi.category, '') = COALESCE('Seafood', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Salmon Teriyaki', 'Grilled salmon steak with Teriyaki sauce on a bed of steamed vegetables', 'Seafood', '2000', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8724de4e-44f0-4f34-880b-a7cb138a9ba9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Salmon Teriyaki')
      AND COALESCE(mi.category, '') = COALESCE('Seafood', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Seafood Madness', 'Sautéed mixed seafood in a spicy basil sauce comes with onion, bell peppers, mushroom, baby corn, snow pea and fresh basil', 'Seafood', '2100', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8724de4e-44f0-4f34-880b-a7cb138a9ba9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Seafood Madness')
      AND COALESCE(mi.category, '') = COALESCE('Seafood', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Shrimp Pik King', 'Sautéed shrimps with string beans, bell peppers and carrots in a spicy Pik king sauce topped with almond slices.', 'Seafood', '1900', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8724de4e-44f0-4f34-880b-a7cb138a9ba9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Shrimp Pik King')
      AND COALESCE(mi.category, '') = COALESCE('Seafood', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Soft Shell Crab w/ Curry Powder', 'Soft Shell Crab, onion, celery, peppers and carrots stir- fried in our special curry powder sauce', 'Seafood', '2300', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8724de4e-44f0-4f34-880b-a7cb138a9ba9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Soft Shell Crab w/ Curry Powder')
      AND COALESCE(mi.category, '') = COALESCE('Seafood', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Spicy Squid', NULL, 'Seafood', '1700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8724de4e-44f0-4f34-880b-a7cb138a9ba9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Spicy Squid')
      AND COALESCE(mi.category, '') = COALESCE('Seafood', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Yum Talay', 'Spicy seafood with red onion, tomato, scallion, cilantro on a bed of lettuce', 'Seafood', '2100', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/8724de4e-44f0-4f34-880b-a7cb138a9ba9.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Yum Talay')
      AND COALESCE(mi.category, '') = COALESCE('Seafood', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Brown Rice', NULL, 'Side Order', '300', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Brown Rice')
      AND COALESCE(mi.category, '') = COALESCE('Side Order', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Egg Fried Rice', NULL, 'Side Order', '600', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Egg Fried Rice')
      AND COALESCE(mi.category, '') = COALESCE('Side Order', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Hot Sauce', NULL, 'Side Order', '50', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Hot Sauce')
      AND COALESCE(mi.category, '') = COALESCE('Side Order', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Lo Mein with Sauce', NULL, 'Side Order', '600', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Lo Mein with Sauce')
      AND COALESCE(mi.category, '') = COALESCE('Side Order', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Peanut Sauce', NULL, 'Side Order', '200', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Peanut Sauce')
      AND COALESCE(mi.category, '') = COALESCE('Side Order', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Steamed Mixed Vegetable', NULL, 'Side Order', '500', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Steamed Mixed Vegetable')
      AND COALESCE(mi.category, '') = COALESCE('Side Order', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Steamed Noodles', NULL, 'Side Order', '400', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Steamed Noodles')
      AND COALESCE(mi.category, '') = COALESCE('Side Order', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sticky Rice', NULL, 'Side Order', '300', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sticky Rice')
      AND COALESCE(mi.category, '') = COALESCE('Side Order', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'White Rice', NULL, 'Side Order', '300', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('White Rice')
      AND COALESCE(mi.category, '') = COALESCE('Side Order', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Coconut Soup', 'Thai coconut soup with lemongrass, galangal, mushroom, scallion and cilantro', 'Soup', '700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/2f958e84-bb04-41b1-b617-4dbbc2b02225.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Coconut Soup')
      AND COALESCE(mi.category, '') = COALESCE('Soup', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Miso Soup', 'Soy bean paste, fresh cubed tofu, seaweed & scallion', 'Soup', '700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/2f958e84-bb04-41b1-b617-4dbbc2b02225.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Miso Soup')
      AND COALESCE(mi.category, '') = COALESCE('Soup', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Rice Soup', 'Simply delicious rice soup with the choice of chicken, shrimp, tofu or vegetables', 'Soup', '700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/2f958e84-bb04-41b1-b617-4dbbc2b02225.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Rice Soup')
      AND COALESCE(mi.category, '') = COALESCE('Soup', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Thai Wonton Soup', 'Soft chicken wonton with yu-choy, fried garlic and cilantro', 'Soup', '700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/2f958e84-bb04-41b1-b617-4dbbc2b02225.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Thai Wonton Soup')
      AND COALESCE(mi.category, '') = COALESCE('Soup', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Tom Yum', 'Thai spicy soup served with mushrooms and topped with scallion and cilantro', 'Soup', '700', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/2f958e84-bb04-41b1-b617-4dbbc2b02225.jpg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Tom Yum')
      AND COALESCE(mi.category, '') = COALESCE('Soup', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Rama Garden', 'Steamed mixed vegetable and tofu served with peanut sauce', 'Vegetarian Corner', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/198ba945-72be-46d1-805d-c103decf22dd.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Rama Garden')
      AND COALESCE(mi.category, '') = COALESCE('Vegetarian Corner', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Spicy Eggplant', 'Stir-fried eggplant, fried tofu, onion, bell peppers and basil leaves in spicy basil sauce', 'Vegetarian Corner', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/ecbe517c-36d1-4087-ac2a-266b23be8624.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Spicy Eggplant')
      AND COALESCE(mi.category, '') = COALESCE('Vegetarian Corner', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Stringbean Delight', 'Stir-fried stringbean with black bean sauce and red pepper', 'Vegetarian Corner', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/ecbe517c-36d1-4087-ac2a-266b23be8624.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Stringbean Delight')
      AND COALESCE(mi.category, '') = COALESCE('Vegetarian Corner', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Tofu Kra Pow', 'Tofu stir-fried with onion, bell peppers and basil leaves in a spicy basil sauce', 'Vegetarian Corner', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/ecbe517c-36d1-4087-ac2a-266b23be8624.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Tofu Kra Pow')
      AND COALESCE(mi.category, '') = COALESCE('Vegetarian Corner', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Vegetable Delight', 'Mixed vegetable stir-fried with light brown sauce and tofu', 'Vegetarian Corner', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/ecbe517c-36d1-4087-ac2a-266b23be8624.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Vegetable Delight')
      AND COALESCE(mi.category, '') = COALESCE('Vegetarian Corner', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Vegetable Hot Basils', 'Stir-fried mixed vegetable with spicy basil sauce', 'Vegetarian Corner', '1500', 'USD', 'https://smilepos-product.s3.amazonaws.com/dining/3008301/DESKTOP/MENU/ecbe517c-36d1-4087-ac2a-266b23be8624.jpeg?20260730133731', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Vegetable Hot Basils')
      AND COALESCE(mi.category, '') = COALESCE('Vegetarian Corner', '')
  );
