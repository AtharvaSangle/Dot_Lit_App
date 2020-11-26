import 'package:demoapp/widgets/spacing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            var signout = await auth.signOut();

            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          HomeButton(
            onTap: () {
              Navigator.pushNamed(context, '/post_home',
                  arguments: {'query': 'dl-current-affairs'});
            },
            label: 'Current Affairs',
            icon: Icon(
              Icons.face,
              color: Colors.red[500],
            ),
          ),
          HomeButton(
            onTap: () {
              Navigator.pushNamed(context, '/post_home',
                  arguments: {'query': 'dl-self-help'});
            },
            label: 'Self Help',
            icon: Icon(
              Icons.lightbulb,
              color: Colors.red[500],
            ),
          ),
          HomeButton(
            onTap: () {},
            label: 'Business',
            icon: FaIcon(
              FontAwesomeIcons.userTie,
              color: Colors.red[500],
            ),
          ),
          HomeButton(
            onTap: () {},
            label: 'Lists',
            icon: Icon(
              Icons.list,
              color: Colors.red[500],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  Function onTap;
  var icon;
  String label;

  HomeButton({this.label, this.icon, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: Row(
          children: [
            icon,
            addHorizontalSpacing(25.0),
            Text(
              label,
              style: TextStyle(fontSize: 19.0),
            ),
          ],
        ),
      ),
    );
  }
}
