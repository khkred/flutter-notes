import 'package:vet_bookr/screens/list_pet.dart';
import 'package:flutter/material.dart';
class PrivacyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("At Vet Bookr, we take the privacy and security of pet owners ('Pet Parents') seriously. This Privacy Policy is designed to explain how we collect, use, and share information gathered through our mobile App Vet Bookr.. You agree to the terms and conditions of this Privacy Policy. Beyond the Privacy Policy, your use of the Services is also subject to our Terms of Service.", style: TextStyle(fontSize: 14)),
            Text("Information You Provide Us", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text("By submitting personal information relating to yourself, you represent that you have the authority to do so and to permit us to use the information by this Privacy Policy.", style: TextStyle(fontSize: 12)),
            Text("Pet Parent Registration Information:", style: TextStyle(fontSize: 13)),
            Text(" When you sign up for a Vet Bookr account as a Pet Parent, you provide us with information about yourself, including:", style: TextStyle(fontSize: 12)),
            Text("Name", style: TextStyle(fontSize: 12)),
            Text("Age", style: TextStyle(fontSize: 12)),
            Text("Address", style: TextStyle(fontSize: 12)),
            Text("Phone Number", style: TextStyle(fontSize: 12)),
            Text("Pet Information:", style: TextStyle(fontSize: 13)),
            Text("Pet characteristics (including but not limited to photo, name, breed, and allergy information and others.", style: TextStyle(fontSize: 12)),
            Text("Payment for Services and Purchase Information:",style: TextStyle(fontSize: 13)),
            Text("As a pet parent, each time you utilize the services of a veterinarian or clinic, you are to settle your dues as per the agreed terms of the service deliverer.", style: TextStyle(fontSize: 12)),
            Text("Vet Bookr is a free platform that connects you with the service provider and has no commercial benefit whatsoever.", style: TextStyle(fontSize: 12)),
            Text("Information We Collect Automatically From Your Use of Services", style: TextStyle(fontSize: 14),),
            Text("Vet Bookr is hosted on PlayStore and App Store. We urge you to read up on their privacy policies as this might apply in addition to the Vet Bookr Privacy Policy shared in this document.", style: TextStyle(fontSize: 12),),
            Text("How We Use Your Information", style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold)),

            ElevatedButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ListPets()));}, child: Text("Next"))

          ],
        ),
        ],
      ),
    );
  }
}
