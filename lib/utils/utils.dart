import 'package:flutter/material.dart';

// arquivo com métodos úteis variados...

class Utils {
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  // NAVEGAÇÃO

  // abre uma tela na pilha de exibição
  static Future push({BuildContext context, Object screen}) {
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
    Object argument, // objeto repassado para o destino da rota
  }) {
    return Navigator.of(context).pushNamed(
      route,
      arguments: argument,
    );
  }

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// XXXXX

}
