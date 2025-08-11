import 'package:flutter/material.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';

class CommonHomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CommonHomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CommonHomeAppBar> createState() => _CommonHomeAppBarState();
}

class _CommonHomeAppBarState extends State<CommonHomeAppBar> {
  bool isNike = true;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(375, 90),
      child: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Opacity(
          opacity: 1, 
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor:
                Colors.transparent,
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF130329), 
                  width: 0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonContainer(
                  width: 70,
                  height: 35,
                  onTap: () {
                    setState(() {
                      isNike = !isNike;
                    });
                  },
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(50),
                  child: Stack(
                    children: [
                      AnimatedAlign(
                        curve: Curves.easeInOut,
                        alignment: isNike
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        duration: const Duration(milliseconds: 250),
                        child: commonContainer(
                          width: 34,
                          height: 34,
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Image.asset(
                            Images.mainvector,
                            width: 22,
                            height: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Image.asset(
                            Images.vectorhomepage,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () {},
                  icon: const Icon(Icons.search_sharp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
