INSERT INTO menu_items (
    restaurant_id,
    name,
    description,
    category,
    price_cents,
    currency,
    is_available
)
SELECT
    r.id,
    CONCAT(r.name, ' Signature'),
    CONCAT('Starter menu entry for ', r.name, '.'),
    'House Special',
    1299,
    'USD',
    TRUE
FROM restaurants r
WHERE r.active = TRUE
  AND NOT EXISTS (
      SELECT 1
      FROM menu_items mi
      WHERE mi.restaurant_id = r.id
  );
