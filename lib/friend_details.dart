
import 'package:flutter/material.dart';
import 'package:sqflite_app_friends/friend_database.dart';

import 'all_friend.dart';
import 'edit_friend.dart';
import 'friend.dart';

class FriendDetails extends StatefulWidget {
  //const FriendDetails({Key? key}) : super(key: key);

  Friend friend;

  FriendDetails(this.friend);


  @override
  _FriendDetailsState createState() => _FriendDetailsState();
}

class _FriendDetailsState extends State<FriendDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Details"),
        actions: [editButton(),deleteButton()],
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
        body: Column(
          children: [
            Text("${widget.friend.friendName}"),
            Text("${widget.friend.friendEmail}"),
            Text("${widget.friend.friendAddress}"),
          ],
        ),
      ),
    );
  }



  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {


        await Navigator.push(context, MaterialPageRoute(builder: (context) => EditFriend(widget.friend)),);


      });

  Widget deleteButton() => IconButton(
    icon: Icon(Icons.delete),
    onPressed: () async {
      delete(widget.friend.id);
      await Navigator.push(context, MaterialPageRoute(builder: (context) => AllFriend()),);

      Navigator.of(context).pop();
    },
  );

  Future delete(int? id) async{


    await FriendDatabase.instance.delete(id!);

  }
}


