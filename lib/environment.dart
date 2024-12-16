const environment = {
  "API_URL": String.fromEnvironment('API_URL'),
  "FIREBASE_MESSAGING_API_KEY":
      String.fromEnvironment('FIREBASE_MESSAGING_API_KEY'),
  "FIREBASE_MESSAGING_APP_ID":
      String.fromEnvironment('FIREBASE_MESSAGING_APP_ID'),
  "FIREBASE_MESSAGING_SENDER_ID":
      String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID'),
  "FIREBASE_MESSAGING_PROJECT_ID":
      String.fromEnvironment('FIREBASE_MESSAGING_PROJECT_ID'),
  "USE_SIMULATOR": bool.fromEnvironment('USE_SIMULATOR'),
  "CONTEXT": String.fromEnvironment('CONTEXT'),
};

final isInTestEnvironment = environment["CONTEXT"] == "test";
