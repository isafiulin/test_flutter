import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_shop_app/config/style/global_app_colors_style.dart';
import 'package:test_shop_app/presentation/features/main/main_tab_screen.dart';

import 'presentation/features/auth/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Shop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primary,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: AppColors.primary,
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
          )),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const AuthPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/main': (context) => const MainTabScreen(),
      },
    );
  }
}
