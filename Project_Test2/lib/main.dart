import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: GmailPrimaryScreen(),
    );
  }
}

class GmailPrimaryScreen extends StatefulWidget {
  const GmailPrimaryScreen({Key? key}) : super(key: key);

  @override
  _GmailPrimaryScreenState createState() => _GmailPrimaryScreenState();
}

class _GmailPrimaryScreenState extends State<GmailPrimaryScreen> {
  final List<String> _emails = [    'John Doe',    'Mary Smith',    'Bob Johnson',    'Samantha Lee',    'David Garcia',    'Emily Davis',    'Michael Brown',    'Sarah Wilson',    'Daniel Thompson',    'Laura Hernandez',  ];

  void _openEmail(String email) async {
    final url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'package': 'com.google.android.gm'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search in email',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _emails.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(_emails[index][0]),
            ),
            title: Text(_emails[index]),
            subtitle: Text('Subject: Hello'),
            trailing: Text('12:20 PM'),
            onTap: () => _openEmail(_emails[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {},
      ),
    );
  }
}
