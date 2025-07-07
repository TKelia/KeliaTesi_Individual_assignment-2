# Notes App

A Flutter notes application with Firebase authentication and Firestore backend. This app demonstrates clean architecture principles and state management using Provider.

## Features

- Email/Password Authentication
- Create, Read, Update, Delete notes
- Real-time updates
- Clean Architecture
- Provider State Management
- Input validation
- Error handling with SnackBars
- Loading states
- Responsive design

## Architecture

```
lib/
├── data/
│   ├── repositories/    # Repository implementations
│   └── services/        # Firebase services
├── domain/
│   ├── models/         # Data models
│   └── providers/      # State management
└── presentation/
    ├── screens/        # UI screens
    └── widgets/        # Reusable widgets
```

## Setup

1. Create a new Firebase project
2. Enable Email/Password Authentication
3. Create a Firestore database
4. Add Firebase configuration to the project
5. Install dependencies:
   ```bash
   flutter pub get
   ```
6. Run the app:
   ```bash
   flutter run
   ```

## State Management

This app uses Provider for state management. Here's how it works:

1. AuthProvider manages authentication state:
   - Handles sign-in/sign-up
   - Tracks current user
   - Manages loading states

2. NotesProvider manages notes state:
   - Real-time notes updates
   - CRUD operations
   - Loading and error states

## Error Handling

- Input validation for email and password
- Specific error messages for auth failures
- Loading indicators during async operations
- Error states in UI with retry options
- Success/Error SnackBars for feedback

## Dependencies

- firebase_core
- firebase_auth
- cloud_firestore
- provider
- flutter_spinkit
