<div align="center">

# 🛍️ NOMA — Smart Accessories Store

<br>

<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
<img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
<img src="https://img.shields.io/badge/Dio-FF6F00?style=for-the-badge&logo=dart&logoColor=white" alt="Dio"/>
<img src="https://img.shields.io/badge/SVG-FFB13B?style=for-the-badge&logo=svg&logoColor=white" alt="SVG"/>
<img src="https://img.shields.io/badge/Material_Design-757575?style=for-the-badge&logo=material-design&logoColor=white" alt="Material Design"/>

<br><br>

<img src="https://img.shields.io/badge/NTI-Round%205%20Graduation-294A3A?style=flat-square" alt="NTI"/>
<img src="https://img.shields.io/badge/Platform-iOS%20%7C%20Android-7B827A?style=flat-square" alt="Platform"/>
<img src="https://img.shields.io/badge/Version-1.0.0-B9785B?style=flat-square" alt="Version"/>
<img src="https://img.shields.io/badge/Dart_SDK-%5E3.12.2-0175C2?style=flat-square" alt="Dart SDK"/>
<img src="https://img.shields.io/badge/License-Educational-294A3A?style=flat-square" alt="License"/>

<br><br>

**A premium e-commerce mobile app for smart accessories — watches, bags, jewelry, belts & more.**<br>
Built with Flutter · Designed in Figma · Powered by REST APIs via Dio

<br>

