import 'package:flutter/material.dart';

class PlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
              child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text(
                'There is No Plan!.',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              SizedBox(
                width: 350,
                child: RaisedButton(
                    color: Color(0xff41c300),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
//                            Icon(Icons.plus_one),
                        const Text('Go to place',
                            style: TextStyle(fontSize: 14)),
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
        ));
  }
}
