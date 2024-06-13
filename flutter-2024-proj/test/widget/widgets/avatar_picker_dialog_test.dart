import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:video_game_catalogue_app/logic/blocs/avatar/avatar_bloc.dart';
import 'package:video_game_catalogue_app/presentation/widgets/avatar_picker_dialog.dart';

class MockAvatarBloc extends Mock implements AvatarBloc {}

void main() {
  group('AvatarPickerDialog', () {
    late AvatarBloc avatarBloc;

    setUp(() {
      avatarBloc = MockAvatarBloc();
      when(() => avatarBloc.state).thenReturn(1);
    });

    testWidgets('should display a list of avatars', (tester) async {
      // Arrange
      await tester.pumpWidget(
        BlocProvider<AvatarBloc>(
          create: (context) => avatarBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Center(
                child: AvatarPickerDialog(),
              ),
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(CircleAvatar), findsWidgets);
    });

    testWidgets('should close the dialog when Cancel button is pressed',
        (tester) async {
      // Arrange
      await tester.pumpWidget(
        BlocProvider<AvatarBloc>(
          create: (context) => avatarBloc,
          child: MaterialApp(
            home: Scaffold(
              body: AvatarPickerDialog(),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}