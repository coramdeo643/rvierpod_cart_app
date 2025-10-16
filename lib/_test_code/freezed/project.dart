import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';

@freezed
abstract class Project with _$Project {
  const factory Project({
    required int id,
    required String title,
    required String content,
  }) = _Project;
}

void main() {
  Project project1 = Project(id: 1, title: "1", content: "1");
  Project project2 = Project(id: 1, title: "1", content: "1");
  print(project1 == project2);
  Project project3 = project1.copyWith(title: "2");
  print(project3.toString());
}
