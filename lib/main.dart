import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeViewModel extends BaseViewModel {
  // 押した回数n
  int n = 1;

  void main() {
    n++;

    notifyListeners();
  }

  //fibonacciの計算関数
  int fibonacci(n) {
    return n < 2 ? n : (fibonacci(n - 1) + fibonacci(n - 2));
  }
}

class HomeView extends StatelessWidget {
  final String title;

  const HomeView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'This is the Fibonacci sequence:',
                    ),
                    Text(
                      '${viewModel.fibonacci(viewModel.n)}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  print(viewModel.fibonacci(viewModel.n));
                  viewModel.main();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ));
  }
}
