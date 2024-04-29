import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.blueGrey,body: Column(children: [
      
    ],),);
  }
}