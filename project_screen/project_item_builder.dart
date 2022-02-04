import 'package:flutter/material.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/screens/tache_screen/list_tache.dart';


class ProjectItemBuilder extends StatelessWidget {
  Project project;
  Function ontap;
  ProjectItemBuilder({ Key? key , required this.project,required this.ontap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
     // title: Text(project.titre)  ,
      subtitle: Text(
        "date fin: ${project.dateFin.toString()}"
        ),
        trailing:  Text(project.dateDebut.toString()),
      onTap: (){
        
        ontap(project: project,selectedScreen:ListTache.screenName);
      },
    );
  }
}