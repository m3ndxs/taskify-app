import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:taskify_app/config/dependencies.dart';
import 'package:taskify_app/config/theme_manager.dart';
import 'package:taskify_app/ui/auth/login_screen.dart';
import 'package:taskify_app/ui/home/widgets/home_screen.dart';
import 'package:taskify_app/ui/splash/splash_page.dart';

void main() {
  runApp(MultiProvider(providers: providersLocal, child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        return MaterialApp(
          navigatorKey: _navigatorKey,
          title: "Taskify",
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: const [Locale('pt', 'BR'), Locale('en', 'US')],
          theme: themeManager.lightTheme,
          darkTheme: themeManager.darkTheme,
          themeMode: themeManager.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: "/",
          routes: {
            "/": (context) => const SplashPage(),
            "/login": (context) => const LoginScreen(),
            "/home": (context) => const HomeScreen(),
          }
        );
      },
    );
  }
}
