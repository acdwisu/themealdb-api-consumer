import 'package:flutter/material.dart';

class MealSearchField extends StatelessWidget {
  final Future<void> Function(String) onSearch;

  const MealSearchField({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                suffix: IconButton(
                  icon: const Icon(
                    Icons.clear,
                  ),
                  onPressed: () {
                    controller.clear();
                  },
                ),
                isDense: true,
                hintText: 'Search meal here...'
              ),
            ),
          ),
          InkWell(
            child: const Icon(
              Icons.search
            ),
            onTap: () {
              if(controller.text.isNotEmpty) {
                FocusManager.instance.primaryFocus?.unfocus();

                onSearch(controller.text).then((value) => controller.clear());
              }
            },
          )
        ],
      ),
    );
  }
}
