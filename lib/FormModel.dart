import 'dart:convert';

import 'package:flutter/material.dart';
import './args/FormModelArgs.dart';
import 'package:http/http.dart' as http;

class FormModel extends StatefulWidget {
  static const routeName = '/predict-result';

  @override
  State<FormModel> createState() => _FormModelState();
}

class _FormModelState extends State<FormModel> {
  // late Future<FormModelArgs> futureArgs;

  var prediction;

  Future apiCall(
    double pHvalue,
    double temperature,
    double taste,
    double odor,
    double fatLevel,
    double turbidity,
    double colorCode,
  ) async {
    try {
      String url = 'https://smart-foxes-learn-42-111-145-178.loca.lt/predict';
      final encoding = Encoding.getByName('utf-8');
      http.Response response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            {
              'pH': pHvalue,
              'temperature': temperature,
              'taste': taste,
              'odor': odor,
              'fat': fatLevel,
              'turbidity': turbidity,
              'color': colorCode,
            },
          ),
          encoding: encoding);
      prediction = json.decode(response.body)['prediction'];
      print(prediction);
      // var prediction = jsonDecode(response.body)['prediction'];
      // print(prediction);
    } catch (e) {
      print(e);
    }
  }

  // @override
  // void initState() {
  //   // futureArgs = apiCall() ;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as FormModelArgs;
    return Scaffold(
      appBar: AppBar(
          title: Row(children: const [
        Icon(Icons.reviews_outlined, size: 25, color: Colors.white),
        SizedBox(width: 10),
        Text('Results',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ))
      ])),
      body: FutureBuilder(
        future: apiCall(
          double.parse(args.pHvalue),
          double.parse(args.temperature),
          double.parse(args.turbidity),
          double.parse(args.fat),
          double.parse(args.color),
          double.parse(args.odor),
          double.parse(args.taste),
        ),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.done) {
          //   print('in Snaphot data');
          //   if (snapshot.hasError) {
          //     return Text('${snapshot.error}');
          //   } else if (snapshot.hasData) {
          //     final data = snapshot.data as String;
          //     print(data);
          //     return Center(
          //       child: Text(
          //         data,
          //         style: const TextStyle(fontSize: 18),
          //       ),
          //     );
          //   }
          // }
          return 
          prediction == null 
          ? const Center(child: CircularProgressIndicator(),)
          : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                  const Text(
                    'Prediction:',
                    style: TextStyle(
                      fontSize: 22 , 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    prediction,
                    style: const TextStyle(
                      fontSize: 26 , 
                      fontWeight: FontWeight.bold
                    ),
                  ),
              ]
            )
          );
        },
      ),
    );
  }
}
