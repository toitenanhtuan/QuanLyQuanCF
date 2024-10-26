import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/utils/image_constant.dart';

class CappuccinoWithChocolate extends StatefulWidget {
  const CappuccinoWithChocolate({Key? key}) : super(key: key);

  @override
  State<CappuccinoWithChocolate> createState() => _CappuccinoWithChocolateState();
}

class _CappuccinoWithChocolateState extends State<CappuccinoWithChocolate> {
  String selectedSize = 'Small';
  final Map<String, int> prices = {
    'Small': 85000,
    'Medium': 95000,
    'Large': 110000,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            // Image and header section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  child: Image.asset(
                    'assets/images/cappuccino_fall.png',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Cappuccino',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          // Container(
                          //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white.withOpacity(0.2),
                          //     borderRadius: BorderRadius.circular(15),
                          //   ),
                          //   child: Row(
                          //     children: const [
                          //       Icon(Icons.star, color: Colors.amber, size: 16),
                          //       SizedBox(width: 4),
                          //       Text(
                          //         '4.9',
                          //         style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                      const Text(
                        'With Chocolate',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Content section
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tags section
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildTag(SvgPicture.asset(ImageConstant.imgCoffeeBean, width: 18, height: 18), 'Coffee'),
                          const SizedBox(width: 8),
                          _buildTag(SvgPicture.asset(ImageConstant.imgChotolate, width: 18, height: 18), 'Chocolate'),
                          const SizedBox(width: 8),
                          _buildTag(const Icon(Icons.local_fire_department_outlined, size: 18), 'Medium Roasted'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Size selection
                    const Text(
                      'Kích thước',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: ['Small', 'Medium', 'Large'].map((size) {
                        bool isSelected = selectedSize == size;
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.brown : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected ? Colors.brown : Colors.grey[300]!,
                                ),
                              ),
                              child: Text(
                                size,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 24),

                    // Description
                    const Text(
                      'Mô tả',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Cappuccino with Chocolate mang đến hương vị đậm đà của cà phê hòa quyện cùng vị ngọt dịu của sô-cô-la, tạo nên một tách cà phê thơm ngon và đặc biệt. Thích hợp để thưởng thức mỗi ngày.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),

                    const Spacer(),

                    // Add to cart button
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Thêm vào giỏ hàng      |',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 32),
                            Text(
                              '${prices[selectedSize]}'.replaceAllMapped(
                                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                    (Match m) => '${m[1]}.',
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(Widget icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}