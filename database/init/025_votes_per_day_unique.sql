SET @drop_old_uq = (
    SELECT IF(
        EXISTS (
            SELECT 1
            FROM information_schema.statistics
            WHERE table_schema = DATABASE()
                AND table_name = 'votes'
                AND index_name = 'uq_user_vote'
        ),
        'ALTER TABLE votes DROP INDEX uq_user_vote',
        'SELECT 1'
    )
);
PREPARE stmt FROM @drop_old_uq;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @add_new_uq = (
    SELECT IF(
        EXISTS (
            SELECT 1
            FROM information_schema.statistics
            WHERE table_schema = DATABASE()
                AND table_name = 'votes'
                AND index_name = 'uq_user_vote_day'
        ),
        'SELECT 1',
        'ALTER TABLE votes ADD UNIQUE KEY uq_user_vote_day (user_id, vote_date)'
    )
);
PREPARE stmt FROM @add_new_uq;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
