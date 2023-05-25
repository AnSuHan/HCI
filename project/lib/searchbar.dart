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
    setState(() {
      searchResults = [];

      for(var i = 0 ; i < emails.length ; i++) {
        if(emails[i].sender.contains(query) || emails[i].message.contains(query) || emails[i].title.contains(query)) {
          searchResults.add(emails[i]);
        }
      }
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
      body: (searchResults.isEmpty) ? Text("") : ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return  Container(
            child: ListTile(
                leading: const FlutterLogo(size: 50.0),
                title: Text(searchResults[index].sender),
                subtitle: SizedBox(
                  height: 50,
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 1000,
                        child: Text(
                          searchResults[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 1000,
                        child: Text(
                          searchResults[index].message.substring(0, 10),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (searchResults[index].isReceiverOpen) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
                    SizedBox(
                      width: 100,
                      child: Column(
                        children: [
                          Text(searchResults[index].time),
                          StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    searchResults[index].isStar = !searchResults[index].isStar;
                                  });
                                  debugPrint("item-index : ${searchResults[index].toJson()}");
                                  /*
                                    if(sendMails[index].isStar) {
                                      sendMails[index].label = "별표편지함";
                                    }
                                    else {
                                      sendMails[index].label = "받은편지함";
                                    }
                                     */
                                },
                                child: searchResults[index].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
                                    : const Icon(Icons.star, color: Colors.grey),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          );
        },
      ),
    );

  }
}