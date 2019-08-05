import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: BmiActivity()));

class BmiActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
      ),
      body: ListView(
        children: <Widget>[
          BmiHeader(),
          BmiForm(),
        ],
      ),
    );
  }
}

class BmiHeader extends StatelessWidget {
  var headerTextSize = 48.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.purple,
            child: Text(
              "B",
              style: TextStyle(color: Colors.white, fontSize: headerTextSize),
            ),
          ),
          Text(
            "MI",
            style: TextStyle(fontSize: headerTextSize),
          )
        ],
      ),
    );
  }
}

class BmiForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BmiFormState();
  }
}

class BmiFormState extends State {
  var _globalKey = GlobalKey<FormState>();
  var _mResult = "";
  var _mAge = 0;
  var _mHeight = 0;
  var _mWeight = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey,
            child: Form(
              key: _globalKey,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Age", icon: Icon(Icons.portrait)),
                        validator: (value) {
                          if (value.isNotEmpty) {
                            _mAge = int.parse(value);
                          } else {
                            return "What is your age";
                          }
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Height", icon: Icon(Icons.portrait)),
                        validator: (value) {
                          if (value.isNotEmpty) {
                            _mHeight = int.parse(value);
                          } else {
                            return "What is your height";
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 24),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Weight", icon: Icon(Icons.portrait)),
                        validator: (value) {
                          if (value.isNotEmpty) {
                            _mWeight = int.parse(value);
                          } else {
                            return "What is your weight";
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
            child: FlatButton(
              onPressed: () {
                if (_globalKey.currentState.validate()) {
                  setState(() {
                    var bmi = _mWeight / (_mHeight * _mHeight);
                    _mResult = bmi <= 0 ? "" : "$bmi";
                  });
                }
              },
              color: Colors.red,
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
            child: Text(
              _mResult,
              style: TextStyle(color: Colors.blue, fontSize: 32),
            ),
          )
        ],
      ),
    );
  }
}
