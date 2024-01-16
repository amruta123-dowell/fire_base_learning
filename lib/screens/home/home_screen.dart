import 'package:firebase_learning/custom_widgets/coffee_class.dart';
import 'package:firebase_learning/screens/settings_form.dart';

import 'package:firebase_learning/services/auth_service.dart';
import 'package:firebase_learning/services/data_base_service.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../custom_widgets/coffee_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //onClick settings button
    void showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: const SettingsForm(),
            );
          });
    }

    return StreamProvider<List<CoffeeClass?>?>.value(
      value: DataBaseService().getCoffeeList,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: const Text("Home screen"),
          actions: <Widget>[
            TextButton.icon(
                onPressed: () async {
                  await AuthService().signOut();
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                )),
            TextButton.icon(
                onPressed: () {
                  showSettingsPanel();
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                label: const Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              CoffeeListWidget()
            ]),
      ),
    );
  }
}
