CREATE TABLE Users (
	id INTEGER PRIMARY KEY,
	username TEXT UNIQUE,
	password_hash TEXT
);

CREATE TABLE Recipes (
	id INTEGER PRIMARY KEY,
	name TEXT UNIQUE,
	user_id INTEGER REFERENCES Users,
	time INTEGER,
	description TEXT
);

CREATE TABLE Ingredients (
	id INTEGER PRIMARY KEY,
	recipe_id INTEGER REFERENCES Recipes,
	name TEXT,
	amount TEXT
);

 CREATE TABLE Classes (
	id INTEGER PRIMARY KEY,
	title TEXT,
	value TEXT
);
    
CREATE TABLE Recipe_classes (
	id INTEGER PRIMARY KEY,
	recipe_id REFERENCES Recipes,
	title TEXT,
	value INTEGER
);

CREATE TABLE Comments (
	id INTEGER PRIMARY KEY,
	recipe_id INTEGER REFERENCES Recipes,
	user_id INTEGER REFERENCES Users,
	comment_str TEXT
);

CREATE TABLE Images (
	id INTEGER PRIMARY KEY,
	recipe_id INTEGER REFERENCES Recipes,
	image BLOB
);

CREATE INDEX idx_recipes_user_id ON Recipes (user_id);
CREATE INDEX idx_users_user_id ON Users (id);
CREATE INDEX idx_comments_recipe_id ON Comments (recipe_id);
CREATE INDEX idx_ingredients_recipe_id ON Ingredients (recipe_id);
CREATE INDEX idx_images_recipe_id ON Images (recipe_id);
CREATE INDEX idx_recipe_classes_recipe_id ON Recipe_classes (recipe_id);
