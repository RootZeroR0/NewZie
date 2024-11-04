import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/HomePageController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePageController()));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Newzie',
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontStyle: FontStyle.italic),
          )
        ],
      ),
    ));
  }
}
