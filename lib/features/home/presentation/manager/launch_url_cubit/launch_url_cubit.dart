import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/launch_book_url_use_case.dart';

part 'launch_url_state.dart';

class LaunchUrlCubit extends Cubit<LaunchUrlState> {
  final LaunchBookUrlUseCase launchBookUrlUseCase;

  LaunchUrlCubit({required this.launchBookUrlUseCase})
      : super(LaunchUrlInitial());

  Future<void> launchUrl(String url) async {
    emit(LaunchUrlLoading());
    var result = await launchBookUrlUseCase.call(url);
    result.fold((failure) {
      return emit(LaunchUrlFailure(failure.msg));
    }, (r) => emit(LaunchUrlSuccess()));
  }
}
