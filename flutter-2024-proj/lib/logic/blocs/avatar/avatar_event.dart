part of 'avatar_bloc.dart';

sealed class AvatarEvent extends Equatable {
  const AvatarEvent();

  @override
  List<Object> get props => [];
}

final class SetAvatarIndex extends AvatarEvent {
  final int index;

  const SetAvatarIndex(this.index);
}

final class GetAvatarIndex extends AvatarEvent {}

final class ResetAvatarIndex extends AvatarEvent {}
