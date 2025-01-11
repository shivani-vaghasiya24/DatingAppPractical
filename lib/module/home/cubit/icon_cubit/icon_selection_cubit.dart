import 'package:flutter_bloc/flutter_bloc.dart';

class IconSelectionCubit extends Cubit<int> {
  IconSelectionCubit() : super(0); // Default selection index is 0

  void selectIcon(int index) {
    emit(index);
  }
}
