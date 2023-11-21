import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottonNavigationBarWidget extends StatelessWidget {
  const BottonNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            border: Border(top: BorderSide(color: Colors.grey, width: 1.0)),
          ),
          child: BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Color.fromARGB(255, 92, 90, 90),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.slideshow), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: ''),
            ],
          ),
        );
      },
    );
  }
}