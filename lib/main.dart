import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:taskify_app/config/dependencies.dart';
import 'package:taskify_app/config/theme_manager.dart';
import 'package:taskify_app/ui/auth/login_screen.dart';
import 'package:taskify_app/ui/auth/view_models/auth_view_model.dart';
import 'package:taskify_app/ui/home/widgets/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: providersLocal, child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeManager, AuthViewModel>(
      builder: (context, themeManager, authViewModel, child) {
        return MaterialApp(
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
          home: authViewModel.isLoggedIn
              ? const HomeScreen()
              : const LoginScreen(),
          routes: {
            "/login": (context) => const LoginScreen(),
            "/home": (context) => const HomeScreen(),
          }
        );
      },
    );
  }
}
