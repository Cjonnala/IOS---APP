# My Fitness Buddy

## Project Title:
**My Fitness Buddy**

## Name:
**Chaitanya Lakshmi Jonnala (2119425)**

## Individual Project

---

## Project Description:
"My Fitness Buddy" is an all-inclusive and intuitive smartphone application that aims to be the best buddy for anyone starting a fitness and health journey. Fundamentally, the app provides users with the tools they need to reach their health objectives, whether eating better, exercising more, or both. 

"My Fitness Buddy" is a comprehensive solution for anyone looking to live a healthy lifestyle, including features such as:
- Goal-setting
- Nutritional counseling
- Individualized training routines
- Progress monitoring

---

## Code Implementation

### ViewController.swift
- **Purpose:** Initial view controller loaded by the app.
- **Functionality:** Serves as a central navigation hub, providing access to different areas of the app, such as registration, sign-up, or guest access.
- **Integration:** Connects to various parts of the app.

### SignupViewController.swift
- **Purpose:** Manages the user sign-up process.
- **Functionality:** 
  - Displays a form for personal data input (name, email, password).
  - Validates input (email format, password strength).
  - Sends data to a backend service for account creation upon successful validation.
- **Integration:** Transitions to the `GoalsViewController` upon successful signup.

### GoalsViewController.swift
- **Purpose:** Allows users to set, view, and track fitness and dietary goals.
- **Functionality:** 
  - Users can set goals such as calorie reduction, running distance, or weight loss.
  - Tracks progress with visual data (graphs, charts).
- **Integration:** Interacts with `WorkOutPlansViewController` and `FoodOptionsViewController` to gather progress data.

### AboutYouViewController.swift
- **Purpose:** Collects or displays user information.
- **Functionality:** Users enter details such as age, fitness level, dietary restrictions, and fitness ambitions.
- **Integration:** 
  - Saves or retrieves data from a backend.
  - Influences recommendations for workouts (`WorkOutPlansViewController`) and food choices (`FoodOptionsViewController`).

### DashboardViewController.swift
- **Purpose:** Displays the main dashboard with key functionalities.
- **Functionality:** 
  - Shows progress, exercise schedules, and dietary objectives.
  - Provides quick access to commonly used features.
- **Integration:** Links to `WorkOutPlansViewController` and `FoodOptionsViewController`.

### WorkOutPlansViewController.swift
- **Purpose:** Allows users to browse, select, and manage workout plans.
- **Functionality:** 
  - Displays a grid or list of fitness plans.
  - Users can view details, make changes, or start a plan.
  - Monitors progress of ongoing plans.
- **Integration:** 
  - Fetches plans from a backend system.
  - Updates progress in `DashboardViewController`.

### FoodOptionsViewController.swift
- **Purpose:** Manages dietary plans and food options.
- **Functionality:** 
  - Provides food options based on dietary preferences.
  - Displays recipes and nutritional information.
  - Logs food intake.
- **Integration:** 
  - Connects to external APIs or an internal database.
  - Integrates with nutritional tracking and goal-setting features.

---

## Screens Implemented

### Sign-up or Login Screen:
- Allows new users to sign up and access subsequent screens.

### Sign-up Screen:
- Includes text fields, buttons, and labels.
- Implements pop-up alerts for validation.

### Goals Screen:
- Allows users to select their fitness goals.
- Prevents conflicting goal selection (e.g., losing and gaining weight at the same time).

### About You Screens:
- Uses segmented controls, text fields, buttons, and labels.
- Implements pop-up alerts for incorrect data input.

### Dashboard Screen:
- Implemented as a **tab bar controller** item with pictures and a search bar.

### Food Log Screen:
- Displays pictures and an **"Add Food"** button.
- A new screen pops up with food data upon clicking the button.

### Food Options Screen:
- Pops up from the **"Add Food"** button on the Food Log screen.
- Implements **multi-touch** functionality, including text view and scroll views.

### Workouts Screen:
- Includes **scroll views, text views, labels, and images**.
- Implements **multi-touch** for zooming in and out of workout plans.

### More Screen:
- Includes profile and settings options.

---

## Features Used

### WorkOutPlansViewController.swift:
- **Multi-touch functionality:** 
  - Users can pinch to zoom in/out on workout plans.
  - Multi-touch allows selection of multiple activities for batch processing (e.g., scheduling, favoriting).

### FoodOptionsViewController.swift:
- **Multi-touch interactions:** 
  - Users can swipe with two fingers to browse food options.
  - Pinch gestures expand/collapse detailed nutritional data.

**Implementation:** 
- Recognizes and handles multi-touch gestures for an enhanced interactive experience.

---

This document provides an overview of the **My Fitness Buddy** app, its core functionalities, and the code structure for different view controllers. The app is designed to enhance user fitness tracking and goal-setting through intuitive interfaces and multi-touch capabilities.
