import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'create_return_transaction_controller.dart';
import 'create_return_transaction_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class CreateReturnTransaction
    extends BaseStatelessWidget<CreateReturnTransactionController,
        CreateReturnTransactionCubit,
        CreateReturnTransactionState> {
  CreateReturnTransaction({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateReturnTransactionCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          CreateReturnTransactionCubit,
          CreateReturnTransactionState>(
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
  CreateReturnTransactionCubit createCubitAndAssignToController(
      BuildContext context) {
    CreateReturnTransactionCubit cubit = CreateReturnTransactionCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
