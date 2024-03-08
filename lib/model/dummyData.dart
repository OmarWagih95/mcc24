import 'package:androidstudiommc/model/category.dart';
import 'package:flutter/material.dart';
import 'Services.dart';

const DUMMY_CATEGORIES = [
  Category(
    id: '1',
    title: 'مقاولات عامة',
    color: Color.fromARGB(255, 222, 206, 223),
    Logoimg: "img/balloning.png",
  ),
  Category(
    id: '2',
    title: 'صيانة عامة وتجديد',
    color: Color.fromARGB(255, 232, 213, 211),
    Logoimg: "img/hiking.png",
  ),
  Category(
    id: '3',
    title: 'ديكورات عامة',
    color: Color.fromARGB(255, 214, 207, 196),
    Logoimg: "img/balloning.png",
  ),
  Category(
    id: '4',
    title: 'مقاولات عامة',
    color: Color.fromARGB(255, 233, 207, 238),
    Logoimg: "img/snorkling.png",
  ),
  Category(
    id: '5',
    title: 'صيانة عامة وتجديد',
    color: Color.fromARGB(255, 212, 182, 179),
    Logoimg: "img/hiking.png",
  ),
  Category(
    id: '6',
    title: 'ديكورات عامة',
    color: Color.fromARGB(255, 189, 186, 179),
    Logoimg: "img/kayaking.png",
  ),
];
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