[🎨 Figma Design](https://www.figma.com/design/1adCRVoFF08Qz5uaDZbz4Q/NTI-Final-Project) · [📦 GitHub Repo](https://github.com/hatemrihan/NTI---Finall)

</div>

---

## 📋 Table of Contents

- [About](#-about)
- [Visual Identity](#-visual-identity)
- [Key Features](#-key-features)
- [User Journey](#-user-journey)
- [Screens Overview](#-screens-overview)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Design System](#-design-system)
- [Getting Started](#-getting-started)
- [Git Workflow](#-git-workflow)
- [Roadmap](#-roadmap)
- [Team](#-team)
- [About the Program](#-about-the-program)
- [License](#-license)

---

## 📖 About

**NOMA** is a full-featured e-commerce mobile application focused on premium smart accessories. The app delivers a complete shopping experience — from a beautiful onboarding flow to product browsing, cart management, reviews, and admin product management.

| Item | Details |
|:-----|:--------|
| **App Name** | NOMA |
| **Tagline** | Smart Accessories Store |
| **Platform** | Flutter (iOS & Android) |
| **Project Type** | Graduation Project — Flutter Training |
| **Organization** | NTI (National Telecommunication Institute) |
| **Intake** | Round 5 |
| **Design** | [Figma — NTI Final Project](https://www.figma.com/design/1adCRVoFF08Qz5uaDZbz4Q/NTI-Final-Project) |

---

## 🎨 Visual Identity

NOMA uses a calm, earthy-toned design language that feels premium and inviting:

| Token | Color | Hex | Usage |
|:------|:-----:|:---:|:------|
| **Primary** | 🟢 | `#294A3A` | Buttons, brand accents, active states |
| **Background** | 🟤 | `#F7F2EA` | Main scaffold background |
| **Surface** | ⬜ | `#FFFCF7` | Bottom navigation, cards |
| **Text** | ⚫ | `#1E2521` | Headings, body text |
| **Gray** | 🔘 | `#7B827A` | Hints, secondary text |
| **Accent** | 🟠 | `#B9785B` | Highlights, badges |
| **Error** | 🔴 | `#DC2626` | Validation errors |
| **Card Fill** | ⬜ | `#F5F5F5` | Card backgrounds |
| **Border** | ⬜ | `#E0E0E0` | Input borders, dividers |

**Typography:** [Manrope](https://fonts.google.com/specimen/Manrope) — weights 400 (Regular) through 800 (ExtraBold)

---

## ✨ Key Features

### 🚀 App Launch & Onboarding
- Branded splash screen with NOMA wordmark
- 3-step onboarding flow: *Discover → Shop With Confidence → Join the Community*
- Skip option to jump straight to authentication

### 🔐 Authentication & Account
- Sign In (Email + Password) with form validation
- Create Account with strong password enforcement
- Email Verification flow
- Forgot Password → Reset Password
- Social login buttons (Google / Apple)
- Change password from Settings
- Delete account

### 🛒 Browse & Shop
- Home screen with categories, search, and trending products
- Browse by categories: Watches, Bags, Jewelry, Belts…
- Product detail view: price, description, ratings, color & size options
- Write & submit reviews with star ratings
- Shopping cart with quantity controls
- Empty cart state handling

### 👤 Profile & Settings
- User profile screen
- Settings (theme, currency)
- Privacy Policy
- About Us
- Contact Us

### 🛠️ Product Management (Admin)
- Add new product form
- Manage existing products
- Delete with confirmation dialog

### ⚠️ System States
- Error screen with retry
- Empty states (no results, empty cart)

---

## 🗺️ User Journey

```
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
| **Auth** | Login · Sign Up · Email Verification · Forgot Password · Reset Password | 5 |
| **Shopping** | Home · Categories · Product Details · Search · My Cart · Empty Cart | 6 |
| **Reviews** | Write a Review | 1 |
| **Account** | Profile · Settings · Change Password · Privacy Policy · About Us | 5 |
| **Admin** | Add Product · Manage Products · Delete Confirmation | 3 |
| **System** | No Results · Error | 2 |
| | **Total** | **26** |

---

## 🛠️ Tech Stack

| Layer | Technology |
|:------|:-----------|
| **Framework** | Flutter (cross-platform iOS & Android) |
| **Language** | Dart ^3.12.2 |
| **UI** | Material Design + Custom Design System |
| **Networking** | [Dio](https://pub.dev/packages/dio) ^5.11.0 (REST API client) |
| **SVG Rendering** | [flutter_svg](https://pub.dev/packages/flutter_svg) ^2.3.0 |
| **Icons** | Cupertino Icons ^1.0.8 + Material Icons |
| **Typography** | Manrope (custom font, bundled) |
| **Design Tool** | Figma |

---

## 📂 Project Structure

```
NTI---Finall/
├── 📁 lib/
│   ├── 📄 main.dart                        # App entry point (NEMOStore)
│   ├── 📄 app_colors.dart                  # Color constants & design tokens
│   ├── 📄 app_styles.dart                  # TextStyle presets (11px–48px)
│   ├── 📄 app_strings.dart                 # Validation messages & strings
│   ├── 📁 screens/                         # All app screens
│   │   ├── splash_screen.dart
│   │   ├── onBoarding1_screen.dart
│   │   ├── onboarding2_screen.dart
│   │   ├── onboarding3_screen.dart
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   │   ├── email_verification_screen.dart
│   │   ├── change_password_screen.dart
│   │   ├── home_screen.dart
│   │   ├── product_screen.dart
│   │   ├── cart_screen.dart
│   │   ├── cart_empty_screen.dart
│   │   ├── search_screen.dart
│   │   ├── profile_screen.dart
│   │   ├── settings_screen.dart
│   │   ├── privacy_policy_screen.dart
│   │   ├── about_us_screen.dart
│   │   └── Delete_Confirmation.dart
│   └── 📁 widgets/                         # Reusable UI components
│       ├── bottom_nav_bar.dart
│       ├── custom_appBar_widget.dart
│       ├── custom_arrow_back.dart
│       ├── custom_categories_home.dart
│       ├── custom_elevated_buttom.dart
│       ├── custom_text_field.dart
│       ├── custom_search_text_field.dart
│       ├── custom_social_button.dart
│       ├── custom_text_button.dart
│       ├── custom_profile_item.dart
│       ├── custom_container_row.dart
│       ├── custom_row.dart
│       ├── cutom_gridview_home.dart
│       ├── filter_button.dart
│       ├── color_button.dart
│       ├── size_button.dart
│       ├── counter_button.dart
│       ├── login_header_section.dart
│       ├── login_social_section.dart
│       ├── onboarding_img_section.dart
│       ├── onboarding_text_section.dart
│       ├── onboarding_page_indicator.dart
│       ├── or_divider.dart
│       ├── password_strengthIndicatorBar.dart
│       ├── product_info.dart
│       ├── review_cart_details.dart
│       ├── write_review.dart
│       └── validators.dart
├── 📁 assets/
│   ├── 📁 images/                          # PNG images (cart items, profile, etc.)
│   ├── 📁 icons/                           # SVG icons (Google, Apple)
│   └── 📁 fonts/                           # Manrope font family (5 weights)
├── 📁 android/                             # Android platform config
├── 📁 ios/                                 # iOS platform config
├── 📁 web/                                 # Web platform config
├── 📁 test/                                # Unit & widget tests
├── 📄 pubspec.yaml                         # Dependencies & assets declaration
├── 📄 analysis_options.yaml                # Lint rules
└── 📄 README.md                            # You are here!
```

---

## 🎯 Design System

### Colors (`app_colors.dart`)
Centralized color constants ensuring visual consistency across all screens.

### Typography (`app_styles.dart`)
A comprehensive type scale with **25+ TextStyle presets** covering:

| Size Range | Weights Available |
|:-----------|:-----------------|
| 11px – 14px | Regular, Medium, SemiBold, Bold |
| 16px – 18px | SemiBold, Bold, ExtraBold |
| 20px – 28px | Bold, ExtraBold |
| 48px | ExtraBold (brand/display) |

### Validation (`validators.dart` + `app_strings.dart`)
Comprehensive input validation for:
- ✅ Email format (must end with `@gmail.com`, min 6 chars before `@`)
- ✅ Password strength (8+ chars, uppercase, lowercase, number, special char)
- ✅ Phone number (Egyptian format: starts with `01`, 11 digits)
- ✅ National ID (14 digits)
- ✅ Username (6+ chars, starts with letter, 3+ letters min)

### Reusable Widgets (29 components)
A rich library of custom widgets including buttons, text fields, navigation bars, product cards, social login buttons, onboarding sections, and more.

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** (Dart ^3.12.2)
- **Android Studio** or **Xcode** (for iOS)
- Physical device or emulator/simulator

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/hatemrihan/NTI---Finall.git
cd NTI---Finall

# 2. Check your Flutter environment
flutter doctor

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run
```

### Run on Specific Platform

```bash
# Android
flutter run -d android

# iOS
flutter run -d ios

# Web
flutter run -d chrome
```

---

## 🌿 Git Workflow

The project follows a **feature-branch workflow** where each team member works on their own branch:

```
main ← Integration branch (stable)
 ├── rezk
 ├── yousef
 ├── abdelrahman
 ├── amr
 ├── elshafei
 ├── hadad
 └── mostafa
```

- Each developer works on their named branch
- Changes are merged into `main` via pull requests
- Merge conflicts are resolved collaboratively

---

## 🗓️ Roadmap

- [x] Project setup & visual identity
- [x] Splash screen
- [x] Onboarding screens (3 screens)
- [x] Authentication screens (Login, Sign Up)
- [x] Email Verification flow
- [x] Home screen with categories & trending products
- [x] Product Details with color/size selection
- [x] Shopping Cart with quantity controls
- [x] Write Review functionality
- [x] Profile & Settings screens
- [x] Privacy Policy & About Us
- [x] Search screen
- [x] Admin — Delete Confirmation
- [x] Custom widget library (29 components)
- [x] Form validation system
- [ ] API / Backend integration (Dio configured)
- [ ] State management solution
- [ ] Wishlist feature
- [ ] Push notifications
- [ ] Testing & performance polish

---

## 👥 Team

> **Flutter Training — NTI Round 5 · Graduation Project**

| # | Name | Branch | Role |
|:-:|:-----|:------:|:-----|
| 1 | **Ahmed Rezk** | `rezk` | Developer |
| 2 | **Yousef Elbeltagy** | `yousef` | Developer |
| 3 | **Abdelrahman Ismaeil** | `abdelrahman` | Developer |
| 4 | **Amr** | `amr` | Developer |
| 5 | **Elshafei Mohamed** | `elshafei` | Developer |
| 6 | **Ahmed Elhaddad** | `hadad` | Developer |
| 7 | **Mostafa Saad** | `mostafa` | Developer |
| 8 | **Hatem Rihan** | — | Supervisor / Repo Owner |

---

## 🏛️ About the Program

<div align="center">

**NTI — National Telecommunication Institute**<br>
**Flutter Mobile Development Track · Round 5**

</div>

This is the **final graduation project** for the Flutter training track at NTI. The program aims to equip trainees with the skills to build a **complete mobile application** — from design to implementation — covering:

- 🎨 UI/UX design and implementation from Figma
- 📐 Clean code organization and reusable component architecture
- 🔄 Full user journey inside a real-world product
- 👥 Team collaboration using Git & GitHub
- 🌐 REST API integration with Dio

---

## 📄 License

This is an **educational / graduation project** developed as part of the NTI Flutter Training Program (Round 5). Not intended for commercial release unless approved by the team and NTI.

---

<div align="center">

**NOMA** · Smart Accessories Store<br>
Made with ❤️ and Flutter · NTI Round 5 Graduation Project

<br>

<img src="https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white" alt="Flutter"/>
<img src="https://img.shields.io/badge/Made_with_❤️-294A3A?style=flat-square" alt="Love"/>
<img src="https://img.shields.io/badge/NTI-Round_5-B9785B?style=flat-square" alt="NTI"/>

</div>
