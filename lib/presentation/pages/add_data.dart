import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_app/bloc/data_bloc/data_bloc.dart';
import 'package:santa_app/bloc/data_bloc/data_event.dart';
import 'package:santa_app/bloc/data_bloc/data_state.dart';
import 'package:santa_app/core/app_strings.dart';

class OpenDialog extends StatelessWidget {
  const OpenDialog({
    super.key,
    this.name,
    this.selectedOption = 1,
  });

  final TextEditingController? name;
  final int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataBloc, DataState>(
      listener: (context, state) {
        if (state is SuccessDataState) {
          Navigator.pop(context);
        }
        if (state is ErrorDataState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              '${state.errorMessage}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        final bloc = BlocProvider.of<DataBloc>(context);
        return Scaffold(
          appBar: AppBar(
              title: const Text(AppStrings.addInformation),
              centerTitle: true,
              elevation: 1),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(AppStrings.name),
                TextFormField(controller: bloc.nameController),
                const SizedBox(
                  height: 25,
                ),
                const Text(AppStrings.country),
                TextFormField(controller: bloc.countryController),
                const SizedBox(
                  height: 25,
                ),
                const Text(AppStrings.status),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: bloc.groupValue ?? 0,
                          onChanged: (value) {
                            bloc.add(ChangeStatusEvent(value: false));
                          },
                        ),
                        const Text(AppStrings.nice),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: bloc.groupValue ?? 0,
                          onChanged: (value) {
                            bloc.add(ChangeStatusEvent(value: true));
                          },
                        ),
                        const Text(AppStrings.naughty),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () => bloc.add(AddDataEvent()),
                      child: const Text(AppStrings.submit,
                          style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
