import 'package:flutter/material.dart';
import '../../data/repositories/notes_repository.dart';
import '../models/note.dart';

class NotesProvider with ChangeNotifier {
  late NotesRepository _repository;
  List<Note> _notes = [];
  bool _isLoading = true;
  String? _error;

  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void initialize(String userId) {
    _repository = NotesRepository(userId);
    _listenToNotes();
  }

  void _listenToNotes() {
    _repository.fetchNotes().listen(
      (notes) {
        _notes = notes;
        _isLoading = false;
        _error = null;
        notifyListeners();
      },
      onError: (error) {
        _error = 'Failed to fetch notes';
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> addNote(String text) async {
    try {
      await _repository.addNote(text);
    } catch (e) {
      _error = 'Failed to add note';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> updateNote(String id, String text) async {
    try {
      await _repository.updateNote(id, text);
    } catch (e) {
      _error = 'Failed to update note';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      await _repository.deleteNote(id);
    } catch (e) {
      _error = 'Failed to delete note';
      notifyListeners();
      rethrow;
    }
  }
}
