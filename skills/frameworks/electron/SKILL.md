---
name: electron
description: Electron best practices for building cross-platform desktop apps. Use when working with Electron projects.
---

# Skill: electron

## When to Use This Skill

Use this skill when:
- Building or reviewing an Electron app
- Setting up IPC between processes
- Packaging for distribution

## Security Non-Negotiables

These are not optional. Every Electron app must:

- `contextIsolation: true` — always. This is the default since Electron 12.
- `nodeIntegration: false` — always. Never give the renderer process direct access to Node.js.
- All Node.js access must go through `contextBridge` in a preload script.
- Validate every IPC message in the main process. Never trust renderer input.

```javascript
// preload.js — the only bridge between renderer and Node
const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('api', {
  // Expose only specific, named operations — not a generic ipcRenderer.send
  saveFile: (content) => ipcRenderer.invoke('save-file', content),
});
```

## IPC Pattern

Use `ipcRenderer.invoke` / `ipcMain.handle` for request-response. Avoid `send`/`on` for anything that needs a result.

```javascript
// main.js
ipcMain.handle('save-file', async (event, content) => {
  // Validate content here before using it
  if (typeof content !== 'string') throw new Error('Invalid content');
  await fs.writeFile(path, content);
});
```

## Process Boundaries

| Process | Responsibility | Has Node.js access |
|---------|---------------|-------------------|
| Main | OS integration, file system, windows | Yes |
| Preload | Bridge — expose safe APIs to renderer | Limited (no remote) |
| Renderer | UI only — treat like a browser | No |

If you're putting business logic in the renderer, move it to the main process.

## Packaging

Use `electron-builder`. Configure in `package.json` under `"build"`. Always sign your app for distribution — unsigned apps show security warnings on macOS and Windows.

```bash
npx electron-builder --mac    # macOS (.dmg)
npx electron-builder --win    # Windows (.exe installer)
npx electron-builder --linux  # Linux (.AppImage)
```
