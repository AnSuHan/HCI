import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      theme: ThemeData(
        primarySwatch: Colors.red, // Use Gmail's primary color
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> emails = [
    'Example email 1',
    'Example email 2',
    'Example email 3',
    'Example email 4',
    'Example email 5',
  ];
  List<String> searchResults = [];

  void searchEmails(String query) {
    setState(() {
      searchResults = emails
          .where((email) => email.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar's background color to white
        elevation: 0, // Remove AppBar's shadow
        title: TextField(
          onChanged: searchEmails,
          autofocus: true, // Automatically focus on TextField
          decoration: InputDecoration(
            hintText: 'Search mail',
            hintStyle: TextStyle(color: Colors.grey), // Set hint text color
            suffixIcon: Icon(Icons.search, color: Colors.grey), // Set search icon color
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Row(
            children: <Widget>[
              SizedBox(width: 16.0),
              FilterChip(
                label: Text('Label'),
                onSelected: (selected) {
                  // Apply label filter logic here
                },
              ),
              SizedBox(width: 8.0),
              FilterChip(
                label: Text('From'),
                onSelected: (selected) {
                  // Apply from filter logic here
                },
              ),
              SizedBox(width: 8.0),
              FilterChip(
                label: Text('To'),
                onSelected: (selected) {
                  // Apply to filter logic here
                },
              ),
              SizedBox(width: 8.0),
              FilterChip(
                label: Text('Attachment'),
                onSelected: (selected) {
                  // Apply attachment filter logic here
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(searchResults[index][0]),
            ),
            title: Text(
              searchResults[index],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Snippet of the email content'),
            trailing: Icon(Icons.star_border), // Set trailing icon
          );
        },
      ),
    );
  }
}
