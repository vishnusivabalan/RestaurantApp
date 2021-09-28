


import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration (
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.greenAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg"
                ),
        ),
              decoration: BoxDecoration(
            color: Colors.transparent,
              ),
                accountName: Text("TestName"),
                accountEmail: Text("testid@gmail.com")),
            ListTileWidget(title: "Order", iconName: Icons.border_color),
            ListTileWidget(title: "Address", iconName: Icons.bookmark),
            ListTileWidget(title: "Helps", iconName: Icons.help),
            ListTileWidget(title: "Notifications", iconName: Icons.notifications),
            ListTileWidget(title: "About", iconName: Icons.account_box),
          ],
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  String title;
  IconData iconName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(5),
        ),
          child: Icon(iconName, color: Colors.white,)),
      title: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
    );
  }

  ListTileWidget({required this.title, required this.iconName, });
}
