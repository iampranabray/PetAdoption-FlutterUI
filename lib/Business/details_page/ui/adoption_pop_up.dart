import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

/// The demo page for [FadeScaleTransition].

class AdoptionPopUp extends StatelessWidget {
  const AdoptionPopUp({required this.animalName});
  final String animalName;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$animalName got Adopted'),
      // content:
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
