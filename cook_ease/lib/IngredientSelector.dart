import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  List<Ingredient?> ingredients2 = [];
  List<Ingredient?> ingredients3 = [];
  List<Ingredient?> ingredients4 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    ingredients4 = ingredients;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingredients'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              MultiSelectBottomSheetField<Ingredient?>(
                key: _multiSelectKey,
                initialChildSize: 0.7,
                maxChildSize: 0.95,
                title: const Text("Ingredients"),
                buttonText: const Text("Ingredients used"),
                items: _items,
                searchable: true,
                onConfirm: (values) {
                  setState(() {
                    ingredients3 = values;
                  });
                  _multiSelectKey.currentState?.validate();
                },
                chipDisplay: MultiSelectChipDisplay(
                  onTap: (item) {
                    setState(() {
                      ingredients3.remove(item);
                    });
                    _multiSelectKey.currentState?.validate();
                  },
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}