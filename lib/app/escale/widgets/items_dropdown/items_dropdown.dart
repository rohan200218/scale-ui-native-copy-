import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/input_styles.dart';
import '../../models/truck_models.dart';
import '/app/themes/borders.dart';
import 'package:go_router/go_router.dart';

import 'items_dropdown_controller.dart';
import 'items_dropdown_cubit.dart';
import '/app/core/widgets/base_stateless_widget.dart';
import '/app/core/widgets/base_dropdown_widget.dart';

class ItemsDropdown extends BaseStatelessWidget<ItemsDropdownController,
    ItemsDropdownCubit,
    ItemsDropdownState> {
  final Function(String?) onChanged;
  final Trucks? selectedTruck;
  final String? selectedItem;
  double width;

  ItemsDropdown({
    Key? key,
    super.controller,
    super.onStateChanged,
    required this.width,
    required this.onChanged,
    this.selectedItem,
    this.selectedTruck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemsDropdownCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ItemsDropdownCubit, ItemsDropdownState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final itemsString = selectedTruck?.items;
          final items = itemsString != null
              ? itemsString.split(',').map((item) => item.trim()).toList()
              : [];
          final isLargeScreen = MediaQuery.of(context).size.width > 600;
          final dropdownWidth = isLargeScreen
              ? MediaQuery.of(context).size.width * (width/2)
              : MediaQuery.of(context).size.width * width;

          return Container(
            height: 40,
            width: dropdownWidth,
            child: BaseDropdownWidget<String>(
              items: items.cast<String>(),
              hintText: "Select Item",
              width: dropdownWidth,
              showSearchBox: false,
              onChanged: onChanged,
              itemAsString: (item) => item,
            ),
          );
        },
      ),
    );
  }

  @override
  ItemsDropdownCubit createCubitAndAssignToController(BuildContext context) {
    ItemsDropdownCubit cubit = ItemsDropdownCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
