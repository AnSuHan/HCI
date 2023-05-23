import 'package:flutter/material.dart';

import 'MailScene.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var emails = MailScene.mails;
  var searchResults = [];

  void searchEmails(String query) {
    debugPrint("emails : $emails");

    for(var i = 0 ; i < emails.length ; i++) {
      if(emails[i].sender.contains(query) || emails[i].message.contains(query) || emails[i].title.contains(query)) {
        setState(() {
          searchResults.add(emails[i]);
        });

      }
    }
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
      body: (searchResults.isEmpty) ? Text("") : ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(searchResults[index].toString()),
            ),
            title: Text(
              searchResults[index].toString(),
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
