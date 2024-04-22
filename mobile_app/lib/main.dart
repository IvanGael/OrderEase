import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:orderease/constants/attributes.dart';
import 'package:orderease/providers/login_state_provider.dart';
import 'package:orderease/screens/auth/login_screen.dart';
import 'package:orderease/screens/onboarding/on_boarding_screen.dart';
import 'package:orderease/screens/splash/splash_screen.dart';
import 'package:orderease/theme/theme_manager.dart';
import 'package:orderease/widgets/root_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginStateProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppAttributes.appName,
      theme: ThemeManager().lightTheme,
      locale: const Locale('fr'),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/login": (context) => const LoginScreen(),
        "/onboarding": (context) => const OnBoardingScreen(),
        "/root": (context) => const RootScreen()
      },
      builder: EasyLoading.init(),
      home: const SplashScreen(),
    );
  }
}
