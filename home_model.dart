import 'package:cloud_firestore/cloud_firestore.dart';

class HomeModel {
  String title, des,id;
   String time;
  HomeModel({
    required this.title,
    required this.des,
    required this.time,
    required this.id,
  });
  factory HomeModel.fromjson(QueryDocumentSnapshot json) {
    return HomeModel(
      title: json["title"]??"",
      des: json["descriptions"]??"",
      time:json["time"],
      id: json.id,
    );
  }
  Map<String,dynamic> toJson(){
    return{
      "title":title,
      "descriptions":des,
      "time":time,



    } ;
  }
}
