import 'package:flutter/material.dart';
import 'package:Quizbox/main.dart';
import 'package:provider/provider.dart';

class settingMods extends StatefulWidget {
  const settingMods({super.key});

  @override
  State<settingMods> createState() => _settingModsState();
}

class _settingModsState extends State<settingMods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text(
                    "Dark Mode",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Icon(Icons.nightlight_round_outlined),
                ],
              ),
              Switch(
                  value: Provider.of<ThemeProvider>(context).darkMode,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  }),
            ],
          )),
    );
  }
}
