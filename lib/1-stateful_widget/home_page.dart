import 'package:apple_store/1-stateful_widget/card.dart';
import 'package:apple_store/1-stateful_widget/store.dart';
import 'package:apple_store/common/bottom_bar.dart';
import 'package:apple_store/common/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 현재 선택된 index
  int currentIndex = 0;

  // 카트에 담긴 상품 목록
  List<Product> cartProductList = [];

  // 상품 클릭
  void onProductPressed(Product product) {
    setState(() {
      if (cartProductList.contains(product)) {
        cartProductList.remove(product);
      } else {
        cartProductList.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          /// Store
          Store(
            cartProductList: cartProductList,
            onPressed: onProductPressed, // flutter 에서는 함수 이름만 작성해도 함수를 넘겨줄 수 있음
          ),

          /// Cart
          Cart(
            cartProductList: cartProductList,
            onPressed: onProductPressed, // flutter 에서는 함수 이름만 작성해도 함수를 넘겨줄 수 있음
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        cartTotal: "${cartProductList.length}",   
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
      ),
    );
  }
}
