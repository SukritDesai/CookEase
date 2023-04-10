import 'package:cook_ease/IngredientsList.dart';
import 'package:cook_ease/extra.dart';

class Responses {
  static List<Ingredient?> ingredients3 = [];
  static List<String> selectedIntos = [];
  static List<Cuisine?> cuisines2 = [];
  static String diet = diets.first;
  // static String apiKey = "1f9d617ba13041859ea773423b0e6291";
  static String apiKey = "883fc7dc6bab43f8b6328a652b48be7a"; // Ethan's key
  static String url =
      "https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey";
  static String apiCall() {
    String ingredients = "&includeIngredients=";
    for (var i = 0; i < ingredients3.length; i++) {
      if (i == ingredients3.length - 1) {
        ingredients += ingredients3[i]!.name;
      } else {
        ingredients += "${ingredients3[i]!.name} ,";
      }
    }
    String intolerance = "&intolerances=";
    for (var i = 0; i < selectedIntos.length; i++) {
      if (i == selectedIntos.length - 1) {
        intolerance += selectedIntos[i];
      } else {
        intolerance += "${selectedIntos[i]} ,";
      }
    }
    String cuisine = "&cuisine=";
    for (var i = 0; i < cuisines2.length; i++) {
      if (i == cuisines2.length - 1) {
        cuisine += cuisines2[i]!.name;
      } else {
        cuisine += "${cuisines2[i]!.name},";
      }
    }
    if (diet == "I Eat Everything!") diet = '';
    return "$url$ingredients$intolerance$cuisine&diet=$diet";
  }
}
