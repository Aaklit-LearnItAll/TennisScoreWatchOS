# Tennis Score Tracker for Apple Watch
A simple tennis scoring app for Apple Watch that tracks points and games during a match.
Unlike iPhone apps, which can be distributed through TestFlight, WatchOS apps must be installed through XCode. Which means you will need a mac, will have to install XCode and use the instructions below to install the app
I will try to keep it as simple as possible
## Features
- Split-screen interface for easy scoring during play
- Automatic tennis scoring (0, 15, 30, 40, deuce, advantage)
- Game counter
- Haptic feedback for each point
- Reset button to start a new match

## Installation Instructions

### Prerequisites
- Mac computer with macOS
- Xcode (free from Mac App Store)
- Apple Watch paired with iPhone
- Apple Developer account (free account works)

### Steps to Install

1. **Clone this repository**
```bash
   git clone [your-repo-url]
   cd [your-repo-name]
```

2. **Open the project in Xcode**
   - Double-click the `.xcodeproj` file, or
   - Open Xcode and select File → Open, then choose the project

3. **Configure signing**
   - Click on the project name in the left sidebar (top item)
   - Select the target (your app name)
   - Go to "Signing & Capabilities" tab
   - Check "Automatically manage signing"
   - Select your Apple ID under "Team" (sign in if needed)

4. **Enable Developer Mode on your devices**
   - On iPhone: Settings → Privacy & Security → Developer Mode → ON (restart)
   - On Apple Watch: Settings → Privacy & Security → Developer Mode → ON (restart)

5. **Connect and run**
   - Connect your iPhone to your Mac (cable or WiFi)
   - Make sure your Apple Watch is unlocked
   - In Xcode, select your Apple Watch from the device dropdown at the top
   - Click the Play button (▶) or press Cmd+R
   - The app will build and install on your watch

6. **Launch the app**
   - The app will automatically open after installation
   - You can also find it in your Apple Watch app grid

### Troubleshooting

**"No devices found"**
- Ensure your watch is unlocked and Developer Mode is enabled on both iPhone and Apple Watch

**"Code signing error"**
- Go to Project settings → Signing & Capabilities → Check "Automatically manage signing"
- Make sure you're signed in with your Apple ID in Xcode (Xcode → Settings → Accounts)

**"Build failed"**
- Try Product → Clean Build Folder (Cmd+Shift+K)
- Restart Xcode and try again

**Watch not appearing in device list**
- Restart both iPhone and Apple Watch
- Ensure iPhone is properly connected to Mac
- Check that the watch is paired with the iPhone

## Usage

- **Tap top half** to score a point for yourself
- **Tap bottom half** to score a point for your opponent
- **Tap reset button** (↻) in top-right corner to start a new match
- Games won are displayed at the top

## Notes

- This app requires a Mac and Xcode to install 
- The app will remain on your watch until you manually delete it

