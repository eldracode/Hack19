import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Wall',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
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

    animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -pi / 2), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: pi / 2, end: 0.0), weight: 0.5)
    ]).animate(animationController);

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
    });

    // animationController.forward();
  }

  _StartAnim() {
    if (!mounted) return;
    if (reversed) {
      _animationController.reverse();
      reversed = false;
    } else {
      _animationController.forward();
      reversed = true;
    }
  }

  _CardAnim() {
    if (!mounted) return;
    if (reversed) {
      animationController.reverse();
      reversed = false;
    } else {
      animationController.forward();
      reversed = true;
    }
  }

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Text('Login'),
          SizedBox(
            height: height / 3,
          ),
          Center(
            child: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) => Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(_animation.value),
                        child: IndexedStack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                      bottomRight: Radius.circular(15.0)),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    height: height / 2.5,
                                    width: 8 * width / 10,
                                    child: Column(
                                      children: <Widget>[
                                        TextField(
                                          autocorrect: false,
                                          controller: _emailController,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Email',
                                            labelText: 'Email',
                                            prefixIcon: Icon(Icons.email),
                                          ),
                                        ),
                                        AnimatedBuilder(
                                          animation: _animation,
                                          builder: (context, child) =>
                                              Transform(
                                                transform: Matrix4.identity()
                                                  ..setEntry(3, 2, 0.001)
                                                  ..rotateY(_animation.value),
                                                child: IndexedStack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    TextField(
                                                      autocorrect: false,
                                                      obscureText: true,
                                                      controller:
                                                          _passwordController,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  'Enter Password',
                                                              labelText:
                                                                  'Password',
                                                              prefixIcon: Icon(Icons
                                                                  .lock_outline),
                                                              suffix: InkWell(
                                                                child: Icon(Icons
                                                                    .visibility_off),
                                                                onTap: () {
                                                                  _StartAnim();
                                                                },
                                                              )),
                                                    ),
                                                    TextField(
                                                      autocorrect: false,
                                                      obscureText: false,
                                                      controller:
                                                          _passwordController,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  'Enter Password',
                                                              labelText:
                                                                  'Password',
                                                              prefixIcon: Icon(Icons
                                                                  .lock_outline),
                                                              suffix: InkWell(
                                                                child: Icon(Icons
                                                                    .visibility),
                                                                onTap: () {
                                                                  _StartAnim();
                                                                },
                                                              )),
                                                    )
                                                  ],
                                                  index: _animationController
                                                              .value <
                                                          0.5
                                                      ? 0
                                                      : 1,
                                                ),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20.0,
                                  left: 80.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: Container(
                                      color: Colors.blueAccent,
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
                                                animationController.value < 5
                                                    ? 'Login'
                                                    : 'Sign Up',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 20.0),
                                              ),
                                              Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          _CardAnim();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                      bottomLeft: Radius.circular(15.0)),
                                  child: Container(
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    height: height / 2.5,
                                    width: 8 * width / 10,
                                    child: Column(
                                      children: <Widget>[
                                        TextField(
                                          autocorrect: false,
                                          controller: _emailController,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Email',
                                            labelText: 'Email',
                                            prefixIcon: Icon(Icons.email),
                                          ),
                                        ),
                                        AnimatedBuilder(
                                          animation: _animation,
                                          builder: (context, child) =>
                                              Transform(
                                                transform: Matrix4.identity()
                                                  ..setEntry(3, 2, 0.001)
                                                  ..rotateY(_animation.value),
                                                child: IndexedStack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    TextField(
                                                      autocorrect: false,
                                                      obscureText: true,
                                                      controller:
                                                          _passwordController,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  'Enter Password',
                                                              labelText:
                                                                  'Password',
                                                              prefixIcon: Icon(Icons
                                                                  .lock_outline),
                                                              suffix: InkWell(
                                                                child: Icon(Icons
                                                                    .visibility_off),
                                                                onTap: () {
                                                                  _StartAnim();
                                                                },
                                                              )),
                                                    ),
                                                    TextField(
                                                      autocorrect: false,
                                                      obscureText: false,
                                                      controller:
                                                          _passwordController,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  'Enter Password',
                                                              labelText:
                                                                  'Password',
                                                              prefixIcon: Icon(Icons
                                                                  .lock_outline),
                                                              suffix: InkWell(
                                                                child: Icon(Icons
                                                                    .visibility),
                                                                onTap: () {
                                                                  _StartAnim();
                                                                },
                                                              )),
                                                    )
                                                  ],
                                                  index: _animationController
                                                              .value <
                                                          0.5
                                                      ? 0
                                                      : 1,
                                                ),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          index: animationController.value < 0.5 ? 0 : 1,
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
