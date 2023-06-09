import '../models/settings.dart';
import 'package:flutter/material.dart';
import '../components/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settingsWidget;

  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settingsWidget, this.onSettingsChanged, {Key? key})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settingsWidget;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Gluten',
                  'Só exibe refeições sem gluten',
                  settings!.isGlutenFree,
                  (value) => setState(() => settings?.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose',
                  settings!.isLactoseFree,
                  (value) => setState(() => settings?.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas',
                  settings!.isVegan,
                  (value) => setState(() => settings?.isVegan = value),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas',
                  settings!.isVeggie,
                  (value) => setState(() => settings?.isVeggie = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
