import 'package:flutter/material.dart';
import '../custCard.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CustCardImage(
              'https://cdn-images-1.medium.com/max/1400/1*dPBaUmLLxh_VS609q125DA.png',
              'Deep Dive into Hero Widget',
              'Deven Joshi',
              'https://medium.com/flutter-community/a-deep-dive-into-hero-widgets-in-flutter-d34f441eb026'),
          CustCardImage(
              'https://cdn-images-1.medium.com/max/800/0*K7Jj9ChznzVsIHJE.png',
              'Navigation using onGeneratedRoutes',
              'Phunsukh Wangdu',
              'https://medium.com/flutter-community/clean-navigation-in-flutter-using-generated-routes-891bd6e000df'),
          CustCardImage(
              'https://cdn-images-1.medium.com/max/800/1*-sXimkCot3rUFOHrYRbhSA.png',
              'Provider And Streams',
              'Aseem wangoo',
              'https://medium.com/flutterpub/flutter-provider-and-streams-33b401ebe28c'),
          CustCardImage(
              'https://cdn-images-1.medium.com/max/1400/1*dPBaUmLLxh_VS609q125DA.png',
              'Deep Dive into Hero Widget',
              'Deven Joshi',
              'https://medium.com/flutter-community/a-deep-dive-into-hero-widgets-in-flutter-d34f441eb026'),
        ],
      ),
    );
  }
}
