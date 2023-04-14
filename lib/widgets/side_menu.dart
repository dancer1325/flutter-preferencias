import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';

// SideMenu to navigate to different screens
class SideMenu extends StatelessWidget {
  const SideMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Allows scrolling
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          const _DrawerHeader(),

          ListTile(
            leading: const Icon( Icons.pages_outlined ),
            title: const Text('Home'),
            onTap: () {
              // Ways to navigate
              // 1. pop + pushNamed
              Navigator.pop(context);   // Required to close the drawer
              Navigator.pushNamed(context, HomeScreen.routerName );

              // 2. pushReplacementNamed
              // Overwrite the route directly
              Navigator.pushReplacementNamed(context, HomeScreen.routerName );
            },
          ),

          ListTile(
            leading: const Icon( Icons.people_outline ),
            title: const Text('People'),
            onTap: () {

            },
          ),

          ListTile(
            leading: const Icon( Icons.settings_outlined ),
            title: const Text('Settings'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsScreen.routerName );
            },
          ),


        ],
      ),
    );
  }
}

// Extract as a specific Widget
class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpg'),
          fit: BoxFit.cover
        )
      ),
    );
  }
}