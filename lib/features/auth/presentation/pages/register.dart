// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../constants/dimension.dart';
// import '../controllers/auth_controller.dart';

// class RegisterFormWidget extends StatelessWidget {
//   RegisterFormWidget({
//     super.key,
//   });

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AuthController>(
//       builder: (controller) {
//         return Form(
//           key: _formKey,
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: kMediumPadding),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextFormField(
//                   controller: controller.name,
//                   validator: (input) => controller.nameValidator(input),
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.person_outline_rounded),
//                     labelText: "Name",
//                     hintText: "Name",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: kMediumPadding / 2),
//                 TextFormField(
//                   controller: controller.email,
//                   validator: (input) => controller.emailValidator(input),
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.email_outlined),
//                     labelText: "Email",
//                     hintText: "Email",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: kMediumPadding / 2),
//                 TextFormField(
//                   controller: controller.password,
//                   validator: (input) => controller.passwordValidator(input),
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.fingerprint),
//                     labelText: "Password",
//                     hintText: "Password",
//                     border: OutlineInputBorder(),
//                     suffixIcon: IconButton(
//                       onPressed: null,
//                       icon: Icon(Icons.remove_red_eye_sharp),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: kMediumPadding / 2),
//                 TextFormField(
//                   controller: controller.confirmPassword,
//                   validator: (input) => controller.passwordConfirmValidator(input),
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.fingerprint),
//                     labelText: "Confirm Password",
//                     hintText: "Confirm Password",
//                     border: OutlineInputBorder(),
//                     suffixIcon: IconButton(
//                       onPressed: null,
//                       icon: Icon(Icons.remove_red_eye_sharp),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: kMediumPadding),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () => {
//                       if (_formKey.currentState!.validate())
//                         controller.register(
//                           email: controller.email.text,
//                           password: controller.password.text,
//                           name: controller.name.text,
//                         ),
//                     },
//                     child: Obx(
//                       () => controller.isLoading ? SizedBox(width: 30, height: 30, child: CircularProgressIndicator()) : Text("Register"),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
