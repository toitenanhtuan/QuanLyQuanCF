import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodScreen extends StatefulWidget {
  final Function(String) onPaymentSelected;

  const PaymentMethodScreen({Key? key, required this.onPaymentSelected})
      : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String _selectedPaymentMethod = '';

  void _selectPaymentMethod(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phương thức thanh toán"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.attach_money, color: Colors.black),
            title: Text("Thanh toán tiền mặt"),
            subtitle: Text("(Thanh toán khi nhận hàng)"),
            trailing: Radio<String>(
              value: "Thanh toán tiền mặt",
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                _selectPaymentMethod(value!);
                widget.onPaymentSelected(value);
                Navigator.pop(context);
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.black),
            title: Text("Credit or debit card"),
            subtitle: Text("(Thẻ Visa hoặc Mastercard)"),
            trailing: Radio<String>(
              value: "Credit or debit card",
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                _selectPaymentMethod(value!);
                widget.onPaymentSelected(value);
                Navigator.pop(context);
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_balance, color: Colors.black),
            title: Text("Chuyển khoản ngân hàng"),
            subtitle: Text("(Tự động xác nhận)"),
            trailing: Radio<String>(
              value: "Chuyển khoản ngân hàng",
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                _selectPaymentMethod(value!);
                widget.onPaymentSelected(value);
                Navigator.pop(context);
              },
            ),
          ),
          ListTile(
            leading: Image.asset('assets/images/vnpay.png', width: 24, height: 24),
            title: Text("VN PAY"),
            subtitle: Text("(Tự động xác nhận)"),
            trailing: Radio<String>(
              value: "VN PAY",
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                _selectPaymentMethod(value!);
                widget.onPaymentSelected(value);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
