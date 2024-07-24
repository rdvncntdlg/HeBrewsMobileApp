import 'package:flutter/material.dart';
import 'package:he_brew_app/provider/add_to_cart_provider.dart';
import 'package:he_brew_app/provider/favorite_provider.dart';
import 'package:he_brew_app/screens/login/login_screen.dart';
import 'package:he_brew_app/screens/login/reg_screen.dart';
import 'package:he_brew_app/screens/nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:he_brew_app/screens/login/welcome_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          // for add to cart
          ChangeNotifierProvider(create: (_) => CartProvider()),
          // for favorite
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.mulishTextTheme(),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const WelcomeScreen(),
            '/login': (context) => const LoginScreen(),
            '/signup': (context) => const RegScreen(),
            '/home': (context) => const BottomNavBar(),
          },
        ),
      );
}
