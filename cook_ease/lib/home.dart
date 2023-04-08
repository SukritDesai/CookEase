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
      )
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
                        fontSize: 90,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              centerTitle: true,
              toolbarHeight: 200,
              backgroundColor: Colors.orange
          ),
          body: Center(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Text('Let us help you find a recipe',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      textAlign: TextAlign.center, // |\| | |\| _| /\ --- /\/ | /\/ _/ /\
                    )
                ),

              ],
            ),
          )
      )
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