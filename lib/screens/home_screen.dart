import 'package:flutter/material.dart';
import 'package:shine_muscat/screens/chat_screen.dart';
import 'package:shine_muscat/models/message_model.dart';
import 'package:shine_muscat/widgets/list.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a1c36),
      body: Column(
        children: <Widget>[
          List(),
          SizedBox(height: 200),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonTheme(
                  minWidth: 350,
                  height: 55,
                  child: RaisedButton(
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                  //user: james,
                                  )));
                    },
                    child: Text(
                      '채팅 바로가기',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFF3182F7),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
