class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    
    validates :name, presence: true
    
    accepts_nested_attributes_for :ingredients
    
    def ingredient_attributes(ingredient_ids)
        ingredient_ids.values.each do |ii|
            ingredient = Ingredient.find_or_create_by(ii)
            self.ingredients << ingredient
        end
    end
end
