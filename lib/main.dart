import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import "pages/skeleton.dart";
import "pages/error.dart";
import 'pages/gridview.dart';
import 'pages/listview.dart';
import 'pages/fancyview.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => NavigationSidebar(MyHomePage(title: 'Home')),
        '/gridview': (context, state, data) => NavigationSidebar(GridViewPage()),
        '/listview': (context, state, data) => NavigationSidebar(ListViewPage()),
        '/fancyview': (context, state, data) => NavigationSidebar(FancyViewPage()),
      },
    ),
    notFoundPage: BeamPage(
      child: NavigationSidebar(ErrorPage()),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          // seedColor: Colors.red[200]!,
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            FilledButton.tonal(
              child: const Text('Grid View'),
              onPressed: () => Beamer.of(context).beamToNamed('/gridview'),
            )
          ],
        ),
    );
  }
}
