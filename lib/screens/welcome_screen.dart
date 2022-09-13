import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/registration_screen.dart';
import 'package:my_app/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
//Animation settings start in WelcomeScreenState
class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //specify the duration of the animation in the controller
    controller = AnimationController(duration: Duration(seconds: 1),
    //specify that the WelcomeScreenState should act as the picker
    vsync: this,
    );
    //To animate from one color to another
    animation = ColorTween(begin:Colors.blueGrey,  end: Colors.white).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {

      });
      print(animation.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ColoTween is used here to change the color from grey to white when the page is first loaded
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                //using the typewriter text kit here
                TypewriterAnimatedTextKit(
                  text:['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black54

                  ),
                  speed: Duration(milliseconds: 200),
                  pause: Duration(microseconds: 1000),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonColor: Colors.lightBlueAccent,
              buttonText:'Log In',
              onPressedButton:(){Navigator.pushNamed(context, LoginScreen.id);
              },),
            RoundedButton(
              buttonColor: Colors.blueAccent,
              buttonText:'Register',
              onPressedButton:() {
                //Go to registration screen.
                Navigator.pushNamed(context, RegistrationScreen.id);

              },),

          ],
        ),
      ),
    );
  }
}

