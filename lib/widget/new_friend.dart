import 'package:flutter/material.dart';
import 'package:sqflite_app_friends/widget/all_friend.dart';
import 'package:sqflite_app_friends/main.dart';

import '../model/friend.dart';
import '../dbhelper/friend_database.dart';


class NewFriend extends StatefulWidget {
  const NewFriend({Key? key}) : super(key: key);

  @override
  _NewFriendState createState() => _NewFriendState();
}

class _NewFriendState extends State<NewFriend> {

  TextEditingController textEditingControllerFriendName = new TextEditingController();
  TextEditingController textEditingControllerFriendEmail = new TextEditingController();
  TextEditingController textEditingControllerFriendAddress = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create new contact"),

        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),

      ),
      body: Center(

        child: Form(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(30.0)),
              TextFormField(controller: textEditingControllerFriendName,decoration: InputDecoration(hintText : "Name"),),
              TextFormField(controller: textEditingControllerFriendEmail,decoration: InputDecoration(hintText: "Mobile No."),),
              TextFormField(controller: textEditingControllerFriendAddress,decoration: InputDecoration(hintText : "Address"),),

              SizedBox(height: 13.0,),
              RaisedButton(
               color: Colors.green
              ,onPressed: (){

                final friend = new Friend(friendName: "${textEditingControllerFriendName.text}", friendEmail: "${textEditingControllerFriendEmail.text}", friendAddress: "${textEditingControllerFriendAddress.text}");

                print(FriendDatabase.instance.create(friend));

                Navigator.push(context, MaterialPageRoute(builder: (context) => AllFriend()),);


              },
              child: Text("SAVE",style: TextStyle(color: Colors.white),),
              )

            ],



          ),
        ),
      ),
    );
  }
}

