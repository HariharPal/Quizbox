import 'package:flutter/material.dart';
import 'package:Quizbox/Screens/Home.dart';
import 'package:Quizbox/Screens/Setting.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key, required this.onSelectScreen});
  final void Function(String) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  "Select Options",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, size: 24),
              title: const Text(
                "Home",
                style: TextStyle(fontSize: 21),
              ),
              onTap: () {
                onSelectScreen("Home");
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, size: 24),
              title: const Text(
                "Setting",
                style: TextStyle(fontSize: 21),
              ),
              onTap: () {
                onSelectScreen("Setting");
              },
            )
          ],
        ),
      ),
    );
  }
}
