import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Inscription extends StatefulWidget {
  Inscription({Key key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  bool cacherMdp = true;

  List<Step> get steps => [
        Step(
          title: const Text('Information de connexion'),
          isActive: currentStep == 0 ? true : false,
          state: currentStep == 0 ? StepState.editing : StepState.complete,
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Adresse mail'),
              ),
              TextFormField(
                obscureText: cacherMdp,
                decoration: InputDecoration(
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
            ],
          ),
        ),
        Step(
          isActive: currentStep == 1 ? true : false,
          state: currentStep == 1 ? StepState.editing : StepState.complete,
          title: const Text('Information personnel'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Prénom'),
              ),
            ],
          ),
        ),
      ];
  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        complete
            ? Expanded(
                child: Center(
                  child: AlertDialog(
                    title: new Text("Profile Created"),
                    content: new Text(
                      "Tada!",
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text("Close"),
                        onPressed: () {
                          setState(() => complete = false);
                        },
                      ),
                    ],
                  ),
                ),
              )
            : Expanded(
                child: Stepper(
                  steps: steps,
                  currentStep: currentStep,
                  onStepContinue: next,
                  onStepTapped: (step) => goTo(step),
                  onStepCancel: cancel,
                  controlsBuilder: (context, {onStepCancel, onStepContinue}) =>
                      Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          color: Colors.red,
                          onPressed: next,
                          child: Center(
                            child: Text('Suivant',
                                style: TextStyle(color: Colors.white)),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        currentStep != 0
                            ? FlatButton(
                                onPressed: cancel,
                                child: Center(
                                  child: Text('Annuler',
                                      style: TextStyle(
                                        color: Colors.red,
                                      )),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
