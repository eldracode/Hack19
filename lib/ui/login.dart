import 'package:flutter/material.dart';
import 'dart:math';

import 'home.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  Animation<double> animation, delayed, _animation;
  bool reversed = false;
  AnimationController animationController, _animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    animation = Tween<double>(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayed = Tween<double>(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      parent: animationController,
    ));

    _animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -pi / 2), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: pi / 2, end: 0.0), weight: 0.5)
    ]).animate(_animationController);

    animation.addStatusListener((status) {
      print(status);

      // if (status == AnimationStatus.completed)
      //   animationController.reverse();
      // else if (status == AnimationStatus.dismissed)
      //   animationController.forward();
    });
    // animationController.forward();
  }

  _doAnim() {
    if (!mounted) return;
    if (reversed) {
      _animationController.reverse();
      reversed = false;
    } else {
      _animationController.forward();
      reversed = true;
    }
  }

  _showModalSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            elevation: 3.0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width / 1.2,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    color: Colors.white.withOpacity(animation.value + 1),
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              hintText: 'Enter Email',
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: _textController,
                          obscureText: T,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                            suffix: InkWell(
                              child: ico,
                              onTap: () {
                                print("obscure tfield");
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            color: Colors.lightBlue,
                            height: 40.0,
                            width: 140.0,
                            //  color: Colors.green,
                            child: InkWell(
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 13.0,
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  bool T = true;

  Icon ico = Icon(
    Icons.visibility_off,
    color: Colors.green,
  );

  bool isKgSeleced = true;

  var textController = TextEditingController();
  var emailController = TextEditingController();

  var _textController = TextEditingController();
  var _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            //  bottomSheet: _showModalSheet(),
            backgroundColor: Color(0xFF2C2B3C),
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 80.0,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          Text(
                            '  Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 55.0),
                          ),
                          Text(
                            '.',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 70.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Transform(
                          transform: Matrix4.translationValues(
                              animation.value *
                                  MediaQuery.of(context).size.width,
                              0.0,
                              0.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2.5,
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  color: Colors.white
                                      .withOpacity(animation.value + 1),
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                            hintText: 'Enter Email',
                                            labelText: 'Email',
                                            labelStyle: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      AnimatedBuilder(
                                        animation: _animation,
                                        builder: (context, child) => Transform(
                                              alignment: Alignment.center,
                                              transform: Matrix4.identity()
                                                ..setEntry(3, 2, 0.001)
                                                ..rotateY(_animation.value),
                                              child: IndexedStack(
                                                children: <Widget>[
                                                  TextFormField(
                                                    controller: textController,
                                                    obscureText: T,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Enter Password',
                                                      labelText: 'Password',
                                                      labelStyle: TextStyle(
                                                        color: Colors
                                                            .lightBlueAccent,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      suffix: InkWell(
                                                        child: ico,
                                                        onTap: () {
                                                          print(
                                                              "obscure tfield");
                                                          _doAnim();
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller: textController,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Enter Password',
                                                      labelText: 'Password',
                                                      labelStyle: TextStyle(
                                                        color: Colors
                                                            .lightBlueAccent,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      suffix: InkWell(
                                                        child: Icon(
                                                          Icons.visibility,
                                                          color: Colors
                                                              .lightBlueAccent,
                                                        ),
                                                        onTap: () {
                                                          _doAnim();
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                alignment: Alignment.center,
                                                index:
                                                    _animationController.value <
                                                            0.5
                                                        ? 0
                                                        : 1,
                                              ),
                                            ),
                                      ),
                                      SizedBox(
                                        height: 50.0,
                                      ),
                                      Container(
                                        width: 100.0,
                                        height: 20.0,
                                        alignment: Alignment.center,
                                        child: InkWell(
                                            onTap: () {
                                              _showModalSheet();
                                            },
                                            child: Text(
                                              'Register',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Oxygen',
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: -20.0,
                            left: 80.0,
                            child: Transform(
                              transform: Matrix4.translationValues(
                                  -1 *
                                      delayed.value *
                                      MediaQuery.of(context).size.width,
                                  0.0,
                                  0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  color: Colors.lightBlue,
                                  height: 40.0,
                                  width: 140.0,
                                  //  color: Colors.green,
                                  child: InkWell(
                                    child: Center(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Login',
                                            style: TextStyle(
                                                color: Colors.white,
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                            size: 13.0,
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) => Home()));
                                    },
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          0.0,
                          -1.0 *
                              delayed.value *
                              MediaQuery.of(context).size.height,
                          0.0),
                      child: Container(
                        child: Text(
                          'Or Login with',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Transform(
                          transform: Matrix4.translationValues(
                              animation.value *
                                  MediaQuery.of(context).size.height,
                              0.0,
                              0.0),
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            child: Image.network(
                                'https://cdn4.iconfinder.com/data/icons/new-google-logo-2015/400/new-google-favicon-512.png'),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Transform(
                          transform: Matrix4.translationValues(
                              -1.0 *
                                  animation.value *
                                  MediaQuery.of(context).size.height,
                              0.0,
                              0.0),
                          child: Container(
                            height: 45.0,
                            width: 45.0,
                            child: Image.network(
                                'http://www.logospng.com/images/125/facebook-logos-vector-eps-ai-cdr-svg-free-download-125682.png'),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
