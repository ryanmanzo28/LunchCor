SET @maddies_id := (
    SELECT id FROM restaurants
    WHERE LOWER(name) = 'maddies' AND active = TRUE
    LIMIT 1
);

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Southwest Fiesta Salad', 'Grilled southwest chicken over romaine with fire roasted corn, onions, red and green peppers, black beans, tomatoes, cucumbers, cheddar jack, and tortilla strips with a side of Mexican ranch.', 'Salads', 1525, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'southwest fiesta salad');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Oriental Salad', 'Teriyaki chicken over romaine with tomatoes, cucumbers, onions, mandarin oranges, sesame seeds, sliced almonds and chow mein noodles. Served with honey ginger dressing.', 'Salads', 1525, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'oriental salad');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Black and Blue Salad', 'Blackened chicken over baby spinach with tomatoes, cucumbers, red onion, walnuts, craisins and gorgonzola. Served with a side of balsamic vinaigrette.', 'Salads', 1499, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'black and blue salad');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Cobb Salad', 'Crisp romaine topped with diced tomatoes, onions, green peppers, bacon, cucumbers, cheddar cheese, grilled chicken, hard-boiled egg, and choice of dressing.', 'Salads', 1550, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'cobb salad');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Mediterranean Salad', 'Grilled chicken, field greens, tomatoes, red onion, sauteed mushrooms and artichokes, cucumbers, roasted red peppers and feta. Served with a side of balsamic vinaigrette.', 'Salads', 1550, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'mediterranean salad');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Buffalo Chicken Salad', 'Crispy buffalo chicken atop salad greens garnished with tomatoes, red onion, cucumbers, and cheddar cheese. Served with a side of blue cheese dressing.', 'Salads', 1525, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'buffalo chicken salad');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Summer Salad', 'Field greens, strawberries, blueberries, candied walnuts, mandarin oranges, grape tomatoes, cucumbers, red onions, and grilled chicken, with poppy seed vinaigrette.', 'Salads', 1599, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'summer salad');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Chads Buddy', 'Grilled buffalo chicken, crispy bacon, diced avocado, tomatoes, onions, and cheddar cheese, over a bed of crisp romaine lettuce. Served with chipotle dressing.', 'Salads', 1550, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'chads buddy');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Apple Waldorf Salad', 'Fresh field greens topped with diced apples, candied walnuts, dried cranberries, gorgonzola, tomatoes, red onion, cucumbers, and grilled chicken. Served with a side of cranberry vinaigrette.', 'Salads', 1699, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'apple waldorf salad');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Garden Salad', 'Crisp romaine with grape tomatoes, cucumbers, red onion, croutons, shredded cheddar, and choice of dressing.', 'Salads', 950, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'garden salad');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Caesar Salad', 'Crisp Romaine tossed with Caesar dressing, garlic croutons, and asiago cheese.', 'Salads', 925, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'caesar salad');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Greek Salad', 'Crisp Romaine with grilled chicken, feta, tomatoes, kalamata olives, cucumbers, red onions, and pepperoncini. Served with Greek Vinaigrette.', 'Salads', 1525, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'greek salad');
