import 'package:flutter/material.dart';
import 'package:santa_app/children_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<ChildrenModel> list = [
    ChildrenModel(id: 1, name: 'Joy', country: 'India', isNaughty: true),
    ChildrenModel(id: 2, name: 'Ritik', country: 'India', isNaughty: false),
    ChildrenModel(
        id: 3, name: 'Malvika', country: 'Afghanistan', isNaughty: true),
    ChildrenModel(id: 4, name: 'Ishan', country: 'Australia', isNaughty: true),
    ChildrenModel(
        id: 5, name: 'Moksh', country: 'Bangladesh', isNaughty: false),
    ChildrenModel(id: 6, name: 'Megha', country: 'India', isNaughty: true),
    ChildrenModel(id: 7, name: 'Nistha', country: 'India', isNaughty: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Santa App'), centerTitle: true),
      body: ListView.separated(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: ListTile(
              title:
                  Text(list[index].name, style: const TextStyle(fontSize: 20)),
              subtitle: Row(
                children: [
                  Text(list[index].country,
                      style: const TextStyle(fontSize: 15)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(list[index].isNaughty ?? false ? 'Naughty' : 'Nice',
                      style: const TextStyle(fontSize: 15))
                ],
              ),
              leading: Text(list[index].id.toString(),
                  style: const TextStyle(fontSize: 20)),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    child: Column(children: [

                    ]),
                  );
                });
          }),
    );
  }
}
/*
Container(
margin: const EdgeInsets.only(bottom: 10),
padding: const EdgeInsets.symmetric(horizontal: 60),
decoration: BoxDecoration(
color: Colors.grey.shade200,
borderRadius: BorderRadius.circular(20)),
height: 100,
width: MediaQuery.of(context).size.width,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
list[index].name,
style:
const TextStyle(fontSize: 20, color: Colors.black),
),
],
),
);*/
