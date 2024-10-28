// cart/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../trang_cf_screen/bloc/trang_cf_bloc.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatelessWidget {
  final TrangCfBloc trangCfBloc;

  const CartScreen({
    Key? key,
    required this.trangCfBloc,
  }) : super(key: key);

  static Route<void> route(TrangCfBloc bloc) {
    return MaterialPageRoute(
      builder: (context) => CartScreen(trangCfBloc: bloc),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: trangCfBloc,
      child: const CartView(),
    );
  }
}

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrangCfBloc, TrangCfState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Giỏ hàng',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildCartItems(context, state),
                _buildPaymentMethod(),
                _buildDeliveryAddress(),
                _buildPromotionCode(),
                _buildOrderSummary(state),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomCheckout(context, state),
        );
      },
    );
  }

  Widget _buildCartItems(BuildContext context, TrangCfState state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.cartItems.length,
      itemBuilder: (context, index) {
        final item = state.cartItems.values.elementAt(index);
        return Card(
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/cappuccino_small.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Đồ uống',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${formatPrice(item.price * 1000)}đ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        context.read<TrangCfBloc>().add(DecreaseQuantityEvent());
                      },
                    ),
                    Text(
                      '${item.quantity}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        context.read<TrangCfBloc>().add(IncreaseQuantityEvent());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaymentMethod() {
    return ListTile(
      title: const Text(
        'Phương thức thanh toán',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text('Chưa chọn phương thức thanh toán'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Handle payment method selection
      },
    );
  }

  Widget _buildDeliveryAddress() {
    return ListTile(
      title: const Text(
        'Địa chỉ giao hàng',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text('Chưa chọn địa chỉ giao hàng'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Handle delivery address selection
      },
    );
  }

  Widget _buildPromotionCode() {
    return ListTile(
      title: const Text(
        'Khuyến mãi',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text('Chưa áp dụng mã khuyến mãi'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Handle promotion code input
      },
    );
  }

  Widget _buildOrderSummary(TrangCfState state) {
    final totalPrice = state.cartItems.values
        .fold(0.0, (sum, item) => sum + (item.price * item.quantity));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thanh toán',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Giá'),
              Text('${formatPrice(totalPrice * 1000)}đ'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Khuyến mãi'),
              Text('-${formatPrice(0)}đ'),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tổng tiền',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${formatPrice(totalPrice * 1000)}đ',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomCheckout(BuildContext context, TrangCfState state) {
    final totalPrice = state.cartItems.values
        .fold(0.0, (sum, item) => sum + (item.price * item.quantity));

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8B4511),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            // Handle order placement
          },
          child: Text(
            'Đặt đơn hàng - ${formatPrice(totalPrice * 1000)}đ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  String formatPrice(double price) {
    final formatter = NumberFormat('#,###', 'vi_VN');
    return formatter.format(price);
  }
}