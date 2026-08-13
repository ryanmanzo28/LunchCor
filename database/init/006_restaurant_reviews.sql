CREATE TABLE IF NOT EXISTS restaurant_reviews (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

	user_id INT UNSIGNED NOT NULL,
	restaurant_id INT UNSIGNED NOT NULL,

	rating TINYINT UNSIGNED NOT NULL,
	review TEXT,

	review_date DATE NOT NULL,
	created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT fk_restaurant_reviews_user
		FOREIGN KEY (user_id)
		REFERENCES users(id)
		ON DELETE CASCADE,

	CONSTRAINT fk_restaurant_reviews_restaurant
		FOREIGN KEY (restaurant_id)
		REFERENCES restaurants(id)
		ON DELETE CASCADE,

	CONSTRAINT chk_restaurant_reviews_rating
		CHECK (rating BETWEEN 1 AND 5),

	CONSTRAINT uq_restaurant_reviews_user_restaurant_day
		UNIQUE (user_id, restaurant_id, review_date)
);
