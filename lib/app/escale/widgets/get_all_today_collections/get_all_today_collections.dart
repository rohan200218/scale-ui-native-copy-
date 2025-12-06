import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'get_all_today_collections_controller.dart';
import 'get_all_today_collections_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class GetAllTodayCollections
    extends BaseStatelessWidget<GetAllTodayCollectionsController,
        GetAllTodayCollectionsCubit,
        GetAllTodayCollectionsState> {
  GetAllTodayCollections({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllTodayCollectionsCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          GetAllTodayCollectionsCubit,
          GetAllTodayCollectionsState>(
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
  GetAllTodayCollectionsCubit createCubitAndAssignToController(
      BuildContext context) {
    GetAllTodayCollectionsCubit cubit = GetAllTodayCollectionsCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
