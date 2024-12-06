import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
import 'routes.dart';
import 'screens/init_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'state_managements/auth.dart';
import 'state_managements/cart_provider.dart';
import 'state_managements/favorite_provider.dart';
import 'theme.dart';
import 'state_managements/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool initAuthIsLoggedIn = (await SharedPreferences.getInstance()).getBool('authIsLoggedIn') ?? false;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DarkMode>(
        create: (_) => DarkMode(),
      ),
      ChangeNotifierProvider<Auth>(
        create: (_) => Auth(),
      ),
      ChangeNotifierProvider<CartProvider>(
        create: (_) => CartProvider(),
      ),
      ChangeNotifierProvider<FavoriteProvider>(
        create: (_) => FavoriteProvider(),
      ),
    ],
    child: MyApp(
      initAuthIsLoggedIn: initAuthIsLoggedIn,
    )
  ));
}

class MyApp extends StatelessWidget {
  final bool initAuthIsLoggedIn;

  const MyApp({this.initAuthIsLoggedIn = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkMode>(
      builder: (context, darkMode, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: name,
        theme: AppTheme.theme(context, darkMode.isEnabled),
        initialRoute: initAuthIsLoggedIn ? InitScreen.routeName : SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
