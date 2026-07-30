-- Generated from data/grand-india.csv; safe to re-run.
INSERT INTO restaurants (name, cuisine, description, icon, color, active)
SELECT 'Grand India', 'Indian', 'Classic Indian dishes, curries, biryani, and tandoori favorites.', 'GI', '#ed8936', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Grand India');

SET @restaurant_id := (SELECT id FROM restaurants WHERE name = 'Grand India' LIMIT 1);

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chilli Paneer', NULL, 'Appetizers', '1400', 'USD', 'https://grand-india.com/pluto-images/funnel/images/3567f645-88fc-4d02-b185-0cef01b61531?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chilli Paneer')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'French Fries', NULL, 'Appetizers', '600', 'USD', 'https://grand-india.com/menu?item=french-fries-2syI', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('French Fries')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Gobi 555', NULL, 'Appetizers', '1300', 'USD', 'https://grand-india.com/pluto-images/funnel/images/8e9dff75-d5d4-4593-a702-9c4d45171929?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Gobi 555')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Gobi Manchurian', NULL, 'Appetizers', '1300', 'USD', 'https://grand-india.com/pluto-images/funnel/images/738c96c2-85fa-4ce0-9d4a-e62941c01561?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Gobi Manchurian')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Guntur Cut Mirchi', NULL, 'Appetizers', '1000', 'USD', 'https://grand-india.com/pluto-images/funnel/images/8e9dff75-d5d4-4593-a702-9c4d45171929?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Guntur Cut Mirchi')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mix Veg Pakora', NULL, 'Appetizers', '1000', 'USD', 'https://grand-india.com/pluto-images/funnel/images/8e9dff75-d5d4-4593-a702-9c4d45171929?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mix Veg Pakora')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Paneer 555', NULL, 'Appetizers', '1400', 'USD', 'https://grand-india.com/pluto-images/funnel/images/8e9dff75-d5d4-4593-a702-9c4d45171929?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Paneer 555')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Samosa', NULL, 'Appetizers', '600', 'USD', 'https://grand-india.com/pluto-images/funnel/images/f5ff185e-fbbd-4758-ab12-2f4711e49459?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Samosa')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Spring Roll (Veg)', NULL, 'Appetizers', '800', 'USD', 'https://grand-india.com/pluto-images/funnel/images/8e9dff75-d5d4-4593-a702-9c4d45171929?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Spring Roll (Veg)')
      AND COALESCE(mi.category, '') = COALESCE('Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken 65 Biryani', NULL, 'Biryani', '2000', 'USD', 'https://grand-india.com/pluto-images/funnel/images/e19eea42-efcc-487f-a4b9-f4f7ba427024?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken 65 Biryani')
      AND COALESCE(mi.category, '') = COALESCE('Biryani', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Biryani - Bone Less', NULL, 'Biryani', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/e19eea42-efcc-487f-a4b9-f4f7ba427024?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Biryani - Bone Less')
      AND COALESCE(mi.category, '') = COALESCE('Biryani', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Goat Biryani', NULL, 'Biryani', '2000', 'USD', 'https://grand-india.com/pluto-images/funnel/images/68cdee22-9c4f-4e3b-8346-0a07a8aa55d9?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Goat Biryani')
      AND COALESCE(mi.category, '') = COALESCE('Biryani', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Lamb Biryani', NULL, 'Biryani', '2200', 'USD', 'https://grand-india.com/pluto-images/funnel/images/9f3aac69-b219-45dc-a78e-93e0949c0237?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Lamb Biryani')
      AND COALESCE(mi.category, '') = COALESCE('Biryani', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Paneer Biryani', NULL, 'Biryani', '1800', 'USD', 'https://grand-india.com/pluto-images/funnel/images/e19eea42-efcc-487f-a4b9-f4f7ba427024?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Paneer Biryani')
      AND COALESCE(mi.category, '') = COALESCE('Biryani', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Shrimp Biryani', NULL, 'Biryani', '2200', 'USD', 'https://grand-india.com/pluto-images/funnel/images/7ae8153b-44d3-40b7-ab45-3acaf89f05d1?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Shrimp Biryani')
      AND COALESCE(mi.category, '') = COALESCE('Biryani', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Vegetable Biryani', NULL, 'Biryani', '1600', 'USD', 'https://grand-india.com/menu?item=vegetable-biryani-Cry7', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Vegetable Biryani')
      AND COALESCE(mi.category, '') = COALESCE('Biryani', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chappathi', NULL, 'Bread', '500', 'USD', 'https://grand-india.com/pluto-images/funnel/images/2ca78df9-dc73-461b-9348-17de82dc49e9?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chappathi')
      AND COALESCE(mi.category, '') = COALESCE('Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Cheese Naan', NULL, 'Bread', '700', 'USD', 'https://grand-india.com/menu?item=cheese-naan-x64T', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Cheese Naan')
      AND COALESCE(mi.category, '') = COALESCE('Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chilli Cilantro Naan', NULL, 'Bread', '600', 'USD', 'https://grand-india.com/pluto-images/uberEatsPhotoCoverage0426/OjgQY9W1Wcbg/ddUG6nEaUPFK.jpg?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chilli Cilantro Naan')
      AND COALESCE(mi.category, '') = COALESCE('Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chilli Garlic Naan', NULL, 'Bread', '600', 'USD', 'https://grand-india.com/menu?item=chilli-garlic-naan-j04j', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chilli Garlic Naan')
      AND COALESCE(mi.category, '') = COALESCE('Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Garlic Naan', NULL, 'Bread', '500', 'USD', 'https://grand-india.com/pluto-images/funnel/images/0788e112-62f0-48bc-a11b-09fa089c8004?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Garlic Naan')
      AND COALESCE(mi.category, '') = COALESCE('Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Gobi/Cauliflower Paratha', NULL, 'Bread', '700', 'USD', 'https://grand-india.com/menu?item=gobicauliflower-paratha-MgFG', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Gobi/Cauliflower Paratha')
      AND COALESCE(mi.category, '') = COALESCE('Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Malabar Parotta', NULL, 'Bread', '500', 'USD', 'https://grand-india.com/pluto-images/uberEatsPhotoCoverage0426/OjgQY9W1Wcbg/wIUFLDhpKWBF.jpg?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Malabar Parotta')
      AND COALESCE(mi.category, '') = COALESCE('Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Onion Kulcha', NULL, 'Bread', '700', 'USD', 'https://grand-india.com/menu?item=onion-kulcha-I6qu', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Onion Kulcha')
      AND COALESCE(mi.category, '') = COALESCE('Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Peshawari Naan', NULL, 'Bread', '600', 'USD', 'https://grand-india.com/pluto-images/uberEatsPhotoCoverage0426/OjgQY9W1Wcbg/ddUG6nEaUPFK.jpg?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Peshawari Naan')
      AND COALESCE(mi.category, '') = COALESCE('Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Plain Naan', NULL, 'Bread', '400', 'USD', 'https://grand-india.com/pluto-images/uberEatsPhotoCoverage0426/OjgQY9W1Wcbg/ddUG6nEaUPFK.jpg?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Plain Naan')
      AND COALESCE(mi.category, '') = COALESCE('Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Rosemary Naan', NULL, 'Bread', '500', 'USD', 'https://grand-india.com/pluto-images/uberEatsPhotoCoverage0426/OjgQY9W1Wcbg/ddUG6nEaUPFK.jpg?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Rosemary Naan')
      AND COALESCE(mi.category, '') = COALESCE('Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Tandoori Roti', NULL, 'Bread', '500', 'USD', 'https://grand-india.com/pluto-images/uberEatsPhotoCoverage0426/OjgQY9W1Wcbg/ddUG6nEaUPFK.jpg?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Tandoori Roti')
      AND COALESCE(mi.category, '') = COALESCE('Bread', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Bhel Puri', NULL, 'Chaat Specials', '1000', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Bhel Puri')
      AND COALESCE(mi.category, '') = COALESCE('Chaat Specials', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Samosa Chaat', NULL, 'Chaat Specials', '1100', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Samosa Chaat')
      AND COALESCE(mi.category, '') = COALESCE('Chaat Specials', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Butter Chicken Masala', NULL, 'Chicken Entree', '1700', 'USD', 'https://grand-india.com/menu?item=butter-chicken-masala-IZmh', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Butter Chicken Masala')
      AND COALESCE(mi.category, '') = COALESCE('Chicken Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chettinad Chicken Curry', NULL, 'Chicken Entree', '1700', 'USD', 'https://grand-india.com/pluto-images/funnel/images/1170e6be-5c8d-4020-a4ea-125062ba4a48?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chettinad Chicken Curry')
      AND COALESCE(mi.category, '') = COALESCE('Chicken Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Korma', NULL, 'Chicken Entree', '1700', 'USD', 'https://grand-india.com/pluto-images/funnel/images/d3e84bac-8666-449e-92cb-8b8c9b3473aa?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Korma')
      AND COALESCE(mi.category, '') = COALESCE('Chicken Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Tikka Masala', NULL, 'Chicken Entree', '1700', 'USD', 'https://grand-india.com/pluto-images/growth/images/1092edd8-8e6c-4e0b-b7e2-f2b3426e4345?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Tikka Masala')
      AND COALESCE(mi.category, '') = COALESCE('Chicken Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Goan Chicken Vindaloo', NULL, 'Chicken Entree', '1700', 'USD', 'https://grand-india.com/pluto-images/funnel/images/1170e6be-5c8d-4020-a4ea-125062ba4a48?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Goan Chicken Vindaloo')
      AND COALESCE(mi.category, '') = COALESCE('Chicken Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Gongura Chicken Pulusu', NULL, 'Chicken Entree', '1700', 'USD', 'https://grand-india.com/pluto-images/funnel/images/1170e6be-5c8d-4020-a4ea-125062ba4a48?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Gongura Chicken Pulusu')
      AND COALESCE(mi.category, '') = COALESCE('Chicken Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Grand India Special Mango Chicken Curry', NULL, 'Chicken Entree', '1700', 'USD', 'https://grand-india.com/pluto-images/funnel/images/1170e6be-5c8d-4020-a4ea-125062ba4a48?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Grand India Special Mango Chicken Curry')
      AND COALESCE(mi.category, '') = COALESCE('Chicken Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kadai Chicken', NULL, 'Chicken Entree', '1700', 'USD', 'https://grand-india.com/pluto-images/funnel/images/1170e6be-5c8d-4020-a4ea-125062ba4a48?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kadai Chicken')
      AND COALESCE(mi.category, '') = COALESCE('Chicken Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Madras Chicken Curry', NULL, 'Chicken Entree', '1700', 'USD', 'https://grand-india.com/menu?item=madras-chicken-curry-xXV3', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Madras Chicken Curry')
      AND COALESCE(mi.category, '') = COALESCE('Chicken Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mugalai Chicken Curry', NULL, 'Chicken Entree', '1700', 'USD', 'https://grand-india.com/menu?item=mugalai-chicken-curry-Tp2D', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mugalai Chicken Curry')
      AND COALESCE(mi.category, '') = COALESCE('Chicken Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Nadan (Kerala) Chicken Curry', NULL, 'Chicken Entree', '1700', 'USD', 'https://grand-india.com/menu?item=nadan-kerala-chicken-curry-NVQb', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Nadan (Kerala) Chicken Curry')
      AND COALESCE(mi.category, '') = COALESCE('Chicken Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Saag Chicken', NULL, 'Chicken Entree', '1700', 'USD', 'https://grand-india.com/pluto-images/funnel/images/74e0d942-5ed8-4d2e-9ca6-da6fcea20713?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Saag Chicken')
      AND COALESCE(mi.category, '') = COALESCE('Chicken Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chocolate Icecream', NULL, 'Dessert/Ice Cream', '500', 'USD', 'https://grand-india.com/pluto-images/funnel/images/3da98aa6-6a0a-456f-a5ca-0e453ddab259?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chocolate Icecream')
      AND COALESCE(mi.category, '') = COALESCE('Dessert/Ice Cream', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Gulab Jamun', NULL, 'Dessert/Ice Cream', '500', 'USD', 'https://grand-india.com/pluto-images/funnel/images/9426a086-92a1-438e-a136-4789e903e71d?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Gulab Jamun')
      AND COALESCE(mi.category, '') = COALESCE('Dessert/Ice Cream', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mango Icecream', NULL, 'Dessert/Ice Cream', '500', 'USD', 'https://grand-india.com/pluto-images/funnel/images/3da98aa6-6a0a-456f-a5ca-0e453ddab259?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mango Icecream')
      AND COALESCE(mi.category, '') = COALESCE('Dessert/Ice Cream', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Rasmalai', NULL, 'Dessert/Ice Cream', '500', 'USD', 'https://grand-india.com/pluto-images/funnel/images/3da98aa6-6a0a-456f-a5ca-0e453ddab259?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Rasmalai')
      AND COALESCE(mi.category, '') = COALESCE('Dessert/Ice Cream', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Rice Kheer', NULL, 'Dessert/Ice Cream', '500', 'USD', 'https://grand-india.com/pluto-images/funnel/images/3da98aa6-6a0a-456f-a5ca-0e453ddab259?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Rice Kheer')
      AND COALESCE(mi.category, '') = COALESCE('Dessert/Ice Cream', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Strawberry Icecream', NULL, 'Dessert/Ice Cream', '500', 'USD', 'https://grand-india.com/pluto-images/funnel/images/3da98aa6-6a0a-456f-a5ca-0e453ddab259?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Strawberry Icecream')
      AND COALESCE(mi.category, '') = COALESCE('Dessert/Ice Cream', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Achari Goat Curry', NULL, 'Lamb And Goat Entree', '1900', 'USD', 'https://grand-india.com/menu?item=achari-goat-curry-uBSQ', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Achari Goat Curry')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chettinad Goat Curry', NULL, 'Lamb And Goat Entree', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/5d1378b2-27c8-4b90-b31a-e5e53aefcacc?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chettinad Goat Curry')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chettinad Lamb Curry', NULL, 'Lamb And Goat Entree', '2000', 'USD', 'https://grand-india.com/menu?item=chettinad-lamb-curry-netI', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chettinad Lamb Curry')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Goat Korma', NULL, 'Lamb And Goat Entree', '1900', 'USD', 'https://grand-india.com/menu?item=goat-korma-8MW9', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Goat Korma')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Goat Rogan Josh', NULL, 'Lamb And Goat Entree', '1900', 'USD', 'https://grand-india.com/menu?item=goat-rogan-josh-LvAp', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Goat Rogan Josh')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Goat Vindaloo', NULL, 'Lamb And Goat Entree', '1900', 'USD', 'https://grand-india.com/menu?item=goat-vindaloo-oqgx', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Goat Vindaloo')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Gongura Mutton (Goat)', NULL, 'Lamb And Goat Entree', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/71bd48b3-1c80-4b0f-8b67-40e93d944fe6?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Gongura Mutton (Goat)')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Grand India Special Mango Lamb Curry', NULL, 'Lamb And Goat Entree', '2000', 'USD', 'https://grand-india.com/pluto-images/funnel/images/9bc7f308-581d-48ac-9af9-2fa09c2f4721?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Grand India Special Mango Lamb Curry')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kadai Mutton', NULL, 'Lamb And Goat Entree', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/e8370b42-83b1-4030-955d-e9916188aca6?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kadai Mutton')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kerala Goat Curry', NULL, 'Lamb And Goat Entree', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/8679c1b6-41a5-42b8-ab64-1c77fcbb1ccf?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kerala Goat Curry')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Lamb Kadai', NULL, 'Lamb And Goat Entree', '2000', 'USD', 'https://grand-india.com/pluto-images/funnel/images/39faa05a-a8b8-43c9-a74b-ae18f9beb599?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Lamb Kadai')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Lamb Korma', NULL, 'Lamb And Goat Entree', '2000', 'USD', 'https://grand-india.com/menu?item=lamb-korma-GN5X', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Lamb Korma')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Lamb Tikka Masala', NULL, 'Lamb And Goat Entree', '2000', 'USD', 'https://grand-india.com/pluto-images/funnel/images/2f722251-725b-4fa2-b739-cc60dccc5309?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Lamb Tikka Masala')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Lamb Vindaloo', NULL, 'Lamb And Goat Entree', '2000', 'USD', 'https://grand-india.com/menu?item=lamb-vindaloo-ggj1', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Lamb Vindaloo')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Saag Lamb', NULL, 'Lamb And Goat Entree', '2000', 'USD', 'https://grand-india.com/pluto-images/funnel/images/be598dfc-963c-4400-96b4-eca178603dbf?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Saag Lamb')
      AND COALESCE(mi.category, '') = COALESCE('Lamb And Goat Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Butter Chicken Masala', NULL, 'Most Ordered', '1700', 'USD', 'https://grand-india.com/pluto-images/funnel/images/1170e6be-5c8d-4020-a4ea-125062ba4a48?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Butter Chicken Masala')
      AND COALESCE(mi.category, '') = COALESCE('Most Ordered', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Korma', NULL, 'Most Ordered', '1700', 'USD', 'https://grand-india.com/pluto-images/funnel/images/d3e84bac-8666-449e-92cb-8b8c9b3473aa?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Korma')
      AND COALESCE(mi.category, '') = COALESCE('Most Ordered', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Tikka Masala', NULL, 'Most Ordered', '1700', 'USD', 'https://grand-india.com/pluto-images/growth/images/1092edd8-8e6c-4e0b-b7e2-f2b3426e4345?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Tikka Masala')
      AND COALESCE(mi.category, '') = COALESCE('Most Ordered', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Garlic Naan', NULL, 'Most Ordered', '500', 'USD', 'https://grand-india.com/pluto-images/funnel/images/0788e112-62f0-48bc-a11b-09fa089c8004?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Garlic Naan')
      AND COALESCE(mi.category, '') = COALESCE('Most Ordered', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Paneer Butter Masala', NULL, 'Most Ordered', '1600', 'USD', 'https://grand-india.com/pluto-images/growth/images/6c9329cd-d9ba-490d-acd6-c42066f8f372?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Paneer Butter Masala')
      AND COALESCE(mi.category, '') = COALESCE('Most Ordered', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Paneer Tikka Masala', NULL, 'Most Ordered', '1600', 'USD', 'https://grand-india.com/pluto-images/funnel/images/06f355d2-0eeb-40f1-9069-9f2a738f6674?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Paneer Tikka Masala')
      AND COALESCE(mi.category, '') = COALESCE('Most Ordered', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Samosa', NULL, 'Most Ordered', '600', 'USD', 'https://grand-india.com/pluto-images/funnel/images/f5ff185e-fbbd-4758-ab12-2f4711e49459?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Samosa')
      AND COALESCE(mi.category, '') = COALESCE('Most Ordered', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Shahi Paneer Korma', NULL, 'Most Ordered', '1600', 'USD', 'https://grand-india.com/pluto-images/funnel/images/90cd36f3-6d7a-4497-884c-418cbf505aef?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Shahi Paneer Korma')
      AND COALESCE(mi.category, '') = COALESCE('Most Ordered', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Apollo Fish', NULL, 'Non Veg Appetizers', '1500', 'USD', 'https://grand-india.com/pluto-images/uberEatsPhotoCoverage0426/OjgQY9W1Wcbg/V57810f4r9sl.jpg?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Apollo Fish')
      AND COALESCE(mi.category, '') = COALESCE('Non Veg Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken 555', NULL, 'Non Veg Appetizers', '1500', 'USD', 'https://grand-india.com/pluto-images/uberEatsPhotoCoverage0426/OjgQY9W1Wcbg/7IcICoCP1N6v.jpg?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken 555')
      AND COALESCE(mi.category, '') = COALESCE('Non Veg Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken 65', NULL, 'Non Veg Appetizers', '1400', 'USD', 'https://grand-india.com/pluto-images/uberEatsPhotoCoverage0426/OjgQY9W1Wcbg/qJfCsDWq0WW3.jpg?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken 65')
      AND COALESCE(mi.category, '') = COALESCE('Non Veg Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Manchurian', NULL, 'Non Veg Appetizers', '1500', 'USD', 'https://grand-india.com/pluto-images/funnel/images/05138966-c0e2-4ae0-994c-67de26e6c3e9?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Manchurian')
      AND COALESCE(mi.category, '') = COALESCE('Non Veg Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Nuggets And Fries', NULL, 'Non Veg Appetizers', '1000', 'USD', 'https://grand-india.com/menu?item=chicken-nuggets-and-fries-6mME', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Nuggets And Fries')
      AND COALESCE(mi.category, '') = COALESCE('Non Veg Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Pepper Fry', NULL, 'Non Veg Appetizers', '1500', 'USD', 'https://grand-india.com/pluto-images/funnel/images/b9031216-2c8f-4132-b6bc-08060088fc32?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Pepper Fry')
      AND COALESCE(mi.category, '') = COALESCE('Non Veg Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Sukka', NULL, 'Non Veg Appetizers', '1500', 'USD', 'https://grand-india.com/menu?item=chicken-sukka-v7ZV', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Sukka')
      AND COALESCE(mi.category, '') = COALESCE('Non Veg Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chilli Chicken', NULL, 'Non Veg Appetizers', '1500', 'USD', 'https://grand-india.com/menu?item=chilli-chicken-jSpD', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chilli Chicken')
      AND COALESCE(mi.category, '') = COALESCE('Non Veg Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chilli Fish', NULL, 'Non Veg Appetizers', '1500', 'USD', 'https://grand-india.com/pluto-images/uberEatsPhotoCoverage0426/OjgQY9W1Wcbg/V57810f4r9sl.jpg?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chilli Fish')
      AND COALESCE(mi.category, '') = COALESCE('Non Veg Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Egg Kalakki', NULL, 'Non Veg Appetizers', '800', 'USD', 'https://grand-india.com/pluto-images/uberEatsPhotoCoverage0426/OjgQY9W1Wcbg/V57810f4r9sl.jpg?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Egg Kalakki')
      AND COALESCE(mi.category, '') = COALESCE('Non Veg Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mutton Sukka', NULL, 'Non Veg Appetizers', '2000', 'USD', 'https://grand-india.com/menu?item=mutton-sukka-VxMK', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mutton Sukka')
      AND COALESCE(mi.category, '') = COALESCE('Non Veg Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Omelette/Masala Omelette', NULL, 'Non Veg Appetizers', '800', 'USD', 'https://grand-india.com/pluto-images/uberEatsPhotoCoverage0426/OjgQY9W1Wcbg/V57810f4r9sl.jpg?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Omelette/Masala Omelette')
      AND COALESCE(mi.category, '') = COALESCE('Non Veg Appetizers', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Andhra Fish Pulusu', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/menu?item=andhra-fish-pulusu-iYFY', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Andhra Fish Pulusu')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Fish Tikka Masala', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/menu?item=fish-tikka-masala-vqiW', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Fish Tikka Masala')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Fish Vindaloo', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/menu?item=fish-vindaloo-pKG2', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Fish Vindaloo')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Grand India Mango Shrimp Curry', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/fe7d9993-fb9f-4275-8efa-3af180c83d4c?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Grand India Mango Shrimp Curry')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kadai Shrimp', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/cfe28c6c-e7ab-4fc7-8825-7bd8c793113d?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kadai Shrimp')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kerala Fish Curry', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/menu?item=kerala-fish-curry-TyxV', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kerala Fish Curry')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kerala Fish Moilee', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/menu?item=kerala-fish-moilee-9LAw', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kerala Fish Moilee')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kerala Shrimp Curry', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/80cceb08-8279-4a5b-96c9-9f2e6565c94a?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kerala Shrimp Curry')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kerala Shrimp Moilee', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/259b5d3a-d757-4152-bcad-bbf0a21a2200?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kerala Shrimp Moilee')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Madras Fish Curry', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/259b5d3a-d757-4152-bcad-bbf0a21a2200?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Madras Fish Curry')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Saag Shrimp', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/menu?item=saag-shrimp-Uyfv', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Saag Shrimp')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Shrimp Chettinad', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/153b5f6f-410d-4868-bba7-191ce1cb8f60?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Shrimp Chettinad')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Shrimp Korma', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/menu?item=shrimp-korma-F0cE', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Shrimp Korma')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Shrimp Tikka Masala', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/65ce21b6-c258-4426-8771-1a9c2b9e3421?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Shrimp Tikka Masala')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Shrimp Vindaloo', NULL, 'Seafood Entree', '1900', 'USD', 'https://grand-india.com/pluto-images/funnel/images/9e1d89da-4005-4917-8e67-ff17a075f1fd?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Shrimp Vindaloo')
      AND COALESCE(mi.category, '') = COALESCE('Seafood Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Basmati Rice', NULL, 'Side Orders', '400', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Basmati Rice')
      AND COALESCE(mi.category, '') = COALESCE('Side Orders', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Masala Papad', NULL, 'Side Orders', '500', 'USD', 'https://grand-india.com/menu?item=masala-papad-ufLU', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Masala Papad')
      AND COALESCE(mi.category, '') = COALESCE('Side Orders', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mint Chutney (8oz)', NULL, 'Side Orders', '500', 'USD', 'https://grand-india.com/menu?item=mint-chutney-8oz-fT2R', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mint Chutney (8oz)')
      AND COALESCE(mi.category, '') = COALESCE('Side Orders', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Onion Chutney', NULL, 'Side Orders', '500', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Onion Chutney')
      AND COALESCE(mi.category, '') = COALESCE('Side Orders', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Papad', NULL, 'Side Orders', '300', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Papad')
      AND COALESCE(mi.category, '') = COALESCE('Side Orders', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Raitha', NULL, 'Side Orders', '500', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Raitha')
      AND COALESCE(mi.category, '') = COALESCE('Side Orders', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Tamarind Chutney', NULL, 'Side Orders', '500', 'USD', NULL, TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Tamarind Chutney')
      AND COALESCE(mi.category, '') = COALESCE('Side Orders', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Butter Milk (Moru)', NULL, 'Soft Drinks', '500', 'USD', 'https://grand-india.com/pluto-images/growth/images/9d9554a7-6dcd-4d19-93dc-67f11768b14f?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Butter Milk (Moru)')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Coke', NULL, 'Soft Drinks', '250', 'USD', 'https://grand-india.com/menu?item=coca-cola-coke-inwo', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Coke')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Diet Coke', NULL, 'Soft Drinks', '250', 'USD', 'https://grand-india.com/menu?item=diet-coke-LHd3', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Diet Coke')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Fanta', NULL, 'Soft Drinks', '250', 'USD', 'https://grand-india.com/pluto-images/growth/images/6d3dec9e-9ac9-41c4-9b87-9dc0701cc49e?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Fanta')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Ginger Ale', NULL, 'Soft Drinks', '250', 'USD', 'https://grand-india.com/menu?item=ginger-ale-AoJi', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Ginger Ale')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Limca', NULL, 'Soft Drinks', '250', 'USD', 'https://grand-india.com/menu?item=limca-cXD6', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Limca')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Madras Coffee', NULL, 'Soft Drinks', '500', 'USD', 'https://grand-india.com/pluto-images/growth/images/98b34d36-2db9-4ee2-b432-48d435209559?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Madras Coffee')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mango Lassi', NULL, 'Soft Drinks', '500', 'USD', 'https://grand-india.com/pluto-images/growth/images/751477c3-d7ff-4fe9-9a87-88393d9ddb68?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mango Lassi')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Masala Chai', NULL, 'Soft Drinks', '500', 'USD', 'https://grand-india.com/pluto-images/growth/images/27890234-9818-48f5-99f5-db59184ee849?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Masala Chai')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Orange Juice', NULL, 'Soft Drinks', '300', 'USD', 'https://grand-india.com/menu?item=orange-juice-edsW', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Orange Juice')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Rose Milk', NULL, 'Soft Drinks', '500', 'USD', 'https://grand-india.com/pluto-images/growth/images/a723c040-55c2-48f5-a219-b991032f923b?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Rose Milk')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Salt Lassi', NULL, 'Soft Drinks', '500', 'USD', 'https://grand-india.com/pluto-images/growth/images/11a01cba-eb21-4ac2-a4e0-5cfa7101c076?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Salt Lassi')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sprite', NULL, 'Soft Drinks', '250', 'USD', 'https://grand-india.com/menu?item=sprite-CoMh', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sprite')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sukku Coffee (Dry Ginger)', NULL, 'Soft Drinks', '500', 'USD', 'https://grand-india.com/pluto-images/growth/images/d4ca3e43-95f0-46ee-a4a9-9eae836d60e0?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sukku Coffee (Dry Ginger)')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Thums Up', NULL, 'Soft Drinks', '250', 'USD', 'https://grand-india.com/menu?item=thums-up-BImJ', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Thums Up')
      AND COALESCE(mi.category, '') = COALESCE('Soft Drinks', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Aloo Gobi Masala', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/menu?item=aloo-gobi-masala-VdXL', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Aloo Gobi Masala')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Channa Masala', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/menu?item=channa-masala-qPmF', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Channa Masala')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chettinad Mix Vegetable Curry', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/menu?item=chettinad-mix-vegetable-curry-KiNn', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chettinad Mix Vegetable Curry')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Dal Fry (Tadka)', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/menu?item=dal-fry-tadka-SGp6', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Dal Fry (Tadka)')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Dal Makhani', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/pluto-images/funnel/images/06f355d2-0eeb-40f1-9069-9f2a738f6674?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Dal Makhani')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Gongura Dal', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/pluto-images/funnel/images/f70d1045-4897-4ae2-92a9-27b36dfdb665?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Gongura Dal')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Gongura Paneer', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/pluto-images/funnel/images/8169a72b-0aba-4e49-b914-d418bc733728?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Gongura Paneer')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kadai Paneer', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/pluto-images/growth/images/ee11ca52-44b3-4b75-8201-46aaba77ec65?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kadai Paneer')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Malai Kofta', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/menu?item=malai-kofta-7zPw', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Malai Kofta')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Navratna Korma', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/menu?item=navratna-korma-7vgn', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Navratna Korma')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Paneer Butter Masala', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/pluto-images/growth/images/6c9329cd-d9ba-490d-acd6-c42066f8f372?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Paneer Butter Masala')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Paneer Tikka Masala', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/menu?item=paneer-tikka-masala-dEJn', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Paneer Tikka Masala')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Saag Paneer', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/pluto-images/funnel/images/ee5c0f91-52ba-4f2c-a2a2-c54bdc6de0f6?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Saag Paneer')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Shahi Paneer Korma', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/pluto-images/funnel/images/90cd36f3-6d7a-4497-884c-418cbf505aef?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Shahi Paneer Korma')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Spinach Dal', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/pluto-images/funnel/images/d2129d05-2a57-43fe-8bc2-2aae0a6a6797?w=640&fit=cover', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Spinach Dal')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Veg Korma', NULL, 'Veg Entree', '1600', 'USD', 'https://grand-india.com/menu?item=veg-korma-tHXu', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Veg Korma')
      AND COALESCE(mi.category, '') = COALESCE('Veg Entree', '')
  );
