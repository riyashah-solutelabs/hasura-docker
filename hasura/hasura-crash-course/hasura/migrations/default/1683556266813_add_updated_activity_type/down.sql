-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- INSERT INTO blog_post_activity_type VALUES ('updated');
DELETE FROM blog_post_activity_type WHERE name="updated";
