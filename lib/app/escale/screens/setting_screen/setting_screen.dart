import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';

import '../../../core/widgets/app_scaffold.dart';
import '../../../themes/borders.dart';
import 'setting_screen_controller.dart';
import 'setting_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class SettingScreen
    extends BaseStatelessWidget<SettingScreenController,
        SettingScreenCubit,
        SettingScreenState> {

  SettingScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SettingScreenCubit, SettingScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;
          return AppScaffold(
            appBarTitle: Text("Settings"),
            body: Container(
              alignment: Alignment.center,
              padding: edge_insets_10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: edge_insets_16,
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width*(largeScreen? 0.4 : 0.7),
                    decoration: BoxDecoration(
                        border: borders.b_2px_bgLightBlue,
                        borderRadius: borderRadius.br_5
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select name", style: TextStyle(
                            fontSize: Fonts.fontSize16,
                            fontWeight: Fonts.f500
                        ),),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ToggleButtons(
                              borderColor: AppColors.grey4,
                              borderRadius: borderRadius.br_10,
                              selectedBorderColor: AppColors.bgPrimary2,
                              isSelected: [
                                !state.farmerName,
                                state.farmerName
                              ],
                              onPressed: (index) {
                                bool lotSize = index == 0;
                                getCubit(context).emitState(
                                  state.copyWith(
                                    lotSize: lotSize,
                                  ),
                                );
                              },
                              selectedColor: AppColors.bgPrimary,
                              color: AppColors.textHeading,
                              children: [
                                Container(
                                  padding: edge_insets_x_10,
                                  child: Text(' Truck '),
                                ),
                                Container(
                                  padding: edge_insets_x_10,
                                  child: Text(' Farmer '),
                                ),
                              ],
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: AppColors.bgPrimary,
                                  shape: RoundedRectangleBorder(borderRadius: borderRadius.br_5)
                              ),
                              onPressed: () async {},
                              child: Text(
                                "Save",
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  SettingScreenCubit createCubitAndAssignToController(BuildContext context) {
    SettingScreenCubit cubit = SettingScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
