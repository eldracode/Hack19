import "package:flutter/material.dart";
import 'package:flutter_wall/ui/tag.dart';
import '../bottomBar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'feed.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> wid = [
    FeedPage(),
    TagPage(),
  ];
  var currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.white,
          leading: Image.asset("images/img.png", width: 40, height: 40),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Flutter Community",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ))),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
              currentIndex = index;
            }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Feed'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.widgets),
              title: Text('Tags'),
              activeColor: Colors.blue),
        ],
      ),
      body: currentIndex == 0 ? wid.elementAt(0) : wid.elementAt(1),
      endDrawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Suyash Purwar"),
            accountEmail: Text("suyashpurwar4035@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child:
                  Image.asset("images/avataaars.png", width: 200, height: 200),
            ),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Edit Profile"),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 25.0,
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
