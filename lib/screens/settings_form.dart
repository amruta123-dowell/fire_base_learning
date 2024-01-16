import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learning/models/user_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/input_text_decoration.dart';
import '../custom_widgets/loading.dart';
import '../services/data_base_service.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["0", "1", "2", "3", "4", "5"];
  String _currentName = '';
  String _currentSugars = '0';
  int? _currentStrength;
  TextEditingController nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<User?>(context);

    return StreamBuilder<UserDataModel>(
        stream: DataBaseService(uid: userData?.uid).getUserData,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            UserDataModel? userSnapshotData = snapShot.data;

            // Use local variables to track changes
            _currentName = userSnapshotData?.name ?? '';
            _currentSugars = userSnapshotData?.sugars ?? '0';
            _currentStrength = userSnapshotData?.sugarStrength != null &&
                    userSnapshotData!.sugarStrength > 100
                ? userSnapshotData.sugarStrength
                : 100;
            nameTextController = TextEditingController(text: _currentName);

            // UserDataModel? userData = snapShot.data;
            // nameTextController.text = userData != null ? userData.name : '';
            // _currentStrength = userData != null && userData.sugarStrength > 100
            //     ? userData.sugarStrength
            //     : 100;

            return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      child: Text(
                        "Update your settings.",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      controller: nameTextController,
                      decoration: inputTextDecoration,
                      validator: (value) =>
                          value == null || value.isEmpty == true
                              ? "Please enter a name"
                              : null,
                      onChanged: (value) {
                        _currentName = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Sugar quantity",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                      child: DropdownButtonFormField(
                        value: userSnapshotData?.sugars != null &&
                                userSnapshotData?.sugars.isNotEmpty == true
                            ? userSnapshotData!.sugars
                            : _currentSugars,
                        focusColor: Colors.brown,
                        items: sugars.map((sugarQty) {
                          return DropdownMenuItem(
                              value: sugarQty,
                              child: Text(
                                sugarQty,
                              ));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _currentSugars = value ?? '';
                          });
                        },
                        decoration: inputTextDecoration,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Strength",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown),
                    ),
                    Slider(
                        value: (_currentStrength ?? 100).toDouble(),
                        activeColor: Colors.brown[_currentStrength ?? 100],
                        inactiveColor: Colors.brown[_currentStrength ?? 100],
                        min: 100.0,
                        max: 900.0,
                        divisions: 8,
                        onChanged: (val) => _currentStrength = val.round()),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 56, 21, 8)),
                        onPressed: () async {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            await DataBaseService(uid: userData?.uid)
                                .updateUserData(
                                    sugarCubes: _currentSugars,
                                    name: _currentName,
                                    strength: _currentStrength?.toInt() ?? 100);
                          }
                          Navigator.pop(context);
                        },
                        child: const Text("Update"))
                  ],
                ));
          } else {
            return const LoadingWidget();
          }
        });
  }
}
