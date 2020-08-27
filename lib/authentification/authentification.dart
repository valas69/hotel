import "package:flutter/material.dart";
import 'package:hotel/authentification/inscription.dart';

import 'connexion.dart';

class Authentification extends StatefulWidget {
  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
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
            Connexion(),
            Inscription()
          ],
        ),
      ),
    );
  }
}
