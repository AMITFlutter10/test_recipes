import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../model/services/local_storage/shared_preferences.dart';
import '../../utilities/app_constants.dart';
import '../../utilities/enums.dart';
import '../../view_model/account/login_cubit.dart';
import '../shared_widgets/default_form_field.dart';
import '../shared_widgets/default_text.dart';
import '../shared_widgets/main_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(3.h),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   DefaultText(
                    text: "Login",
                    color: Colors.teal,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                   SizedBox(height: 2.h,),
                  DefaultFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Enter your Email",
                      labelText: "Email",
                      suffixIcon: const Icon(Icons.mail),
                      inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.teal),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Email cannot be empty';
                        }
                        if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Invalid email address';
                        }
                        return null;
                      }),
                   SizedBox(height: 2.h),
                  DefaultFormField(
                      obscureText: cubit.isPassword,
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Enter your Password",
                      labelText: "Password",
                      suffixIcon: IconButton(onPressed: () {
                        cubit.changePasswordIcon();
                      },
                          icon: Icon(Icons.password,
                              color: cubit.isPassword ? Colors.grey : Colors
                                  .teal)),
                      inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.teal),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      }),
                  SizedBox(height: 2.h,),

                  MainButton(
                    text: 'Login',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        MyCache.putString(key: MySharedKeys.email,
                            value: emailController.text);
                        MyCache.putString(key: MySharedKeys.password,
                            value: passwordController.text);
                        Navigator.of(context).pushNamedAndRemoveUntil("recipesHome",  (route) => false);
                      }
                    },
                  )

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
