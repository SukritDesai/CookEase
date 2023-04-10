import 'package:cook_ease/Responses.dart';
import 'package:cook_ease/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiselect/multiselect.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class IntoleranceSelector extends StatefulWidget {
  const IntoleranceSelector({Key? key}) : super(key: key);
  @override
  State<IntoleranceSelector> createState() => _IntoleranceSelector();
}

class _IntoleranceSelector extends State<IntoleranceSelector> {
  List<String> intos = [
    "Dairy",
    "Egg",
    "Grain",
    "Peanut",
    "Seafood",
    "Sesame",
    "Gluten",
    "Shellfish",
    "Soy",
    "Sulfite",
    "Tree Nut",
    "Wheat"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: SingleChildScrollView(
          child: Column(children: [
            DropDownMultiSelect(
              hintStyle: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              selected_values_style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              options: intos,
              selectedValues: Responses.selectedIntos,
              onChanged: (value) {
                Text(
                  'Selected Intolerances $value',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                );
                setState(() {
                  Responses.selectedIntos = value;
                });
                Text(
                  "You have selected $Responses.selectedIntos as the intolerances.",
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                );
              },
              whenEmpty: "Select your dietary restrictions",
            )
          ]),
        ));
  }
}

class Cuisine {
  final int id;
  final String name;
  Cuisine({
    required this.id,
    required this.name,
  });
}

List<Cuisine> cuisine = <Cuisine>[
  Cuisine(id: 0, name: "Chinese"),
  Cuisine(id: 1, name: "Eastern European"),
  Cuisine(id: 2, name: "Greek"),
  Cuisine(id: 3, name: "Indian"),
  Cuisine(id: 4, name: "Italian"),
  Cuisine(id: 5, name: "Latin American"),
  Cuisine(id: 6, name: "Mexican"),
  Cuisine(id: 7, name: "Middle Eastern"),
  Cuisine(id: 8, name: "Spanish"),
  Cuisine(id: 9, name: "Thai"),
  Cuisine(id: 10, name: "Vietnamese")
];

class CuisineSelectors extends StatefulWidget {
  const CuisineSelectors({super.key});
  @override
  State<CuisineSelectors> createState() => Cuisines();
}

class Cuisines extends State<CuisineSelectors> {
  final _items = cuisine
      .map((_cuisine) => MultiSelectItem<Cuisine>(_cuisine, _cuisine.name))
      .toList();
  final _multiSelectKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              MultiSelectDialogField<Cuisine?>(
                backgroundColor: Colors.white,
                selectedColor: Colors.orange,
                key: _multiSelectKey,
                title: Text(
                  "Cuisines",
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ),
                buttonText: Text(
                  "Cuisines I Want",
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ),
                items: _items,
                searchable: false,
                isDismissible: false,
                onConfirm: (values) {
                  setState(() {
                    Responses.cuisines2 = values;
                  });
                  _multiSelectKey.currentState?.validate();
                },
                chipDisplay: MultiSelectChipDisplay.none(),
              ),
            ],
          ),
        ),
      ),
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
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: Responses.diet,
      icon: const Icon(Icons.arrow_downward),
      elevation: 20,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 5,
        color: Colors.orange,
      ),
      onChanged: (String? value) {
        setState(() {
          Responses.diet = value!;
        });
      },
      items: diets.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
            ));
      }).toList(),
    );
  }
}
