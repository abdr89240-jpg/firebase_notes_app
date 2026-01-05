import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/features/homee/viewmodel/create_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CreateCubit extends Cubit<CreateState>{
  CreateCubit():super(CreateInitialState());
        CollectionReference createNotes = FirebaseFirestore.instance.collection('notes');

  Future<void>create({
    required String title,
    required String desc,
    required String Userid,
})async{
  emit(CreateLoadingState());
  try{
    final now = DateTime.now();
String formattedTime = DateFormat('dd/MM/yyyy - HH:mm').format(now);
    createNotes.add({
      "title":title,
      "descriptions":desc,
      "time":formattedTime,
      "user_id":Userid

    });
    emit(CreateLoaded());
      //constant

    
  }catch(e){
    emit(CreateError(message: ("error$e")));

  }

  }
   upDate(
    {required String title,
    required String des,
    required String id,
    }
  )async{
  try{
    final now = DateTime.now();
String formattedTime = DateFormat('dd/MM/yyyy - HH:mm').format(now);
    createNotes.doc(id).update({
      "title":title,
      "descriptions":des,
      
      "time":formattedTime,
      

  });
  emit(CreateLoaded());

  }catch(e){
    emit(CreateError(message: "erroe$e"));

  }



    

  }
}