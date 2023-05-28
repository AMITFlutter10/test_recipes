import 'package:flutter/material.dart';
import '../model/services/local_storage/shared_preferences.dart';
import 'enums.dart';

var emailController = TextEditingController(text: MyCache.getString(key: MySharedKeys.email));
var passwordController = TextEditingController(text: MyCache.getString(key: MySharedKeys.password));

final formKey = GlobalKey<FormState>();


//////images
final List<Widget> imgList = [
  Image.network("https://img.hellofresh.com/w_1080,f_webp,q_auto/hellofresh_s3/image/zartes-kokos-fischfilet-76aba609.jpg",),
  Image.network("https://img.hellofresh.com/w_1080,f_webp,q_auto/hellofresh_s3/image/schwedische-frikadellen-mit-kartoffelstampf-5c8d2614.jpg"),
  Image.network("https://img.hellofresh.com/w_1080,f_webp,q_auto/hellofresh_s3/image/fisch-auf-rauchigem-ratatouille-efe93706.jpg"),
];