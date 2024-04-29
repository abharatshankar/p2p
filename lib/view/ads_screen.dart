import 'package:flutter/material.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
      
        // title: const Text("Home Screen"),
        // centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Image.asset('assets/logo_with_title.png',height: 46,
                  width: 191,),
        actions: [
          Icon(Icons.person_rounded),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
    body: Column(children: [
     
    ],),);
  }
}