module model

pub struct Cocktail {
pub:
	id_drink                       string [json: idDrink]
	str_drink                      string [json: strDrink]
	str_drink_alternate            string [json: strDrinkAlternate]
	str_tags                       string [json: strTags]
	str_video                      string [json: strVideo]
	str_category                   string [json: strCategory]
	str_iba                        string [json: strIBA]
	str_alcoholic                  string [json: strAlcoholic]
	str_glass                      string [json: strGlass]
	str_instructions               string [json: strInstructions]
	str_instructionses             string [json: strInstructionsES]
	str_instructionsde             string [json: strInstructionsDE]
	str_instructionsfr             string [json: strInstructionsFR]
	str_instructionsit             string [json: strInstructionsIT]
	str_drinkthumb                 string [json: strDrinkThumb]
	str_ingredient1                string [json: strIngredient1]
	str_ingredient2                string [json: strIngredient2]
	str_ingredient3                string [json: strIngredient3]
	str_ingredient4                string [json: strIngredient4]
	str_ingredient5                string [json: strIngredient5]
	str_ingredient6                string [json: strIngredient6]
	str_ingredient7                string [json: strIngredient7]
	str_ingredient8                string [json: strIngredient8]
	str_ingredient9                string [json: strIngredient9]
	str_ingredient10               string [json: strIngredient10]
	str_ingredient11               string [json: strIngredient11]
	str_ingredient12               string [json: strIngredient12]
	str_ingredient13               string [json: strIngredient13]
	str_ingredient14               string [json: strIngredient14]
	str_ingredient15               string [json: strIngredient15]
	str_measure1                   string [json: strMeasure1]
	str_measure2                   string [json: strMeasure2]
	str_measure3                   string [json: strMeasure3]
	str_measure4                   string [json: strMeasure4]
	str_measure5                   string [json: strMeasure5]
	str_measure6                   string [json: strMeasure6]
	str_measure7                   string [json: strMeasure7]
	str_measure8                   string [json: strMeasure8]
	str_measure9                   string [json: strMeasure9]
	str_measure10                  string [json: strMeasure10]
	str_measure11                  string [json: strMeasure11]
	str_measure12                  string [json: strMeasure12]
	str_measure13                  string [json: strMeasure13]
	str_measure14                  string [json: strMeasure14]
	str_measure15                  string [json: strMeasure15]
	str_imagesource                string [json: strImageSource]
	str_image_attribution          string [json: strImageAttribution]
	str_creative_commons_confirmed string [json: strCreativeCommonsConfirmed]
	date_modified                  string [json: dateModified]
}

pub struct Ingredient {
pub:
	id_ingredient   string [json: idIngredient]
	str_ingredient  string [json: strIngredient]
	str_description string [json: strDescription]
	str_type        string [json: strType]
	str_alcohol     string [json: strAlcohol]
	str_abv         string [json: strABV]
}

pub struct Filter {
pub:
	str_drink       string [json: strDrink]
	str_drink_thumb string [json: strDrinkThumb]
	id_drink        string [json: idDrink]
}
