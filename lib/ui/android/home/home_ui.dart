import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gerenciadorloja_app/blocs/orders_bloc.dart';
import 'package:gerenciadorloja_app/blocs/user_bloc.dart';
import 'package:gerenciadorloja_app/ui/android/products/products_tab.dart';
import 'package:gerenciadorloja_app/ui/android/user/user_tab_ui.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

import '../orders/orders_tab.dart';

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  PageController _pageController;
  int _currentPage = 0;

  UserBLoC _userBLoC;
  OrdersBloc _ordersBloc;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _userBLoC = UserBLoC();
    _ordersBloc = OrdersBloc();
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
          child: BlocProvider<OrdersBloc>(
            bloc: _ordersBloc,
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
                ProductsTab(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _buildFloating(),
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

  Widget _buildFloating() {
    switch (_currentPage) {
      case 0:
        return null;
      case 1:
        return SpeedDial(
          child: Icon(Icons.sort),
          backgroundColor: Colors.pinkAccent,
          overlayOpacity: 0.4,
          overlayColor: Colors.black,
          children: [
            SpeedDialChild(
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.pinkAccent,
                ),
                backgroundColor: Colors.white,
                label: "Concluídos Abaixo",
                labelStyle: TextStyle(fontSize: 14),
                onTap: () {
                  _ordersBloc.setOrderCriteria(SortCriteria.READY_LAST);
                }),
            SpeedDialChild(
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.pinkAccent,
                ),
                backgroundColor: Colors.white,
                label: "Concluídos Acima",
                labelStyle: TextStyle(fontSize: 14),
                onTap: () {
                  _ordersBloc.setOrderCriteria(SortCriteria.READY_FIRST);
                })
          ],
        );
      case 2:
        return FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.pinkAccent,
          onPressed: () {
            //   showDialog(context: context,
            //     builder: (context) => EditCategoryDialog()
            // );
          },
        );
    }
  }
}
