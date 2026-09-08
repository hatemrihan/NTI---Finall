<p align="center">
  <img src="assets/images/logo.png" width="120" alt="LAMSA App Icon">
</p>

<h1 align="center">
  🛍️ LAMSA
</h1>

<h3 align="center">
  Smart Accessories Store — Elegance at Your Fingertips
</h3>

<p align="center">
  <a href="#-features">✨ FEATURES</a>
  &nbsp; • &nbsp;
  <a href="#-architecture">🏗 ARCHITECTURE</a>
  &nbsp; • &nbsp;
  <a href="#-tech-stack">🛠 TECH STACK</a>
  &nbsp; • &nbsp;
  <a href="#-getting-started">🚀 GETTING STARTED</a>
  &nbsp; • &nbsp;
  <a href="#-team">👥 TEAM</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=flat-square&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-%5E3.12.2-0175C2?style=flat-square&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Clean%20Architecture-294A3A?style=flat-square" alt="Clean Architecture">
  <img src="https://img.shields.io/badge/Cubit%20%2F%20BLoC-6C63FF?style=flat-square" alt="Cubit BLoC">
  <img src="https://img.shields.io/badge/Dio-REST%20API-FF6F00?style=flat-square" alt="Dio">
  <img src="https://img.shields.io/badge/Material%20Design-757575?style=flat-square&logo=material-design&logoColor=white" alt="Material Design">
</p>

<p align="center">
  🛒 Shopping
  &nbsp; • &nbsp;
  🔐 Authentication
  &nbsp; • &nbsp;
  ⭐ Reviews
  &nbsp; • &nbsp;
  🔍 Search
  &nbsp; • &nbsp;
  👤 Profile
  &nbsp; • &nbsp;
  🛠️ Admin
</p>

---

## 📱 About

**LAMSA** is a Flutter-based cross-platform e-commerce mobile application designed for premium smart accessories — watches, bags, jewelry, belts, and more.

Users can explore curated product categories, view detailed product information with color and size options, manage their shopping cart, write and read reviews, and enjoy a beautifully crafted onboarding experience.

The application is built with a focus on **clean architecture, reusable components, Cubit state management, REST API integration via Dio, and a polished premium UI.**

> 🎓 **Graduation Project** — NTI Flutter Mobile Development Track · Round 5
>
> 👨‍🏫 **Instructor:** Eng. Karim Tamer

---

## ✨ Features

### 🚀 Onboarding & Splash

- Branded splash screen with LAMSA logo
- 3-step onboarding experience
- **Discover** → **Shop With Confidence** → **Join the Community**
- Skip option for returning users
- Smooth page indicator transitions

---

### 🔐 Authentication

- User login with email & password
- User registration with form validation
- Real-time password strength indicator
- Email verification flow
- Forgot password → Reset password
- Change password from settings
- Social login buttons (Google / Apple)
- Secure token storage
- API error handling
- Loading, success, and failure states

---

### 🏠 Home & Discovery

The home screen provides multiple sections to help users discover products:

- **Trending Products** — Featured items
- **Category Browsing** — Watches, Bags, Jewelry, Belts
- **Quick Search** — Find products instantly
- Responsive product grid cards
- Category-based filtering
- Loading and empty states

---

### 📦 Product Details

Each product has a dedicated details screen containing:

- Product images
- Product name & description
- Price information
- Star rating & reviews count
- Color selector
- Size selector
- Add to cart action
- Write review option

The details screen provides users with all the information they need before purchasing.

---

### 🛒 Shopping Cart

- View all cart items
- Quantity increment / decrement controls
- Real-time price calculation
- Remove items from cart
- Empty cart state with illustration
- Checkout flow

---

### ⭐ Reviews

Users can share their experience through the review system:

- Write detailed product reviews
- Star rating selector
- Submit and view reviews
- Review cards with user information

---

### 👤 Profile & Settings

The profile section allows users to manage their account:

- View profile information
- Settings screen
- Change password
- Privacy policy
- About us
- Contact us
- Delete account

---

### 🛠️ Admin Panel

Administrative features for product management:

