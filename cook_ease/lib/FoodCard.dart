import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


// example call
// FoodCard(
//     id: 716429
//     title: "Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs",
//     imageUrl: "https://spoonacular.com/recipeImages/716429-312x231.jpg",
// ),

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  final int id;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    const double cardPadding = 20;

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3))
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(80),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: 200,
                height: 180,
              ),
            )),
        const SizedBox(width: cardPadding),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold, fontSize: 32)),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () async {

                    final response = await http
                        .get(Uri.parse('https://api.spoonacular.com/recipes/$id/information'));
                    var json;
                    Uri link;

                    if (response.statusCode == 200) {
                      // If the server did return a 200 OK response,
                      // then parse the JSON.
                      json = jsonDecode(response.body);
                      link = Uri.parse(json['sourceUrl']);
                      launchUrl(link);

                    } else {
                      // If the server did not return a 200 OK response,
                      // then throw an exception.
                      throw Exception('Failed to load recipe link from api');
                    }

                  },

                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange[50],
                    textStyle: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    foregroundColor: Colors.orange,
                  ),
                  child: const Text("Recipe Details"))
            ]),
    ]),
    );
  }

  factory FoodCard.fromJson(Map<String, dynamic> json) {
    return FoodCard(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image'],
    );
  }
}

