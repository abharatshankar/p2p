import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../res/widgets/coloors.dart';
import '../viewModel/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashService.checkAuthentication(context);
   
  }


  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: Center(child: PlaygroundView()));
    return Scaffold(
      backgroundColor: AppColors.themeNavBlueColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/fynzon_logo.png',
                  height: 279,
                  width: 170,
                )
                    .animate()
                    .fadeIn(duration: Duration(milliseconds: 500))
                    // .scale()
                    ,
                Image.asset(
                  'assets/logo_with_title.png',
                  height: 46,
                  width: 191,
                )
                    .animate()
                    .effect()// baseline=800ms
                    .slideY()
              ],
            ),
          )
        ],
      )),
    );
  }
}

class PlaygroundView extends StatelessWidget {
  const PlaygroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        child: const Text("Playground 🛝")
            .animate()
            .slideY(duration: 900.ms, curve: Curves.easeOutCubic)
            .fadeIn(),
      ),
    );
  }
}
