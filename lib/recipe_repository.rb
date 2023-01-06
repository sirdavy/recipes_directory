require_relative "./recipe"

class RecipeRepository

  def all
    all_recipes = []
    sql = 'SELECT * FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |element|
      recipe = Recipe.new
      recipe.id = element["id"]
      recipe.name = element["name"]
      recipe.average_cooking_time = element["average_cooking_time"]
      recipe.rating = element["rating"]
      all_recipes << recipe
    end
    return all_recipes
  end


  def find(id)
    sql = 'SELECT * FROM recipes WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    recipe = Recipe.new
    recipe.id = record['id']
    recipe.name = record['name']
    recipe.average_cooking_time = record['average_cooking_time']
    recipe.rating = record['rating']
    return recipe
  end

end
