import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify_app/ui/auth/view_models/auth_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.black),
                child: Center(
                  child: Image.asset(
                    'assets/images/icon.png',
                    height: 90,
                    color: const Color(0xFFB6FF02),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.feed, color: Colors.white),
                title: const Text(
                  'Feed',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text(
                  'Preferências',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final authViewModel = context.read<AuthViewModel>();
                  await authViewModel.logout();
                  if (context.mounted) {
                    Navigator.of(context).pushReplacementNamed('/login');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Icon(
          Icons.task_alt_outlined,
          size: 40,
          color: const Color(0xFFB6FF02),
        ),
        centerTitle: true,
      ),
      body: const Center(child: Text('Tarefas')),
    );
  }
}
