import 'package:cook_ease/IngredientSelector.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'extra.dart';

void main() {
  runApp(const Stuff());
}

class Stuff extends StatelessWidget {
  const Stuff({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
          title: 'CookEase 🍲',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          ),
          home: const MyHomePage(),
          debugShowCheckedModeBanner: false),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/image_1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.7),
        appBar: AppBar(
            title: Text(
              'CookEase',
              style: GoogleFonts.pacifico(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
            ),
            centerTitle: true,
            toolbarHeight: 150,
            backgroundColor: Colors.orange),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Let us help you find a recipe',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, top: 32.0, bottom: 35.0),
                    child: Text(
                      'Enter your Diet:',
                      style: GoogleFonts.notoSansGeorgian(
                        textStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const InputSelectors(),
                ],
              ),
              const SizedBox(
                height: 130,
                width: 600,
                child: IngredientSelector(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, top: 22.0, bottom: 35.0),
                    child: Text(
                      'Enter Preferred Cuisines:',
                      style: GoogleFonts.notoSansGeorgian(
                        textStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                          height: 60, width: 220, child: CuisineSelectors()),
                    ),
                  )
                ],
              ),
              const SizedBox(
                  height: 70, width: 600, child: IntoleranceSelector()),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black87),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.orange.withOpacity(0.04);
                        }
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return Colors.black87.withOpacity(1);
                        }
                        return null; // Defer to the widget's default.
                      },
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orange.shade400),
                  ),
                  onPressed: () {
                    //Responses().writeToFile();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Submit my Choices',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
