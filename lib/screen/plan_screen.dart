
import 'package:flutter/material.dart';
import 'package:travel_smart/screen/plan_map_screen.dart';

class PlanScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            Text('There is No Plan!.',
              style: TextStyle(fontSize: 16),),
            Spacer(),
            SizedBox(
                width: 350,
                child: RaisedButton(
                    color: Color(0xff41c300),
                    onPressed: () {
                      print("Click hand");
                      final route = MaterialPageRoute(
                          builder: (context) => PlanMapScreen()
                      );
                      Navigator.of(context).push(route);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
//                            Icon(Icons.plus_one),
                        const Text(
                            'Go to plan',
                            style: TextStyle(fontSize: 14)
                        ),
                      ],
                    )
                ),
            ),
            SizedBox(height: 20,),
          ],
        )
    );
  }
}