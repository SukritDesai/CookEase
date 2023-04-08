import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(stuff());
}

class stuff extends StatelessWidget{
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
        home: MyHomePage(),
        debugShowCheckedModeBanner: false
      )
    );
  }
}
class MyAppState extends ChangeNotifier {

}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
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
              ),
            ),

          ],
        ),
      ),

    );
  }
}