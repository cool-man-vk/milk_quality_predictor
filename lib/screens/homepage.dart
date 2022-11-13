import 'package:flutter/material.dart';
import '../FormModel.dart';
import '../args/FormModelArgs.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController pHvalue = TextEditingController();
  TextEditingController temperature = TextEditingController();
  TextEditingController taste = TextEditingController();
  TextEditingController odor = TextEditingController();
  TextEditingController fatLevel = TextEditingController();
  TextEditingController turbidity = TextEditingController();
  TextEditingController colorCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onClickedSubmit() {
        Navigator.of(context).pushNamed(FormModel.routeName,
          arguments: FormModelArgs(
              pHvalue: pHvalue.text,
              temperature: temperature.text,
              taste: taste.text,
              odor: odor.text,
              fat: fatLevel.text,
              turbidity: turbidity.text,
              color: colorCode.text
            ));        
    
    }


    return Scaffold(
        appBar: AppBar(
            title: Row(children: const <Widget>[
          Icon(Icons.analytics_rounded, size: 25, color: Colors.white),
          SizedBox(width: 10),
          Text('Milk Quality Predictor',
              style: TextStyle(color: Colors.white, fontSize: 18))
        ])),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: pHvalue,
                      decoration: const InputDecoration(
                          labelText: 'Enter the pH value of the milk'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                        controller: temperature,
                        decoration: const InputDecoration(
                            labelText: 'Enter the temperature'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter proper temperature";
                          }
                          return null;
                        }),
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: taste,
                        decoration: const InputDecoration(
                            labelText:
                                'Enter the taste(1 for good , 0 for bad)'),
                        validator: (value) {
                          if ((value == null) ||
                              value.isEmpty ||
                              int.parse(value) != 1 ||
                              int.parse(value) != 0) {
                            return "Please enter proper values";
                          }
                          return null;
                        },
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                        controller: odor,
                        decoration: const InputDecoration(
                            labelText: 'Enter the odor (1 for good,0 for bad)'),
                        validator: (val) {
                          if ((val == null) ||
                              val.isEmpty ||
                              int.parse(val) != 1 ||
                              int.parse(val) != 0) {
                            return "Please enter proper values";
                          }
                          return null;
                        }),
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                          controller: fatLevel,
                          decoration: const InputDecoration(
                              labelText:
                                  'Enter the Fat level(1 for good,0 for bad)'),
                          validator: (val) {
                            if ((val == null) ||
                                val.isEmpty ||
                                int.parse(val) != 1 ||
                                int.parse(val) != 0) {
                              return "Please enter proper values";
                            }
                            return null;
                          })),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                        controller: turbidity,
                        decoration: const InputDecoration(
                            labelText:
                                'Enter the Turbidity level(1 for Yes,0 for No)'),
                        validator: (val) {
                          if ((val == null) ||
                              val.isEmpty ||
                              int.parse(val) != 1 ||
                              int.parse(val) != 0) {
                            return "Please enter proper values";
                          }
                          return null;
                        }),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                        controller: colorCode,
                        decoration: const InputDecoration(
                            labelText:
                                'Enter the colour code of the white(240-255)'),
                        validator: (val) {
                          if ((val == null) ||
                              val.isEmpty ||
                              !(int.parse(val) >= 240 &&
                                  int.parse(val) <= 255)) {
                            return "Please enter proper values in the given range";
                          }
                          return null;
                        }),
                  ),
                  Container(
                    height: 50,
                    width: 180,
                    margin: const EdgeInsets.all(6),
                    child: ElevatedButton(
                        child:Text('Predict the quality'),
                        onPressed: onClickedSubmit
                    ),
                  )
                ],
              )),
        ));
  }
}
