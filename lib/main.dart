import 'package:beingsocial/Pages/driver.dart';
import 'package:beingsocial/firebase_options.dart';
import 'package:beingsocial/forms/registerform.dart';
import 'package:beingsocial/pages/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

/* 
This code was copied from my other file that I was following along with with the Webex lecture.
*/

Future<void> main() async {
  //Always needed for firebase
  // 1WidgetsFlutterBinding.ensureInitialized();
  //1 if (Firebase.apps.length == 0) {
  //1 await Firebase.initializeApp(
  //1options: DefaultFirebaseOptions.currentPlatform);
  runApp(const SocialApp());
} //1else {}
//await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//runApp(const SocialApp());
//1}

class SocialApp extends StatelessWidget {
  const SocialApp({Key? key}) : super(key: key);
  //final Future<FirebaseApp> _initFirebase =
  // Firebase.initializeApp(); //usually needed
//So future elements are synchronous and can call in errors....
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Social App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Driver());
    /* const Scaffold(
            body: Center(
          child: Text("Gogogogo"),
        )) */
    /*  Scaffold(
        body: FutureBuilder(
          initialData: _initFirebase,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              /* If there is an error then it'lll have an error */
              return const Center(
                child: Text("Oops an error is here..."),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return const Center(
                child: Text("You are good to go!"),
              );
            } */
    //return Authentication());
    // },
    // ),
    // ),
    // );
  }
}
