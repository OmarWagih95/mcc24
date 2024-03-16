import 'package:MCC/generated/l10n.dart';
import 'package:MCC/model/category.dart';
import 'package:flutter/material.dart';
import 'Services.dart';

List<Category> DUMMY_CATEGORIES_(BuildContext context) {
  return [
    Category(
      id: '1',
      title: S.of(context).General_contracting,
      color: Color.fromARGB(255, 222, 206, 223),
      LogoimgURL: "img/balloning.png",
    ),
    Category(
      id: '2',
      title: S.of(context).General_maintenance_and_renovation,
      color: Color.fromARGB(255, 232, 213, 211),
      LogoimgURL: "img/hiking.png",
    ),
    Category(
      id: '3',
      title: S.of(context).General_interior_design_and_finishes,
      color: Color.fromARGB(255, 214, 207, 196),
      LogoimgURL: "img/balloning.png",
    ),
    Category(
      id: '4',
      title: S.of(context).General_contracting,
      color: Color.fromARGB(255, 233, 207, 238),
      LogoimgURL: "img/snorkling.png",
    ),
    Category(
      id: '5',
      title: S.of(context).General_maintenance_and_renovation,
      color: Color.fromARGB(255, 212, 182, 179),
      LogoimgURL: "img/hiking.png",
    ),
    Category(
      id: '6',
      title: S.of(context).General_interior_design_and_finishes,
      color: Color.fromARGB(255, 189, 186, 179),
      LogoimgURL: "img/kayaking.png",
    ),
  ];
}

List<Services> DummyServices = [
  Services(
    id: "1",
    name: 'Electrical Works',
    Logoimg: "img/snorkling.png",
    img: "img/mmcassits/1.jpg",
    title: "title",
    subtitle: "subtitle",
    description: ["description", "description", "description", "description"],
    HowItsWork: ["HowItsWork", "HowItsWork", "HowItsWork", "HowItsWork"],
  ),
  Services(
    id: "1",
    name: 'Carpentar Works',
    Logoimg: "img/kayaking.png",
    img: "img/mmcassits/1.jpg",
    title: "title",
    subtitle: "subtitle",
    description: ["description", "description", "description", "description"],
    HowItsWork: ["HowItsWork", "HowItsWork", "HowItsWork", "HowItsWork"],
  ),
  Services(
    id: "2",
    name: 'Maintainance works',
    Logoimg: "img/hiking.png",
    img: "img/mmcassits/1.jpg",
    title: "title",
    subtitle: "subtitle",
    description: ["description,description,description,description"],
    HowItsWork: ["HowItsWork", "HowItsWork", "HowItsWork", "HowItsWork"],
  ),
  Services(
    id: "3",
    name: 'decoration Works',
    Logoimg: "img/balloning.png",
    img: "img/mmcassits/1.jpg",
    title: "title",
    subtitle: "subtitle",
    description: ["description,description,description,description"],
    HowItsWork: ["HowItsWork", "HowItsWork", "HowItsWork", "HowItsWork"],
  ),
];
List<Services> DummyServices_ar = [
  Services(
    id: "1",
    name: 'Electrical Works',
    Logoimg: "img/snorkling.png",
    img: "img/mmcassits/1.jpg",
    title: "title",
    subtitle: "subtitle",
    description: ["description", "description", "description", "description"],
    HowItsWork: ["HowItsWork", "HowItsWork", "HowItsWork", "HowItsWork"],
  ),
  Services(
    id: "1",
    name: 'Carpentar Works',
    Logoimg: "img/kayaking.png",
    img: "img/mmcassits/1.jpg",
    title: "title",
    subtitle: "subtitle",
    description: ["description", "description", "description", "description"],
    HowItsWork: ["HowItsWork", "HowItsWork", "HowItsWork", "HowItsWork"],
  ),
  Services(
    id: "2",
    name: 'Maintainance works',
    Logoimg: "img/hiking.png",
    img: "img/mmcassits/1.jpg",
    title: "title",
    subtitle: "subtitle",
    description: ["description,description,description,description"],
    HowItsWork: ["HowItsWork", "HowItsWork", "HowItsWork", "HowItsWork"],
  ),
  Services(
    id: "3",
    name: 'decoration Works',
    Logoimg: "img/balloning.png",
    img: "img/mmcassits/1.jpg",
    title: "title",
    subtitle: "subtitle",
    description: ["description,description,description,description"],
    HowItsWork: ["HowItsWork", "HowItsWork", "HowItsWork", "HowItsWork"],
  ),
];
