import "package:flutter/material.dart";
import "package:beamer/beamer.dart";

class NavigationSidebar extends StatelessWidget {
  Widget junk;
  NavigationSidebar(this.junk);
  final int appBarHeight = 58;
  List<List<String>> paths = [
    ["Home", "/"],
    ["Documents", "/documents"],
    ["Coding", "/coding"],
    ["This Computer", "/computer"],
    ["Volumes", "/volumes"],
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight.toDouble()),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          height: appBarHeight.toDouble(),
          color: Theme.of(context).colorScheme.surfaceContainer,
          child: Row(
            children: <Widget>[
              Builder(
                builder: (context) => IconButton(
                  color: Theme.of(context).colorScheme.onSurface,
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => ListTile(
            title: Text(paths[index][0]),
            onTap: () => Beamer.of(context).beamToNamed(paths[index][1]),
          ),
        ),
      ),
      body: junk,
    );
  }
}
