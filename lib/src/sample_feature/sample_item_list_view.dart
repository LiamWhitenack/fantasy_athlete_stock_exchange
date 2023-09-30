import 'package:fantasy_athlete_stock_exchange/src/line_charts/line_chart_sample.dart';
import 'package:flutter/material.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

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
    return FantasyAthleteStocksListView(items: items);
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
          trailing: const SizedBox(width: 66, height: 20, child: LineChartSample()),
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
