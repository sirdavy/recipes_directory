require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

DatabaseConnection.connect('recipes_directory')

recipe_repository = RecipeRepository.new

recipe_list = recipe_repository.all 

recipe_list.each do |recipe|
  puts "#{recipe.id}".ljust(3) + "- #{recipe.name}".ljust(20) + "- #{recipe.average_cooking_time}".ljust(8) + "- #{recipe.rating}".ljust(5)
end