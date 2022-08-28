/*
 * Copyright 2022 XXIV
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
module cocktaildb

import net.http
import net.urllib
import model {Cocktail, Ingredient, Filter}
import json

struct CocktailResponse {
    drinks []Cocktail
}

struct IngredientResponse {
    ingredients []Ingredient
}

struct FilterResponse {
    drinks []Filter
}

struct CategoriesFilter {
	drinks []struct {
		str_category string [json: strCategory]
	}
}

struct GlassesFilter {
	drinks []struct {
		str_glass string [json: strGlass]
	}
}

struct IngredientsFilter {
	drinks []struct {
		str_ingredient1 string [json: strIngredient1]
	}
}

struct AlcoholicFilter {
	drinks []struct {
		str_alcoholic string [json: strAlcoholic]
	}
}

fn get_request(endpoint string) ?string {
	response := http.get('https://thecocktaildb.com/api/json/v1/1/$endpoint') or { return err }
	return response.body
}

// search cocktail by name
pub fn search(s string) ?[]Cocktail {
	response := get_request('search.php?s=${urllib.query_escape(s)}') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(CocktailResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.drinks.len == 0 {
        return error('no results found')
	}

	return json.drinks
}

// search cocktails by first letter
pub fn search_by_letter(c string) ?[]Cocktail {
	response := get_request('search.php?f=$c') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(CocktailResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.drinks.len == 0 {
        return error('no results found')
	}

	return json.drinks
}

// search ingredient by name
pub fn search_ingredient(s string) ?Ingredient {
	response := get_request('search.php?i=${urllib.query_escape(s)}') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(IngredientResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.ingredients.len == 0 {
        return error('no results found')
	}

	return json.ingredients[0]
}

// search cocktail details by id
pub fn search_by_id(i i64) ?Cocktail {
	response := get_request('lookup.php?i=$i') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(CocktailResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.drinks.len == 0 {
        return error('no results found')
	}

	return json.drinks[0]
}

// search ingredient by ID
pub fn search_ingredient_by_id(i i64) ?Ingredient {
	response := get_request('lookup.php?iid=$i') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(IngredientResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.ingredients.len == 0 {
        return error('no results found')
	}

	return json.ingredients[0]
}

// random cocktail
pub fn random() ?Cocktail {
	response := get_request('random.php') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(CocktailResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.drinks.len == 0 {
        return error('no results found')
	}

	return json.drinks[0]
}

// filter by ingredient
pub fn filter_by_ingredient(s string) ?[]Filter {
	response := get_request('filter.php?i=${urllib.query_escape(s)}') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(FilterResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.drinks.len == 0 {
        return error('no results found')
	}

	return json.drinks
}

// filter by alcoholic
pub fn filter_by_alcoholic(s string) ?[]Filter {
	response := get_request('filter.php?a=${urllib.query_escape(s)}') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(FilterResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.drinks.len == 0 {
        return error('no results found')
	}

	return json.drinks
}

// filter by category
pub fn filter_by_category(s string) ?[]Filter {
	response := get_request('filter.php?c=${urllib.query_escape(s)}') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(FilterResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.drinks.len == 0 {
        return error('no results found')
	}

	return json.drinks
}

// filter by glass
pub fn filter_by_glass(s string) ?[]Filter {
	response := get_request('filter.php?g=${urllib.query_escape(s)}') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(FilterResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.drinks.len == 0 {
        return error('no results found')
	}

	return json.drinks
}

// List the categories filter
pub fn categories_filter() ?[]string {
	response := get_request('list.php?c=list') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(CategoriesFilter, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.drinks.len == 0 {
        return error('no results found')
	}
	mut array := []string{}
	for i in json.drinks {
		array << i.str_category
	}

	return array
}

// List the glasses filter
pub fn glasses_filter() ?[]string {
	response := get_request('list.php?g=list') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(GlassesFilter, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.drinks.len == 0 {
        return error('no results found')
	}
	mut array := []string{}
	for i in json.drinks {
		array << i.str_glass
	}

	return array
}

// List the ingredients filter
pub fn ingredients_filter() ?[]string {
	response := get_request('list.php?i=list') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(IngredientsFilter, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.drinks.len == 0 {
        return error('no results found')
	}
	mut array := []string{}
	for i in json.drinks {
		array << i.str_ingredient1
	}

	return array
}

// List the alcoholic filter
pub fn alcoholic_filter() ?[]string {
	response := get_request('list.php?a=list') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(AlcoholicFilter, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.drinks.len == 0 {
        return error('no results found')
	}
	mut array := []string{}
	for i in json.drinks {
		array << i.str_alcoholic
	}

	return array
}