import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/app_routes.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/theme_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Biến lưu email người dùng
  String? userEmail;

  @override
  void initState() {
    super.initState();
    _loadUserEmail(); // Gọi hàm load email khi màn hình được tạo
  }

  // Hàm load email từ SharedPreferences
  Future<void> _loadUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('user_email'); // Lấy email đã lưu
    });
  }

  // Hàm xử lý đăng xuất
  Future<void> _handleLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_email'); // Xóa email khi đăng xuất

    // Chuyển về màn hình đăng nhập và xóa stack điều hướng
    Navigator.pushReplacementNamed(context, AppRoutes.dangnhapScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          // Phần hiển thị email
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  userEmail ?? '', // Hiển thị email nếu có, nếu không thì hiển thị rỗng
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1),

          // Các mục menu
          ListTile(
            leading: Icon(Icons.feedback_outlined),
            title: Text('Phản hồi'),
            onTap: () {
              // Xử lý khi nhấn vào phản hồi
            },
          ),
          Divider(height: 1),

          ListTile(
            leading: Icon(Icons.contact_support_outlined),
            title: Text('Liên hệ'),
            onTap: () {
              // Xử lý khi nhấn vào liên hệ
            },
          ),
          Divider(height: 1),

          ListTile(
            leading: Icon(Icons.lock_outline),
            title: Text('Đổi mật khẩu'),
            onTap: () {
              // Xử lý khi nhấn vào đổi mật khẩu
            },
          ),
          Divider(height: 1),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Đăng xuất'),
            onTap: _handleLogout, // Gọi hàm xử lý đăng xuất khi nhấn
          ),
          Divider(height: 1),
        ],
      ),
    );
  }
}