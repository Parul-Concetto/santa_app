import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_app/bloc/data_bloc/data_bloc.dart';
import 'package:santa_app/bloc/data_bloc/data_event.dart';
import 'package:santa_app/bloc/data_bloc/data_state.dart';
import 'package:santa_app/core/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///load data in list
    BlocProvider.of<DataBloc>(context).add(LoadDataEvent());
    return Scaffold(
      appBar: AppBar(title: const Text('Santa App'), centerTitle: true),
      body: BlocConsumer<DataBloc, DataState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
            itemCount: BlocProvider.of<DataBloc>(context).dataList.length,
            itemBuilder: (BuildContext context, int index) {
              final bloc = BlocProvider.of<DataBloc>(context).dataList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.add,
                      arguments: {'index': index, 'isEditPage': true});
                },
                child: ListTile(
                  title: Text(bloc.name, style: const TextStyle(fontSize: 20)),
                  subtitle: Row(
                    children: [
                      Text(bloc.country, style: const TextStyle(fontSize: 15)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(bloc.isNaughty ?? false ? 'Naughty' : 'Nice',
                          style: const TextStyle(fontSize: 15))
                    ],
                  ),
                  leading: Text(bloc.id.toString(),
                      style: const TextStyle(fontSize: 20)),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.add);
        },
      ),
    );
  }
}
