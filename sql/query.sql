--- Non-recursive recipe reference query.
SELECT
       i.name as name,
      'nonrecursive' as type
FROM RecipeReferences edges
    JOIN Ingredients i ON (edges.dst_recipe = i.origin_recipe_id)
WHERE edges.src_recipe = 2;

--- Recursively selects all ingredients for recipes referenced (both directly and indirectly)
--- by an ingredient in the origin recipe.
WITH RECURSIVE paths (src, dest, path) AS (
        SELECT e.src_recipe, e.dst_recipe, ARRAY[e.src_recipe, e.dst_recipe]
        FROM RecipeReferences e
        WHERE e.src_recipe = 2 /* Sams Chicken Bowl */
    UNION
        SELECT p.src, e.dst_recipe, p.path || ARRAY[e.dst_recipe]
        FROM paths p
        JOIN RecipeReferences e
        ON p.dest = e.src_recipe AND e.dst_recipe != ALL(p.path)
)
SELECT
    i.name as name,
    'recursive' as type
FROM paths p
    JOIN Ingredients i ON (p.dest = i.origin_recipe_id);
