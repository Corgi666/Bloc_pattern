import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState()) {
    on<TriggerSetting>(_triggerSetting);
  }
  _triggerSetting(SettingEvent event, Emitter emit) {
    emit(SettingState());
  }
}
