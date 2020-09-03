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
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            children: <Widget>[
              DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [Icon(Icons.person_pin), Text("Tergel t")],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(""),
                          FlatButton(
                              onPressed: () {},
                              child: Text("Modifier le profil"))
                        ],
                      )
                    ],
                  ),
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor)),
              ListTile(
                title: Text('Rechercher un hôtel'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Mes réservations'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Mon compte'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Paramètres'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
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
          children: [Connexion(), Inscription()],
        ),
      ),
    );
  }
}
