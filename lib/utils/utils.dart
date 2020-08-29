import 'package:flutter/material.dart';

import 'app_routes.dart';

// arquivo com métodos úteis variados...

class Utils {
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  // NAVEGAÇÃO

  // abre uma tela na pilha de exibição
  static Future push({BuildContext context, Object screen}) {
    Utils.pushNamed(context: context, route: AppRoutes.HOME);
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext ctx) {
        return screen;
      }),
    );
  }

  // outra opção para abrir uma tela, por meio de rota nomeada
  static Future pushNamed({
    BuildContext context,
    String route,
    Object argument = null, // objeto repassado para o destino da rota
  }) {
    return Navigator.of(context).pushNamed(
      route,
      arguments: argument,
    );
  }

  // outra opção para abrir uma tela, substituindo a tela que chamou
  // neste caso não há empilhamento
  static Future pushReplacementNamed({
    BuildContext context,
    String route,
    Object argument = null, // objeto repassado para o destino da rota
  }) {
    return Navigator.of(context).pushReplacementNamed(
      route,
      arguments: argument,
    );
  }

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// XXXXX

}
