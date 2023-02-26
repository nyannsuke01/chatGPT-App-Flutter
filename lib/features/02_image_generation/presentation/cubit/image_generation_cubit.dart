import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../03_text_completion/presentation/cubit/text_completion_cubit.dart';
import '../../domain/entities/image.dart';
import '../../domain/usecases/get_generate_image.dart';

part 'image_generation_state.dart';

class ImageGenerationCubit extends Cubit<ImageGenerationState> {
  final ImageGenerationUseCase imageGenerationUseCase;
  ImageGenerationCubit({required this.imageGenerationUseCase})
      : super(ImageGenerationInitial());

  Future<void> imagesGenerate({required String query}) async {
    emit(ImageGenerationLoading());
    try {
      String translatedText = await DeepL.translate(query);
      final result = await imageGenerationUseCase.execute(translatedText);
      result.fold(
        (failure) {
          emit(ImageGenerationFailure(errorMsg: failure.message));
          return; // ハンドリング後に return することで、関数の実行を終了します。
        },
        (data) {
          emit(ImageGenerationLoaded(imageGenerationModelData: data));
        },
      );
    } catch (e) {
      emit(ImageGenerationFailure(errorMsg: e.toString()));
    }
  }
}
