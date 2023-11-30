import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_app/bloc/data_bloc/data_bloc.dart';
import 'package:santa_app/bloc/data_bloc/data_event.dart';
import 'package:santa_app/bloc/data_bloc/data_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc()..add(LoadDataEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Santa App'), centerTitle: true),
        body: BlocConsumer<DataBloc, DataState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state is LoadingDataState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemCount:
                        BlocProvider.of<DataBloc>(context).dataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          title: Text(
                              BlocProvider.of<DataBloc>(context)
                                  .dataList[index]
                                  .name,
                              style: const TextStyle(fontSize: 20)),
                          subtitle: Row(
                            children: [
                              Text(
                                  BlocProvider.of<DataBloc>(context)
                                      .dataList[index]
                                      .country,
                                  style: const TextStyle(fontSize: 15)),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                  BlocProvider.of<DataBloc>(context)
                                              .dataList[index]
                                              .isNaughty ??
                                          false
                                      ? 'Naughty'
                                      : 'Nice',
                                  style: const TextStyle(fontSize: 15))
                            ],
                          ),
                          leading: Text(
                              BlocProvider.of<DataBloc>(context)
                                  .dataList[index]
                                  .id
                                  .toString(),
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
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Column(children: []);
              },
            );
          },
        ),
      ),
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
