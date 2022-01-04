import 'package:flutter/material.dart';

//App's entry point
void main() => runApp(const ContactProfilePage());
//App's main widget
class ContactProfilePage extends StatelessWidget {
  const ContactProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Removing debug banner
      debugShowCheckedModeBanner: false,
      //Scaffold widget as home
      home: Scaffold(
        appBar: AppBar(
          //Adding background color to AppBar
          backgroundColor: Colors.purple,

          //Adding back arrow for leading property.
          //Back arrow appears at the top-left of AppBar
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          actions: <Widget>[
            //Adding Star icon for favorting the contact.
            //This IconButton responds to user's tap,
            //and prints the message.
            IconButton(
              icon: const Icon(Icons.star_border),
              color: Colors.black,
              onPressed: () {
                print("Contact is starred");
              },
            ),
          ],
        ),
      ),
    );
  }
}
