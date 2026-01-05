import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/servises/local_storage.dart';
import 'package:flutter_application_1/features/auth/model/login_screen.dart';
import 'package:flutter_application_1/features/home/components/model/view/viewmodel/auth_cubit.dart';
import 'package:flutter_application_1/features/homee/view/addnote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String ?id=await  LocalStorage.getData("email",String);
  runApp(Myapp(isLogged: id!=null,));
  


}
class Myapp extends StatelessWidget {
  final isLogged;
  Myapp({required this.isLogged});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthCubit>(create: (_) => AuthCubit(),),



    ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      isLogged?Addnote():LoginScreen()
       ,
      
      
    ) ,);
    
  }
}