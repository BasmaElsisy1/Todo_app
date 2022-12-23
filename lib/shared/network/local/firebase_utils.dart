import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/task.dart';

CollectionReference<Task> getTasksCollections() {
  return FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
      fromFirestore: ((snapshot, options) => Task.fromJson(snapshot.data()!)),
      toFirestore: (value, options) => value.toJson());
}

Future<void> addTaskToFireStore(Task task) {
  // FirebaseFirestore.instance.collection('tasks').add(data);
  var collection = getTasksCollections();
  var documentref = collection.doc();
  task.id = documentref.id;
  return documentref.set(task);
}

Stream<QuerySnapshot<Task>> getDataFromFireStore(DateTime date) {
  return getTasksCollections()
      .where('date', isEqualTo: date.microsecondsSinceEpoch)
      .snapshots();
}

Future<void> deleteTasksFromFireStore(String id) {
  return getTasksCollections().doc(id).delete();
}

Future<void> ChangeDone(String id) {
  return getTasksCollections().doc(id).update({"isDone": true});
}

// Future<void> Edit(String id, String title) {
//   return getTasksCollections().doc(id).update({"title": title});
// }
