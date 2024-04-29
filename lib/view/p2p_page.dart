import 'package:flutter/material.dart';

class P2pPage extends StatefulWidget {
  const P2pPage({super.key});

  @override
  State<P2pPage> createState() => _P2pPageState();
}

class _P2pPageState extends State<P2pPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.green,
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