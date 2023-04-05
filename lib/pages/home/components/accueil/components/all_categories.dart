import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guichetier/pages/home/components/accueil/components/all_event.dart';

class AllCategories {
  final categories = [
    {
      'icon': CupertinoIcons.list_dash,
      'title': 'Tous',
    },
    {
      'icon': CupertinoIcons.music_albums,
      'title': 'Concert',
    },
    {
      'icon': Icons.stadium_outlined,
      'title': 'Foire',
    },
    {
      'icon': FontAwesomeIcons.crown,
      'title': 'Miss',
    },
    {
      'icon': Icons.ondemand_video,
      'title': 'Cinema',
    },
    {
      'icon': CupertinoIcons.sportscourt_fill,
      'title': 'Sport',
    },
  ];

  List homeBody = const [
    /// TOUS //////////////////////////////////////
    AllEvent(),
    ///////////////////////////////////////////////////////////
    /// CONCERT //////////////////////////////////////
    Text("Concert"),

    /// FOIRE //////////////////////////////////////
    Text("Foire"),

    /// MISS //////////////////////////////////////
    Text("Miss"),

    /// CINEMA //////////////////////////////////////
    Text("Cinema"),

    /// SPORT //////////////////////////////////////
    Text("Sport"),

    ///
  ];
}
