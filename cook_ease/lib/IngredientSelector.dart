import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:cook_ease/IngredientsList.dart';

class IngredientSelector extends StatefulWidget {
  const IngredientSelector({super.key});
  @override
  State<IngredientSelector> createState() => Ingredients();
}

class Ingredients extends State<IngredientSelector> {
  Ingredient current = ingredients.first;
  final _items = ingredients.map((ingredient) => MultiSelectItem<Ingredient>(ingredient,ingredient.name))
      .toList();
  List<Ingredient?> ingredients3 = [];
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
              Text('Ingredients:',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              MultiSelectBottomSheetField<Ingredient?>(
                backgroundColor: Colors.white,
                selectedColor: Colors.orange,
                key: _multiSelectKey,
                initialChildSize: 0.7,
                maxChildSize: 0.95,
                title: Text("Ingredients",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    )
                  ),
                ),
                buttonText: Text("Ingredients I Have",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    )
                  ),
                ),
                itemsTextStyle: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    )
                ),
                selectedItemsTextStyle: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    )
                ),
                items: _items,
                searchable: true,
                isDismissible: false,
                onConfirm: (values) {
                  setState(() {
                    ingredients3 = values;
                  });
                  _multiSelectKey.currentState?.validate();
                },
                chipDisplay: MultiSelectChipDisplay(
                  chipColor: Colors.orange.shade300,
                  textStyle: GoogleFonts.inter(color: Colors.black),
                  onTap: (item) {
                    setState(() {
                      ingredients3.remove(item);
                    });
                    _multiSelectKey.currentState?.validate();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}