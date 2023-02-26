import 'package:flutter/material.dart';
List<IconData> listOfIcons = [
  Icons.home_rounded,
  Icons.favorite_rounded,
  Icons.settings_rounded,
  Icons.person_rounded,
];
class BottomNavBar extends StatefulWidget {
  final List<IconData> icons;
  final ValueChanged<int> onTap;
  final int currentIndex;
  final Color backgroundColor;
  final Color iconColor;
  final Color activeIconColor;
  final BuildContext context;

  BottomNavBar({
    required this.icons,
    required this.onTap,
    required this.currentIndex,
    required this.backgroundColor,
    required this.iconColor,
    required this.activeIconColor,
    required this.context,
  });

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(20),
      height: size.width * .155,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: size.width * .024),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            widget.onTap(index);
            //navigate using router
// Navigator.pushNamed(context, listOfRoutes[index]);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(
                  //bottom: index == currentIndex ? 0 : size.width * .029,
                  bottom: index == widget.currentIndex ? 0 : size.width * .029,
                  right: size.width * .0422,
                  left: size.width * .0422,
                ),
                width: size.width * .128,
              //  height: index == currentIndex ? size.width * .014 : 0,
                height: index == widget.currentIndex ? size.width * .014 : 0,
                decoration: BoxDecoration(
                 // color: Colors.blueAccent,
                  color: widget.activeIconColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              ),
              Icon(
                listOfIcons[index],
                size: size.width * .076,
              //  color: index == currentIndex
             color: index == widget.currentIndex ?
                widget.activeIconColor
                : widget.iconColor,
              ),
              SizedBox(height: size.width * .03),
            ],
          ),
        ),
      ),
    );
  }
}
