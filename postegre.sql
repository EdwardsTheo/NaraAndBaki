-- Create users table
CREATE TABLE users (
                       user_id SERIAL PRIMARY KEY,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password_hash VARCHAR(100) NOT NULL,
                       is_admin BOOLEAN NOT NULL
);

-- Create recipe_types table
CREATE TABLE recipe_types (
                              type_id SERIAL PRIMARY KEY,
                              type_name VARCHAR(50) NOT NULL UNIQUE
);

-- Create recipe table
CREATE TABLE recipes (
                         recipe_id SERIAL PRIMARY KEY,
                         title VARCHAR(100) NOT NULL,
                         ingredients TEXT NOT NULL,
                         time_to_make INTERVAL NOT NULL,
                         time_to_cook INTERVAL NOT NULL,
                         user_id INT REFERENCES users(user_id),
    -- Add other columns as needed
);

-- Create intermediary table for recipe types
CREATE TABLE recipe_type_mapping (
                                     recipe_id INT REFERENCES recipes(recipe_id),
                                     type_id INT REFERENCES recipe_types(type_id),
                                     PRIMARY KEY (recipe_id, type_id)
);
