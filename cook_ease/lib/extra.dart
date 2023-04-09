import 'package:cook_ease/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiselect/multiselect.dart';

class IntoleranceSelector extends StatefulWidget {
  const IntoleranceSelector({Key? key}) : super(key: key);
  @override
  State<IntoleranceSelector> createState() => _IntoleranceSelector();
}

class _IntoleranceSelector extends State<IntoleranceSelector> {
  List<String> intos = ["Dairy", "Egg", "Grain", "Peanut", "Seafood", "Sesame", "Gluten", "Shellfish", "Soy", "Sulfite", "Tree Nut", "Wheat"];
  List<String> selectedIntos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropDownMultiSelect(
              hintStyle: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  )
              ),
              selected_values_style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  )
              ),
              options: intos,
              selectedValues: selectedIntos,
              onChanged: (value) {
                Text('Selected Intolerances $value',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      )
                  ),
                );
                setState(() {
                  selectedIntos = value;
                });
                Text("You have selected $selectedIntos as the intolerances.",
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      )
                  ),
                );
              },
              whenEmpty: "Select your dietary restrictions",

            )
          ]
        ),
      )
    );
  }
}
const List<String> cuisine = <String>[
  "Chinese",
  "Eastern European",
  "Greek",
  "Indian",
  "Italian",
  "Latin American",
  "Mexican",
  "Middle Eastern",
  "Spanish",
  "Thai",
  "Vietnamese"
];

class CuisineSelectors extends StatefulWidget {
  const CuisineSelectors({super.key});
  @override
  Cuisine createState() => Cuisine();
}

class Cuisine extends State<CuisineSelectors> {
  String current = cuisine.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: current,
      icon: const Icon(Icons.arrow_downward),
      elevation: 20,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 5,
        color: Colors.orange,
      ),
      onChanged: (String? value) {
        setState(() {
          current = value!;
        });
      },
      items: cuisine.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500
              )
            ),
          )
        );
      }).toList(),
    );
  }
}

class InputSelectors extends StatefulWidget {
  const InputSelectors({super.key});
  @override
  State<InputSelectors> createState() => Diets();
}

const List<String> diets = <String>[
  "I Eat Everything!",
  "Vegetarian",
  "Gluten Free",
  "Ketogenic",
  "Lacto-Vegetarian",
  "Ovo-Vegetarian",
  "Vegan",
  "Pescetarian",
  "Paleo",
  "Primal",
  "Low FODMAP",
  "Whole30"
];

class Diets extends State<InputSelectors> {
  String current = diets.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: current,
      icon: const Icon(Icons.arrow_downward),
      elevation: 20,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 5,
        color: Colors.orange,
      ),
      onChanged: (String? value) {
        setState(() {
          current = value!;
        });
      },
      items: diets.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String> (
            value: value,
            child: Text(value,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  )
              ),
            )
        );
      }).toList(),
    );
  }
}