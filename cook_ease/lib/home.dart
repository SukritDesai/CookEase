import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(top:35.0),
                    child: Text('Enter your diet',
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
                  const Scaffold(
                    body: Center(
                        child: InputSelectors(),
                    ),
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
  State<StatefulWidget> createState() => Diets();

}

class Diets extends State<InputSelectors> {
  static const List<String> diets = <String>[
    "I'll Eat Anything",
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

  String current = diets.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: current,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
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
          child: Text(value)
        );
      }).toList(),
    );
  }
}

// TextFormField(
// // The validator receives the text that the user has entered.
//  validator: (value) {
//    if (value == null || value.isEmpty) {
//      return 'Enter your dietary restrictions here:';
//    }
//    return null;
//  },
// ),