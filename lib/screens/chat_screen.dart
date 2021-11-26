import 'package:shine_muscat/models/message_model.dart';
import 'package:shine_muscat/models/test.dart';
import 'package:shine_muscat/models/test2.dart';
import 'package:shine_muscat/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  //final User user;
  //ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final data = TextEditingController();
  final repository = DBHelper.INSTANCE;
  List<Memo> memos = [];

  _buildMessage(String message, bool isMe) {
    final Container msg = Container(
      //width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 18.0),
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0, right: 10.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, left: 10.0, right: 80.0),
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFF2F3F5),
        borderRadius: isMe
            ? BorderRadius.all(Radius.circular(15.0))
            : BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15.0,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );

    return msg;
  }

  _buildMessageComposer() {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Color(0xFFF2F3F5),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: data,
              textCapitalization: TextCapitalization.sentences,
              //onChanged: (value) {},
              decoration: InputDecoration.collapsed(hintText: ' Type message'),
            ),
          ),
          RaisedButton(
            //icon: Icon(Icons.send),
            //iconSize: 25.0,
            child: Text('send'),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              print("OnPressed!!");

              DBHelper.insertMemo(Memo(id: 4, text: data.text));
              DBHelper.memos().then((value) => print(value));

              //var a;

              //DBHelper.memos().then((value) => value);
              //print(a);
            },
          ),
          //Text('SEND  '),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          '나린',
          style: TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    child: FutureBuilder(
                        future: DBHelper.memos(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData == false) {
                            return Text("로딩 중..");
                          } else if (snapshot.hasError) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Error: ${snapshot.error}',
                                style: TextStyle(fontSize: 15),
                              ),
                            );
                          } else {
                            return buildMessage(snapshot.data);
                          }
                        })),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  Widget buildMessage(List<Memo> data) {
    return ListView.builder(
        reverse: true,
        padding: EdgeInsets.only(top: 15.0),
        //itemCount: messages.length,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          //return Text(data[index].text);
          return _buildMessage(data[index].text, true);
        });
  }
}
