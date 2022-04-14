json.extract! recipe, :id, :name, :preparationTime, :cookingTime, :description, :public, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
