CREATE TABLE Recipes (
    id int,
    name text,
    primary key (id)
);

CREATE TABLE Ingredients (
    id int,
    name text,
    origin_recipe_id int references Recipes (id),
    primary key (id)
);

CREATE TABLE RecipeReferences (
    src_recipe int references Recipes (id),
    dst_recipe int references Recipes (id),
    ingredient int references Ingredients (id)
);


INSERT INTO Recipes (id, name) VALUES (0, 'Teriyaki Sauce');
INSERT INTO Ingredients (origin_recipe_id, id, name) VALUES (0, 3, 'Soy Sauce');
INSERT INTO Ingredients (origin_recipe_id, id, name) VALUES (0, 4, 'Sugar');
INSERT INTO Ingredients (origin_recipe_id, id, name) VALUES (0, 5, 'Mirin');

INSERT INTO Recipes (id, name) VALUES (1, 'Chicken Teriyaki');
INSERT INTO Ingredients (origin_recipe_id, id, name) VALUES (1, 1, 'Chicken');
INSERT INTO Ingredients (origin_recipe_id, id, name) VALUES (1, 2, 'Teriyaki Sauce');
INSERT INTO RecipeReferences (src_recipe, dst_recipe, ingredient) VALUES (1, 0, 2);

INSERT INTO Recipes(id, name) VALUES (2, 'Sams Chicken Bowl');
INSERT INTO Ingredients (origin_recipe_id, id, name) VALUES (2, 6, 'Chicken Teriyaki');
INSERT INTO Ingredients (origin_recipe_id, id, name) VALUES (2, 7, 'White Rice');
INSERT INTO RecipeReferences (src_recipe, dst_recipe, ingredient) VALUES (2, 1, 6);
