import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SettingsPage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingPage()),
                      );
                    },
                    child: Icon(Icons.settings,color: Colors.black54,))
            ),

            const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 78,
              foregroundImage: AssetImage('assets/images/img_1.png'),
            ),
            const SizedBox(height: 30),
            itemProfile('Name', 'Smita Patel', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '123467890', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'Gandhinagar, Gujarat', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile('Email', 'smitapatel@gmail.com', CupertinoIcons.mail),
            const SizedBox(height: 20,),
            SizedBox(

              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Colors.blue.shade800.withOpacity(0.3),
                  ),
                  child: const Text('Edit Profile',style: TextStyle(
                    color: Colors.white,
                  ),)
              ),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.blue.shade800.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),

      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}

