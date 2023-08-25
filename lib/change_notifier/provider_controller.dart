import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String name = 'Sem nome';
  String imgAvatar = 'Sem imagem';
  String birthDate = 'Sem data';

  void alterarDados() {
    name = 'Guilherme Potter Petry';
    imgAvatar = 'https://docs.flutter.dev/assets/images/dash/early-dash-sketches5.jpg';
    birthDate = '05/07/1993';
    notifyListeners();
  }

  void alterarNome() {
    name = 'Guilherme ADF';
    notifyListeners();
  }
}
