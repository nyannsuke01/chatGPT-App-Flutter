import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/text_completion_model.dart';
import '../../domain/usecases/get_text_completion_usecase.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

part 'text_completion_state.dart';

class TextCompletionCubit extends Cubit<TextCompletionState> {
  final TextCompletionUseCase textCompletionUseCase;
  TextCompletionCubit({required this.textCompletionUseCase})
      : super(TextCompletionInitial());
  Future<void> textCompletion({required String query}) async {
    emit(TextCompletionLoading());
    try {
      String translatedText = await DeepL.translate(query);
      final result = await textCompletionUseCase.execute(translatedText);
      result.fold(
        (failure) {
          emit(TextCompletionFailure(errorMsg: failure.message));
          return; // ハンドリング後に return することで、関数の実行を終了します。
        },
        (data) {
          emit(TextCompletionLoaded(textCompletionModelData: data));
        },
      );
    } catch (e) {
      emit(TextCompletionFailure(errorMsg: e.toString()));
    }
  }
}

class DeepL {
  static const String _baseUrl = 'https://api-free.deepl.com/v2';
  static const String _apiKey = '5519c55a-f929-d910-44fe-b0950c1e9035:fx';

  static Future<String> translate(String text) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/translate'),
      body: {
        'auth_key': _apiKey,
        'text': text,
        'target_lang': 'EN',
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      final body = json.decode(response.body);
      return body['translations'][0]['text'];
    } else {
      throw Exception('Failed to translate text');
    }
  }
}
