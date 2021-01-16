import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/blocs/user_bloc.dart';
import 'package:gerenciadorloja_app/ui/android/tabs/orders_tab.dart';
import 'package:gerenciadorloja_app/ui/android/tabs/user_tab_ui.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  PageController _pageController;
  int _currentPage = 0;

  UserBLoC _userBLoC;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _userBLoC = UserBLoC();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.COR_SECUNDARIA,
      body: SafeArea(
        child: BlocProvider<UserBLoC>(
          bloc: _userBLoC,
          child: PageView(
            onPageChanged: (pagina) {
              setState(() {
                _currentPage = pagina;
              });
            },
            controller: _pageController,
            children: [
              UserTabUI(),
              OrdersTab(),
              Container(
                child: Icon(
                  Icons.list_outlined,
                  size: 130,
                  color: AppColors.COR_PRIMARIA,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (pagina) {
          _pageController.animateToPage(pagina,
              duration: Duration(milliseconds: 500), curve: Curves.bounceOut);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Clientes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Pedidos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_outlined), label: 'Produtos')
        ],
      ),
    );
  }
}
