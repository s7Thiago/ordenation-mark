import 'package:flutter/widgets.dart';
import 'package:ordenation_mark/shared/providers/chart_provider.dart';

class InputProvider extends ChangeNotifier {
  int valorVetor = 0;
  int valorMedia = 0;

  void updateVetor(int newValor) {
    valorVetor = newValor;
    print(valorVetor);
    notifyListeners();
  }

  void updateMedia(int newValor) {
    valorMedia = newValor;
    print(valorMedia);
    notifyListeners();
  }
}
