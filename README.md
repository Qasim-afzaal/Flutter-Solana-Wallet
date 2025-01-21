# Solana Wallet Flutter Project

This project is a Flutter application that enables users to create and manage Solana wallets, interact with the blockchain using Solana libraries, and integrate QuickNode APIs for advanced blockchain functionalities.

---

## Features

1. **Create Solana Wallets**:
   - Generate new wallets with secure seed phrases.
   - Option to upload pre-existing seed phrases.

2. **Blockchain Interaction**:
   - Use Solana libraries to interact with the Solana blockchain.
   - Leverage QuickNode APIs for optimized blockchain integration.

3. **Account Creation**:
   - Implement an account creation system with secure seed phrase storage.

4. **Secure Login Process**:
   - Secure login using private keys and seed phrases.

5. **Seed Phrase Management**:
   - Generate, securely store, and restore wallets using seed phrases.

---

## Dependencies

Add the following dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  cupertino_icons: ^1.0.8
  go_router: ^10.0.0
  solana: ^0.29.1
  bip39: ^1.0.6
  flutter_secure_storage: ^8.0.0
  flutter_dotenv: ^5.1.0
