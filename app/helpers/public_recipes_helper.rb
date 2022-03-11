module PublicRecipesHelper
  def recipe_avatar(_recipe)
    # if recipe.image.present?
    #   image_tag(recipe.image, alt: 'recipe', class: 'thumbnail')
    # else
    image_tag('http://www.licensingmattersglobal.com/wp-content/uploads/2019/03/News-Tasty.jpg',
              alt: 'recipe', class: 'recipe-img thumbnail')
    # end
  end
end
