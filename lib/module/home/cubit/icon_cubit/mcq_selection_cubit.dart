import 'package:flutter_bloc/flutter_bloc.dart';

class McqSelectionCubit extends Cubit<int> {
  McqSelectionCubit() : super(0); // Default selection index is 0

  void selectIcon(int index) {
    emit(index);
  }
}
