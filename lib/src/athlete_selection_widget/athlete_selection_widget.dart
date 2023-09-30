import 'package:fantasy_athlete_stock_exchange/src/sample_feature/sample_item.dart';
import 'package:fantasy_athlete_stock_exchange/src/sample_feature/sample_item_list_view.dart';
import 'package:flutter/material.dart';

class AthleteSelectionWidget extends StatefulWidget {

  const AthleteSelectionWidget({
    super.key,
  });

  @override
  State<AthleteSelectionWidget> createState() => _AthleteSelectionWidgetState();
}

class _AthleteSelectionWidgetState extends State<AthleteSelectionWidget> {
  TextEditingController editingController = TextEditingController();
  List<AthleteCard> athleteCards = const [AthleteCard(1), AthleteCard(2), AthleteCard(3)];
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = <String>[];
  void filterSearchResults(String query) {
    return
    setState(() {
      items = duplicateItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Dialog(
          child: TextField(
            onChanged: (value) {
              filterSearchResults(value);
            },
            controller: editingController,
            decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        Expanded(child: FantasyAthleteStocksListView(items: athleteCards,)),
      ],
    );
  }
}
