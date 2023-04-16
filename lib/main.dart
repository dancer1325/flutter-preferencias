import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/screens.dart';

import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

// void main() {
// main() can be asynchronous !!!!
void main() async {

  // Required to make work the initialization of the preferences
    WidgetsFlutterBinding.ensureInitialized();

    await Preferences.init();

    runApp(
        MultiProvider(      // Required in case you need several providers, which are state managers
          // Providers available in the Context --> to use in any Widget
          // Placing providers here --> they will be accessible globally
          providers: [
            //Preferences.isDarkmode             Required to pass the current isDarkMode value, not a default dummy one
            // ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode ))    Unnecessary new
            ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkmode: Preferences.isDarkmode )  )
          ],
          child: const MyApp(),
        )
    );
  }
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Impossible to initialize here Preferences, since build() is synchronous
    //await Preferences.init();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        // (_)    BuildContext, but since we don't need it here --> It's indicated as _
        HomeScreen.routerName    : ( _ ) => const HomeScreen(),
        SettingsScreen.routerName: ( _ ) => const SettingsScreen(),
      },
      //theme: Preferences.isDarkmode ? ThemeData.dark() : ThemeData.light(),     // SharedPreferences aren't a state manager
      // Get access to the ThemeProvider via context, casting to ThemeProvider
      // listen   By default, it's true.  Required for listening changes
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}