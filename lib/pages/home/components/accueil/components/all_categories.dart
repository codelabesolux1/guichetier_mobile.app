import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guichetier/pages/home/components/accueil/components/all_event.dart';
import 'package:guichetier/pages/home/components/accueil/components/custom_widget/custom_category_body.dart';

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
    CustomCategoryBody(categoryType: 'Concert'),

    /// FOIRE //////////////////////////////////////
    CustomCategoryBody(categoryType: "Foire"),

    /// MISS //////////////////////////////////////
    CustomCategoryBody(categoryType: "Miss"),

    /// CINEMA //////////////////////////////////////
    CustomCategoryBody(categoryType: "Cinema"),

    /// SPORT //////////////////////////////////////
    CustomCategoryBody(categoryType: "Sport"),

    ///
  ];
}
