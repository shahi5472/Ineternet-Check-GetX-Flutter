import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_check_flutter/network/controller/NetworkController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final NetworkController networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet check with GetX'),
      ),
      body: Container(
        child: Center(
          child: Obx(
            () => Text(
              '${networkController.connectionStatus.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ),
    );
  }
}
