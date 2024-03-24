import 'package:flutter/material.dart';
import 'package:gdsc_app/src/theme/theme_changer.dart';
import 'package:provider/provider.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          'Select Your Theme',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: Text(
                'Light Mode',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text(
                'Dark Mode',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text(
                'System Mode',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
        ],
      ),
    );
  }
}
