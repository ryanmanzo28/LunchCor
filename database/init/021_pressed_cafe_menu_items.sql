-- Generated from data/pressed.csv; safe to re-run.
INSERT INTO restaurants (name, cuisine, description, icon, color, active)
SELECT 'Pressed Cafe', 'Cafe', 'Fresh salads, bowls, sandwiches, and smoothies.', 'PC', '#6b8e23', TRUE
WHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = 'Pressed Cafe');

SET @restaurant_id := (SELECT id FROM restaurants WHERE name = 'Pressed Cafe' LIMIT 1);

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Avocado Toast', NULL, 'Menu', '1300', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/8ed1a234-6cfe-4ae0-a36a-ae36a89d513e/Avocado-Toast.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Avocado Toast')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Award-Winning Freshly Baked Muffins', NULL, 'Menu', '500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/0871851e-17fd-4d5b-a778-d420973da954/Muffins_Olo.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Award-Winning Freshly Baked Muffins')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Backyard BBQ Protein Bowl', NULL, 'Menu', '1700', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/94cd9037-3ae8-4d98-8280-adaf6a606fd9/Backyard-BBQ.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Backyard BBQ Protein Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Banh Mi Bowl', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/a41e550f-52be-467e-a961-4958a99be6f5/Banh-Mi-Bowl.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Banh Mi Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Blackberry Lemon-Cheesecake Matcha (Iced Only)', NULL, 'Menu', '650', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/62ecec87-b1a8-4bfb-bad5-356d8f1da9ad/BlackberryLemonCheesecakeMatcha_2.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Blackberry Lemon-Cheesecake Matcha (Iced Only)')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Blue Aura Smoothie', NULL, 'Menu', '1075', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/091a1580-35bd-44e1-b7be-864e5fa203e4/PeachOuraSmoothie_7.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Blue Aura Smoothie')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Blue Zone Ahi Tuna Farro Salad', NULL, 'Menu', '1800', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/92232cc7-83af-4d9b-98e4-d0c600173a82/Blue-Zone-Ahi-Tuna.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Blue Zone Ahi Tuna Farro Salad')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Braised Beef Short Rib Poutine', NULL, 'Menu', '1600', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/dbb89473-9406-4a34-b681-eff0fa6e6d6e/ncp_-322-of-473-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Braised Beef Short Rib Poutine')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Buffalo Blue', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/452ba804-468f-4bda-98a8-11f23af8af8d/Buffalo-Blue.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Buffalo Blue')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Buffalo Cauliflower', NULL, 'Menu', '1300', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/8fca02bc-a03a-4565-b667-3d58e6467c50/ncp_-327-of-473-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Buffalo Cauliflower')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Buffalo Chicken Burrito', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/b794e553-0114-4a52-9421-51df21b95e89/Buff-Chix-Burrito.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Buffalo Chicken Burrito')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Cafe Horchata (Iced Only)', NULL, 'Menu', '500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/3109678e-bb1c-43d8-85f3-c7c5649b7a47/EspressoMatcha_5.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Cafe Horchata (Iced Only)')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'California Cobb Salad', NULL, 'Menu', '1600', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/232100d3-3e35-4709-bf9c-d4ecfba4de71/Cobb-Salad.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('California Cobb Salad')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'California Turkey BLT', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/dd650350-717c-4436-a692-ff99d80648ad/California-Turkey-BLT.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('California Turkey BLT')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Charred Veggie Hummus*', NULL, 'Menu', '1700', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/313629dc-4f26-4fae-ba8e-df9a6cd534d1/Charred-Veggie-Hummus.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Charred Veggie Hummus*')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chicken Cordon Bleu', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/1a49694f-9349-4d39-84ac-9e1f943f61b5/Chicken-Cordon-Bleu.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chicken Cordon Bleu')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chipotle Chicken', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/5d73be63-b438-4d2a-8c84-a3b70a977191/Chipotle-Chix.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chipotle Chicken')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chipotle Steak & Egg Burrito', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/e3cc6c8b-53e3-45bb-be3a-3a3eb32a1e80/Chipotle-Steak-Burrito.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chipotle Steak & Egg Burrito')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Chocolate Coconut Balls', NULL, 'Menu', '225', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/7b5a1b33-d76d-4bcb-860e-a475d514a676/ChocolateBalls_Olo.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Chocolate Coconut Balls')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Cinnamon Roll', NULL, 'Menu', '600', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/cd3da2d7-b223-4bb7-803f-428a51623861/CinnamonRoll_Olo.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Cinnamon Roll')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Classic Hummus*', NULL, 'Menu', '1300', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/b6f42a9b-f1bf-47d8-82c9-d5a08e122c44/Classic-Hummus.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Classic Hummus*')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Coconut Curry Bowl*', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/cf3a7fc7-9a8e-482d-a9cd-df787eb97a9a/Coconut-Curry-Bowl.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Coconut Curry Bowl*')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Eggplant Chicken Parm Panini', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/22a2c509-ee78-454e-8906-e16e9eb2f821/Eggplant-Chix-Parm.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Eggplant Chicken Parm Panini')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Eggplant Parmesan Quinoa Bowl', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/dc048021-6bf5-4e40-b8d2-b1ef19d9e471/Eggplant-Parmesan-Bowl.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Eggplant Parmesan Quinoa Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Enter The Dragon', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/8c1e53a2-eb3c-49e6-8b9d-cd713f694c63/ncp-78-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Enter The Dragon')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Firecracker Burrito', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/48acd9ce-a46d-468d-8df1-5022d71e5de6/Firecracker-Burrito.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Firecracker Burrito')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'French Fries', NULL, 'Menu', '500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/c7588220-b4d9-41c3-a008-f64e9d73ba31/DSC01373.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('French Fries')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Fresh Croissants', NULL, 'Menu', '400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/cabe8634-548b-4d35-896f-9e5086dbb315/Croissant_Olo.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Fresh Croissants')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Greek Chicken', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/92df82c7-b07d-44cc-a873-d577e5e07de8/Greek-Chicken.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Greek Chicken')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Greek Chicken Farro Bowl', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/3971b9d0-c27a-4e80-affe-1e8c7e899392/Greek-Vegetable-Chicken-Farro.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Greek Chicken Farro Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Health Nut Smoothie', NULL, 'Menu', NULL, 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/62e14186-b439-4455-8f88-6cbc1f248b9a/Healthnut.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Health Nut Smoothie')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Hibiscus Sangria Tea (Iced Only)', NULL, 'Menu', '400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/8f2e0692-e542-4ef6-aa79-1410bc2b1ce6/HibiscusSangriaTea_3.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Hibiscus Sangria Tea (Iced Only)')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'House Fruit Cup', NULL, 'Menu', '1000', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/357ee041-df6e-4269-b691-91f2ae1f9fd7/ChatGPT-Image-May-8-2026-08_35_23-AM.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('House Fruit Cup')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'House-Made Granola Bars', NULL, 'Menu', '450', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/79e2a192-d4af-42aa-9011-52fbd8e4ec6e/GranolaBars_Olo.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('House-Made Granola Bars')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Humina Humina Toast', NULL, 'Menu', '1300', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/8d9dcd43-e000-4dea-9d33-bb5ef0486deb/Humina-Humina.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Humina Humina Toast')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Jammy Egg and Cheddar Toast', NULL, 'Menu', '1200', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/85b7dc63-12f7-42a7-91a8-f38d1c98d2a9/ncp-43-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Jammy Egg and Cheddar Toast')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Jerusalem Mezze Plate*', NULL, 'Menu', '1700', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/a3eeba5d-4637-4185-a2c4-d5a2a0a70c1a/JERUSALEM-MEZZE-PLATE.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Jerusalem Mezze Plate*')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Kefta Kebab Bowl', NULL, 'Menu', '1700', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/b5066371-38a7-4fc4-a8a9-5d1ab5ae2cc0/ncp-11-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Kefta Kebab Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Lu Lu Melt', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/cc4c45f1-726c-4651-8b6c-eaf7f8afd95f/Lu-Lu-Melt.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Lu Lu Melt')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Luck of the Irish Burrito', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/3a9b42b3-2428-4386-9a77-b47383ea282b/Luck-of-the-Irish.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Luck of the Irish Burrito')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Magic Mushroom Melt', NULL, 'Menu', '1700', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/55cea917-98c9-41e7-9abc-b99465b18d66/ncp-66-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Magic Mushroom Melt')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mango Passion Fruit Smoothie', NULL, 'Menu', NULL, 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/6f7f2c2a-77f4-49b1-a8df-421716ae4af8/Mango-PS.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mango Passion Fruit Smoothie')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Meat Lover Burrito', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/37f1ec40-376d-4302-bda4-123358d0dfcc/Meat-Lover-Burrito.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Meat Lover Burrito')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mediterranean Cauliflower', NULL, 'Menu', '1300', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/25a0dfef-6199-46de-9f9a-9d46199af5ea/ncp_-323-of-473-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mediterranean Cauliflower')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mediterranean Grain', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/0372525e-b272-425b-953b-b7c3ba1ed9af/ncp-76-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mediterranean Grain')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mexicali Bowl', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/4b1804af-23bd-4fbe-999f-ee4a79cb5415/Mexi-Cali-Bowl.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mexicali Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Morning Smash Burrito', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/e309931f-1ef9-482e-bcab-358bfc953c75/Smash-Burger-Burrito.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Morning Smash Burrito')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Mykonos Triple Berry Probiotic', NULL, 'Menu', NULL, 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/f228783b-a447-4b99-82fe-785fe52ae7bf/Mykonos.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Mykonos Triple Berry Probiotic')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Nutella and Peanut Butter Toast', NULL, 'Menu', '1100', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/8db57bf8-dd43-46f3-a628-6453aa36260f/PBN-Toast.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Nutella and Peanut Butter Toast')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Orange Balls', NULL, 'Menu', '350', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/d6167684-d138-4c41-8d9c-fcc1b512c11f/OrangeBalls_Olo.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Orange Balls')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Oven Roasted Turkey', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/cc96b5fc-97cb-4f5a-8960-459e3f7fa4cf/Oven-Roasted-Turkey.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Oven Roasted Turkey')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Paleo Pastries', NULL, 'Menu', '400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/68c3d99b-1b9b-48c2-884a-f03a8bf512ff/PaleoChocolateBrownies_Olo.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Paleo Pastries')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Peach Bash Flash', NULL, 'Menu', '450', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/116fbfae-16b5-4125-825d-40b16217f710/Peach-Bash-Flash.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Peach Bash Flash')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Peaches ''N Cream Matcha (Iced Only)', NULL, 'Menu', '600', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/c7e1bd4d-e6eb-4082-8121-e05ff7ef7ded/Matcha.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Peaches ''N Cream Matcha (Iced Only)')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Peaches ''N Cream Tea (Iced Only)', NULL, 'Menu', '600', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/24f2970e-292c-4ff9-8ca4-e2ca6cfd5245/Peach-Teas.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Peaches ''N Cream Tea (Iced Only)')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Peanut Butter Power', NULL, 'Menu', NULL, 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/202f316d-83b9-46ad-a400-b657265178c5/PB-POWER.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Peanut Butter Power')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Peanut Butter Protein Balls', NULL, 'Menu', '225', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/ff888800-a57a-4dd2-ad18-105ff7c74a22/PeanutButterBalls_Olo.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Peanut Butter Protein Balls')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Pesto Goat Cheese BLT', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/33823ac3-5e52-41e2-943a-cc0b3b9f4925/Goat-Cheese-BLT.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Pesto Goat Cheese BLT')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Pina-Coquito Flash', NULL, 'Menu', '450', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/312e9754-5bae-4ab9-83ae-03c50afbb2c2/PinaCoquitoFlash_6.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Pina-Coquito Flash')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Pressed Pad Thai Bowl', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/d6466458-2f89-432c-8eec-b854ed6aedb1/Pad-Thai-Bowl.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Pressed Pad Thai Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Rainbow Acai Bowl', NULL, 'Menu', '1000', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/fc93949b-2583-4fe7-83b0-a166c6c58948/ncp-2-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Rainbow Acai Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Reuben', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/cca51d3d-3351-4f70-b432-002163fb730e/Reuben.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Reuben')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Rugelach', NULL, 'Menu', '395', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/67bd5800-d7f1-4993-a60b-d08263d158aa/Rugelach_Olo.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Rugelach')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sababa Salmon Salad', NULL, 'Menu', '1600', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/f489817e-f7f2-46e8-9e37-29e046b75e64/Sababa-Salmon.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sababa Salmon Salad')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sabich (Sah-Beekh)', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/934df992-15ce-47dd-b5d5-729607f92204/ncp_-222-of-473-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sabich (Sah-Beekh)')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Salted Rum Vanilla Latte (Iced/Hot)', NULL, 'Menu', '600', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/e65c8e43-f354-4a08-a653-7c07f9481b86/SaltedRumVanillaLatte_8.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Salted Rum Vanilla Latte (Iced/Hot)')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Santorini Sunrise Yogurt', NULL, 'Menu', '1200', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/c750b17e-30cd-442d-8aa1-c83f7c978a32/ncp-6-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Santorini Sunrise Yogurt')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Schnitzel - American Style', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/93e1fcc1-bd59-4dda-9302-552dc79b98ff/ncp-63-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Schnitzel - American Style')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Schnitzel - Israeli Style', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/e0e49f9b-21f2-416b-bce0-5f41019ad778/ncp-62-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Schnitzel - Israeli Style')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Smash Burger Salad', NULL, 'Menu', '1600', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/5a58b186-b504-4a56-aaeb-9433ec3fad96/Smash-Burger-Salad.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Smash Burger Salad')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Smoked Salmon Toast', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/aea558b0-0f59-4798-ba28-ac4d875d8e53/Salmon-Toast.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Smoked Salmon Toast')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Spicy BBQ Chicken', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/83ef086b-3462-4f02-8d60-44ad90f143d2/Spicy-BBQ-Chicken.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Spicy BBQ Chicken')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Spring Fling', NULL, 'Menu', NULL, 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/e32b89a7-7da9-42b4-8f0c-020d91225370/Spring-Fling.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Spring Fling')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Steakhouse Salad', NULL, 'Menu', '1600', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/7d315c5e-f1ce-493b-a827-6c832652fe9a/Steak-House-Salad.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Steakhouse Salad')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Strawberry Banana', NULL, 'Menu', NULL, 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/d089b7c8-89aa-44b0-bf32-7df3e6ce8f5b/Strawberry-Banana.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Strawberry Banana')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Strawberry Fields', NULL, 'Menu', '1200', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/d0cfc80a-856c-4b50-ae48-d627ceabe7b4/Strawberry-Fields.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Strawberry Fields')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Summer Blackberry Hibiscus Refresher', NULL, 'Menu', '650', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/3758c64e-8706-42f6-ac82-81bd2ab2ebdc/BlackberryHibiscusRefresher_8.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Summer Blackberry Hibiscus Refresher')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Surf and Turf', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/d493bf50-b2fa-47ab-bbbc-69fc732ebe7d/Surf-N-Turf.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Surf and Turf')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Sweet and Spicy Rice Bowl', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/9f7e9a7f-7c1f-409e-9564-e194bfbfb4cc/ncp-77-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Sweet and Spicy Rice Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Tel Aviv Tuna', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/831343e7-2f5e-4bb6-80d3-558cb25db179/Tel-Aviv-Tuna.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Tel Aviv Tuna')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The AmeriCoCo', NULL, 'Menu', '900', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/67e915b8-abda-41f5-85ae-67590f2e6042/AmeriCoCo3.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The AmeriCoCo')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Atlantic', NULL, 'Menu', '1600', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/0d93f84f-ee02-41cf-81a4-07534e4457ff/Atlantic-Salad.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Atlantic')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Bridge', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/471e0a71-9afa-47cf-ba48-e585c4bb33ba/The-Bridge.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Bridge')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Caprese', NULL, 'Menu', '1200', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/7a628341-8328-49c5-a57b-7098566ea0f9/Caprese-Salad.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Caprese')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The French Burrito', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/b49e6a29-2c9a-4107-be4e-b99e32d7a8c0/French-Burrito.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The French Burrito')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Green Monster', NULL, 'Menu', NULL, 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/8549bdd6-6c23-4541-87e8-b76af2aa7ebf/ncp_-369-of-473-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Green Monster')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Medusa', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/ed73f916-f8d1-4e0a-902a-c431e6ee9998/Medusa.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Medusa')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Middle East', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/8e75c6a8-b063-4029-a51e-177d720f03c1/Middle-East.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Middle East')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Pressed', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/f6aa8541-57b8-4f95-a7f8-eed0056a10e1/Pressed.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Pressed')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Real Deal Melt', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/d727fe99-432b-4bda-ad50-ed8f690a4249/Real-Deal-Melt.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Real Deal Melt')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'The Zohan', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/3eb62bbb-8d56-4ab5-a960-2bfdd586709d/Zohan.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('The Zohan')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Traditional Acai Bowl', NULL, 'Menu', '900', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/3b736b05-03b6-429e-bda1-1fddfdf78fd7/ncp-1-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Traditional Acai Bowl')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Traditional BLT', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/bf8d8f38-0984-4d7c-8e84-4a6a2c20b0d7/BLT.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Traditional BLT')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Traditional Greek', NULL, 'Menu', '1200', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/b1d13bc1-c537-40e9-ba32-5f183e9879a2/Traditional-Greek.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Traditional Greek')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Tropical Island Smoothie', NULL, 'Menu', NULL, 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/7af12f39-e6c2-4f39-bdf2-d45ba4e9b17b/Tropical-Island-Smoothie.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Tropical Island Smoothie')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Truffle Parmesan Fries', NULL, 'Menu', '1200', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/d3e50993-5782-42d2-b6eb-7c3d6e4c75a3/truffle-fries.avif', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Truffle Parmesan Fries')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Turkey Reuben', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/d6f540d2-6d41-422c-a572-61d4b26ec461/Turkey-Reuben.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Turkey Reuben')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Vegan Forager Smash', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/a39181ca-2593-4733-994b-f89ae112f64b/ncp-61-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Vegan Forager Smash')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Vegan Middle East', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/729200a8-754c-4a97-a5f3-e9abeaa43825/ncp-69-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Vegan Middle East')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Vegetarian Magic Mushroom Melt', NULL, 'Menu', '1700', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/fc3a182d-09c7-4b55-9999-cf863d504085/ChatGPT-Image-May-4-2026-12_24_22-PM.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Vegetarian Magic Mushroom Melt')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Warm Roasted Beets and Labneh*', NULL, 'Menu', '1200', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/aaee175f-164b-4a54-8f50-dc76b0289477/ncp-39-of-91-.jpg', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Warm Roasted Beets and Labneh*')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Wipe The Plate*', NULL, 'Menu', '1400', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/adf48aaf-c1db-4a2c-b1a0-2c39903df446/Wipe-the-Plate.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Wipe The Plate*')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );

INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)
SELECT @restaurant_id, 'Yalla Hummus Bowl*', NULL, 'Menu', '1500', 'USD', 'https://files.elfsightcdn.com/eafe4a4d-3436-495d-b748-5bdce62d911d/937ed2ad-b796-4bce-8ec9-fe028b24ee57/Yalla-Hummus.png', TRUE
WHERE @restaurant_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM menu_items mi
    WHERE mi.restaurant_id = @restaurant_id
      AND LOWER(mi.name) = LOWER('Yalla Hummus Bowl*')
      AND COALESCE(mi.category, '') = COALESCE('Menu', '')
  );
