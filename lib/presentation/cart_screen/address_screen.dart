import 'package:flutter/material.dart';
import 'addadd.dart';

class AddressScreen extends StatefulWidget {
  final Function(String name, String phone, String address) onSelectAddress;

  const AddressScreen({Key? key, required this.onSelectAddress}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<Map<String, String>> addresses = [
    {'name': 'Nguyễn Văn Test', 'phone': '0123456789', 'address': 'Nguyễn Văn Linh - Hải Châu - Đà Nẵng'},
  ];

  void _addNewAddress(String name, String phone, String address) {
    setState(() {
      addresses.add({'name': name, 'phone': phone, 'address': address});
    });
  }

  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Địa chỉ giao hàng'),
      ),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];
          return ListTile(
            title: Text(address['name']!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Số điện thoại: ${address['phone']}'),
                Text('Địa chỉ: ${address['address']}'),
              ],
            ),
            trailing: Radio(
              value: index,
              groupValue: _selectedIndex,
              onChanged: (value) {
                setState(() {
                  _selectedIndex = value as int?;
                });
                widget.onSelectAddress(
                  address['name']!,
                  address['phone']!,
                  address['address']!,
                );
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 32),
            backgroundColor: const Color(0xFF8B4511),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddAddressScreen(onAddAddress: _addNewAddress),
              ),
            );
          },
          child: const Text(
            'Thêm địa chỉ mới',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
