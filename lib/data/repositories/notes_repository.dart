import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/note.dart';

class NotesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId;

  NotesRepository(this.userId);

  CollectionReference get _notesCollection =>
      _firestore.collection('users').doc(userId).collection('notes');

  // Fetch all notes
  Stream<List<Note>> fetchNotes() {
    return _notesCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Note.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Add a note
  Future<void> addNote(String text) async {
    await _notesCollection.add({
      'text': text,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Update a note
  Future<void> updateNote(String id, String text) async {
    await _notesCollection.doc(id).update({
      'text': text,
    });
  }

  // Delete a note
  Future<void> deleteNote(String id) async {
    await _notesCollection.doc(id).delete();
  }
}
