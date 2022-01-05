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

      //theme property
      theme: ThemeData(
        // Define the default brightness and colors for the overall app.
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          //Try a different color
          //color: Colors.white,
          color: Colors.purple,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.indigo.shade800,
        ),
      ),

      //Scaffold widget as home
      home: Scaffold(
        appBar: AppBar(
          //Adding background color to AppBar
          //backgroundColor: Colors.purple,
          //backgroundColor: Colors.white,

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
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                //Container for adding Profile picture//UserProfile SizedBox instead of Container
                SizedBox(
                  //Container is stretched horizontally
                  width: double.infinity,
                  //Image is fetched from url
                  child: Image.network(
                    //"https://github.com/ptyagicodecamp/educative_flutter/raw/profile_1/assets/profile.jpg?raw=true",
                    "https://i.ibb.co/x3bqT0P/dodemy-Logo.jpg",
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                //Adding Display Name
                SizedBox(
                  height: 60,
                  child: Row(
                    //Aligning text to the start of the widget
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Dodemy Technology Ltd",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
                // Adding Divider below the display name
                const Divider(
                  color: Colors.grey,
                  height: 1.0,
                ),
                // Container for action items
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //"Call" action item
                      buildCallButton(),
                      //"Text" action item
                      buildTextButton(),
                      // "Video" action item
                      buildVideoCallButton(),
                      // "Email" action item
                      buildEmailButton(),
                      // "Directions" action item
                      buildDirectionsButton(),
                      // "Pay" action item
                      buildPayButton(),
                    ],
                  ),
                ),
                //Adding divider to separate action items from phone numbers
                const Divider(
                  color: Colors.grey,
                  height: 2.0,
                ),
                //Adding contact's phone numbers
                mobilePhoneListTile(),
                otherPhoneListTile(),
                //Adding `Divider` widget with grey color
                const Divider(
                  color: Colors.grey,
                  height: 3.0,
                ),
                //Email address item
                emailListTile(),
                // Divider to separate physical address
                const Divider(
                  color: Colors.grey,
                ),
                // Contact's home address item
                addressListTile(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Adding "Call" action item
  Widget buildCallButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.call,
            color: Colors.indigo.shade800,
          ),
          onPressed: () {},
        ),
        const Text("Call"),
      ],
    );
  }

  //Adding "Text" action item
  Widget buildTextButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.message,
            color: Colors.indigo.shade800,
          ),
          onPressed: () {},
        ),
        const Text("Text"),
      ],
    );
  }

  // Adding "Video Call" action item
  Widget buildVideoCallButton() {
    return Column(children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.video_call,
          color: Colors.indigo.shade800,
        ),
        onPressed: () {},
      ),
      const Text("Video Call"),
    ]);
  }

// Adding "Email" action item
  Widget buildEmailButton() {
    return Column(children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.email,
          color: Colors.indigo.shade800,
        ),
        onPressed: () {},
      ),
      const Text("Email"),
    ]);
  }

// Adding "Directions" action item
  Widget buildDirectionsButton() {
    return Column(children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.directions,
          color: Colors.indigo.shade800,
        ),
        onPressed: () {},
      ),
      const Text("Directions"),
    ]);
  }

// Adding "Pay" action item
  Widget buildPayButton() {
    return Column(children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.attach_money,
          color: Colors.indigo.shade800,
        ),
        onPressed: () {},
      ),
      const Text("Pay"),
    ]);
  }

  //Adding "Mobile Phone Number" item
  Widget mobilePhoneListTile() {
    return ListTile(
      leading: const Icon(Icons.call),
      title: const Text("330-803-3390"),
      subtitle: const Text("mobile"),
      trailing: IconButton(
        icon: const Icon(Icons.message),
        color: Colors.indigo.shade500,
        onPressed: () {},
      ),
    );
  }

  //Adding "Other Phone Number" item
  Widget otherPhoneListTile() {
    return ListTile(
      leading: const Text(""),
      title: const Text("440-440-3390"),
      subtitle: const Text("other"),
      trailing: IconButton(
        icon: const Icon(Icons.message),
        color: Colors.indigo.shade500,
        onPressed: () {},
      ),
    );
  }

  //Adding "Email Address" item
  Widget emailListTile() {
    return const ListTile(
      leading: Icon(Icons.email),
      title: Text("info@dodemy.com"),
      subtitle: Text("work"),
    );
  }

  //Adding Contact's home address
  Widget addressListTile() {
    return ListTile(
      leading: const Icon(Icons.location_on),
      title: const Text("234 Uduloma St, PHC"),
      subtitle: const Text("home"),
      trailing: IconButton(
        icon: const Icon(Icons.directions),
        color: Colors.indigo.shade500,
        onPressed: () {},
      ),
    );
  }
}
