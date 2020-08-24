import "package:flutter/material.dart";
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  bool cacherMdp = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Connexion",
              ),
              Tab(text: "Inscription")
            ],
          ),
          centerTitle: true,
          title: Text("Authentification"),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
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
                      child: Container(
                        height: 350,
                        width: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Adresse e-mail',
                              ),
                            ),
                            TextField(
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
                            ),
                            FlatButton(
                              color: Colors.red,
                              onPressed: () {},
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
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
            ),
            Container(child: Text("Tergel"))
          ],
        ),
      ),
    );
  }
}
