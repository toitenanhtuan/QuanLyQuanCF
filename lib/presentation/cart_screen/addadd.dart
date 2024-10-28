import 'package:flutter/material.dart';
class AddAddressScreen extends StatefulWidget {
  final Function(String name, String phone, String address) onAddAddress;

  const AddAddressScreen({Key? key, required this.onAddAddress}) : super(key: key);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm địa chỉ mới'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Họ và Tên'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Số điện thoại'),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Địa chỉ'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                backgroundColor: const Color(0xFF8B4511),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty && _addressController.text.isNotEmpty) {
                  widget.onAddAddress(
                    _nameController.text,
                    _phoneController.text,
                    _addressController.text,
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Vui lòng điền đầy đủ thông tin')),
                  );
                }
              },
              child: const Text(
                'Lưu địa chỉ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