- Add new product form
- Manage existing products
- Edit product details
- Delete product with confirmation dialog
- Category dropdown selector
- Image upload container

---

## 🗺️ User Journey

```text
┌─────────────────┐
│     Splash      │
└────────┬────────┘
         ▼
┌─────────────────────────────┐
│   Onboarding (3 screens)    │─── Skip ───┐
└────────────┬────────────────┘             │
             ▼                              ▼
      ┌────────────┐                ┌────────────┐
      │   Login    │◄──────────────►│  Register  │
      └──────┬─────┘                └──────┬─────┘
             │                              │
             │   Forgot Password            │
             │        ▼                     │
             │   Reset Password             │
             │        ▼                     │
             │  Email Verification          │
             ▼                              ▼
      ┌────────────────────────────────────────┐
      │                 Home                    │
      └──┬──────────┬───────────┬──────────────┘
         │          │           │
         ▼          ▼           ▼
   Categories    Search      Profile
         │          │           │
         ▼          ▼           ▼
   Category     Results     Settings /
   Products                 About / Contact
         │
         ▼
   Product Details ──► Write Review
         │
         ▼
      My Cart
         │
         ▼
   (Checkout Flow)
```

| Journey | Flow |
|:--------|:-----|
| **New User** | Splash → Onboarding → Register → Email Verification → Home |
| **Returning User** | Splash → Login → Home |
| **Purchase** | Category / Search → Product Details → Add to Cart → Checkout |
| **Admin** | Product Management → Add / Edit / Delete Product |

---

## 📱 Screens Overview

| Group | Screens | Count |
|:------|:--------|:-----:|
| **Onboarding** | Splash · Discover · Shop With Confidence · Join the Community | 4 |
| **Authentication** | Login · Sign Up · Email Verification · Forgot Password · Reset Password · Change Password | 6 |
| **Shopping** | Home · Categories · Category Products · Product Details · Search · My Cart · Empty Cart | 7 |
| **Reviews** | Write a Review | 1 |
| **Account** | Profile · Settings · Privacy Policy · About Us | 4 |
| **Admin** | Add Product · Manage Products · Delete Confirmation | 3 |
| | **Total** | **25+** |

---

# 🏗 Architecture

LAMSA follows **Clean Architecture** with a feature-based project structure, combined with **Cubit** for state management.

The application is organized into three main layers:

```text
┌──────────────────────────────┐
│        Presentation          │
│                              │
│  Screens • Widgets • Cubit   │
│        • UI States           │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│            Domain            │
│                              │
│   Entities • Repository      │
│       Contracts              │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│             Data             │
│                              │
│ API • Models • Data Sources  │
│ Repository Implementations   │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│           REST API           │
└──────────────────────────────┘
```

Each feature is organized around its own business responsibility, keeping the codebase modular, maintainable, and easier to scale.

---

## 🛠 Tech Stack

<p>

<img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white">
<img src="https://img.shields.io/badge/Dart-%5E3.12.2-0175C2?style=for-the-badge&logo=dart&logoColor=white">
<img src="https://img.shields.io/badge/BLoC%20%2F%20Cubit-6C63FF?style=for-the-badge">
<img src="https://img.shields.io/badge/Dio-REST%20API-FF6F00?style=for-the-badge">
<img src="https://img.shields.io/badge/Clean%20Architecture-294A3A?style=for-the-badge">

</p>

### 🏗 Architecture & State

<p>
<img src="https://img.shields.io/badge/Clean%20Architecture-294A3A?style=flat-square">
<img src="https://img.shields.io/badge/BLoC%20%2F%20Cubit-6C63FF?style=flat-square">
<img src="https://img.shields.io/badge/Feature--Based%20Structure-1A435E?style=flat-square">
</p>

### 🌐 Networking & Data

<p>
<img src="https://img.shields.io/badge/Dio-REST%20API-FF6F00?style=flat-square">
<img src="https://img.shields.io/badge/Token%20Management-Secure%20Storage-607D8B?style=flat-square">
</p>

### 🎨 UI & User Experience

