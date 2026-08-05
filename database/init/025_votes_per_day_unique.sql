ALTER TABLE votes
    DROP INDEX uq_user_vote,
    ADD UNIQUE KEY uq_user_vote_day (user_id, vote_date);
