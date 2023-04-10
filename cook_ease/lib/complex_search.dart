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

class Recipe {
  final int id;
  final String title;
  final String imageUrl;

  const Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json, int index) {
    return Recipe(
        id: json['results'][index]['id'],
        title: json['results'][index]['title'],
        imageUrl: json['results'][index]['image']);
  }
}

class MyRecipe extends StatefulWidget {
  const MyRecipe({super.key});

  @override
  State<MyRecipe> createState() => _MyRecipeState();
}

class _MyRecipeState extends State<MyRecipe> {
  late List<Future<Recipe>> recipes = [];
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  void getRecipes() {
    for (int i = 0; i < 5; i++) {
      recipes.add(fetchRecipe(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: ListView.builder(
          itemCount: 5,
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
  }
}
