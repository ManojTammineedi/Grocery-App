import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/Auth/UnderConstruction.dart';

class AccountSettingsScreen extends StatefulWidget {
  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  bool showProgressIndicator = false;

  Future<void> _handleLogout() async {
    await signUserOut();
    Navigator.pop(context); // Close the drawer
  }

  Future<void> signUserOut() async {
    setState(() {
      showProgressIndicator = true;
    });

    await Future.delayed(Duration(seconds: 2)); // Introduce a 2-second delay

    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Sign out error: $e");
    } finally {
      setState(() {
        showProgressIndicator = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Account Settings',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true, // Center the title
        backgroundColor: Colors.white, // Set AppBar color to blue
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            AccountSettingsTile(
              title: 'Notification Settings',
              icon: Icons.notifications,
              iconColor: Colors.orange,
              onTap: () {
                // Add your logic for Notification Settings here
              },
            ),
            AccountSettingsTile(
              title: 'Update Profile',
              icon: Icons.person,
              iconColor: Colors.green,
              onTap: () {
                // Add your logic for Update Profile here
              },
            ),
            AccountSettingsTile(
              title: 'Change Password',
              icon: Icons.lock,
              iconColor: Colors.purple,
              onTap: () {
                // Add your logic for Change Password here
              },
            ),
            AccountSettingsTile(
              title: 'Contact Us',
              icon: Icons.contact_mail,
              iconColor: Colors.red,
              onTap: () {
                // Add your logic for Contact Us here
              },
            ),
            Divider(),
            AccountSettingsTile(
              title: 'Delete Account',
              icon: Icons.delete,
              iconColor: Colors.grey,
              onTap: () {
                // Add your logic for Delete Account here
              },
              textColor: Colors.red,
            ),
            AccountSettingsTile(
              title: 'Logout',
              icon: Icons.logout,
              iconColor: Colors.red,
              onTap: () {
                _handleLogout();
                // Add your logic for Logout here
              },
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class AccountSettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function onTap;
  final Color textColor;

  const AccountSettingsTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
          fontFamily: 'Poppins-Medium',
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
