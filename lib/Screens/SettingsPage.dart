import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool valueFirst = true;
  bool valueSecond = false;
  bool valueThird = false;
  bool valueFour = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800.withOpacity(0.3),
        centerTitle: true,
        title: Text("Settings",style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Card(
                color: Colors.lightBlue.shade50,
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    children: [
                      buildSettingButton(
                        label: 'Change Username',
                        icon: Icons.person,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Change Username"),
                              content: TextFormField(
                                onChanged: (value) {
                                  print(value);
                                },
                                decoration: InputDecoration(
                                  labelText: 'New Username',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.blueGrey,),
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: const Text('Cancel',
                                  style: TextStyle(
                                    color: Colors.black54
                                  ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'UPDATE');
                                  },
                                  child: const Text('UPDATE',
                                    style: TextStyle(
                                        color: Colors.black54
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 6),
                      buildSettingButton(
                        label: 'Change Password',
                        icon: Icons.lock,
                        onPressed: () {
                          // Add functionality for Change Password button
                        },
                      ),
                      const SizedBox(height: 6),
                      buildSettingButton(
                        label: 'Change Info',
                        icon: Icons.info,
                        onPressed: () {
                          // Add functionality for Change Info button
                        },
                      ),
                      const SizedBox(height: 6),
                      buildSettingButton(
                        label: 'Change Phone Number',
                        icon: Icons.phone,
                        onPressed: () {
                          // Add functionality for Change Phone Number button
                        },
                      ),
                      const SizedBox(height: 6),
                      buildSettingButton(
                        label: 'Contact Us',
                        icon: Icons.mail,
                        onPressed: () {
                          // Add functionality for Contact Us button
                        },
                      ),
                      const SizedBox(height: 6),
                      buildSettingButton(
                        label: 'About App',
                        icon: Icons.info_outline,
                        onPressed: () {
                          // Add functionality for About App button
                        },
                      ),
                      const SizedBox(height: 6),
                      buildSettingButton(
                        label: 'Rate Us',
                        icon: Icons.star,
                        onPressed: () {
                          // Add functionality for Rate Us button
                          showRatingDialog(context);
                        },
                      ),
                      const SizedBox(height: 6),
                      buildSettingButton(
                        label: 'Change Language',
                        icon: Icons.language,
                        onPressed: () {
                          // Add functionality for Change Language button
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      //headerAnimationLoop: false,
                      animType: AnimType.topSlide,
                      title: 'Warning',
                      desc: 'Are you sure you want to Sign out',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade600,
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSettingButton({required String label, required IconData icon, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800.withOpacity(0.3)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Icon(icon,color: Colors.black54,),
          ],
        ),
      ),
    );
  }

  void showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => RatingDialog(
        showCloseButton: true,
        image: Image.asset('assets/images/appicon1.png',alignment: Alignment.center),
        title: Text(
          "Rate this App",
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
        submitButtonText: "SUBMIT",
        onCancelled: () => print("cancelled"),
        onSubmitted: (response) {
          print("rating: ${response.rating}");
        },
      ),
    );
  }

}
