import 'dart:io';

import 'IngredientsList.dart';
import 'extra.dart';

// void main() {
//   Responses r = Responses();
//   r.writeToFile();
// }
main() {
  Responses r = Responses();
  r.writeToFile();
}

class Responses {
  static List<Ingredient?> ingredients3 = [];
  static List<String> selectedIntos = [];
  static List<Cuisine?> cuisines2 = [];
  static String diet = diets.first;
  void writeToFile() {
    final file = File("lib/backend/inputs.txt");
    String result = "";
    for (int i = 0; i < ingredients3.length; i++) {
      if (i == ingredients3.length - 1) {
        result += "${ingredients3[i]?.getName()}";
      } else {
        result += "${ingredients3[i]?.getName()},";
      }
    }
    //file.writeAsString(result);

    // var file = File("/backend/inputs.txt");
    // var sink = file.openWrite();
    // sink.write("$ingredients3\n$selectedIntos\n$cuisines2\n$diet");
    // sink.close();
  }
}
