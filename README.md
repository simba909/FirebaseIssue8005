#  Firebase issue 8005 sample

Steps to reproduce the issue:

 - Add a valid `Google-Info.plist` file for a Firebase project
 - Open `ContentView.swift`
 - In the preview pane on the right hand side, click the little "Play" icon on the top left of the simulator
 
This should try to start the live SwiftUI preview, which in most cases will crash. If it doesn't crash immediately try
running the app in the simulator, then try the previews again. Sometimes it requires a little bit of back-and-forth
before the issue reproduces, but after the first time it will happen repeatedly.

Usually the SwiftUI preview doesn't show you _why_ it crashed, so you need to look for the crash logs in:

`~/Library/Logs/DiagnosticReports`

where they will be named `FirebaseIssue8005_<date>_<hostname>.crash` (for this project).
