import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:projects3/src/daos/user_dao.dart';
import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/project_dao.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/screens/project_screen/create_project_screen.dart';
import 'package:projects3/src/screens/project_screen/project_item_builder.dart';

import 'package:intl/intl.dart';

class ListProject extends StatelessWidget {
  static const String screenName = 'listProject';
  final DateFormat _dateFormatter = DateFormat("MMM dd, yyyy");

  
  Function changeScreen;
  ListProject({Key? key, required this.changeScreen}) : super(key: key);

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('les Projet'),
      ),
      body: FutureBuilder<List<Project>>(
          future: ProjectDao.getUserProject(Auth.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty)
                return Center(
                  child: Text('pas de project '),
                );
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ProjectItemBuilder(
                        ontap: changeScreen,
                        project: snapshot.data![index],
                      ));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
          elevation: 8.0,
          child: Icon(Icons.add),
          onPressed: () {
            {
              changeScreen(selectedScreen: CreateProjectScreen.screenName);
            }
          }),
    );
  }
}
