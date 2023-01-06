require 'recipe_repository'
require 'recipe'

describe RecipeRepository do
  def reset_recipes_table
    seed_sql = File.read("spec/seed_recipes.sql")
    connection =
      PG.connect({ host: "127.0.0.1", dbname: "recipes_directory_test" })
    connection.exec(seed_sql)
  end

  before(:each) { reset_recipes_table }

  it "returns all recipes" do
    repo = RecipeRepository.new
    recipes = repo.all
    expect(recipes.length).to eq 2
    expect(recipes[0].name).to eq "Pizza"
    expect(recipes[0].average_cooking_time).to eq "90"
    expect(recipes[0].rating).to eq "5"
    expect(recipes[1].name).to eq "Lasagna"
    expect(recipes[1].average_cooking_time).to eq "120"
    expect(recipes[1].rating).to eq "4"
  end

  it "returns single recipe pizza" do
    repo = RecipeRepository.new
    recipe = repo.find(1)
    expect(recipe.name).to eq "Pizza"
    expect(recipe.average_cooking_time).to eq "90"
    expect(recipe.rating).to eq "5"
  end

  it "returns single recipe - lasagna" do
    repo = RecipeRepository.new
    recipe = repo.find(2)
    expect(recipe.name).to eq "Lasagna"
    expect(recipe.average_cooking_time).to eq "120"
    expect(recipe.rating).to eq "4"
  end

end
