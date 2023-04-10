import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:cook_ease/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cook_ease/Responses.dart';

Future<Recipe> fetchRecipe() async {
  var response = await http.get(Uri.parse(Responses.apiCall()));
  if (response.statusCode == 200) {
    Recipe r = Recipe.fromJson(jsonDecode(response.body));
    print(response.body);
    print(r.id);
    return Recipe.fromJson(jsonDecode(response.body));
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

  factory Recipe.fromJson(Map<String, dynamic> json) {
    print(json['id']);
    print(json['title']);
    return Recipe(
      id: json['results']["id"],
      title: json['results']["title"],
      imageUrl: json['results']["imageUrl"]
    );
  }
}
void main(){
    runApp(const MyApp());
    print(fetchRecipe());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyRecipeState();

}

class _MyRecipeState extends State<MyApp> {
  late Future<Recipe> futureRecipe;

  @override
  void initState() {
    super.initState();
    futureRecipe = fetchRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Recipe>(
            future: futureRecipe,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}