# Read data from csv files
locations_path = Rails.root.join("lib", "seed_data", "locations.csv")
staff_members_path = Rails.root.join("lib", "seed_data", "staff.csv")
ingredients_path = Rails.root.join("lib", "seed_data", "ingredients.csv")
recipes_path = Rails.root.join("lib", "seed_data", "recipes.csv")
modifiers_path = Rails.root.join("lib", "seed_data", "modifiers.csv")
menu_items_path = Rails.root.join("lib", "seed_data", "menus.csv")

location_id = Constants::LOCATION_ID

CSV.foreach(locations_path, headers: true) do |row|
  next if row["location_id"].to_i != location_id

  Location.find_or_create_by!(id: location_id, name: row["name"], address: row["address"])
end

CSV.foreach(staff_members_path, headers: true) do |row|
  next if row["location_id"].to_i != location_id

  StaffMember.find_or_create_by!(id: row["staff_id"], name: row["name"], location_id: location_id, date_of_birth: Date.parse(row["dob"]), role: row["role"], iban: row["iban"], bic: row["bic"])
end

CSV.foreach(ingredients_path, headers: true) do |row|
  ingredient = Ingredient.find_or_create_by!(id: row["ingredient_id"], name: row["name"], unit: row["unit"], cost: row["cost"])
  if InventoryItem.where(ingredient: ingredient).empty?
    InventoryItem.create!(ingredient: ingredient, audit_comment: "Imported from spreadsheet")
  end
end

CSV.foreach(recipes_path, headers: true) do |row|
  recipe = Recipe.find_or_create_by!(id: row["recipe_id"], name: row["name"])
  RecipeIngredient.find_or_create_by!(recipe_id: recipe.id, ingredient_id: row["ingredient_id"], quantity: row["quantity"])
end

CSV.foreach(modifiers_path, headers: true) do |row|
  modifier = Modifier.find_or_create_by!(id: row["modifier_id"], name: row["name"])
  ModifierOption.find_or_create_by!(modifier: modifier, name: row["option"], price: row["price"])
end

CSV.foreach(menu_items_path, headers: true) do |row|
  next if row["location_id"].to_i != location_id

  MenuItem.find_or_create_by!(location_id: location_id, modifier_id: row["modifier_id"], recipe_id: row["recipe_id"], price: row["price"])
end
