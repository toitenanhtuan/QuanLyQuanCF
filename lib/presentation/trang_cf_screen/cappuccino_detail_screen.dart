import 'package:flutter/material.dart';

class CappuccinoDetailScreen extends StatefulWidget {
  const CappuccinoDetailScreen({Key? key}) : super(key: key);

  @override
  State<CappuccinoDetailScreen> createState() => _CappuccinoDetailScreenState();
}

class _CappuccinoDetailScreenState extends State<CappuccinoDetailScreen> {
  String selectedSize = 'Small';
  Map<String, double> prices = {
    'Small': 85000,
    'Medium': 95000,
    'Large': 110000,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildProductInfo(),
            _buildSizeSelection(),
            _buildDescription(),
            _buildAddToCartButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/cappuccino_fall.png',
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 40,
          left: 16,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cappuccino',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'With Chocolate',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[200],
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: Row(
          //     children: const [
          //       Icon(Icons.star, color: Colors.amber, size: 20),
          //       SizedBox(width: 4),
          //       Text(
          //         '4.9',
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildSizeSelection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kích thước',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildSizeButton('Small'),
              const SizedBox(width: 12),
              _buildSizeButton('Medium'),
              const SizedBox(width: 12),
              _buildSizeButton('Large'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    bool isSelected = selectedSize == size;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedSize = size;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.brown : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.brown : Colors.grey[300]!,
            ),
          ),
          child: Center(
            child: Text(
              size,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Mô tả',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Cappuccino with Chocolate mang đến hương vị đậm đà của '
                'cà phê hòa quyện cùng vị ngọt dịu của sô-cô-la, tạo nên '
                'một tách cà phê thơm ngon và đặc biệt. Thích hợp để '
                'thưởng thức mỗi ngày.',
            style: TextStyle(
              color: Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          // Add to cart logic here
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Thêm vào giỏ hàng  |  ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${prices[selectedSize]?.toStringAsFixed(0)} đ',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}