import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DropDownButton",
      home: DropdownButtonController(),
    );
  }
}

class DropdownButtonController extends StatefulWidget {
  const DropdownButtonController({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<DropdownButtonController> {
  static const menuItem = <String>["One", "Two", "Three", "Four"];
  final String _btn1SelectedVal = "One";
  // final String? _btn2SelectedVal;
  // late String _btn3SelectedVal;

  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItem
      .map((e) => DropdownMenuItem<String>(
            child: Text(e),
            value: e,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        ListTile(
          title: const Text("DropDownButton with default: One"),
          trailing: DropdownButton<String>(
            items: _dropDownMenuItems,
            value: _btn1SelectedVal,
            onChanged: (String? newVal) {
              if (newVal != null) {}
            },
          ),
        )
      ],
    ));
  }
}
