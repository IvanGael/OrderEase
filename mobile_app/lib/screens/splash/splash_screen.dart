import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:orderease/constants/colors.dart';
import 'package:orderease/constants/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void checkUserFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    Future.delayed(const Duration(seconds: 6), () {
      if (isFirstTime) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/onboarding", (route) => false);
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/login", (route) => false);
        });
        // FirebaseAuth auth = FirebaseAuth.instance;
        // if (auth.currentUser != null) {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     Navigator.pushNamedAndRemoveUntil(
        //         context, "/root", (route) => false);
        //   });
        // } else {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     Navigator.pushNamedAndRemoveUntil(
        //         context, "/login", (route) => false);
        //   });
        // }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkUserFirstTime();
  }

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color5,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Card(
                elevation: 12,
                child: Image.asset(AppImages.logoApp, fit: BoxFit.cover,),
              ),
            ),
          ),
          Center(
            child: SpinKitThreeInOut(
              size: 50,
              itemBuilder: (_, int index){
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.color1
                  )
                );
              },
            ),
          ),
          Center(
            child: Text("Démarrage...", style: TextStyle(fontSize: 14, color: AppColors.color2),),
          )
        ],
      ),
    );
  }
}