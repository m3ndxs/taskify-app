import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify_app/ui/auth/view_models/auth_view_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final AuthViewModel _auth;
  bool _didNavigate = false;

  @override
  void initState() {
    super.initState();
    _auth = context.read<AuthViewModel>();
    _auth.addListener(_tryNavigate);
    WidgetsBinding.instance.addPostFrameCallback((_) => _tryNavigate());
  }

  @override
  void dispose() {
    _auth.removeListener(_tryNavigate);
    super.dispose();
  }

  void _tryNavigate() {
    if (_didNavigate || !mounted) return;
    if (_auth.isLoading) return;

    _didNavigate = true;
    _auth.removeListener(_tryNavigate);

    final next = _auth.isLoggedIn ? "/home" : "/login";
    Navigator.pushReplacementNamed(context, next);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB6FF02),
      body: Center(
        child: const Icon(Icons.task_alt, size: 80, color: Colors.white),
      ),
    );
  }
}
