// import 'dart:convert';
//
// import 'package:cook_ease/Responses.dart';
// import 'package:cook_ease/food_card.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// Future<Recipe> fetchRecipe(int index) async {
//   var response = await http.get(Uri.parse(Responses.apiCall()));
//   if (response.statusCode == 200) {
//     return Recipe.fromJson(jsonDecode(response.body), index);
//   } else {
//     throw Exception('Failed to load recipe!');
//   }
// }
//
// Future<int> getNumber(Future<Recipe> r) async {
//   return await r.then((value) => value.totalResults);
// }
//
// class Recipe {
//   final int id;
//   final String title;
//   final String imageUrl;
//   final int totalResults;
//
//   const Recipe({
//     required this.id,
//     required this.title,
//     required this.imageUrl,
//     required this.totalResults,
//   });
//
//   factory Recipe.fromJson(Map<String, dynamic> json, int index) {
//     return Recipe(
//         id: json['results'][index]['id'],
//         title: json['results'][index]['title'],
//         imageUrl: json['results'][index]['image'],
//         totalResults: json['totalResults']);
//   }
// }
//
// class MyRecipe extends StatefulWidget {
//   const MyRecipe({super.key});
//
//   @override
//   State<MyRecipe> createState() => _MyRecipeState();
// }
//
// class _MyRecipeState extends State<MyRecipe> {
//   late List<Future<Recipe>> recipes = [];
//
//   @override
//   void initState() {
//     super.initState();
//     getRecipes();
//   }
//
//   void getRecipes() {
//     int max = getNumber(fetchRecipe(0)) as int;
//     for (int i = 0; i < max; i++) {
//       recipes.add(fetchRecipe(i));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (recipes.isNotEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Recipes'),
//         ),
//         body: ListView.builder(
//             itemCount: recipes.length,
//             itemBuilder: (BuildContext context, int index) {
//               return FutureBuilder<Recipe>(
//                 future: recipes[index],
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return FoodCard(
//                         id: snapshot.data!.id,
//                         title: snapshot.data!.title,
//                         imageUrl: snapshot.data!.imageUrl);
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }
//                   // By default, show a loading spinner.
//                   return const CircularProgressIndicator();
//                 },
//               );
//             }),
//       );
//     } else {
//       return const Scaffold(
//         body: Center(
//           child: Text('Sorry no recipes found with those constraints!'),
//         ),
//       );
//     }
//   }
// }

import 'dart:convert';

import 'package:cook_ease/Responses.dart';
import 'package:cook_ease/food_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Recipe> fetchRecipe(int index) async {
  var response = await http.get(Uri.parse(Responses.apiCall()));
  if (response.statusCode == 200) {
    return Recipe.fromJson(jsonDecode(response.body), index);
  } else {
    throw Exception('Failed to load recipe!');
  }
}

Future<int> getNumber(Future<Recipe> r) async {
  return await r.then((value) => value.totalResults);
}

class Recipe {
  final int id;
  final String title;
  final String imageUrl;
  final int totalResults;

  const Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.totalResults,
  });

  factory Recipe.fromJson(Map<String, dynamic> json, int index) {
    return Recipe(
        id: json['results'][index]['id'],
        title: json['results'][index]['title'],
        imageUrl: json['results'][index]['image'],
        totalResults: json['totalResults']);
  }
}

class MyRecipe extends StatefulWidget {
  const MyRecipe({Key? key}) : super(key: key);

  @override
  State<MyRecipe> createState() => _MyRecipeState();
}

class _MyRecipeState extends State<MyRecipe> {
  late List<Future<Recipe>> recipes = [];

  @override
  void initState() {
    super.initState();
    getRecipes().then((value) => setState(() {
          recipes = value;
        }));
  }

  Future<List<Future<Recipe>>> getRecipes() async {
    List<Future<Recipe>> recipes_ = [];
    int max = 10;
    int newMax = await getNumber(fetchRecipe(0));
    if (newMax < max) {
      max = newMax;
    }

    for (int i = 0; i < max; i++) {
      recipes_.add(fetchRecipe(i));
    }
    return recipes_;
  }

  @override
  Widget build(BuildContext context) {
    if (recipes.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Recipes'),
        ),
        body: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (BuildContext context, int index) {
              return FutureBuilder<Recipe>(
                future: recipes[index],
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FoodCard(
                        id: snapshot.data!.id,
                        title: snapshot.data!.title,
                        imageUrl: snapshot.data!.imageUrl);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              );
            }),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Recipes'),
        ),
        body: const Center(
          child: Text('Sorry no recipes found with those constraints!'),
        ),
      );
    }
  }
}
