import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RealTimeUsers extends StatefulWidget {
  const RealTimeUsers({Key? key}) : super(key: key);

  @override
  State<RealTimeUsers> createState() => _RealTimeUsersState();
}

class _RealTimeUsersState extends State<RealTimeUsers> {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
  @override

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(

          body: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['full_name']),
                subtitle: Text(data['company']),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
