import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/features/firestore/fruit_model.dart';
import 'package:flutter/material.dart';

class FirestoreDemoPage extends StatefulWidget {
  const FirestoreDemoPage({Key? key}) : super(key: key);

  @override
  State<FirestoreDemoPage> createState() => _FirestoreDemoPageState();
}

class _FirestoreDemoPageState extends State<FirestoreDemoPage> {
  List<FruitModel> fruits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FireStore Demo'),
        actions: [
          TextButton(
            onPressed: () {
              _loadData();
            },
            child: const Text(
              'Load data',
              style: TextStyle(color: Color.fromARGB(255, 54, 27, 27)),
            ),
          ),
          TextButton(
            onPressed: () {
              _getUser();
            },
            child: const Text(
              'Get user',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: fruits.length,
            itemBuilder: (context, index) {
              final fruit = fruits[index];
              // if (index == 0) {
              //   return const Text('This is the first data');
              // }
              return ListTile(
                title: Text(fruit.type),
                trailing: Text(fruit.quantity.toString()),
                subtitle: Text(index.toString()),
              );
            },
          )
        ],
      ),
    );
  }

  void _loadData() async {
    // Testing for local data
    // setState(() {
    //   fruits.addAll([FruitModel(24, 'banana')]);
    // });
    // return;

    // Load data from Firestore
    final db = FirebaseFirestore.instance;
    final results = await db.collection("fruits").get();
    print(results.docs.length);

    fruits = results.docs
        .map(
          (e) => FruitModel(
            e.data()['quantity'],
            e.data()['type'],
          ),
        )
        .toList();

    for (var doc in results.docs) {
      print("${doc.id} => ${doc.data()}");
    }

    setState(() {});
  }

  void _getUser() async {
    final db = FirebaseFirestore.instance;
    final results = await db.collection("users").doc('gsmiCgKFTcNZPmr8S2cT9r06NqI3').get();

    print(results.data());

    setState(() {});
  }

  // Future<int> calculate() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   return 3 + 1;
  // }
}
