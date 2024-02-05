import 'package:flutter/material.dart';
import 'package:flutter_base_project/app_resources/app_routes.dart';
import 'package:flutter_base_project/localization/app_localization.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('home')),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: AppLocalizations.of(context)!.translate('settings'),
            onPressed: () {
              Navigator.pushNamed(context, settingsScreen);
              // handle the press
            },
          ),
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.translate('hello_msg')),
      ),
    );
  }
}
