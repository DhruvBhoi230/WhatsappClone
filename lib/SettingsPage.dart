import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void chatListPressed() {
    print('chat list pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        "assets/images/profile 1.jpg",
                        height: 65,
                        width: 65,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "EALISA",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Hey there, I am using Whatsapp")
                            ]))
                  ],
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Icon(Icons.key),
                ),
                title: Text(
                  "Account",
                  style: TextStyle(fontSize: 17),
                ),
                subtitle: Text(
                  " security notification, chang number",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Icon(Icons.security),
                ),
                title: Text(
                  "Privacy",
                  style: TextStyle(fontSize: 17),
                ),
                subtitle: Text(
                  "Block contats, disappearing message",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Icon(Icons.emoji_emotions_sharp),
                ),
                title: Text(
                  "Avatar",
                  style: TextStyle(fontSize: 17),
                ),
                subtitle: Text(
                  "Create,edit,profile photo",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ExpansionTile(
                title: Text('Chat settings'),
                subtitle: Text(
                  "Theme,wallpapers,chat history",
                  style: TextStyle(fontSize: 15),
                ),
                children: <Widget>[
                  Column(
                    children: [
                      Switch(value: true, onChanged: (bool value) { },)
                    ],
                  ),
                ],
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Icon(Icons.notifications),
                ),
                title: Text(
                  "Notifications",
                  style: TextStyle(fontSize: 17),
                ),
                subtitle: Text(
                  "Message,group & call tones",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Icon(Icons.storage_sharp),
                ),
                title: Text(
                  "Storage and data",
                  style: TextStyle(fontSize: 17),
                ),
                subtitle: Text(
                  "Network usage, auto-downlod",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Icon(Icons.language),
                ),
                title: Text(
                  "App language",
                  style: TextStyle(fontSize: 17),
                ),
                subtitle: Text(
                  "English, Hindi(device's language)",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Icon(Icons.help_outline_outlined),
                ),
                title: Text(
                  "Help",
                  style: TextStyle(fontSize: 17),
                ),
                subtitle: Text(
                  "Help center,contact us,privacy police",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Icon(Icons.people_alt),
                ),
                title: Text(
                  "Invite a friend",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Icon(Icons.update),
                ),
                title: Text(
                  "App update",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Text(
                      "from",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Fecabook",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
