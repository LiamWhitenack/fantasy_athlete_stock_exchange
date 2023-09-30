import 'package:fantasy_athlete_stock_exchange/src/athlete_selection_widget/athlete_selection_widget.dart';
import 'package:fantasy_athlete_stock_exchange/src/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppBody extends StatelessWidget {
  const AppBody({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.black,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Athletes", style: TextStyle(color: Colors.white),),
            Text(DateFormat('MMMM d').format(DateTime.now()), style: const TextStyle(color: Colors.white54),),
          ],
        ),
        
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.blue),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: const AthleteSelectionWidget()
    );
  }
}
