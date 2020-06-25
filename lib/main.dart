import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:navigation_rail/navigation_rail.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NavigationRail Demo',
      theme: _theme(ThemeData.light().copyWith(
        accentColor: Colors.red,
      )),
      home: MyHomePage(title: 'Navigation Rail Demo'),
    );
  }

  ThemeData _theme(ThemeData base) {
    return ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: base.appBarTheme.copyWith(elevation: 0.0),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
        elevation: 2.0,
        backgroundColor: base.accentColor,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              minWidth: 72.0,
              groupAlignment: 1.0,
              leading: Icon(Icons.people),
              trailing: Icon(Icons.exit_to_app),
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: RotatedBox(
                      quarterTurns: -1,
                      child: Text('First')),
                ),
                NavigationRailDestination(
                  icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 10),
                      child: Icon(Icons.av_timer)),
                  label: SizedBox.shrink(),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Third'),
                ),
              ],
            ),
            VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(
              child: Center(
                child: Text('selectedIndex: $_selectedIndex'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

