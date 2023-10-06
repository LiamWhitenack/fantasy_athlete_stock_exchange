import 'dart:core';
import 'test_athletes_list.dart';
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

  final List<String> athleteNames = popularAthletes;
  List<String> filteredAthleteNames = popularAthletes;
  Color? primaryColor = Colors.grey[300];
  void filterSearchResults(String query) {
    setState(() {
      filteredAthleteNames = athleteNames
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Dialog(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0.1),
            child: TextField(
              cursorColor: primaryColor,
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: editingController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: primaryColor,
                border: InputBorder.none,
                hoverColor: primaryColor,
                focusColor: primaryColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: FantasyAthleteStocksListView(
            names: filteredAthleteNames,
          ),
        ),
      ],
    );
  }
}
