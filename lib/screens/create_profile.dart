import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
import 'package:we_chat/screens/landing_page.dart';

import '../../../core/utils/custom_buttom.dart';
import '../../../core/utils/error.dart';
import '../core/presentation/resources/size_constants.dart';
import '../models/user_profile.dart';
import 'auth/auth_provider.dart';

class UserInfromationScreen extends StatefulWidget {
  const UserInfromationScreen({super.key});

  @override
  State<UserInfromationScreen> createState() => _UserInfromationScreenState();
}

class _UserInfromationScreenState extends State<UserInfromationScreen> {
  File? image;
  //File? image2;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();
  final citycontroller = TextEditingController();
  final marriagecontroller = TextEditingController();
  final dietcontroller = TextEditingController();
  final heightcontroller = TextEditingController();
  final gendercontroller = TextEditingController();
  final hobbycontroller = TextEditingController();
  final religiouscontroller = TextEditingController();
  final educationcontroller = TextEditingController();
  final employcontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final jobtypescontroller = TextEditingController();
  final salaryrangecontroller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  String dropdownValue = 'Dog';
  List<String> dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  // for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              )
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // InkWell(
                          //   onTap: () => selectImage(),
                          //   child: image == null
                          //       ? const CircleAvatar(
                          //           backgroundColor: Colors.purple,
                          //           radius: 50,
                          //           child: Icon(
                          //             Icons.account_circle,
                          //             size: 50,
                          //             color: Colors.white,
                          //           ),
                          //         )
                          //       : CircleAvatar(
                          //           backgroundImage: FileImage(image2!),
                          //           radius: 50,
                          //         ),
                          // ),
                          SBC.mW,
                          InkWell(
                            onTap: () => selectImage(),
                            child: image == null
                                ? const CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    radius: 50,
                                    child: Icon(
                                      Icons.account_circle,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundImage: FileImage(image!),
                                    radius: 50,
                                  ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            // name field
                            textFeld(
                              hintText: "John Smith",
                              icon: Icons.account_circle,
                              inputType: TextInputType.name,
                              maxLines: 1,
                              controller: nameController,
                            ),

                            // email
                            textFeld(
                              hintText: "Enter your City",
                              icon: Icons.location_city,
                              inputType: TextInputType.text,
                              maxLines: 1,
                              controller: citycontroller,
                            ),
                            textFeld(
                              hintText: "Enter your Age",
                              icon: Icons.account_circle,
                              inputType: TextInputType.number,
                              maxLines: 1,
                              controller: agecontroller,
                            ),
                            textFeld(
                              hintText: "Enter your Religious",
                              icon: Icons.account_circle,
                              inputType: TextInputType.text,
                              maxLines: 1,
                              controller: religiouscontroller,
                            ),
                            textFeld(
                              hintText: "Enter your Qualification",
                              icon: Icons.account_circle,
                              inputType: TextInputType.text,
                              maxLines: 1,
                              controller: educationcontroller,
                            ),
                            textFeld(
                              hintText: "Enter Your Salary Range",
                              icon: Icons.account_circle,
                              inputType: TextInputType.number,
                              maxLines: 1,
                              controller: salaryrangecontroller,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Jobs",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                ),
                                SBC.lH,
                                Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          employcontroller.text.toLowerCase() ==
                                              'employed',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            employcontroller.text = 'Employed';
                                          } else if (employcontroller.text
                                                  .toLowerCase() ==
                                              'Employed') {
                                            employcontroller.text = '';
                                          }
                                        });
                                      },
                                    ),
                                    const Text('Employed'),
                                    Checkbox(
                                      value:
                                          employcontroller.text.toLowerCase() ==
                                              'unemployed',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            employcontroller.text =
                                                'Unemployed';
                                          } else if (employcontroller.text
                                                  .toLowerCase() ==
                                              'unemployed') {
                                            employcontroller.text = '';
                                          }
                                        });
                                      },
                                    ),
                                    const Text('Un-Employed'),
                                  ],
                                )
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Jobs types",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                ),
                                SBC.lH,
                                Row(
                                  children: [
                                    Checkbox(
                                      value: jobtypescontroller.text
                                              .toLowerCase() ==
                                          'private',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            jobtypescontroller.text = 'Private';
                                          } else if (jobtypescontroller.text
                                                  .toLowerCase() ==
                                              'Private') {
                                            jobtypescontroller.text = '';
                                          }
                                        });
                                      },
                                    ),
                                    const Text('Private'),
                                    Checkbox(
                                      value: jobtypescontroller.text
                                              .toLowerCase() ==
                                          'goverment',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            jobtypescontroller.text =
                                                'Goverment';
                                          } else if (jobtypescontroller.text
                                                  .toLowerCase() ==
                                              'goverment') {
                                            jobtypescontroller.text = '';
                                          }
                                        });
                                      },
                                    ),
                                    const Text('Goverment'),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Gender",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                ),
                                SBC.lH,
                                Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          gendercontroller.text.toLowerCase() ==
                                              'male',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            gendercontroller.text = 'Male';
                                          } else if (gendercontroller.text
                                                  .toLowerCase() ==
                                              'male') {
                                            gendercontroller.text = '';
                                          }
                                        });
                                      },
                                    ),
                                    const Text('Male'),
                                    Checkbox(
                                      value:
                                          gendercontroller.text.toLowerCase() ==
                                              'female',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            gendercontroller.text = 'Female';
                                          } else if (citycontroller.text
                                                  .toLowerCase() ==
                                              'female') {
                                            gendercontroller.text = '';
                                          }
                                        });
                                      },
                                    ),
                                    const Text('Female'),
                                    Checkbox(
                                      value:
                                          gendercontroller.text.toLowerCase() ==
                                              'other',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            gendercontroller.text = 'Other';
                                          } else if (citycontroller.text
                                                  .toLowerCase() ==
                                              'other') {
                                            gendercontroller.text = '';
                                          }
                                        });
                                      },
                                    ),
                                    const Text('Other'),
                                  ],
                                )
                              ],
                            ),

                            // SBC.lH,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Marriage Status",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                ),
                                SBC.lH,
                                Row(
                                  children: [
                                    Checkbox(
                                      value: marriagecontroller.text
                                              .toLowerCase() ==
                                          'unmarried',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            marriagecontroller.text =
                                                'Unmarried';
                                          } else if (marriagecontroller.text
                                                  .toLowerCase() ==
                                              'unmarried') {
                                            marriagecontroller.text = '';
                                          }
                                        });
                                      },
                                    ),
                                    const Text('Single'),
                                    Checkbox(
                                      value: marriagecontroller.text
                                              .toLowerCase() ==
                                          'married',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            marriagecontroller.text = 'Married';
                                          } else if (marriagecontroller.text
                                                  .toLowerCase() ==
                                              'married') {
                                            marriagecontroller.text = '';
                                          }
                                        });
                                      },
                                    ),
                                    const Text('Married'),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Hobbey",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                ),
                                SBC.lH,
                                Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          hobbycontroller.text.toLowerCase() ==
                                              'Dancing',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            hobbycontroller.text = 'Dancing';
                                          } else if (hobbycontroller.text
                                                  .toLowerCase() ==
                                              'dancing') {
                                            hobbycontroller.text = '';
                                          }
                                        });
                                      },
                                    ),
                                    const Text('Dancing'),
                                    Checkbox(
                                      value:
                                          hobbycontroller.text.toLowerCase() ==
                                              'watching movie',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            hobbycontroller.text =
                                                'Watching Movie';
                                          } else if (citycontroller.text
                                                  .toLowerCase() ==
                                              'watching movie') {
                                            hobbycontroller.text = '';
                                          }
                                        });
                                      },
                                    ),
                                    const Text('Watching Movie'),
                                  ],
                                ),
                              ],
                            ),

                            textFeld(
                              hintText: "Diets",
                              icon: Icons.girl,
                              inputType: TextInputType.text,
                              maxLines: 1,
                              controller: dietcontroller,
                            ),

                            textFeld(
                              hintText: "Height",
                              icon: Icons.height,
                              inputType: TextInputType.number,
                              maxLines: 1,
                              controller: heightcontroller,
                            ),

                            textFeld(
                              hintText: "abc@example.com",
                              icon: Icons.email,
                              inputType: TextInputType.emailAddress,
                              maxLines: 1,
                              controller: emailController,
                            ),
                            // bio
                            textFeld(
                              hintText: "Enter your bio here...",
                              icon: Icons.edit,
                              inputType: TextInputType.text,
                              maxLines: 2,
                              controller: bioController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: CustomButton(
                          text: "Continue",
                          onPressed: () {
                            storeData();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget textFeld({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Colors.purple,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.purple,
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: InputBorder.none,
          fillColor: Colors.purple.shade50,
          filled: true,
        ),
      ),
    );
  }

  ///
  Widget dropdownField({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Colors.purple,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.purple,
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: InputBorder.none,
          fillColor: Colors.purple.shade50,
          filled: true,
        ),
      ),
    );
  }
  // widget for checkbox

  // store user data to database
  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      jobtypes: jobtypescontroller.text.trim(),
      bio: bioController.text.trim(),
      city: citycontroller.text.trim(),
      employe: employcontroller.text.trim(),
      marriage: marriagecontroller.text.trim(),
      diet: dietcontroller.text.trim(),
      height: heightcontroller.text.trim(),
      gender: gendercontroller.text.trim(),
      salaryrange: salaryrangecontroller.text.trim(),
      hobby: hobbycontroller.text.trim(),
      age: agecontroller.text.trim(),
      religious: religiouscontroller.text.trim(),
      qulafication: educationcontroller.text.trim(),
      profilePic: "",
      docfilePic: "",
      createdAt: "",
      phoneNumber: "",
      id: "",
    );
    if (image != null) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          ap.saveUserDataToSP().then(
                (value) => 
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LandingPage(),
                          ),
                          (route) => false),
                    
              );
        },
      );
    } else {
      Fluttertoast.showToast(
          msg: "Please upload your profile photo",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      // Fluttertoast.showToast(
      //     msg: "Please upload your Valid Id Card",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      // showSnackBar(context, "Please upload your profile photo");
    }
    // if (image != null) {
    //   ap.savedocDataToFirebase(
    //     context: context,
    //     userModel: userModel,
    //     docfilePic: image!,
    //     onSuccess: () {
    //       ap.saveUserDataToSP().then(
    //             (value) => ap.setSignIn().then(
    //                   (value) => Navigator.pushAndRemoveUntil(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (context) => const LandingPage(),
    //                       ),
    //                       (route) => false),
    //                 ),
    //           );
    //     },
    //   );
    // } else {
    //   // Fluttertoast.showToast(
    //   //     msg: "Please upload your profile photo",
    //   //     toastLength: Toast.LENGTH_SHORT,
    //   //     gravity: ToastGravity.CENTER,
    //   //     timeInSecForIosWeb: 1,
    //   //     backgroundColor: Colors.red,
    //   //     textColor: Colors.white,
    //   //     fontSize: 16.0);
    //   Fluttertoast.showToast(
    //       msg: "Please upload your Valid Id Card",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    //   // showSnackBar(context, "Please upload your profile photo");
    // }
  }
}
