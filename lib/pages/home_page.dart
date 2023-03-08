import 'package:bank_corrupcy/pages/moedas_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'favoritas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: pageAtual);
  }

  setPageAtual(Page) {
    setState(() {
      pageAtual = Page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: setPageAtual,
        controller: pc,
        children: const [MoedasPage(), FavoritasPage()],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Colors.lightBlue.withOpacity(0.1),
          labelTextStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          )),
        ),
        child: NavigationBar(
          // currentIndex: pageAtual,
          // items: const [
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.money),
          //     label: "Moedas",
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.favorite),
          //     label: "favoritas",
          //   ),
          // ],
          // onTap: (page) {
          //   pc.animateToPage(page,
          //       duration: Duration(microseconds: 400), curve: Curves.ease);
          // },
          // backgroundColor: Colors.grey[300],
          selectedIndex: pageAtual,
          onDestinationSelected: (page) => {
            pc.animateToPage(page,
                duration: const Duration(microseconds: 400), curve: Curves.ease)
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.money,
                size: 30,
              ),
              label: "Moeda",
              selectedIcon: Icon(
                Icons.money,
                size: 30,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              label: "Favoritas",
              selectedIcon: Icon(
                Icons.favorite,
                size: 30,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        elevation: 9,
      ),
    );
  }
}
