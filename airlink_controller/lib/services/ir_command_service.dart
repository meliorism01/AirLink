import '../models/ac_state.dart';

class IRCommandService {
  String buildCommand(ACState state) {
    return state.toJson().toString();
  }
}