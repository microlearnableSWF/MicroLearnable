import 'package:flutter/material.dart';

enum Gender { man, woman }
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        leading: const Icon(Icons.keyboard_backspace),
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          microProject1('Name', nameController),
          microProject1('ID', idController),
          microProject1('Password', passwordController),
          microProject2(),
          microProject3(),
          microProject4(),
          microProject5(),
          microProject6(),
        ],
      ),
    );
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget microProject1(String fieldName, TextEditingController controllerName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(fontSize: 20),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 15),
          child: TextFormField(
              controller: controllerName,
              decoration: InputDecoration(
                  hintText: fieldName, contentPadding: EdgeInsets.zero),
              obscureText: fieldName == 'Password' ? true : false),
        )
      ],
    );
  }

  DateTime currentDate = DateTime.now();

  Widget microProject2() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Birth',
            style: TextStyle(fontSize: 20),
          ),
          const Expanded(child: SizedBox()),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                selectedDate();
              },
              child: Row(
                children: [
                  Text(
                    currentDate.year.toString() +
                        '/' +
                        currentDate.month.toString() +
                        '/' +
                        currentDate.day.toString(),
                    style: const TextStyle(color: Colors.black26),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.calendar_today, color: Colors.black26)
                ],
              ))
        ],
      ),
    );
  }

  Future<void> selectedDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  Gender _gender = Gender.man;
  Widget microProject3() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gender',
            style: TextStyle(fontSize: 20),
          ),
          Row(
            children: <Widget>[
              Radio<Gender>(
                  value: Gender.man,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value!;
                    });
                  }),
              const Text('Male'),
              Radio<Gender>(
                  value: Gender.woman,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value!;
                    });
                  }),
              const Text('Femmale'),
            ],
          )
        ],
      ),
    );
  }

  var dropDownList = ['Highschool', 'University', 'Colleage', 'Graduate'];
  var dropDownListValue = 'Highschool';

  Widget microProject4() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          const Text(
            'Current Education',
            style: TextStyle(fontSize: 20),
          ),
          const Expanded(child: SizedBox()),
          DropdownButton<String>(
            value: dropDownListValue,
            items: dropDownList.map((String value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                dropDownListValue = value.toString();
              });
            },
          )
        ],
      ),
    );
  }

  bool _isSwithChecked = false;
  Widget microProject5() {
    return Padding(
      padding: const EdgeInsets.only(top: 75, bottom: 15),
      child: Row(
        children: [
          const Text(
            'Reveal to the public',
            style: TextStyle(fontSize: 20),
          ),
          const Expanded(child: SizedBox()),
          Switch(
            value: _isSwithChecked,
            onChanged: (value) {
              setState(() {
                _isSwithChecked = value;
              });
            },
          )
        ],
      ),
    );
  }

  Widget microProject6() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('preview'),
                  content: SizedBox(
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ' + nameController.text),
                        Text('Password: ' + passwordController.text),
                        Text('Birth: ' +
                            currentDate.year.toString() +
                            '/' +
                            currentDate.month.toString() +
                            '/' +
                            currentDate.day.toString() +
                            '/'),
                        Text(_gender.toString() == 'Gender.man'
                            ? 'Gender: Man'
                            : 'Gender: Woman'),
                        Text('Current Education: ' + dropDownListValue),
                        Text('Reveal to the public: ' +
                            _isSwithChecked.toString()),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('exit'))
                  ],
                );
              });
        },
        child: const Text(
          'Join',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}