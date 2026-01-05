import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/core/servises/local_storage.dart';
import 'package:flutter_application_1/features/home/homestate/model/home_model.dart';
import 'package:flutter_application_1/features/home/homestate/viewmodel/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  
  HomeCubit() : super(HomeInitial())
  {
    print("object");
  }
  void getData() async {
    print("GET DATA CALLED");
try{
  emit(HomeLoading());
  String? idd=await LocalStorage.getData("id",String);//جبت ال user id من التخزين المحلي
  if(idd!=null){
  CollectionReference notess = FirebaseFirestore.instance.collection('notes');//constant
  QuerySnapshot notesQuery=await notess.where("user_id",isEqualTo: idd).get();
  List<HomeModel> notesss=List<HomeModel>.from(notesQuery.docs.map((e)=>HomeModel.fromjson(e)));
  print(notesss.length);
 
  emit(HomeLoaded(not: notesss));
 }else{
    logOut();
  }
}   catch(e){
  emit(HomeError(mess: "Error ${e.toString()}"));


}
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  await LocalStorage.clearData();
    emit(LogOut());
  }
}