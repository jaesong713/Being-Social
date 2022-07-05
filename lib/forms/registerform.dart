import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beingsocial/style/style.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  bool loading = false;
  /* final FirebaseAuth _auth =
      FirebaseAuth.instance; */ /* This will enable the signing in and so forth */
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _bio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey, // with <-- can validate when interacting with keys
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
              return null;
            },
            /* helper text is underneath the text field */
          ),
          TextFormField(
            controller: _username,
            decoration: inputStyling("Username"),
            //Used this down below before
            //InputDecoration(labelText: "Password"),
            /* this will now be hidden */
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Username cannot be empty";
              }
              return null;
            },
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
              return null;
            },
          ),
          TextFormField(
            controller: _bio,
            decoration: inputStyling("Biography"),
            //Used this down below before
            //InputDecoration(labelText: "Password"),
            /* this will now be hidden */
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password cannot be empty";
              }
              if (value.length < 7) {
                return "Password is too short";
              }
              return null;
            },
          ),
          OutlinedButton(
              onPressed: () {
                setState(() {
                  //would it be useful to get rid of setState?
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
              child: const Text("Register"))
        ],
      ),
    );
  }

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      try {
        //var
        UserCredential registerResponse =
            await _auth.createUserWithEmailAndPassword(
                email: _email.text, password: _password.text);
// or can use update
        _db
            .collection("users")
            .doc(registerResponse.user!.uid)
            .set({
              "name": _username.text,
              "bio": _bio.text,
            })
            .then((value) => snackBar(context, "User registered successfully."))
            .catchError((error) => snackBar(context, "Failed. $error"));

        registerResponse.user!.sendEmailVerification();
        setState(() {
          //was user didn't register successfully before.
          loading = false;
        });
      } catch (e) {
        setState(() {
          snackBar(context, e.toString());
          loading = false;

          //Now when done loading it will be done loading?
          /* .whenComplete(() => setState(() {
                loading = false;
                _email.clear();
                _password.clear();
              }));
      /*
                              If registered correctly then we can see in firebase 
                              Being social --> authentication
                          */ */
        });
      }
    }
  }
}
