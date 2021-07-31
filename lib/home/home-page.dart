import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech/cubit/cubit-page.dart';
import 'package:speech/cubit/cubit-state.dart';
import 'package:speech/cubit/cubitShare.dart';
import 'package:speech/moduels/search/search.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitPage, CubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CubitPage.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    CubitShareBl.get(context).changeThem();
                  },
                  icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: cubit.screens[cubit.currentScreen],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentScreen,
            items: cubit.item,
            onTap: (index) {
              cubit.changeScreen(index);
            },
          ),
        );
      },
    );
  }
}
