import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/trang_cf_bloc.dart';
import 'models/trang_cf_model.dart';
import '../trang_trasua_screen/trang_trasua_screen.dart';
import '../trang_sinhto_screen/trang_sinhto_screen.dart';
import 'cappuccino_with_chocolate.dart';
import 'cappuccino_with_low_fat_milk.dart';

class TrangCfScreen extends StatelessWidget {
  const TrangCfScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<TrangCfBloc>(
      create: (context) => TrangCfBloc(TrangCfState(
        trangCfModelObj: TrangCfModel(),
      ))..add(TrangCfInitialEvent()),
      child: BlocBuilder<TrangCfBloc, TrangCfState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    _buildSearchBar(),
                    _buildCategories(context),
                    _buildCoffeeGrid(context, state),
                    _buildSpecialOffer(),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: _buildBottomNavigation(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }

  static Widget _buildCoffeeGrid(BuildContext context ,TrangCfState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildCoffeeItem(context, state.trangCfModelObj?.items?[0]),
          const SizedBox(width: 12),
          _buildCoffeeItem(context ,state.trangCfModelObj?.items?[1]),
        ],
      ),
    );
  }

  static Widget _buildCoffeeItem(BuildContext context ,CoffeeItemModel? item) {
    if (item == null) return const SizedBox();
    return Expanded(
      child: InkWell(
        onTap: () {
          if (item.name == "Cappuccino With Chocolate") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CappuccinoWithChocolate(),
              ),
            );
          } else if (item.name == "Cappuccino With Low Fat Milk") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CappuccinoWithLowFatMilk(),
              ),
            );
          }
        },

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      item.image,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.description,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${item.price} đ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.brown,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person_outline, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Xin chào',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.location_on, size: 16, color: Colors.brown),
                  Text('Hải Châu, Đà Nẵng'),
                ],
              ),
            ],
          ),
          const Spacer(),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              // Positioned(
              //   right: 8,
              //   top: 8,
              //   child: Container(
              //     width: 8,
              //     height: 8,
              //     decoration: const BoxDecoration(
              //       color: Colors.red,
              //       shape: BoxShape.circle,
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Coffee...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Icon(Icons.menu, color: Colors.brown),
          ],
        ),
      ),
    );
  }

  static Widget _buildCategories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thực đơn',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildCategoryButton(
                context,
                'Cà Phê',
                isSelected: true,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              _buildCategoryButton(
                context,
                'Trà sữa',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TraSuaScreen()),
                  );
                },
              ),
              const SizedBox(width: 8),
              _buildCategoryButton(
                context,
                'Sinh Tố',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SinhToScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildCategoryButton(
      BuildContext context,
      String label, {
        bool isSelected = false,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.brown : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.brown : Colors.grey,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  static Widget _buildSpecialOffer() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Special Offer ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.local_fire_department, color: Colors.orange),
            ],
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/cappuccino_small_106x138.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.brown[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Limited',
                          style: TextStyle(color: Colors.brown),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Mua 1 tặng 1\nnếu bạn thanh toán\nbằng Gopay',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.brown,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}