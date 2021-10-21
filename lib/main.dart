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
  static const menuItems = <String>["One", "Two", "Three", "Four"];
  String _btn1SelectedVal = "One";
  String? _btn2SelectedVal;
  late String _btn3SelectedVal;

  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map((e) => DropdownMenuItem<String>(
            child: Text(e),
            value: e,
          ))
      .toList();

  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map((val) => PopupMenuItem<String>(
            value: val,
            child: Text(val),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        ListTile(
          title: const Text("DropDownButton with default: "),
          trailing: DropdownButton<String>(
            items: _dropDownMenuItems,
            value: _btn1SelectedVal,
            onChanged: (String? newVal) {
              if (newVal != null) {
                setState(() {
                  _btn1SelectedVal = newVal;
                });
              }
            },
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text("DropDownButton with hint: "),
          trailing: DropdownButton(
            items: _dropDownMenuItems,
            value: _btn2SelectedVal,
            hint: const Text("Choose"),
            onChanged: (String? newVal) {
              if (newVal != null) {
                setState(() {
                  _btn2SelectedVal = newVal;
                });
              }
            },
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text("Popup menu button"),
          trailing: PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => _popUpMenuItems,
            onSelected: (String newVal) {
              _btn3SelectedVal = newVal;
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(_btn3SelectedVal)));
            },
          ),
        )
      ],
    ));
  }
}
