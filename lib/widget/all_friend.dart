import 'package:flutter/material.dart';
import 'package:sqflite_app_friends/widget/edit_friend.dart';
import 'package:sqflite_app_friends/widget/new_friend.dart';

import '../model/friend.dart';
import '../dbhelper/friend_database.dart';
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
        appBar: AppBar(title: Text("Contacts"),
         actions: [settingButton()],
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

        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            await Navigator.push(context, MaterialPageRoute(builder: (context) => NewFriend()),);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        drawer: Drawer(),
      ),
    );
  }


  Widget getWidget(BuildContext context) {
    
    return Container(
      color: Colors.purple,
    );
  }


  Widget settingButton() => IconButton(
      icon: Icon(Icons.settings),
      onPressed: ()  async{

        //refreshNote();
      });



  Future delete(int? id) async{
  await FriendDatabase.instance.delete(id!);

  }

}