<p>
<img src="https://img.shields.io/badge/Material%20Design-757575?style=flat-square&logo=material-design&logoColor=white">
<img src="https://img.shields.io/badge/Flutter%20SVG-Vector%20Icons-FFB13B?style=flat-square">
<img src="https://img.shields.io/badge/Cupertino%20Icons-iOS%20Style-000000?style=flat-square&logo=apple&logoColor=white">
<img src="https://img.shields.io/badge/Manrope-Custom%20Typography-B9785B?style=flat-square&logo=google-fonts&logoColor=white">
</p>

### 🧩 Dev Tools

<p>
<img src="https://img.shields.io/badge/Flutter%20Launcher%20Icons-App%20Icon-02569B?style=flat-square">
<img src="https://img.shields.io/badge/Flutter%20Lints-Code%20Quality-00BFA5?style=flat-square">
<img src="https://img.shields.io/badge/Figma-Design%20Source-F24E1E?style=flat-square&logo=figma&logoColor=white">
</p>

---

## ⚙️ Engineering Highlights

### 🏗 Architecture & State Management

- **Clean Architecture** with feature-based modular structure
- **Cubit** for predictable and reactive state management
- **Repository Pattern** with domain-level contracts
- Separation of presentation, domain, and data responsibilities
- Dedicated `auth_cubit`, `products_cubit`, and `cart_cubit`

### 🌐 Networking & Data

- **RESTful API** integration using Dio
- Centralized API data sources per feature
- Model mapping and serialization
- Secure token management (`core/Token`)
- Loading, success, and failure state handling

### 🎨 UI & Design System

- Custom earthy-toned color palette (`app_colors.dart`)
- **25+ TextStyle presets** with Manrope font (`app_styles.dart`)
- Comprehensive form validation (`validators.dart`)
- Reusable widget library across features
- SVG icon rendering with `flutter_svg`
- Pixel-perfect Figma-to-Flutter implementation

### 🔐 Validation System

Production-grade input validation with user-friendly error messaging:

| Field | Validation Rules |
|:------|:----------------|
| ✅ **Email** | Must end with `@gmail.com`, min 6 chars before `@` |
| ✅ **Password** | 8+ chars, uppercase, lowercase, number, special char |
| ✅ **Phone** | Egyptian format — starts with `01`, exactly 11 digits |
| ✅ **National ID** | Exactly 14 digits |
| ✅ **Username** | 6+ chars, starts with letter, minimum 3 letters |

---

## 🎨 Visual Identity

LAMSA uses a calm, earthy-toned design language that feels premium and inviting:

| Token | Color | Hex | Usage |
|:------|:-----:|:---:|:------|
| **Primary** | 🟢 | `#294A3A` | Buttons, brand accents, active states |
| **Background** | 🟤 | `#F7F2EA` | Main scaffold background |
| **Surface** | ⬜ | `#FFFCF7` | Bottom navigation, cards |
| **Text** | ⚫ | `#1E2521` | Headings, body text |
| **Gray** | 🔘 | `#7B827A` | Hints, secondary text |
| **Accent** | 🟠 | `#B9785B` | Highlights, badges, CTAs |
| **Error** | 🔴 | `#DC2626` | Validation errors, alerts |
| **Card Fill** | ⬜ | `#F5F5F5` | Card backgrounds |
| **Border** | ⬜ | `#E0E0E0` | Input borders, dividers |

