import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

//import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //UserModel? user;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
        var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
  
   // final ap = Provider.of<AuthProvider>(context, listen: false);
 return Scaffold(
    backgroundColor: Colors.white,
         appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text("Profile", style: TextStyle(
          fontSize: 16
        )),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
                  // SizedBox(
                  //   width: 120,
                  //   height: 120,
                  //   child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(100),
                  //       child:  Image(image: NetworkImage('${ap.userModel.profilePic}'))),
                      
                  // ),
                  Positioned(
                      bottom: 0,
                    right: 0,
                    child: Container(
                         width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.yellow),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    )),
                   //const SizedBox(height: 10),
              // Text("${ap.userModel.name}", style: Theme.of(context).textTheme.headline4),
              // Text("${ap.userModel.email}", style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 5),
  //              SizedBox(
  //                     width: 200,
  //                     height: 40,
  //                     child: ElevatedButton(
  //                       onPressed: (){
  //                           Navigator.push(  
  //   context,  
  //   MaterialPageRoute(builder: (context) =>  EditProfilePage()),  
  // );  
  //                       },
  //                     //  onPressed: () => Get.to(() => const UpdateProfileScreen()),
  //                       style: ElevatedButton.styleFrom(
  //                           backgroundColor: Colors.yellow,
  //                           side: BorderSide.none,
                            
  //                           shape: const StadiumBorder()),
  //                       child: const Text("Edit", style: TextStyle(color: Colors.black)),
  //                     ),
  //                   ),
                  const SizedBox(height: 30),
                  const Divider(),
                ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {}),
            ProfileMenuWidget(title: "Billing Details", icon: LineAwesomeIcons.wallet, onPress: () {}),
              ProfileMenuWidget(title: "User Management", icon: LineAwesomeIcons.user_check, onPress: () {}),  const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: () {}),
                   ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: (){

                          },

                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
                    );
                  }),

                ],
              ),
              
        ),
        
      ),
 );
           
    
  }
}


class _LoginoutButton extends StatelessWidget {
  const _LoginoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "powered by 21st Tech",
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
      
    
  


class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
   var iconColor = isDark ? Colors.yellow : Colors.black;

    return ListTile(
      onTap: onPress,
      leading: Container( 
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyText1?.apply(color: textColor)),
      trailing: endIcon? Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: const Icon(LineAwesomeIcons.angle_right, size: 18.0, color: Colors.grey)) : null,
    );
  }
}