# ErythroCheck App Blueprint

## Overview

ErythroCheck is a mobile application designed to help users track their health metrics, specifically focusing on temperature, pulse, and hemoglobin status. The app allows users to view their historical data and receive dietary recommendations based on their hemoglobin levels.

## Implemented Features

### Core Features

*   **Health Metric Tracking**: The main screen displays the most recent health data, including:
    *   Date of the reading
    *   Temperature
    *   Pulse
    *   Hemoglobin status
*   **Data History**: Users can view a chronological list of their past health readings.
*   **Dietary Recommendations**: The app provides personalized dietary tips based on the user's hemoglobin status (e.g., low, stable, improved).
*   **Graphical Representation**: A line chart on the main screen, built with the `fl_chart` package, visualizes the trend of hemoglobin levels over time.

### Style and Design

*   **Theme**: The app now uses a modern, clean theme defined in `lib/theme.dart`. The theme features a blue, white, and gray color scheme with vibrant accent colors (green, orange, and red) for key actions and status indicators.
*   **Color Palette**:
    *   **Primary**: A deep blue for headers and primary buttons.
    *   **Background**: A light, off-white or very light gray.
    *   **Accent (Green)**: For positive/stable status and suggestions.
    *   **Accent (Orange)**: For history and neutral/warning information.
    *   **Accent (Red)**: For alerts and negative status.
*   **Components**:
    *   **Cards**: UI elements are grouped into cards with rounded corners and soft drop shadows to create a sense of depth.
    *   **Buttons**: Buttons are rounded, with icons and clear text labels.
    *   **Typography**: The `google_fonts` package is used for the `Lato` font to enhance readability.
    *   **Icons**: Material Design icons are used to improve usability and provide visual cues.
*   **Theme Toggling**: The app now supports basic light/dark mode toggling via a `ThemeProvider`.

## Current Plan

The UI has been refactored and the hemoglobin trend chart has been implemented. The following tasks have been completed:

1.  **Defined Color Scheme and Theme**: Created a central `AppTheme` in `lib/theme.dart`.
2.  **Updated `ThemeData`**: Modified `MaterialApp`'s `ThemeData` to use the new theme.
3.  **Refactored Home Screen (`lib/main.dart`)**: Rebuilt the home screen using `Card` widgets and `ElevatedButton.icon` with the new styles.
4.  **Refactored History Screen (`lib/history_page.dart`)**: Styled the history list items as cards with color-coded status text.
5.  **Refactored Dietary Screen (`lib/dietary_page.dart`)**: Redesigned the dietary tips using styled cards with icons and colors.
6.  **Added `provider` package**: Added `provider` for theme management.
7.  **Added `faker` package**: Added `faker` for mock data in the history page.
8.  **Added `fl_chart` package**: Added `fl_chart` for the hemoglobin trend chart.
9.  **Implemented Chart**: Created a `HemoglobinChart` widget and integrated it into the home screen.
