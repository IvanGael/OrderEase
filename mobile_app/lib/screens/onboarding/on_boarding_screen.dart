import 'package:flutter/material.dart';

import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:orderease/constants/attributes.dart';
import 'package:orderease/constants/images.dart';
import 'package:orderease/screens/auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<Introduction> list = [
    Introduction(
      title: 'Bienvenue à bord !',
      subTitle: 'Découvrez ${AppAttributes.appName}',
      imageUrl: AppImages.o1,
      titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis),
    ),
    Introduction(
      title: 'Commandes simplifiées',
      subTitle: 'Gérer vos commandes avec aisance',
      imageUrl: AppImages.o2,
      titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis),
    ),
    Introduction(
      title: 'Paiements instantanés',
      subTitle: "Fini l'attente ! Passez au paiement à distance en quelques instants.",
      imageUrl: AppImages.o3,
      titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreenOnboarding(
        introductionList: list,
        onTapSkipButton: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isFirstTime', false);
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ), //MaterialPageRoute
          );
        },
      ),
    );
  }
}
