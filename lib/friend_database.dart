import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_app_friends/friend.dart';

class FriendDatabase{

  static final FriendDatabase instance = FriendDatabase._init();

  static Database? _database;
  FriendDatabase._init();

  Future<Database> get database async{

    if(_database != null)
      return _database!;

    _database = await _initDB('friends.db');
    return _database!;

  }

  Future<Database> _initDB(String filePath) async{

    final dbpath = await getDatabasesPath();
    final path = join(dbpath,filePath);
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    // final integerType = 'INTEGER NOT NULL';


    await db.execute('''
     CREATE TABLE $tableFriends(
     ${FriendFields.id} $idType,
     ${FriendFields.friendName} $textType,
     ${FriendFields.friendEmail} $textType,
     ${FriendFields.friendAddress} $textType
     )
    ''');
  }


  Future<Friend> create(Friend friend) async{

    print("++++++   Inside create  ++++++");

    final db = await instance.database;
    final id = await db.insert(tableFriends, friend.toJson());
    return friend.copy(id: id);
  }

  Future<Friend> readFriend(int id) async{
    print("++++++   Inside read  ++++++");
    final db = await instance.database;
   final maps = await db.query(
     tableFriends,
     columns: FriendFields.values,
     where: '${FriendFields.id} = ?',
     whereArgs: [id],
   );

    if(maps.isNotEmpty){
      return Friend.fromJson(maps.first);
    }
    else{
      throw Exception('ID $id not found');
    }

  }

  Future<List<Friend>> readAllFriends() async{

    print("++++++   Read All  ++++++");
    final db = await instance.database;
   // final orderBy = '${FriendF}'
    final result = await db.query(tableFriends);

    return result.map((json) => Friend.fromJson(json)).toList();

  }

  Future<int> update(Friend friend) async{
    print("++++++   Inside update  ++++++");
    final db = await instance.database;
    return db.update(
    tableFriends,
    friend.toJson(),
    where:'${FriendFields.id} = ?',
    whereArgs: [friend.id],
    );
  }
  //
  // Future<int> update1(Friend friend) async {
  //   var db = await instance.database;
  //   var result = await db.update(tableFriends, friend.toJson(),
  //       where: "${FriendFields.id} = ?", whereArgs: [friend.id]);
  //   return result;
  // }





  Future<int> delete(int id) async{
    print("++++++   Inside delete  ++++++");
    final db = await instance.database;
    return await db.delete(
      tableFriends,
      where: '${FriendFields.id} = ?',
      whereArgs: [id],
    );
  }




  Future close() async{
    print("++++++   Inside close  ++++++");
    final db = await instance.database;
    db.close();
  }



}
