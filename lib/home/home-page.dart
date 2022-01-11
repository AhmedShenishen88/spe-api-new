import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech/cubit/cubit-page.dart';
import 'package:speech/cubit/cubit-state.dart';
import 'package:speech/cubit/cubitShare.dart';
import 'package:speech/moduels/search/search.dart';

// now we in home page
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitPage, CubitState>(
      //first Write BLocConsumer tat belong to base-Page cubit that has all get method to get all data
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
                    //Navigator to go the page search
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  //this iconButton for control if we want the page dark or light
                  onPressed: () {
                    CubitShareBl.get(context).changeThem();
                    //when we press on it we change the value from true to false ,or from false to true
                  },
                  icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: cubit.screens[
              cubit.currentScreen], //this for can Mobility from many screens
          bottomNavigationBar: BottomNavigationBar(
            // this for can Mobility from many icon in bottomNavigatorBar
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
