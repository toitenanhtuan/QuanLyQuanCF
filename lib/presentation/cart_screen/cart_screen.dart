import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../trang_cf_screen/bloc/trang_cf_bloc.dart';
import 'package:intl/intl.dart';
import 'payment_screen.dart';
import 'address_screen.dart';

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

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  String selectedPaymentMethod = 'Chưa chọn phương thức thanh toán';
  String? selectedAddress;

  void _updatePaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }
  void _updateSelectedAddress(String name, String phone, String address) {
    setState(() {
      selectedAddress = '$name\nSố điện thoại: $phone\nĐịa chỉ: $address';
    });
  }

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
                _buildPaymentMethod(context),
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

  Widget _buildPaymentMethod(BuildContext context) {
    return ListTile(
      title: const Text(
        'Phương thức thanh toán',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(selectedPaymentMethod),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () async {
        final selectedMethod = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentMethodScreen(
              onPaymentSelected: _updatePaymentMethod,
            ),
          ),
        );
      },
    );
  }

  Widget _buildDeliveryAddress() {
    return ListTile(
      title: const Text(
        'Địa chỉ giao hàng',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(selectedAddress ?? 'Chưa chọn địa chỉ giao hàng'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddressScreen(
              onSelectAddress: _updateSelectedAddress,
            ),
          ),
        );
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
          const Divider(height: 24, thickness: 1,),
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
              color: Colors.white,
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
