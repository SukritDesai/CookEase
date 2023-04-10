// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:cook_ease/Responses.dart';
//
// Future<http.Response> fetchRecipe() async {
//   final response = await http.get(Uri.parse(Responses.apiCall()));
//   if (response.statusCode == 200) {
//     return Recipe.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load recipe!');
//   }
// }
//
// // This function defines a recipe according to spoonacular