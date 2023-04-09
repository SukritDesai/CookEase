import 'package:cook_ease/IngredientsList.dart';
import 'extra.dart';
class Responses{
  static List<Ingredient?> ingredients3 = [];
  static List<String> selectedIntos = [];
  static List<Cuisine?> cuisines2 = [];
  static String diet = diets.first;
  void printout(){
    print(ingredients3);
    print(selectedIntos);
    print(cuisines2);
    print(diet);
  }
}