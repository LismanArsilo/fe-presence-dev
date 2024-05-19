import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presence_flutter_app/data/datasources/auth_remote_datasource.dart';
import 'package:presence_flutter_app/data/models/response/user_response_model.dart';

part 'update_user_register_face_event.dart';
part 'update_user_register_face_state.dart';
part 'update_user_register_face_bloc.freezed.dart';

class UpdateUserRegisterFaceBloc
    extends Bloc<UpdateUserRegisterFaceEvent, UpdateUserRegisterFaceState> {
  final AuthRemoteDataResource authRemoteDataSource;
  UpdateUserRegisterFaceBloc(
    this.authRemoteDataSource,
  ) : super(_Initial()) {
    on<_UpdateProfileRegisterFace>((event, emit) async {
      emit(const _Loading());
      try {
        final user = await authRemoteDataSource.updateProfileRegisterFace(
            event.embedded, event?.image);
        user.fold((l) => emit(_Error(l)), (r) => emit(_Success(r)));
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}