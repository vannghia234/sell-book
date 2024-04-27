import 'package:brainiaccommerce2/screens/edit_profile_screen.dart';
import 'package:brainiaccommerce2/screens/favorites_screen.dart';
import 'package:brainiaccommerce2/screens/otp_screen.dart';
import 'package:brainiaccommerce2/widgets/container_buton_model.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}); // Sửa đổi ở đây

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Account",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                //appProvider.getUserInfomation.image==null ?
                const Icon(
                  Icons.person_outline,
                  size: 100,
                ),
                //:Image.network(appProvider.getUserInfomation.image!),
                const Text(
                  "Phan Thi Kieu Phuong",
                  //appProvider.getUserInfomation.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "kieuphuong@gmail.com",
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ),
                    );
                  },
                  child: ContainerButtonModel(
                    itext: "Edit Profile",
                    containerWidth: MediaQuery.of(context).size.width / 3,
                    bgColor: Color(0xFFDB3022),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.shopping_bag_outlined),
                    title: const Text("Your Orders"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritesScreen(),
                        ),
                      );
                    },
                    leading: const Icon(Icons.favorite_outline),
                    title: const Text("Favorite List"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.info_outline),
                    title: const Text("About Us"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.support),
                    title: const Text("Support"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(),
                        ),
                      );
                    },
                    leading: const Icon(Icons.change_circle_outlined),
                    title: const Text("Change Password"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text("Log Out"),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text("Brainiac Store since 2024")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
