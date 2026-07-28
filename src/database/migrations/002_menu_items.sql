CREATE TABLE IF NOT EXISTS menu_items (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    restaurant_id INT UNSIGNED NOT NULL,

    name VARCHAR(120) NOT NULL,
    description TEXT NULL,
    category VARCHAR(80) NULL,

    price_cents INT UNSIGNED NULL,
    currency CHAR(3) NOT NULL DEFAULT 'USD',

    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    available_from DATE NULL,
    available_to DATE NULL,

    created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_menu_items_restaurant
        FOREIGN KEY (restaurant_id)
        REFERENCES restaurants(id)
        ON DELETE CASCADE,

    INDEX idx_menu_items_restaurant (restaurant_id),
    INDEX idx_menu_items_available (is_available, available_from, available_to)
);
