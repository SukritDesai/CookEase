import requests
import json
import os

api_key = "1f9d617ba13041859ea773423b0e6291"

# stolen api key - 1f9d617ba13041859ea773423b0e6291

with open("inputs.txt") as f:
    inputs = f.read().splitlines()

id = "https://api.spoonacular.com/recipes/complexSearch?apiKey=" + api_key

ingredients, into, cuisine, diet = inputs

ingredients = "&includeIngredients=" + ingredients
into = "&intolerances=" + into
cuisine = "&cuisine=" + cuisine
diet = "&diet=" + diet

#response = requests.get(id).json()

#print(json.dumps(response, indent=4))
