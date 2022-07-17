import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatelessWidget {
  var attendee = TextEditingController();
  var email_address = TextEditingController();
  var twitter_account = TextEditingController();
  var github_account = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Badge Generator"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Attendee's Name"),
              controller: attendee,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Email address"),
              controller: email_address,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Twitter Account"),
              controller: twitter_account,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Github Account"),
              controller: github_account,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (attendee.text.isEmpty || email_address.text.isEmpty) {
                  const snackBar = SnackBar(
                    content: Text("Please fill in Name and Email"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (!twitter_account.text.contains("@")) {
                  const snackBar = SnackBar(
                    content: Text("Please add @ before your Twitter username"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (!email_address.text.contains("@gmail.com")) {
                  const snackBar = SnackBar(
                    content: Text("Please enter a valid email"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  Text("Scroll down for your image");
                }
              },
              child: Text("Create Badge")),
          ElevatedButton(
              onPressed: () {
                attendee.clear();
                email_address.clear();
                twitter_account.clear();
                github_account.clear();
              },
              child: Text("Cancel")),
          QrImage(
            data: "$attendee,$email_address,$twitter_account,$github_account",
            version: QrVersions.auto,
            size: 320,
            gapless: false,
          )
        ],
      ),
    );
  }
}
