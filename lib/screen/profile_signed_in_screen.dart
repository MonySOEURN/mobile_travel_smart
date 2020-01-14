import 'package:flutter/material.dart';

class ProfileSignedInScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        // Background
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Color(0xffD2DBDB)
          ),
        ),
        // circle account profile
        Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Container(
                child: Center(
                    child:
                     Text(
                        "M",
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 204,
                         fontWeight: FontWeight.bold
                       ),
                     )
                ),
                decoration: BoxDecoration(
                  color: Color(0xff41C300),
                  borderRadius: BorderRadius.all(
                    Radius.circular(190),
                  ),
                ),
                height: 280,
                width: 280,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40,),
                    _buildUserInformations("User name: ", "Mony SOEURN"),
                    _buildUserInformations("E-mail: ", "soeurn.mony@gmail.com"),
//                    Spacer(),
                    SizedBox(height: 50,),
                    SizedBox(
                      width: 350,
                      child: RaisedButton(
                          color: Color(0xff41c300),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
//                            Icon(Icons.plus_one),
                              const Text(
                                  'Log out',
                                  style: TextStyle(fontSize: 14)
                              ),
                            ],
                          )
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserInformations(String label, String value){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        ListTile(
          title: Text(value),
          trailing: Icon(Icons.edit),
        )
      ],
    );
  }

}