import 'package:ecommerce_elevate/core/assets/animation_assets.dart';
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/user_cart_response.dart';
import 'package:ecommerce_elevate/features/checkout/checkout_contact.dart';
import 'package:ecommerce_elevate/features/checkout/checkout_view_model.dart';
import 'package:ecommerce_elevate/features/checkout/widgets/address_widget.dart';
import 'package:ecommerce_elevate/features/checkout/widgets/billing_information.dart';
import 'package:ecommerce_elevate/features/checkout/widgets/header_widget.dart';
import 'package:ecommerce_elevate/features/checkout/widgets/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CheckoutView extends StatefulWidget {
  final UserCartResponse userCartResponse;

  const CheckoutView({required this.userCartResponse, super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends BaseState<CheckoutView, CheckoutViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.userCartResponse = widget.userCartResponse;
    viewModel.doIntent(LoadDataAction());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider.value(
      value: viewModel,
      child: RefreshIndicator(
        color: AppColors.pink,
        onRefresh: () async {
          viewModel.doIntent(LoadDataAction());
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(viewModel.locale!.checkout),
          ),
          body: BlocConsumer<CheckoutViewModel, CheckoutStates>(
            listener: (context, state) async {
              if (state.navigationState is NavigateToAddAddress) {
                await Navigator.pushNamed(context, Routes.addressesRoute);
                viewModel.doIntent(LoadDataAction());
              }
              if (state.navigationState is ShowLoadingState) {
                AppDialogs.showLoading(
                    message: viewModel.locale!.loading,
                    // ignore: use_build_context_synchronously
                    context: context);
              }
              if (state.navigationState is ShowSuccessState) {
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
                AppDialogs.showSuccessDialog(
                  message: (state.navigationState as ShowSuccessState).message,
                  // ignore: use_build_context_synchronously
                  context: context,
                  posActionTitle: viewModel.locale!.ok,
                  posAction: () {
                    Navigator.pop(context);
                  },
                );
              }
            },
            builder: (context, state) {
              if (state.dataLoading is LoadingState) {
                return Center(
                    child: Lottie.asset(AnimationsAssets.loginImageAnimation));
              }
              if (state.dataLoading is LoadingFailState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AnimationsAssets.loginImageAnimation),
                    Text(
                      (state.dataLoading as LoadingFailState).message,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.doIntent(LoadDataAction());
                      },
                      child: Text(viewModel.locale!.tryAgain),
                    )
                  ],
                );
              }
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: HeaderWidget()),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 16,
                      color: AppColors.white[AppColors.colorCode60],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        viewModel.locale!.deliveryAddress,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  if ((state.dataLoading as LoadingSuccessState<List<Address>?>)
                          .data !=
                      null)
                    SliverList.separated(
                      itemBuilder: (context, index) {
                        var data = (state.dataLoading
                                as LoadingSuccessState<List<Address>?>)
                            .data![index];
                        return AddressWidget(
                          address: data,
                          onPress: () {
                            viewModel
                                .doIntent(ChangeSelectedAddressAction(data));
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      itemCount: (state.dataLoading
                                  as LoadingSuccessState<List<Address>?>)
                              .data
                              ?.length ??
                          0,
                    ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OutlinedButton(
                          onPressed: () {
                            viewModel.doIntent(AddAddressAction());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add),
                              const SizedBox(width: 8),
                              Text(viewModel.locale!.addNew)
                            ],
                          )),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 16,
                      color: AppColors.white[AppColors.colorCode60],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        viewModel.locale!.paymentMethod,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [
                        PaymentMethodWidget(
                          paymentMethod: 0,
                          paymentMethodName: viewModel.locale!.cashOnDelivery,
                        ),
                        const SizedBox(height: 16),
                        PaymentMethodWidget(
                          paymentMethod: 1,
                          paymentMethodName: viewModel.locale!.creditCard,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 16,
                      color: AppColors.white[AppColors.colorCode60],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Switch(
                                value: viewModel.isGift,
                                onChanged: (value) {
                                  viewModel.isGift = value;
                                  setState(() {});
                                },
                                inactiveTrackColor:
                                    AppColors.white[AppColors.colorCode60],
                                activeTrackColor:
                                    Theme.of(context).primaryColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                viewModel.locale!.itIsAGift,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            child: viewModel.isGift
                                ? Column(
                                    children: [
                                      TextFormField(
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) => viewModel
                                            .nameValidation(value ?? ""),
                                        keyboardType: TextInputType.name,
                                        controller: viewModel.nameController,
                                        decoration: InputDecoration(
                                          label:
                                              Text(viewModel.locale!.firstName),
                                          hintText:
                                              viewModel.locale!.enterFirstName,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormField(
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) => viewModel
                                            .phoneValidation(value ?? ""),
                                        keyboardType: TextInputType.phone,
                                        controller: viewModel.phoneController,
                                        decoration: InputDecoration(
                                          label: Text(viewModel.locale!.phone),
                                          hintText:
                                              viewModel.locale!.enterPhone,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 16,
                      color: AppColors.white[AppColors.colorCode60],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BillingInformation(
                          viewModel.userCartResponse, viewModel),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  CheckoutViewModel initViewModel() {
    return getIt<CheckoutViewModel>();
  }
}
