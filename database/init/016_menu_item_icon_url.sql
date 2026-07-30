-- Preserve source-provided menu item images as icons.
SET @add_menu_item_icon_url = (
  SELECT IF(
    COUNT(*) = 0,
    'ALTER TABLE menu_items ADD COLUMN icon_url VARCHAR(2048) NULL AFTER currency',
    'SELECT 1'
  )
  FROM information_schema.columns
  WHERE table_schema = DATABASE()
    AND table_name = 'menu_items'
    AND column_name = 'icon_url'
);
PREPARE stmt FROM @add_menu_item_icon_url;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
