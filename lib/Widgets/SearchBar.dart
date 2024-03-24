import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Quizbox/DummyData/Quizdata.dart';
import 'package:Quizbox/Models/QuestionsModels.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      margin: const EdgeInsets.fromLTRB(30, 40, 20, 0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 31, 56, 78).withOpacity(.85),
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              "svgs/search1.svg",
            ),
          ),
          suffixIcon: SizedBox(
            width: 60,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    indent: 10,
                    endIndent: 10,
                    width: 1,
                    color: Colors.black,
                    thickness: .2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset("svgs/filter.svg", width: 28),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
