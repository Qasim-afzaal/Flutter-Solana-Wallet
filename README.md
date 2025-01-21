# 🌟 Solana Wallet Flutter App 🌟

Dive into the world of Solana with this Flutter app! 🚀 This project lets you create Solana wallets, interact with the blockchain, and leverage QuickNode APIs for all your Web3 needs. Let's make blockchain fun and easy! 😎

---

## 💡 Features That Shine

✨ **Create New Wallets**  
Generate wallets with secure seed phrases and take control of your crypto journey.  

🔐 **Secure Login**  
Log in using private keys or seed phrases. Your wallet, your rules.  

🌐 **Blockchain Magic**  
Interact with the Solana blockchain like a pro using QuickNode APIs.  

📖 **Seed Phrase Upload**  
Already have a wallet? Bring it here with your existing seed phrase!  

⚡ **Quick Account Setup**  
Simple account creation for seamless Solana experiences.  

---

## 🔧 Dependencies

Here's what makes this app tick! Add these to your `pubspec.yaml` file:

```yaml
dependencies:
  cupertino_icons: ^1.0.8
  go_router: ^10.0.0
  solana: ^0.29.1
  bip39: ^1.0.6
  flutter_secure_storage: ^8.0.0
  flutter_dotenv: ^5.1.0
```

---

## 🚀 Getting Started

### 1️⃣ Clone the Project

```bash
git clone <repository-url>
cd <repository-folder>
```

### 2️⃣ Install the Magic (Dependencies)

```bash
flutter pub get
```

### 3️⃣ Configure Your Secrets

Create a `.env` file in the project root and pop in your QuickNode API key:

```env
QUICKNODE_API_KEY=your_quicknode_api_key
```

### 4️⃣ Launch the App

```bash
flutter run
```

And voilà! Your Solana wallet app is live! 🎉

---

## 🔥 Wallet Powers Explained

### **Generate a Seed Phrase**
Magically create a secure seed phrase:

```dart
import 'package:bip39/bip39.dart' as bip39;

String generateSeedPhrase() {
  return bip39.generateMnemonic();
}
```

### **Restore a Wallet**
Bring your existing wallet back to life:

```dart
import 'package:solana/solana.dart';

Future<Ed25519HDKeyPair> restoreWallet(String seedPhrase) async {
  final seed = bip39.mnemonicToSeed(seedPhrase);
  return Ed25519HDKeyPair.fromSeed(seed);
}
```

### **Secure Your Secrets**
Lock your seed phrase like Fort Knox:

```dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

Future<void> saveSeedPhrase(String seedPhrase) async {
  await storage.write(key: 'seedPhrase', value: seedPhrase);
}

Future<String?> retrieveSeedPhrase() async {
  return await storage.read(key: 'seedPhrase');
}
```

### **Talk to Solana**
Check your account balance faster than you can say "blockchain":

```dart
import 'package:solana/solana.dart';

Future<void> getAccountBalance(String publicKey) async {
  final client = SolanaClient(
    rpcUrl: Uri.parse('https://your-quicknode-url.com'),
    websocketUrl: Uri.parse('wss://your-quicknode-url.com'),
  );

  final balance = await client.rpcClient.getBalance(publicKey);
  print('Account Balance: $balance');
}
```

### **Smooth Navigation**
Glide through the app with `go_router`:

```dart
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
.............
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    ..........
  ],
);
```

---

## ⚙️ How to Use

1. **Create a Wallet**  
   Tap "Create Wallet" to generate a new wallet with a seed phrase.  

2. **Restore a Wallet**  
   Select "Restore Wallet" to input your existing seed phrase.  

3. **Check Balance**  
   Enter your wallet's public key and fetch its balance instantly!  

4. **Store Securely**  
   Seed phrases are stored using military-grade encryption (okay, it's just `flutter_secure_storage`, but still).

---

## 🎉 Join the Fun

Got a killer idea or found a bug? Fork this repo, submit a PR, or just open an issue. Let’s build something awesome together! 🌐

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).  

---

✨ **Pro Tip**: Crypto is fun but also serious business. Always back up your seed phrases and keep them safe! 🔑
```

This version adds a more engaging tone while retaining all the critical details. It’s perfect for making the project feel approachable and exciting! 🚀
