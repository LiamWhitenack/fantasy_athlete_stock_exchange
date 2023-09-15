import 'package:flutter/material.dart';

/// Displays detailed information about a AthleteCard.
class AthleteCardDetailsView extends StatelessWidget {
  const AthleteCardDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