**Typography:** [Manrope](https://fonts.google.com/specimen/Manrope) — weights 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold), 800 (ExtraBold)

---

## 📂 Project Structure

The project follows a feature-based structure with shared application infrastructure inside `core`.

```text
lib/
├── core/
│   ├── Token/                          # Secure token management
│   ├── constants/
│   │   └── app_strings.dart            # Validation messages & UI strings
│   ├── theme/
│   │   ├── app_colors.dart             # Centralized color tokens
│   │   └── app_styles.dart             # Typography presets
│   ├── utils/
│   │   ├── app_styles.dart             # Additional style utilities
│   │   └── validators.dart             # Input validation logic
│   └── widgets/                        # Shared reusable widgets
│       ├── custom_elevated_buttom.dart
│       ├── custom_text_field.dart
│       ├── custom_text_button.dart
│       ├── custom_search_text_field.dart
│       └── search_text_field.dart
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── data_sources/           # API calls
│   │   │   ├── models/                 # Data models
│   │   │   └── repositories/           # Repository implementations
│   │   ├── domain/                     # Business logic contracts
│   │   └── presentation/
│   │       ├── auth_cubit/             # Auth state management
│   │       ├── screens/                # Login, Signup, Verify, etc.
│   │       └── widgets/               # Auth-specific widgets
│   │
│   ├── home/
│   │   ├── data/
│   │   │   ├── data_sources/           # Product API
│   │   │   └── models/                 # Product models
│   │   └── presentation/
│   │       ├── products_cubit/         # Products state management
│   │       ├── screens/                # Home, Product, Search, Admin
│   │       └── widgets/               # Home-specific widgets
│   │
│   ├── cart/
│   │   ├── data/
│   │   │   ├── data_sources/           # Cart API
│   │   │   └── models/                 # Cart models
│   │   ├── domain/                     # Cart business logic
│   │   └── presentation/
│   │       ├── cart_cubit/             # Cart state management
│   │       ├── screens/                # Cart screens
│   │       └── widgets/               # Cart-specific widgets
│   │
│   ├── profile/
│   │   ├── data/                       # Profile data layer
│   │   ├── domain/                     # Profile business logic
│   │   └── presentation/              # Profile screens & widgets
│   │
│   ├── settings/
│   │   ├── data/                       # Settings data
│   │   └── presentation/              # Settings screens
│   │
│   ├── navigation/
│   │   └── presentation/              # Bottom navigation bar
│   │
│   ├── onboarding/
│   │   └── presentation/              # Onboarding screens
│   │
│   └── splash/
│       └── presentation/              # Splash screen
│
├── screens/                            # Legacy / shared screens
└── main.dart                           # App entry point (LAMSA)
```

Each feature follows clean architecture and can contain:

```text
feature/
├── data/           # API, models, repositories
├── domain/         # Entities, contracts
└── presentation/   # Screens, widgets, cubit
```

---

## 🚀 Getting Started

### Prerequisites

| Requirement | Details |
|:------------|:--------|
| **Flutter SDK** | Dart ^3.12.2 |
| **IDE** | Android Studio, VS Code, or IntelliJ IDEA |
| **iOS Development** | Xcode (macOS only) |
| **Device** | Physical device or emulator / simulator |

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/hatemrihan/NTI---Finall.git
cd NTI---Finall

# 2. Verify your Flutter environment
flutter doctor

# 3. Install dependencies
flutter pub get

# 4. Launch the application
flutter run
```

### Run on Specific Platform

```bash
# Android
flutter run -d android

# iOS (macOS only)
flutter run -d ios

# Web
flutter run -d chrome
```

---

## 🌿 Git Workflow & Branching Strategy

The project follows a **feature-branch workflow** where each team member develops independently on their own named branch.

```text
main ← Integration branch (stable, production-ready)
 ├── rezk
 ├── yousef
 ├── abdelrahman
 ├── amr
 ├── elshafei
 ├── hadad
 └── mostafa
```

**Workflow Rules:**
- Each developer works exclusively on their named branch
- All changes are merged into `main` via **pull requests** with code review
- Merge conflicts are resolved collaboratively as a team
- `main` branch always reflects the latest stable version

---

## 🗺 Roadmap

| ✅ Completed | 🔜 Planned |
|:---|:---|
| ✅ Project setup & visual identity | 🔜 Full API / Backend integration |
| ✅ Splash screen with branding | 🔜 State management expansion |
| ✅ Onboarding flow (3 screens) | 🔜 Wishlist feature |
| ✅ Authentication (Login, Sign Up) | 🔜 Push notifications |
| ✅ Email Verification flow | 🔜 Payment gateway integration |
| ✅ Home screen with categories | 🔜 Favorites system |
| ✅ Product Details (color/size) | 🔜 Order tracking |
| ✅ Shopping Cart with controls | 🔜 Testing suite |
| ✅ Write Review functionality | 🔜 Performance optimization |
| ✅ Profile & Settings screens | 🔜 Google Play release |
| ✅ Admin product management | 🔜 Apple App Store release |
| ✅ Search screen | |
| ✅ Form validation system | |
| ✅ Custom widget library | |
| ✅ Clean Architecture setup | |
| ✅ Cubit state management | |

---

## 👥 Team

> **Flutter Training — NTI Round 5 · Graduation Project**

| # | Name | Branch | Role |
|:-:|:-----|:------:|:-----|
| 1 | **Ahmed Rezk** | `rezk` | Flutter Developer |
| 2 | **Yousef Elbeltagy** | `yousef` | Flutter Developer |
| 3 | **Abdelrahman Ismaeil** | `abdelrahman` | Flutter Developer |
| 4 | **Amr** | `amr` | Flutter Developer |
| 5 | **Elshafei Mohamed** | `elshafei` | Flutter Developer |
| 6 | **Ahmed Elhaddad** | `hadad` | Flutter Developer |
| 7 | **Mostafa Saad** | `mostafa` | Flutter Developer |
| 8 | **Hatem Rihan** | — | Supervisor / Repository Owner |

---

## 👨‍🏫 Instructor

<div align="center">

### **Eng. Karim Tamer**

**Flutter Instructor — National Telecommunication Institute (NTI)**

</div>

This project was developed under the expert supervision and mentorship of **Eng. Karim Tamer**, who guided the team throughout the Flutter Mobile Development Track (Round 5). His instruction covered the complete spectrum of mobile development — from foundational Dart programming and Flutter widget architecture to advanced topics including clean architecture, Cubit state management, REST API integration, and professional development workflows.

---

## 🏛️ About the Program

<div align="center">

**NTI — National Telecommunication Institute**<br>
**Flutter Mobile Development Track · Round 5**

</div>

This is the **final graduation project** for the Flutter training track at NTI. The program equips trainees with the professional skills required to design, develop, and deliver a **complete production-grade mobile application** — covering:

- 🎨 **UI/UX Design** — Translating Figma designs into pixel-perfect Flutter implementations
- 📐 **Clean Architecture** — Feature-based modular structure with separation of concerns
- 🔄 **State Management** — Reactive UI with Cubit / BLoC pattern
- 👥 **Team Collaboration** — Professional Git & GitHub workflows with feature branching
- 🌐 **API Integration** — REST API consumption using Dio with proper error handling
- 📱 **Cross-Platform** — Single codebase targeting iOS, Android, and Web

---

## 🙏 Acknowledgements

We extend our sincere gratitude to:

- **Eng. Karim Tamer** — For his exceptional instruction, continuous support, and dedication throughout the Flutter training program
- **NTI (National Telecommunication Institute)** — For providing this invaluable training opportunity and fostering the next generation of mobile developers
- **The entire team** — For their commitment, collaboration, and hard work in bringing LAMSA to life

---

## 📄 License

This project is an **educational / graduation project** developed as part of the **NTI Flutter Training Program (Round 5)**. All rights reserved to the development team and NTI.

---

<p align="center">

**LAMSA** · Smart Accessories Store<br>
_Elegance at Your Fingertips_

<br>

Made with ❤️ and Flutter<br>
NTI Round 5 · Supervised by **Eng. Karim Tamer**

<br>

<img src="https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white" alt="Flutter"/>
<img src="https://img.shields.io/badge/Made_with_❤️-294A3A?style=flat-square" alt="Love"/>
<img src="https://img.shields.io/badge/NTI-Round_5-B9785B?style=flat-square" alt="NTI"/>
<img src="https://img.shields.io/badge/Instructor-Eng._Karim_Tamer-294A3A?style=flat-square" alt="Instructor"/>

<br><br>

<a href="https://www.figma.com/design/1adCRVoFF08Qz5uaDZbz4Q/NTI-Final-Project">🎨 Figma Design</a>
&nbsp; • &nbsp;
<a href="https://github.com/hatemrihan/NTI---Finall">📦 GitHub Repository</a>

</p>
