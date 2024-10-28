import 'package:appqlcafe/presentation/trang_sinhto_screen/trang_sinhto_screen.dart';
import 'package:appqlcafe/presentation/trang_trasua_screen/trasuanuong.dart';
import 'package:appqlcafe/presentation/trang_trasua_screen/trasuathaixanh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/trasua_bloc.dart';
import 'models/trasua_model.dart';
import '../trang_cf_screen/trang_cf_screen.dart';
import '../profile_screen/profile_screen.dart';

class TraSuaScreen extends StatelessWidget {
  const TraSuaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TraSuaBloc(TraSuaState(
        traSuaModelObj: TraSuaModel(),
      ))..add(TraSuaInitialEvent()),
      child: _TraSuaScreenContent(),
    );
  }
}

class _TraSuaScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TraSuaBloc, TraSuaState>(
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
                  _buildTraSuaGrid(context, state),
                  _buildSpecialOffer(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _buildBottomNavigation(context),
        );
      },
    );
  }

  Widget _buildTraSuaGrid(BuildContext context, TraSuaState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildTraSuaItem(context, state.traSuaModelObj?.items?[0]),
          SizedBox(width: 12),
          _buildTraSuaItem(context, state.traSuaModelObj?.items?[1]),
        ],
      ),
    );
  }

  Widget _buildTraSuaItem(BuildContext context, TraSuaItemModel? item) {
    if (item == null) return SizedBox();
    return Expanded(
      child: InkWell(
        onTap: () {
          if (item.name == "Trà sữa nướng") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TraSuaNuong(),
              ),
            );
          } else if (item.name == "Trà sữa thái xanh") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TraSuaThaiXanh(),
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
                  // Positioned(
                  //   top: 8,
                  //   right: 8,
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Icon(Icons.star, color: Colors.amber, size: 16),
                  //         Text(item.rating),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${item.price} đ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
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


  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person_outline, color: Colors.grey[600]),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.brown),
                  Text(
                    'Hải Châu, Đà Nẵng',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Text(
                'Xin chào',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }


  Widget _buildSearchBar() {
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

  Widget _buildCategories(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thực đơn',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              _buildCategoryChip('Cà Phê', false, context),
              SizedBox(width: 8),
              _buildCategoryChip('Trà sữa', true, context),
              SizedBox(width: 8),
              _buildCategoryChip('Sinh Tố', false, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (label == 'Cà Phê') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TrangCfScreen.builder(context)),
          );
        } else if (label == 'Sinh Tố') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SinhToScreen()),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.brown : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? Colors.brown : Colors.grey),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialOffer() {
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

  static Widget _buildBottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.brown,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      onTap: (index) {
        if (index == 3) { // Tab Profile
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        }
      },
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