import 'package:flutter/material.dart';
import 'package:sqflite_app_friends/edit_friend.dart';
import 'package:sqflite_app_friends/new_friend.dart';

import 'friend.dart';
import 'friend_database.dart';
import 'friend_details.dart';

class AllFriend extends StatefulWidget {
  const AllFriend({Key? key}) : super(key: key);

  @override
  _AllFriendState createState() => _AllFriendState();
}

class _AllFriendState extends State<AllFriend> {

  List<Friend> friends = [];


  @override
  void initState() {
    super.initState();
    print("init");
    loadData();
  }

  Future loadData() async{
    print("before fetch");
    friends = await FriendDatabase.instance.readAllFriends();
    print("after fetch");
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Friends"),
         actions: [addButton()],
        ),
        body:(friends != null && friends.isNotEmpty)?ListView.builder(itemCount: friends.length ,itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){



                Navigator.push(context, MaterialPageRoute(builder: (context) => FriendDetails(friends[index])),);

              },
            leading: Image.asset('assets/images/user.jpg'),
              title: Text("${friends[index].friendName}"),
              subtitle: Text("${friends[index].friendEmail}"),
              trailing: Text("${friends[index].friendAddress}"),
              // trailing: RaisedButton(onPressed: () {
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => EditFriend(friends[index])),);
              // },
              //   child: Text("Edit"),
              //
              // ),
              // trailing: RaisedButton(onPressed: () async{
              //
              //   delete(friends[index].id);
              //
              //  // setState(() {});
              //
              // await  Navigator.push(context, MaterialPageRoute(builder: (context) => AllFriend()),);
              //   Navigator.of(context).pop();
              //   },
              //   child: Text("Delete"),
              //
              // ),
              //trailing:getWidget(context),



            ),
          );
        }) : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }


  Widget getWidget(BuildContext context) {
    
    return Container(
      color: Colors.purple,
    );
  }


  Widget addButton() => IconButton(
      icon: Icon(Icons.add),
      onPressed: ()  async{
        await Navigator.push(context, MaterialPageRoute(builder: (context) => NewFriend()),);

        //refreshNote();
      });



  Future delete(int? id) async{
  await FriendDatabase.instance.delete(id!);

  }

}
