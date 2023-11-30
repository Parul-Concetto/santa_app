import 'package:flutter/material.dart';
import 'package:santa_app/core/app_strings.dart';
import 'package:santa_app/core/routes/app_routes.dart';
import 'package:santa_app/data/models/children_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<ChildrenModel> list = [
    const ChildrenModel(id: 1, name: 'Joy', country: 'India', isNaughty: true),
    const ChildrenModel(
        id: 2, name: 'Ritik', country: 'India', isNaughty: false),
    const ChildrenModel(
        id: 3, name: 'Malvika', country: 'Afghanistan', isNaughty: true),
    const ChildrenModel(
        id: 4, name: 'Ishan', country: 'Australia', isNaughty: true),
    const ChildrenModel(
        id: 5, name: 'Moksh', country: 'Bangladesh', isNaughty: false),
    const ChildrenModel(
        id: 6, name: 'Megha', country: 'India', isNaughty: true),
    const ChildrenModel(
        id: 7, name: 'Nistha', country: 'India', isNaughty: false),
  ];
  final TextEditingController name = TextEditingController();

  late final int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(AppStrings.santaApp),
          centerTitle: true,
          elevation: 1),
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
          return Divider(
            height: 1,
            thickness: 2,
            color: Colors.purple.shade50,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.add);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
