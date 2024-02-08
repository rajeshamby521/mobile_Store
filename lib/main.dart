import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'domain/repositories/user_repository_impl.dart';
import 'domain/repositories/product_repository_impl.dart';
import 'domain/usecases/add_product_usecase.dart';
import 'domain/usecases/get_products_usecase.dart';
import 'domain/usecases/login_usecase.dart';
import 'domain/usecases/register_usecase.dart';
import 'presentation/controllers/add_product_controller.dart';
import 'presentation/controllers/login_controller.dart';
import 'presentation/controllers/product_list_controller.dart';
import 'presentation/controllers/register_controller.dart';
import 'presentation/pages/add_product_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/product_list_page.dart';
import 'presentation/pages/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mobile_store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: BindingsBuilder.put(
                () => LoginController(LoginUseCase(UserRepositoryImpl())),
          ),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterPage(),
          binding: BindingsBuilder.put(
                () => RegisterController(RegisterUseCase(UserRepositoryImpl())),
          ),
        ),
        GetPage(
          name: '/add_product',
          page: () => AddProductPage(),
          binding: BindingsBuilder.put(
                () =>
                AddProductController(AddProductUseCase(ProductRepositoryImpl())),
          ),
        ),
        GetPage(
          name: '/product_list',
          page: () => ProductListPage(),
          binding: BindingsBuilder.put(
                () => ProductListController(GetProductsUseCase(ProductRepositoryImpl())),
          ),
        ),
      ],
    );
  }
}