# CampusGo - Student Campus App

A Flutter Student Campus App created for the Flutter Routes and Navigator customization project.

## Features

- Dashboard / Home
- Timetable
- Campus Services
- Service Details
- Campus Events
- Event Details
- Student Profile
- Named routes
- `Navigator.pushNamed()`
- `Navigator.push()` with `MaterialPageRoute`
- `Navigator.pop()`
- Route argument passing
- Returned route result
- Unknown route fallback
- Custom `PageRouteBuilder` transition
- Event detail route
- Light/dark theme toggle
- Responsive layouts
- Local sample data

## Run locally

```bash
flutter pub get
flutter run
```

For Chrome:

```bash
flutter run -d chrome
```

## Build for web

```bash
flutter build web --release --base-href "/student-campus-app/"
```

Change `student-campus-app` to your GitHub repository name.

## GitHub Pages

The workflow in `.github/workflows/deploy.yml` builds the Flutter Web application and deploys it to GitHub Pages.

After pushing the repository:

1. Open GitHub repository Settings.
2. Open Pages.
3. Set the source to GitHub Actions.
4. Push to the `main` branch.
5. GitHub Actions builds and deploys the application.

## Required navigation demonstration

Dashboard
→ Campus Services
→ Selected Service
→ Request an appointment
→ Result returned to Services

The service object is passed through route arguments, and the detail screen returns `requested` using `Navigator.pop()`.

## Assignment extensions

1. Custom `PageRouteBuilder` transition for event details.
2. Event object passed to an Event Details route.
3. Light/dark theme toggle shared across routes.

## Sample student

The profile uses fictional student information. Replace it with your own required submission details if your lecturer requires personal information.
