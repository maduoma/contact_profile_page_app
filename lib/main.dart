import 'package:flutter/material.dart';

//App's entry point
void main() => runApp(const ContactProfilePage());

enum APP_THEME { LIGHT, DARK }

//Separate class to store themes
class MyAppThemes {
  //Light theme definition
  static ThemeData appThemeLight() {
    //Theme for app
    return ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.light,

      //Appbar theme
      appBarTheme: const AppBarTheme(
        color: Colors.purple,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      //Theme for icons
      iconTheme: IconThemeData(
        color: Colors.indigo.shade800,
      ),

      //Theme for FAB
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //White background
        backgroundColor: Colors.white,

        //Black plus (+) sign for FAB
        foregroundColor: Colors.black,
      ),
    );
  }

  //Dark theme definition
  static ThemeData appThemeDark() {
    //Theme for app
    return ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.dark,

      //Theme for AppBar
      appBarTheme: const AppBarTheme(
        color: Colors.black,

        //Theme for appBar's icons
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      //Theme for app's icons
      iconTheme: const IconThemeData(
        color: Colors.orange,
      ),

      //Theme for FAB
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //dark background for FAB
        backgroundColor: Colors.black,

        //White plus (+) sign for FAB
        foregroundColor: Colors.white,
      ),
    );
  }
// //Method to provide light theme
// static ThemeData appThemeLight() {
//   return ThemeData(
//     // Define the default brightness and colors for the overall app.
//     brightness: Brightness.light,
//
//     //Theme for app bar
//     appBarTheme: const AppBarTheme(
//       //AppBar's color
//       color: Colors.purple,
//       //Theme for AppBar's icons
//       iconTheme: IconThemeData(
//         //Dark color icons on light colored background
//         color: Colors.white,
//       ),
//     ),
//
//     //Theme for app's icons
//     iconTheme: IconThemeData(
//       color: Colors.indigo.shade800,
//     ),
//   );
// }
//
// //Method to provide dark theme
// static ThemeData appThemeDark() {
//   return ThemeData(
//     // Define the default brightness and colors for the overall app.
//     brightness: Brightness.dark,
//
//     //Theme for app bar
//     appBarTheme: const AppBarTheme(
//       //AppBar's background color is dark this time
//       color: Colors.black,
//
//       //Light color for the app bar's icons
//       iconTheme: IconThemeData(
//         color: Colors.white,
//       ),
//     ),
//
//     //App's icons are colored in orange color
//     iconTheme: const IconThemeData(
//       color: Colors.orange,
//     ),
//   );
// }
}

class ContactProfilePage extends StatefulWidget {
  const ContactProfilePage({Key? key}) : super(key: key);

  @override
  _ContactProfilePageState createState() => _ContactProfilePageState();
}

//App's main widget
class _ContactProfilePageState extends State<ContactProfilePage> {
  //NEW CODE
  var currentTheme = APP_THEME.LIGHT;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Removing debug banner
      debugShowCheckedModeBanner: false,

      //Applying theme based on the current selection.
      theme: currentTheme == APP_THEME.DARK
          ? MyAppThemes.appThemeDark()
          : MyAppThemes.appThemeLight(),

      //Applying theme to app calling MyAppThemes's method
      //theme: MyAppThemes.appThemeLight(),
      //theme: MyAppThemes.appThemeDark(),

      //theme property
      // theme: ThemeData(
      //   // Define the default brightness and colors for the overall app.
      //   brightness: Brightness.light,
      //   appBarTheme: const AppBarTheme(
      //     //Try a different color
      //     //color: Colors.white,
      //     color: Colors.purple,
      //     iconTheme: IconThemeData(
      //       color: Colors.white,
      //     ),
      //   ),
      //   iconTheme: IconThemeData(
      //     color: Colors.indigo.shade800,
      //   ),
      // ),

      //Scaffold widget as home
      home: Scaffold(
        //Creating app bar
        //appBar: buildAppBarWidget(),
        //Creating app bar
        appBar: AppBar(
          //Adding background color to AppBar
          //backgroundColor: Colors.purple,
          //backgroundColor: Colors.white,

          //Adding back arrow for leading property.
          //Back arrow appears at the top-left of AppBar
          leading: const Icon(
            Icons.arrow_back,
            //color: Colors.purple,
          ),
          actions: <Widget>[
            //Adding Star icon for favorting the contact.
            //This IconButton responds to user's tap,
            //and prints the message.
            IconButton(
              icon: const Icon(Icons.star_border),
              //color: Colors.black,
              onPressed: () {
                print("Contact is starred");
              },
            ),
          ],
        ),
        //Creating body part of the app
        body: buildBodyWidget(),
        //Code for FAB
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconButton(
            icon: const Icon(Icons.threesixty),
            onPressed: () {
              setState(() {
                //Currently selected theme toggles when FAB is pressed
                currentTheme == APP_THEME.DARK
                    ? currentTheme = APP_THEME.LIGHT
                    : currentTheme = APP_THEME.DARK;
              });
            },
          ),
        ),
      ),
    );
  }

  // //Provides app bar implementation
  // Widget buildAppBarWidget() {
  //   //appBar:
  //   //Giving error message: The argument type 'Widget' can't be assigned to the parameter type 'PreferredSizeWidget?'
  //   return AppBar(
  //     //Adding background color to AppBar
  //     //backgroundColor: Colors.purple,
  //     //backgroundColor: Colors.white,
  //
  //     //Adding back arrow for leading property.
  //     //Back arrow appears at the top-left of AppBar
  //     leading: const Icon(
  //       Icons.arrow_back,
  //       //color: Colors.purple,
  //     ),
  //     actions: <Widget>[
  //       //Adding Star icon for favorting the contact.
  //       //This IconButton responds to user's tap,
  //       //and prints the message.
  //       IconButton(
  //         icon: const Icon(Icons.star_border),
  //         //color: Colors.black,
  //         onPressed: () {
  //           print("Contact is starred");
  //         },
  //       ),
  //     ],
  //   );
  // }

  //Creating body part of the app
  Widget buildBodyWidget() {
    //body:
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            //Container for adding Profile picture//UserProfile SizedBox instead of Container
            SizedBox(
              //Container is stretched horizontally
              width: double.infinity,
              height: 250,
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
              //Applying local theme to profileActionItems()
              child: Theme(
                data: ThemeData(
                  //Applying iconTheme locally
                  iconTheme: const IconThemeData(
                    //NOTE: Try Colors.orange or a different color
                    color: Colors.pink,
                  ),
                ),
                child: profileActionItems(),
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
    );
  }

  //NOTE: Builds the action items widget //Builds custom action items widget
  Widget profileActionItems() {
    return Row(
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
    );
  }

  //Adding "Call" action item //Call button of action item widget
  Widget buildCallButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.call,
            //color: Colors.indigo.shade800,
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
          icon: const Icon(
            Icons.message,
            //color: Colors.indigo.shade800,
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
        icon: const Icon(
          Icons.video_call,
          //color: Colors.indigo.shade800,
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
        icon: const Icon(
          Icons.email,
          //color: Colors.indigo.shade800,
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
        icon: const Icon(
          Icons.directions,
          //color: Colors.indigo.shade800,
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
        icon: const Icon(
          Icons.attach_money,
          //color: Colors.indigo.shade800,
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
      title: const Text("234 Yoduloma St, PHC"),
      subtitle: const Text("home"),
      trailing: IconButton(
        icon: const Icon(Icons.directions),
        color: Colors.indigo.shade500,
        onPressed: () {},
      ),
    );
  }
}
