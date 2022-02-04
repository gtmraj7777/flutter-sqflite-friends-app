import 'package:flutter/material.dart';

import 'all_friend.dart';
import 'friend.dart';
import 'friend_database.dart';
import 'friend_details.dart';
import 'new_friend.dart';




void main() {
 // runApp(MaterialApp(home: HomePage()));
  //runApp(MaterialApp(home: NewFriend()));
  //runApp(AllFriend());
  //runApp(FriendDetails());
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",

      routes: {
        "/":(context) => AllFriend()
      },
    );
  }
}
























































//
// class HomePage extends StatelessWidget {
//  // const HomePage({Key? key}) : super(key: key);
//
//
//
//
//
//   //final _formKey = GlobalKey<FormState>();
//   late bool isImportant;
//   late int number;
//   late String title;
//   late String description;
//
//   late List<Friend> friends;
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//
//     return Scaffold(
//
//       appBar: AppBar(title: Text("Sqflite Friend"),),
//
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//           //   FlatButton(onPressed: () {
//           //     Navigator.push(context, MaterialPageRoute(builder: (context) => NewFriend()),);
//           // //    addFriend();
//           //   }, child: Text("Insert"),color: Colors.grey[400],),
//
//             FlatButton(onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => AllFriend()),);
//
//             // friends = await FriendDatabase.instance.readAllFriends();
//             //
//             // for(var i in friends)
//             //   {
//             //     print(i.friendName);
//             //   }
//
//
//             }, child: Text("Query"),color: Colors.green,),
//             // FlatButton(onPressed: (){}, child: Text("Update"),color: Colors.blue[400],),
//             // FlatButton(onPressed: (){}, child: Text("Delete"),color: Colors.red[300],),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//
//   Future addFriend() async {
//
//     final friend = Friend(friendName: "GAUTAM",friendEmail: "gautam@gmail.com",friendAddress: "JH");
//     await FriendDatabase.instance.create(friend);
//
//   }
// }
