import 'package:flutter/material.dart';
import 'package:flutter_provider_example/change_notifier/provider_controller.dart';
import 'package:provider/provider.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({super.key});

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 2));
      context.read<ProviderController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Consumer<ProviderController>(
                  builder: (_, controller, __) {
                    print('Build controller.imgAvatar');
                  },
              ),*/
              Selector<ProviderController, String>(
                selector: (_, controller) => controller.imgAvatar,
                builder: (BuildContext _, imgAvatar, Widget? __) {
                  print('imgAvatar alterado');
                  return CircleAvatar(
                    backgroundImage: NetworkImage(imgAvatar),
                    radius: 80,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.name,
                    builder: (BuildContext _, name, Widget? __) {
                      print('name alterado');
                      return Text(name);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.birthDate,
                    builder: (BuildContext _, birthDate, Widget? __) {
                      print('birthDate alterado');
                      return Text(birthDate);
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ProviderController>().alterarNome();
                },
                child: Text('Alterar nome'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
