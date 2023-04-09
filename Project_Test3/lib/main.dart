import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GmailHomePage(),
    );
  }
}

class GmailHomePage extends StatefulWidget {
  const GmailHomePage({Key? key}) : super(key: key);

  @override
  _GmailHomePageState createState() => _GmailHomePageState();
  import 'package:flutter/material.dart';

  void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  title: 'Gmail Clone',
  theme: ThemeData(
  primarySwatch: Colors.red,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  home: const GmailHomePage(),
  );
  }
  }

  class GmailHomePage extends StatefulWidget {
  const GmailHomePage({Key? key}) : super(key: key);

  @override
  _GmailHomePageState createState() => _GmailHomePageState();
  }

  class _GmailHomePageState extends State<GmailHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[    Text('Primary'),    Text('Social'),    Text('Promotions'),  ];

  void _onItemTapped(int index) {
  setState(() {
  _selectedIndex = index;
  });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  leading: IconButton(
  icon: const Icon(Icons.menu),
  onPressed: () {},
  ),
  title: const Text('Gmail'),
  actions: <Widget>[
  IconButton(
  icon: const Icon(Icons.search),
  onPressed: () {},
  ),
  IconButton(
  icon: const Icon(Icons.more_vert),
  onPressed: () {},
  ),
  ],
  ),
  body: Center(
  child: _widgetOptions.elementAt(_selectedIndex),
  ),
  bottomNavigationBar: BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
  icon: Icon(Icons.mail),
  label: 'Primary',
  ),
  BottomNavigationBarItem(
  icon: Icon(Icons.people),
  label: 'Social',
  ),
  BottomNavigationBarItem(
  icon: Icon(Icons.local_offer),
  label: 'Promotions',
  ),
  ],
  currentIndex: _selectedIndex,
  selectedItemColor: Colors.red,
  onTap: _onItemTapped,
  ),
  );
  }
  }
