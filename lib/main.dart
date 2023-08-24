import 'package:flutter/material.dart';
import 'package:flutter_provider_example/change_notifier/change_notifier_page.dart';
import 'package:flutter_provider_example/provider/provider_page.dart';
import 'package:flutter_provider_example/provider/user_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        return UserModel(
            name: 'Guilherme Potter Petry',
            imgAvatar: 'https://docs.flutter.dev/assets/images/dash/early-dash-sketches5.jpg',
            birthDate: '05/07/1993');
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/provider': (_) => const ProviderPage(),
          '/change_notifier': (_) => const ChangeNotifierPage(),
        },
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/provider');
                      },
                      child: Text('Provider'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/change_notifier');
                      },
                      child: Text('Change Notifier'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
