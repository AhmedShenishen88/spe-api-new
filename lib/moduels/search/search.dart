import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech/cubit/cubit-page.dart';
import 'package:speech/cubit/cubit-state.dart';
import 'package:speech/shared/component/component.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formField = TextEditingController();
    return BlocConsumer<CubitPage, CubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = CubitPage.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    CubitPage.get(context).getSearch(value);
                  },
                  controller: formField,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Text must not be Empty';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                    prefix: Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ),
                ),
                Expanded(child: allPagesUses(list, context, isSearch: true)),
              ],
            ),
          ),
        );
      },
    );
  }
}
