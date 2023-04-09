import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// example call
// FoodCard(
//     title: "Apple Or Peach Strudel",
//     imageUrl: "https://spoonacular.com/recipeImages/73420-312x231.jpg",
// ),

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

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
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3))
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
        SizedBox(width: cardPadding),
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
                  onPressed: () {},
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
}
