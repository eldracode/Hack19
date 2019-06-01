import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustCardImage extends StatelessWidget {
  var url;
  var title;
  var author;
  var _url;
  CustCardImage(this.url, this.title, this.author, this._url);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 3,
          width: 0.9 * MediaQuery.of(context).size.width,
          child: new Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4 - 30,
                //child: Image.network(url),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.cover),
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('By $author'),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.favorite_border),
                      ],
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
