import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';
import 'package:intl/intl.dart';

/// Displays a list of AthleteCards.
class AthleteCardListView extends StatelessWidget {
  const AthleteCardListView({
    super.key,
    this.items = const [AthleteCard(1), AthleteCard(2), AthleteCard(3)],
  });

  static const routeName = '/';

  final List<AthleteCard> items;

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
      body: FantasyAthleteStocksListView(items: items),
    );
  }
}

class FantasyAthleteStocksListView extends StatelessWidget {
  const FantasyAthleteStocksListView({
    super.key,
    required this.items,
  });

  final List<AthleteCard> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Providing a restorationId allows the ListView to restore the
      // scroll position when a user leaves and returns to the app after it
      // has been killed while running in the background.
      restorationId: 'AthleteCardListView',
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];

        return ListTile(
          title: Text('${item.id}'),
          onTap: () {
            // Navigate to the details page. If the user leaves and returns to
            // the app after it has been killed while running in the
            // background, the navigation stack is restored.
            Navigator.restorablePushNamed(
              context,
              AthleteCardDetailsView.routeName,
            );
          }
        );
      },
    );
  }
}
