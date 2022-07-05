import 'package:beingsocial/Pages/home.dart';
import 'package:beingsocial/widgets/Loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beingsocial/style/style.dart';
//import '../Pages/authentication.dart';
//import '../style/style.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  /* final FirebaseAuth _auth =
      FirebaseAuth.instance; */ /* This will enable the signing in and so forth */
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return loading
        ? const Loading()
        : Form(
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
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        loading = true;
                        login(context);
                      });
                    },
                    //This code below was used before for the previous call to log in.
                    /* () {
                          if (_formKey.currentState!.validate()) {}
                        }, */
                    child: const Text("Login")),
                OutlinedButton(
                    onPressed: () {
                      forgot();
                    },
                    //This code below was used before for the previous call to log in.
                    /* () {
                          if (_formKey.currentState!.validate()) {}
                        }, */
                    child: const Text("Forgot Passsword"))
              ],
            ),
          );
  }

  Future<void> login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        //var
        UserCredential loginResponse = await _auth.signInWithEmailAndPassword(
            email: _email.text, password: _password.text);

        setState(() {
          if (loginResponse.user!.emailVerified) {
            //snackBar(context, "Go to the next thing");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
          } else {
            snackBar(context, "User logged in but email is not verified");
            loginResponse.user!.sendEmailVerification();
          }
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

  Future<void> forgot() async {
    if (_email.text.isNotEmpty) {
      _auth.sendPasswordResetEmail(email: _email.text);
      snackBar(context, "Password reset was sent to your email.");
    }
  }
}
