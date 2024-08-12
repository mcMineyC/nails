import "package:flutter/material.dart";
import "package:beamer/beamer.dart";

class ErrorPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("Error"),
          Text("Page not found."),
          FilledButton(
            child: Text("Go Home"),
            onPressed: () => Beamer.of(context).beamToNamed("/"),
          ),
        ],
      ),
    );
  }
}
