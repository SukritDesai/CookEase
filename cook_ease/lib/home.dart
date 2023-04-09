import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cook_ease/IngredientSelector.dart';
import 'extra.dart';

void main(){
  runApp(const Stuff());
}

class Stuff extends StatelessWidget{
  const Stuff({super.key});
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'CookEase 🍲',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false
      ),
    );
  }
}


class MyAppState extends ChangeNotifier {

}

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
            backgroundColor: Colors.white.withOpacity(0.5),
            appBar: AppBar(
                title: Text('CookEase',
                  style: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 60,
                          fontWeight: FontWeight.bold
                      ),
                  ),
                ),
                centerTitle: true,
                toolbarHeight: 150,
                backgroundColor: Colors.orange
            ),
            body: Center(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text('Let us help you find a recipe',
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
                  optionList,
                  optionList1,
                ],
              ),
            ),
        ),
    );
  }
}

final optionList = DefaultTextStyle.merge(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 20.0, top: 32.0, bottom: 35.0),
        child: Text('Enter your Diet:',
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
      const CuisineSelectors(),
      const SizedBox(
          height: 46,
          width: 300,
          child: IntoleranceSelector()
      ),
    ],
  ),
);
final optionList1 = DefaultTextStyle.merge(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(
          height: 300,
          width: 300,
          child: IngredientSelector()
      ),
    ],
  ),
);