import 'package:babybrain/presentation/bottomNavBar/bloc/navigation_even.dart';
import 'package:babybrain/presentation/bottomNavBar/bloc/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationChanged(index: 0)) {
    on<NavigateTo>((event, emit) {
      emit(NavigationChanged(index: event.index));
    });
  }
}
