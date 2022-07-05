import 'package:beingsocial/Pages/home.dart';
import 'package:beingsocial/forms/registerform.dart';
import 'package:beingsocial/style/style.dart';
import 'package:beingsocial/widgets/Loading.dart'; // might not need.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:beingsocial/forms/loginform.dart';

class Authentication extends StatelessWidget {
  //was stateful before
  const Authentication({Key? key}) : super(key: key);

  /* @override
  State<Authentication> createState() => _AuthState();
}

class _AuthState extends State<Authentication> { 
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  /* final FirebaseAuth _auth =
      FirebaseAuth.instance; */ /* This will enable the signing in and so forth */
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
*/
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // used this before return const Center(child: Text("Authentication"));
    //This now loads the image instead of the Authentication text.
    // Used this portion of code for the image.
    //return Center(
    //  child: Image.asset("images/kakao.png"),
    //Column(children: [
    //Image.asset("images/kakao.png"),
    return Scaffold(
        appBar: AppBar(
          title: const Text("Authentication Basics"),
        ),
        body: const LoginForm()
        /*  const LoginForm()
            Was just this statement before, but changed to loginform.
            const RegisterForm()
            */

        /* loading
            ? const Loading()
            : Form(
                key:
                    _formKey, // with <-- can validate when interacting with keys
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: inputStyling("Email"),
                      //Used __ before.
                      //InputDecoration(labelText: "Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email cannot be empty";
                        }
                        if (!value.contains('@')) {
                          return "Email is in the wrong format";
                        }
                      },
                      /* helper text is underneath the text field */
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: inputStyling("Password"),
                      //Used this down below before
                      //InputDecoration(labelText: "Password"),
                      obscureText: true,
                      /* this will now be hidden */
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (value.length < 7) {
                          return "Password is too short";
                        }
                      },
                    ),
                    OutlinedButton(
                        onPressed: signin,
                        //This code below was used before for the previous call to log in.
                        /* () {
                          if (_formKey.currentState!.validate()) {}
                        }, */
                        child: Text("Login")),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            loading = true;
                            register();
                          });
                        },
                        // This code below was used before for the previous call
                        // to register.
                        /* () {
                           if (_formKey.currentState!.validate()) {
                            _auth
                                .createUserWithEmailAndPassword(
                                    email: _email.text,
                                    password: _password.text)
                                //Now when done loading it will be done loading?
                                .whenComplete(() => setState(() {
                                      loading = false;
                                      _email.clear();
                                      _password.clear();
                                    }));
                            /*
                              If registered correctly then we can see in firebase 
                              Being social --> authentication
                          */
                            setState(() {
                              loading = true;
                            });
                          }
                        }, */
                        child: Text("Register")),
                    OutlinedButton(
                        onPressed: () {}, child: Text("Forgot Password")),
                  ], */
        );
    //   ));
    //]);
  }
/*
  void login() {
    if (_formKey.currentState!.validate()) {
      _auth
          .signInWithEmailAndPassword(
              email: _email.text, password: _password.text)
          //Now when done loading it will be done loading?
          .whenComplete(() => setState(() {
                loading = false;
                _password.clear();
              }));
      /*
                              If registered correctly then we can see in firebase 
                              Being social --> authentication
                          */
      setState(() {
        loading = true;
      });
    }
  }
}*/
}
