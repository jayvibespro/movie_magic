class MovieActorEntity {
  static const String tableName = 'movie_actor';

  final int movieId;
  final int actorId;

  MovieActorEntity({required this.movieId, required this.actorId});

  Map<String, dynamic> toMap() {
    return {'movie_id': movieId, 'actor_id': actorId};
  }

  factory MovieActorEntity.fromMap(Map<String, dynamic> map) {
    return MovieActorEntity(movieId: map['movie_id'], actorId: map['actor_id']);
  }
}
