
import 'package:flutter/material.dart';
import 'package:sqflite_app_friends/dbhelper/friend_database.dart';
import 'package:url_launcher/url_launcher.dart';

import 'all_friend.dart';
import 'edit_friend.dart';
import '../model/friend.dart';

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
        actions: [callButton(),editButton(),deleteButton()],
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

          child: Column(


            children: [
              SizedBox( height: 50.0,),
              Text("${widget.friend.friendName}",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.teal),),

              Text("${widget.friend.friendAddress}",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.pink),),

              Text("${widget.friend.friendEmail}",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.blueAccent),),

            ],
          ),
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



  Widget callButton() => IconButton(
    icon: Icon(Icons.phone),
    onPressed: () async {


      final phoneNumber = "${widget.friend.friendEmail}";
      final url = 'tel:$phoneNumber';

      if(await canLaunch(url))
      {
        await launch(url);
      }

     // Navigator.of(context).pop();




    },
  );




  Future delete(int? id) async{

    await FriendDatabase.instance.delete(id!);

  }
}


