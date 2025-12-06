import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_all_today_collections_state.dart';

part 'get_all_today_collections_cubit.freezed.dart';

class GetAllTodayCollectionsCubit
    extends BaseCubit<GetAllTodayCollectionsState> {
  GetAllTodayCollectionsCubit({required super.context})
      : super(initialState: GetAllTodayCollectionsState.initial());
}
