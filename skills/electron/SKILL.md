---
name: electron
description: Electron best practices for building cross-platform desktop apps. Use when working with Electron projects.
---

# Skill: electron

## When to Use This Skill

Use this skill when:
- Building desktop apps with Electron
- Creating cross-platform desktop applications
- Setting up Electron projects

## Project Structure

```
my-app/
├── main/           # Main process
│   └── main.js
├── preload/         # Preload scripts
│   └── preload.js
├── renderer/        # Renderer process (React/Vue/HTML)
│   ├── index.html
│   └── renderer.js
└── package.json
```

## Main Process

```javascript
const { app, BrowserWindow, ipcMain } = require('electron');

function createWindow() {
  const win = new BrowserWindow({
    width: 800,
    height: 600,
  });

  win.loadFile('renderer/index.html');
}

app.whenReady().then(createWindow);
```

## IPC Communication

**Preload (bridge):**
```javascript
const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('electronAPI', {
  send: (channel, data) => ipcRenderer.send(channel, data),
  receive: (channel, func) => ipcRenderer.on(channel, (event, ...args) => func(...args)),
});
```

**Renderer:**
```javascript
window.electronAPI.send('message', 'Hello');
window.electronAPI.receive('response', (data) => console.log(data));
```

## Best Practices

- Use `electron-builder` for packaging
- Use `electron-log` for logging
- Use contextBridge for IPC (not nodeIntegration)
- Enable contextIsolation
- Handle app lifecycle properly

## Packaging

```bash
npx electron-builder --win    # Windows
npx electron-builder --mac    # macOS
npx electron-builder --linux   # Linux
```

## Common Tools

- electron-builder - packaging
- electron-log - logging
- electron-store - persistent storage