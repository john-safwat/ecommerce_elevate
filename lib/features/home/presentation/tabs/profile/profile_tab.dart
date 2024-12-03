// 🐦 Flutter imports:
import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:ecommerce_elevate/core/constants/constants.dart';
import 'package:ecommerce_elevate/features/auth/data/datasource/impl/auth_local_datasource_impl.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_response.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/profile_response.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/widgets/home_app_bar.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/view_model/profile_tab_actions.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/view_model/profile_tab_state.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/view_model/profile_tab_view_model.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/widget/list_tile_widget.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/widget/profile_app_bar.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/widget/profile_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/base/base_view.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../../core/di/di.dart';
import '../../../../auth/data/datasource/contract/auth_local_datasource.dart';
import '../../../../auth/presentation/login/login_view.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends BaseState<ProfileTab, ProfileTabViewModel> {

  @override
  void initState() {
    super.initState();
    viewModel.doIntent(LoadLoggedUserInfo());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(

      children: [
       AppBar(
            title: ProfileAppBar(),
            elevation: 0,
          ),

        Expanded(
          child: BlocBuilder<ProfileTabViewModel, ProfileTabState>(
            bloc: viewModel,
            builder: (context, state) {
              if (state is ProfileLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileSuccessState) {

                return ProfileWidget(
                  user: state.user,
                  viewModel: viewModel,
                  onLogoutSuccess:(){
                    setState(() {

                    });
                  },

                );
              } else if (state is ProfileFailState) {

               if (state.exception is DioException &&
                  (state.exception as DioException).response?.statusCode == 401) {
                return Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(viewModel.locale!.pleaseLoginAgain),
                    ElevatedButton(onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.remove(Constants.tokenKey);
                      Navigator.pushNamed(context, Routes.loginRoute);
                    }, child: Text(viewModel.locale!.loginAgain)),
                  ],
                ));
              }
                return Text(state.exception.toString());
              }

              return Container();


            }
          ),
        ),
      ],
    );
  }

  @override
  ProfileTabViewModel initViewModel() {
    return getIt.get<ProfileTabViewModel>();
  }
}
