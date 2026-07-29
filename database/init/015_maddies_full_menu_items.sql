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

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Chicken Salad Supreme', 'Chicken salad on grilled multi-grain with field greens, fresh tomatoes, and avocado spread.', 'Originals', 1325, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'chicken salad supreme');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Ultimate Turkey Club', 'Sliced turkey, bacon, cheddar, lettuce, tomatoes, honey mustard, and mayo stacked on white toast.', 'Originals', 1399, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'ultimate turkey club');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Cowboy''s Chicken', 'Grilled chicken breast on a ciabatta with bacon, lettuce, tomato, cheddar, and ranch dressing.', 'Originals', 1425, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'cowboy''s chicken');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Pressed Pastrami', 'Grilled pastrami on grilled marble rye bread with melted Swiss and spice brown mustard.', 'Originals', 1375, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'pressed pastrami');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Reuben', 'Corned beef, sauerkraut, Russian dressing, and Swiss cheese on grilled marble rye.', 'Originals', 1450, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'reuben');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Chicken Caprese', 'Grilled chicken, tomatoes, fresh mozzarella, basil-infused olive oil, and balsamic glaze served on grilled ciabatta.', 'Originals', 1375, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'chicken caprese');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Tuna Meltdown', 'Tuna salad on grilled sourdough with tomatoes and melted cheddar cheese.', 'Originals', 1375, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'tuna meltdown');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Eric''s Egg Salad', 'Our homemade egg salad with lettuce and tomato on a grilled focaccia roll.', 'Originals', 1325, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'eric''s egg salad');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Southwest Fiesta Wrap', 'Grilled chicken, fire-roasted corn, peppers, onions, black beans, tomatoes, cheddar jack, tortilla chips, and ranch dressing.', 'Wraps', 1225, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'southwest fiesta wrap');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Steak and Cheese Wrap', 'Grilled steak with peppers, onions, mushrooms, cheddar, lettuce, tomatoes, and mayo.', 'Wraps', 1425, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'steak and cheese wrap');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'BBQ Chicken Wrap', 'Grilled BBQ chicken, bacon, cheddar, onions, lettuce, tomatoes and ranch.', 'Wraps', 1250, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'bbq chicken wrap');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'California Chicken Wrap', 'Grilled chicken, bacon, avocado, lettuce, tomato, onion, cheddar and chipotle mayo.', 'Wraps', 1325, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'california chicken wrap');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Buffalo Chicken Wrap', 'Grilled buffalo chicken with onions, and cheddar jack with lettuce, diced tomatoes, and blue cheese dressing.', 'Wraps', 1249, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'buffalo chicken wrap');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Crispy Chicken Wrap', 'Crispy chicken fritters, lettuce, tomatoes, honey-dijon, mayo, bacon, and cheddar.', 'Wraps', 1250, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'crispy chicken wrap');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Mediterranean Wrap', 'Grilled chicken, mushrooms, artichokes, spinach, roasted red peppers, tomatoes, onions, feta and balsamic vinaigrette.', 'Wraps', 1225, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'mediterranean wrap');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Chicken Caesar Wrap', 'Grilled chicken, romaine, croutons, asiago cheese, and Caesar dressing.', 'Wraps', 1225, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'chicken caesar wrap');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Oriental Wrap', 'Teriyaki chicken, romaine, tomatoes, mandarin oranges, sesame seeds, almonds, chow mein noodles, and honey ginger dressing.', 'Wraps', 1249, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'oriental wrap');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Chipotle Chicken', 'Grilled chicken, chipotle spread, lettuce, tomatoes, and cheddar on grilled ciabatta.', 'The Funky Bunch', 1399, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'chipotle chicken');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Tuscan Chicken Salad', 'Chicken salad with greens, tomatoes, red onion, and roasted red peppers topped with Italian dressing on grilled focaccia.', 'The Funky Bunch', 1325, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'tuscan chicken salad');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Sammy''s Gone to California', 'Turkey, lettuce, tomatoes, red onion, cheddar, and avocado spread on grilled sourdough.', 'The Funky Bunch', 1375, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'sammy''s gone to california');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Monterey Turkey', 'Grilled turkey, roasted red peppers, red onion, spinach bacon, cheddar, and honey dijon on grilled sourdough.', 'The Funky Bunch', 1425, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'monterey turkey');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Maddie''s Baked Italian', 'Baked hot ham, salami, provolone, tomatoes, red onion, pickles, hot pepper relish, Italian dressing, and mayo baked on a grilled parmesan focaccia.', 'The Funky Bunch', 1350, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'maddie''s baked italian');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Pesto Classico', 'Grilled chicken, mozzarella, basil pesto, tomatoes, and spinach on a grilled ciabatta.', 'The Funky Bunch', 1425, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'pesto classico');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Cordon Bleu Sandwich', 'Crispy chicken cutlet with grilled ham, melted swiss cheese, tomatoes, mayo and honey mustard, on a grilled asiago bagel.', 'The Funky Bunch', 1450, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'cordon bleu sandwich');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Hot Honey Chicken', 'Crispy chicken cutlet, drizzled with hot honey, bacon, melted cheddar, shredded lettuce, diced pickles and spicy mayonnaise, on a grilled brioche roll.', 'The Funky Bunch', 1425, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'hot honey chicken');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Buffalo Chicken Fritters', 'Crispy fritters served with French fries, Cole slaw, and blue cheese dressing.', 'Fritters, Burgers & Grilled Cheese', 1325, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'buffalo chicken fritters');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Chicken Fritters', 'Crispy chicken fritters served with cole slaw, French fries, and honey mustard.', 'Fritters, Burgers & Grilled Cheese', 1299, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'chicken fritters');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Maddie''s Angus Burger', '1/2 lb. patty on a grilled brioche roll with lettuce, tomato, red onions, choice of cheddar, Swiss or American, with fries and a pickle. Add bacon, mushrooms, BBQ, or grilled onion.', 'Fritters, Burgers & Grilled Cheese', 1449, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'maddie''s angus burger');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Grilled Cheese', 'Grilled sourdough with cheddar, served with chips and a pickle.', 'Fritters, Burgers & Grilled Cheese', 775, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'grilled cheese');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Veggie Burger', 'Veggie burger with lettuce, tomato, red onion, sauteed mushrooms, cheddar, Dijon mustard, on a grilled brioche roll.', 'Veggie Sandwiches', 1449, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'veggie burger');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Portabella Mushroom Sandwich', 'Grilled Portabella mushroom, balsamic onion, tomato, and roasted red peppers, and mayo on grilled parmesan focaccia.', 'Veggie Sandwiches', 1349, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'portabella mushroom sandwich');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Pesto Besto', 'Spinach, vine ripe tomatoes, fresh mozzarella and pesto on grilled ciabatta.', 'Veggie Sandwiches', 1250, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'pesto besto');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Supreme Hummus', 'Hummus, field greens, tomatoes, cucumbers, cheddar cheese and balsamic glaze on grilled multigrain.', 'Veggie Sandwiches', 1250, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'supreme hummus');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Soup', 'Soup.', 'Soups & Sides', 525, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'soup');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Chowder', 'Chowder.', 'Soups & Sides', 625, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'chowder');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'French Fries', 'French fries.', 'Soups & Sides', 550, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'french fries');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Sweet Potato Fries', 'Sweet potato fries.', 'Soups & Sides', 599, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'sweet potato fries');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Fresh Pita', 'Fresh pita.', 'Soups & Sides', 99, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'fresh pita');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Cole Slaw', 'Cole slaw.', 'Soups & Sides', 325, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'cole slaw');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Cup of Fresh Fruit', 'Cup of fresh fruit.', 'Soups & Sides', 450, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'cup of fresh fruit');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Hot Dog', 'On a grilled roll.', 'Mini Maddie''s', 699, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'hot dog');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Chicken Tenders', 'BBQ, honey mustard, ranch.', 'Mini Maddie''s', 699, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'chicken tenders');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Grilled Cheese', 'American on white.', 'Mini Maddie''s', 699, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'grilled cheese' AND category = 'Mini Maddie''s');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'PB&J', 'Grape or strawberry on white.', 'Mini Maddie''s', 699, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'pb&j');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Kraft Mac & Cheese', 'Kraft mac & cheese.', 'Mini Maddie''s', 699, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'kraft mac & cheese');

INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT @maddies_id, 'Make Your Own Sandwich', 'Turkey, Ham, Tuna, Chicken Salad | American, Swiss, Cheddar | Mayo, Mustard, or Avocado Spread | Lettuce, Tomatoes, Pickles', 'Mini Maddie''s', 699, 'USD', TRUE
WHERE @maddies_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM menu_items WHERE restaurant_id = @maddies_id AND LOWER(name) = 'make your own sandwich');
