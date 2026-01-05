import 'package:flutter_application_1/core/servises/local_storage.dart';
import 'package:flutter_application_1/features/home/components/model/view/viewmodel/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) LocalStorage.saveData("email", credential.user!.email);
      if (credential.user != null) LocalStorage.saveData("id", credential.user!.uid);

      emit(AuthLoaded());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthError(message: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthError(message: 'Wrong password provided for that user.'));
      }
    }
  }

  Future<void> Signup(String email, String password) async {
    emit(AuthLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) LocalStorage.saveData("email", credential.user!.email);
      if (credential.user != null) LocalStorage.saveData("id", credential.user!.uid);
      emit(AuthLoaded());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthError(message: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthError(message: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(AuthError(message: "Error $e"));
    }
  }
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   // if (credential.user != null) LocalStorage.saveData("email", credential.user!.email);
     // if (credential.user != null) LocalStorage.saveData("id", credential.user!.uid);
      // TextfieldComponent("Email", "example@gmail.com",emailController),
      //QueryDocumentSnapshot json){
    //return HomeModel(title: json["title"], des: json["description"], time: json["time"],id: json.id);

    //String? id=await LocalStorage.getData("id", String);//جبت ال user id من التخزين المحلي
  //if(id!=null){
  //CollectionReference notess = FirebaseFirestore.instance.collection('notes');
   //QuerySnapshot notesQuery=await notess.where("User_id",isEqualTo: id).get();
 //List<HomeModel> notesss=List<HomeModel>.from(notesQuery.docs.map((e)=>HomeModel.fromjson(e)));
 //children:State.not.map((note){
   //return CardComponent(note.title, note.des, note.time);
     //} ).toList()

