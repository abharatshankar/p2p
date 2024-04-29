import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes/routes_names.dart';
import 'package:mvvm_app/utils/utils.dart';
import 'package:mvvm_app/viewModel/home_view_model.dart';
import 'package:mvvm_app/viewModel/user_view_model.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel hm = HomeViewModel();

  @override
  void initState() {
    hm.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final preferences = Provider.of<UserViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        // title: const Text("Home Screen"),
        // centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Image.asset('assets/2.png',height: 35,
                  width: 151,),
        actions: [
          Icon(Icons.person_rounded),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => hm,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            return Column(children: [
              
            ],);
          },
        ),
      ),
    );
  }
}
