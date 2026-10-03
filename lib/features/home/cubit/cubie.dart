import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/home/cubit/state_cubit.dart';

class GridCubit extends Cubit<GridState> {
  GridCubit() : super(GridState(count: 1));

  void changeGrid() {
    if (state.count == 1) {
      emit(GridState(count: 2));
    } else {
      emit(GridState(count: 1));
    }
  }
}
