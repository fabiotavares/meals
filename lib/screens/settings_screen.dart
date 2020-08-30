import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

// tela que exibe as opções de configurações (filtros) disponíveis

class SettingsScreen extends StatefulWidget {
  // configuração do aplicativo que será passado por parâmetro
  final Settings settings;

  // função que irá ser chamada em Main quando uma configuração for alterada
  final Function (Settings) onSettingsChanged;

  // construtor
  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  Settings setting; //filtros da aplicação

  @override
  void initState() {
    super.initState();

    setting = widget.settings;
  }

  @override
  Widget build(BuildContext context) {
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
          // executa a função no main passando as configurações já atualizadas
          widget.onSettingsChanged(setting);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      // manter o menu para conseguir voltar (devido à substituição de tela)
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              // criação manual de cada elemento
              children: [
                _createSwitch(
                  'Sem Glúten',
                  'Só exibe refeições sem glúten',
                  setting.isGlutenFree,
                  (value) => setState(() => setting.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose',
                  setting.isLactoseFree,
                      (value) => setState(() => setting.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas',
                  setting.isVegan,
                      (value) => setState(() => setting.isVegan = value),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas',
                  setting.isVegetarian,
                      (value) => setState(() => setting.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
