import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var currentIndex;
  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 8,
      // fabLocation: BubbleBottomBarFabLocation.end, //new
      hasNotch: true, //new
      hasInk: true, //new, gives a cute ink effect
      inkColor: Colors.black12, //optional, uses theme color if not specified
      items: <BubbleBottomBarItem>[
        BubbleBottomBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
            title: Text("Home")),
        BubbleBottomBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(
              Icons.widgets,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.widgets,
              color: Colors.deepPurple,
            ),
            title: Text("Tags")),
      ],
    );
  }
}
