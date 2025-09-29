# flutter_app

A Flutter project demonstrating user authentication using Firebase and some other features like Cubits, APIs and Firebase FireStore.

## Overview

`flutter_app` is a mobile application built with Flutter that provides a foundation for user authentication. It allows users to sign up, sign in, and manage their sessions. The app uses Firebase for backend authentication services and BLoC/Cubit for state management to handle the authentication flow.

## Features

- **Email & Password Authentication**:
  - User sign-up with email and password.
  - User sign-in with existing credentials.
- **Session Management**: Persists user sessions and automatically routes users based on their authentication status.
- **Protected Routing**: Directs users to a login screen if unauthenticated or to the main home screen if authenticated.

## Core Technologies

- **Flutter**: UI toolkit for building natively compiled applications for mobile from a single codebase.
- **Firebase Authentication**: Backend service for handling user sign-up, sign-in, and session management.
- **Cloud Firestore**: (Assumed for user data storage or other app data, based on dependency) NoSQL database for storing and syncing data.
- **BLoC/Flutter BLoC**: State management library used for managing authentication state (`AuthCubit`).

## Authentication Flow

1.  The application starts and initializes Firebase.
2.  The `AuthGateScreen` is displayed, which listens to the `AuthCubit` for authentication state changes.
3.  `AuthCubit` in turn listens to real-time authentication state updates from Firebase via `AuthRepo`.
4.  If a user is already authenticated (e.g., from a previous session), `AuthGateScreen` navigates to `HomeScreen`.
5.  If no user is authenticated, `AuthGateScreen` displays `LoginScreen`.
6.  Users can navigate to `SignUpScreen` from `LoginScreen` to create a new account.
7.  Both login and sign-up operations are handled by `AuthCubit`, which uses `AuthRepo` to communicate with Firebase Authentication.


## Project Structure (Key Components)

- `lib/main.dart`: Entry point of the application, initializes Firebase, Hive, and sets up initial BLoC providers.
- `lib/cubits/auth_cubit.dart`: Manages authentication state and business logic related to authentication.
- `lib/firebase_services/auth_repo.dart`: Repository class that directly interacts with Firebase Authentication services.
- `lib/screens/auth_gate_screen.dart`: A widget that routes users based on their authentication state.
- `lib/screens/login_screen.dart`: UI for user login.
- `lib:screens/signup_screen.dart`: UI for user registration.
- `lib/screens/home_screen.dart`: The main screen displayed after successful authentication.
- `lib/screens/popular_people_screen.dart`: A screen that displays a list of popular people.
- `lib/screens/profile_screen.dart`: UI for user profile management.

