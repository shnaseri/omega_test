part of 'album_cubit.dart';

@immutable
abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoad extends AlbumState {
  final List<ImageData> images;

  AlbumLoad(this.images);
}

class AlbumError extends AlbumState {}
