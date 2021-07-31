import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech/cubit/cubit-page.dart';
import 'package:speech/cubit/cubit-state.dart';
import 'package:speech/shared/component/component.dart';

class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitPage, CubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = CubitPage.get(context).business;
        return allPagesUses(list, context);
      },
    );
  }
}
