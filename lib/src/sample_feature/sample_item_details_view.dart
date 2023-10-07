import 'package:flutter/material.dart';

/// Displays detailed information about a AthleteCard.
class AthleteDetailsView extends StatelessWidget {
  const AthleteDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    final Map arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments["name"]),
      ),
      body: Center(
        child: Text('More Information Here ${arguments["league"]}'),
      ),
    );
  }
}
