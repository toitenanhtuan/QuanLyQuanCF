import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/utils/image_constant.dart';

class SinhToBo extends StatefulWidget {
  const SinhToBo({Key? key}) : super(key: key);

  @override
  State<SinhToBo> createState() => _TraSuaNuongState();
}

class _TraSuaNuongState extends State<SinhToBo> {
  String selectedSize = 'Small';
  final Map<String, int> prices = {
    'Small': 40000,
    'Medium': 50000,
    'Large': 55000,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F6F7),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.26,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/sinhtobo_fall.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: 16,
                //   left: 16,
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 16,
                //       vertical: 8,
                //     ),
                //     decoration: BoxDecoration(
                //       color: Colors.black.withOpacity(0.5),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     // child: Row(
                //     //   children: const [
                //     //     Icon(
                //     //       Icons.star,
                //     //       color: Colors.yellow,
                //     //       size: 20,
                //     //     ),
                //     //     SizedBox(width: 4),
                //     //     Text(
                //     //       '4.9',
                //     //       style: TextStyle(
                //     //         color: Colors.white,
                //     //         fontWeight: FontWeight.bold,
                //     //       ),
                //     //     ),
                //     //   ],
                //     // ),
                //   ),
                // ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Sinh tố Bơ',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Bơ + Sữa đặc + Sữa tươi',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Tags
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _buildTag(SvgPicture.asset('assets/images/smoothie.svg', width: 18, height: 18), 'Smoothie'),
                                  const SizedBox(width: 8),
                                  _buildTag(const Icon(Icons.water_drop_outlined, size: 18), 'Sugar'),
                                  const SizedBox(width: 8),
                                  _buildTag(const Icon(Icons.local_fire_department_outlined, size: 18), 'Medium Roasted'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              'Kích thước',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: ['Small', 'Medium', 'Large'].map((size) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: GestureDetector(
                                      onTap: () => setState(() => selectedSize = size),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: selectedSize == size
                                              ? const Color(0xFF846046)
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(24),
                                          border: Border.all(
                                            color: selectedSize == size
                                                ? const Color(0xFF846046)
                                                : Colors.grey.shade300,
                                          ),
                                        ),
                                        child: Text(
                                          size,
                                          style: TextStyle(
                                            color: selectedSize == size
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              'Mô tả',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Sinh tố bơ là thức uống tốt cho sức khỏe được nhiều người yêu thích. Màu xanh của bơ hòa quyện với màu của sữa tạo cho cốc sinh tố một màu sắc rất bắt mắt và hấp dẫn. Cho tới nay, bơ ngày càng được biết đến rộng rãi nhờ vào những thành phần dinh dưỡng phong phú của nó.',
                              style: TextStyle(
                                color: Colors.grey,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF846046),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 24,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Thêm vào giỏ hàng',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                ' | ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
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
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}