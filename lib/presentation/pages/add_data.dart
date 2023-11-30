import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            AppStrings.addInformation,
          ),
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
            TextFormField(controller: name),
            const SizedBox(
              height: 25,
            ),
            const Text(AppStrings.country),
            TextFormField(controller: name),
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
                      value: 1,
                      groupValue: selectedOption,
                      onChanged: (value) {},
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
                      value: 2,
                      groupValue: selectedOption,
                      onChanged: (value) {},
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
                  onPressed: () {},
                  child: const Text(AppStrings.submit,
                      style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
