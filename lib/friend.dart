
final String tableFriends = 'friends';


class FriendFields{

  static final List<String> values = [id,friendName,friendEmail,friendAddress];

  static final String id = '_id';
  static final String friendName = 'friendName';
  static final String friendEmail = 'friendEmail';
  static final String friendAddress = 'friendAddress';
}


class Friend{

  final int? id;
  final String friendName;
  final String friendEmail;
  final String friendAddress;




 const Friend({this.id, required this.friendName, required this.friendEmail, required this.friendAddress});


 Friend copy({
   int? id,
   String? friendName,
   String? friendEmail,
   String? friendAddress,

 }) => Friend(
      id: id ?? this.id,
   friendName: friendName ?? this.friendName,
   friendEmail: friendEmail ?? this.friendEmail,
   friendAddress: friendAddress ?? this.friendAddress,
 );

 static Friend fromJson(Map<String, Object?> json) => Friend(

   id: json[FriendFields.id] as int?,
   friendName: json[FriendFields.friendName] as String,
   friendEmail: json[FriendFields.friendEmail] as String,
   friendAddress: json[FriendFields.friendAddress] as String,
 );


 Map<String, Object?> toJson() => {
   FriendFields.id: id,
   FriendFields.friendName: friendName,
   FriendFields.friendEmail: friendEmail,
   FriendFields.friendAddress: friendAddress,

 };





}