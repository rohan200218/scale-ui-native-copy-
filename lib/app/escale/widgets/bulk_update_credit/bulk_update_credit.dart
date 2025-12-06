import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'bulk_update_credit_controller.dart';
import 'bulk_update_credit_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class BulkUpdateCredit extends BaseStatelessWidget<BulkUpdateCreditController,
    BulkUpdateCreditCubit,
    BulkUpdateCreditState> {
  BulkUpdateCredit({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BulkUpdateCreditCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BulkUpdateCreditCubit, BulkUpdateCreditState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container();
        },
      ),
    );
  }

  @override
  BulkUpdateCreditCubit createCubitAndAssignToController(BuildContext context) {
    BulkUpdateCreditCubit cubit = BulkUpdateCreditCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
