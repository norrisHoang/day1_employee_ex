import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'employee.dart';

void main() {
  runApp(MaterialApp( home: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  bool _sex = true;

  late String name;
  late String age;
  late String address;
  late String sex;
  String text = "";
  final _nameController = new TextEditingController();
  final _ageController = new TextEditingController();
  final _addressController = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _addressController.dispose();
  }

  void _setDefault(){
    _nameController.clear();
    _ageController.clear();
    _addressController.clear();
  }
  void _setObject() {
    setState(() {
      var employee = Employee(name: name, age: age, address: address, sex: sex);
      text =employee.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter TextField Example'),
        ),
        body: new SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Enter Your Name',

                    ),
                    autofocus: true,
                    controller: _nameController,
                    onChanged: (valueName) => name = valueName,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Age',
                      hintText: 'Enter Your Age',
                    ),
                    autofocus: false,
                    controller: _ageController,
                    onChanged: (valueAge) => age = valueAge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                      hintText: 'Enter Your Address',
                    ),
                    autofocus: false,
                    controller: _addressController,
                    onChanged: (valueAddress) => address = valueAddress,
                  ),
                ),
                ListTile(
                  title: Text("Male"),
                  leading: Radio(value: true,
                      groupValue: _sex,
                      onChanged: (newValue){
                        setState(() {
                          _sex = true;
                          sex = "Male";
                        });
                      }),
                ),
                ListTile(
                  title: Text("Female"),
                  leading: Radio(value: false,
                      groupValue: _sex,
                      onChanged: (newValue){
                        setState(() {
                          _sex = false;
                          sex = "Female";
                        });
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: _setObject,
                    child: const Text('Confirm'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: _setDefault,
                    child: const Text('Delete'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(text),
                ),
              ],
            )
        )
    );
  }
}

