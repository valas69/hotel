import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Connexion extends StatefulWidget {
  Connexion({Key key}) : super(key: key);

  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  bool cacherMdp = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _signInWithEmailAndPassword() async {
    final User user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passController.text,
    ))
        .user;

    if (user != null) {
      setState(() {
        print("Login success");
      });
    } else {
      setState(() {
        print("Raté morray");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
                child: Image(
              image: AssetImage('lib/assets/images/logo.png'),
              color: Colors.red,
              height: 200,
            )),
            Form(
              key: _formKey,
              child: Container(
                height: 350,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adresse e-mail',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Votre adresse e-mail ne peut pas être vide";
                        }
                        return null;
                      },
                      controller: _emailController,
                    ),
                    TextFormField(
                      obscureText: cacherMdp,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mot de passe',
                          suffixIcon: IconButton(
                            icon: cacherMdp == true
                                ? Icon(MdiIcons.eyeOff)
                                : Icon(MdiIcons.eye),
                            onPressed: () {
                              setState(() {
                                cacherMdp = !cacherMdp;
                              });
                            },
                          )),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Votre mot de passe ne peut pas être vide";
                        }
                        return null;
                      },
                      controller: _passController,
                    ),
                    FlatButton(
                      color: Colors.red,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _signInWithEmailAndPassword();
                        }
                      },
                      child: Center(
                        child: Text('Se connecter',
                            textScaleFactor: 1.3,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey,
                            height: 1,
                          ),
                        ),
                        Text(
                          " Autre moyen de connexion ",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FlatButton.icon(
                            onPressed: () {},
                            label: Text("Facebook",
                                textScaleFactor: 1.2,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.blue,
                            icon: Icon(
                              MdiIcons.facebook,
                              color: Colors.white,
                              size: 40,
                            )),
                        FlatButton.icon(
                            onPressed: () {},
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            label: Text(
                              "Google",
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            icon: Icon(
                              MdiIcons.google,
                              color: Colors.white,
                              size: 40,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
