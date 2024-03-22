import 'package:color_app/bloc/color_events.dart';
import 'package:color_app/bloc/color_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ColorBloc extends Bloc<ColorEvent, ColorState> {
  bool initState = true;
  ColorBloc() : super(ColorInitial()) {
    on<ColorEvent>((event, emit) {
    });
    on<InitialEvent>((event, emit) {
      emit(ColorUpdateState(initialState: initState));
    });
    on<ColorToBlue> ((event, emit) {
      initState = true;
      emit(ColorUpdateState(initialState: initState));
    });
    on<ColorToRed> ((event, emit) {
      initState = false;
      emit(ColorUpdateState(initialState: initState));
    });
  }
}