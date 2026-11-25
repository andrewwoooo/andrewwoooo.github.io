<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
  <meta name="apple-mobile-web-app-title" content="小酌记录" />
  <title>小酌记录 · 低声说话的地方 | SCA 咖啡风味图鉴</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+SC:wght@500;600;700&family=Noto+Sans+SC:wght@400;500;600&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet" />
  <style>
    :root {
      --bg-paper: #F5F1E8;
      --bg-card: #FAF7F0;
      --bg-elevated: #FFFDF9;
      --grid-line: rgba(92, 75, 58, 0.065);
      --ink-primary: #26201B;
      --ink-secondary: #5C5248;
      --ink-muted: #8E8275;
      --border-subtle: rgba(68, 55, 42, 0.13);
      --border-strong: rgba(68, 55, 42, 0.28);
      --accent-rust: #9E4A36;
      --accent-olive: #586B51;
      --accent-gold: #B88B4A;
      --shadow-card: 0 6px 24px -6px rgba(38, 32, 27, 0.08), 0 1px 3px rgba(38, 32, 27, 0.05);
      --font-serif: "Noto Serif SC", "Songti SC", "STSong", Georgia, serif;
      --font-sans: "Noto Sans SC", -apple-system, BlinkMacSystemFont, "PingFang SC", sans-serif;
      --font-mono: "JetBrains Mono", ui-monospace, SFMono-Regular, Menlo, monospace;
    }

    * {
      box-sizing: border-box;
      -webkit-tap-highlight-color: transparent;
      user-select: none;
    }

    input, textarea {
      user-select: text;
    }

    html, body {
      margin: 0;
      padding: 0;
      width: 100%;
      height: 100%;
      background-color: #EAE4D7;
      color: var(--ink-primary);
      font-family: var(--font-sans);
      overflow: hidden;
    }

    .app-shell {
      position: relative;
      width: 100%;
      max-width: 480px;
      height: 100dvh;
      margin: 0 auto;
      background-color: var(--bg-paper);
      background-image:
        linear-gradient(to right, var(--grid-line) 1px, transparent 1px),
        linear-gradient(to bottom, var(--grid-line) 1px, transparent 1px);
      background-size: 20px 20px;
      display: flex;
      flex-direction: column;
      overflow: hidden;
      box-shadow: 0 0 40px rgba(28, 22, 16, 0.14);
    }

    /* 顶部精致出版物 / 建筑印章导航栏 */
    .top-header {
      flex-shrink: 0;
      padding: max(10px, env(safe-area-inset-top)) 14px 8px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      border-bottom: 1px solid var(--border-subtle);
      background: rgba(245, 241, 232, 0.9);
      backdrop-filter: blur(8px);
      z-index: 20;
    }

    .brand-block {
      display: flex;
      align-items: center;
      gap: 9px;
      min-width: 0;
    }

    .brand-seal-wrap {
      position: relative;
      width: 34px;
      height: 34px;
      flex-shrink: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      background: var(--bg-elevated);
      border: 1px solid var(--border-strong);
      border-radius: 7px;
      box-shadow: 0 2px 6px rgba(38, 32, 27, 0.06);
    }

    .brand-seal-wrap::after {
      content: "";
      position: absolute;
      inset: 2px;
      border: 0.5px solid rgba(158, 74, 54, 0.25);
      border-radius: 5px;
      pointer-events: none;
    }

    .brand-title-group {
      display: flex;
      flex-direction: column;
      gap: 2px;
      min-width: 0;
    }

    .brand-title-row {
      display: flex;
      align-items: center;
      gap: 6px;
    }

    .brand-vert-tag {
      writing-mode: vertical-rl;
      text-orientation: upright;
      font-family: var(--font-serif);
      font-size: 7.5px;
      line-height: 1;
      letter-spacing: 0.05em;
      color: var(--accent-rust);
      border-right: 1px solid rgba(158, 74, 54, 0.35);
      padding-right: 4px;
      height: 22px;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }

    .brand-title {
      font-family: var(--font-serif);
      font-size: 18px;
      font-weight: 700;
      letter-spacing: 0.14em;
      color: var(--ink-primary);
      line-height: 1.08;
      display: flex;
      align-items: baseline;
    }

    .brand-title .char-accent {
      color: var(--accent-rust);
      font-weight: 700;
    }

    .brand-sub {
      font-family: var(--font-mono);
      font-size: 8.5px;
      letter-spacing: 0.08em;
      color: var(--ink-muted);
      text-transform: uppercase;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .header-actions {
      display: flex;
      align-items: center;
      gap: 6px;
      flex-shrink: 0;
    }

    .icon-btn {
      height: 30px;
      padding: 0 9px;
      border-radius: 6px;
      border: 1px solid var(--border-subtle);
      background: var(--bg-card);
      color: var(--ink-secondary);
      font-size: 11.5px;
      font-family: var(--font-sans);
      display: inline-flex;
      align-items: center;
      gap: 4px;
      cursor: pointer;
      transition: all 0.16s ease;
    }

    .icon-btn:active {
      transform: scale(0.96);
      background: #EFE9DC;
    }

    .icon-btn.muted {
      color: var(--ink-muted);
      opacity: 0.72;
    }

    .badge-count {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      min-width: 15px;
      height: 15px;
      padding: 0 4px;
      border-radius: 99px;
      background: var(--accent-rust);
      color: #FFFDF9;
      font-family: var(--font-mono);
      font-size: 9.5px;
      font-weight: 600;
    }

    /* 三级面包屑导航 */
    .breadcrumb-bar {
      flex-shrink: 0;
      padding: 7px 14px;
      display: flex;
      align-items: center;
      gap: 4px;
      overflow-x: auto;
      scrollbar-width: none;
      border-bottom: 1px dashed var(--border-subtle);
      background: rgba(250, 247, 240, 0.65);
    }

    .breadcrumb-bar::-webkit-scrollbar {
      display: none;
    }

    .crumb-item {
      display: inline-flex;
      align-items: center;
      gap: 4px;
      padding: 3px 8px;
      border-radius: 4px;
      font-size: 11px;
      font-family: var(--font-mono);
      color: var(--ink-muted);
      background: transparent;
      border: 1px solid transparent;
      white-space: nowrap;
      cursor: pointer;
      transition: all 0.15s ease;
    }

    .crumb-item.active {
      color: var(--ink-primary);
      background: var(--bg-elevated);
      border-color: var(--border-strong);
      font-weight: 600;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.04);
    }

    .crumb-item.clickable:hover {
      color: var(--ink-primary);
    }

    .crumb-sep {
      font-family: var(--font-mono);
      font-size: 10px;
      color: var(--ink-muted);
      opacity: 0.6;
    }

    /* 风味轮主舞台 */
    .wheel-stage {
      position: relative;
      flex: 1;
      min-height: 240px;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
      touch-action: none;
    }

    .wheel-hint {
      position: absolute;
      top: 8px;
      left: 14px;
      right: 14px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      pointer-events: none;
      z-index: 5;
    }

    .hint-pill {
      font-size: 10.5px;
      color: var(--ink-muted);
      background: rgba(250, 247, 240, 0.85);
      border: 1px solid var(--border-subtle);
      padding: 2px 8px;
      border-radius: 99px;
      backdrop-filter: blur(4px);
    }

    #flavorSvg {
      width: 100%;
      height: 100%;
      max-width: 440px;
      max-height: 440px;
      overflow: visible;
    }

    .wheel-rotor {
      transition: transform 0.52s cubic-bezier(0.22, 1, 0.36, 1);
      transform-origin: 0px 0px;
    }

    .wheel-rotor.dragging {
      transition: none;
    }

    .wedge-path {
      cursor: pointer;
      transition: opacity 0.25s ease, filter 0.2s ease;
    }

    .wedge-path:hover {
      filter: brightness(1.04);
    }

    .wedge-label {
      pointer-events: none;
      font-family: var(--font-sans);
      transition: opacity 0.25s ease;
    }

    .center-hub {
      cursor: pointer;
      transition: transform 0.2s ease;
    }

    .center-hub:active {
      transform: scale(0.95);
    }

    /* 底部检视与捕获面板 */
    .inspector-dock {
      flex-shrink: 0;
      padding: 8px 14px max(12px, env(safe-area-inset-bottom));
      background: linear-gradient(to top, rgba(245, 241, 232, 0.98) 80%, rgba(245, 241, 232, 0));
      z-index: 15;
    }

    .inspector-card {
      background: var(--bg-elevated);
      border: 1px solid var(--border-strong);
      border-radius: 12px;
      padding: 11px 13px;
      box-shadow: var(--shadow-card);
    }

    .inspector-top {
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
      gap: 10px;
    }

    .flavor-meta-left {
      flex: 1;
      min-width: 0;
    }

    .flavor-tag-row {
      display: flex;
      align-items: center;
      gap: 6px;
      margin-bottom: 3px;
      flex-wrap: wrap;
    }

    .swatch-dot {
      width: 10px;
      height: 10px;
      border-radius: 50%;
      border: 1px solid rgba(0, 0, 0, 0.15);
      flex-shrink: 0;
    }

    .sca-path-tag {
      font-family: var(--font-mono);
      font-size: 10px;
      color: var(--ink-muted);
      letter-spacing: 0.02em;
    }

    .valence-badge {
      font-size: 10px;
      padding: 1px 6px;
      border-radius: 4px;
      font-weight: 500;
    }

    .valence-pos {
      background: rgba(88, 107, 81, 0.14);
      color: #41543A;
    }

    .valence-neg {
      background: rgba(158, 74, 54, 0.14);
      color: #8A3B28;
    }

    .flavor-name-row {
      display: flex;
      align-items: baseline;
      gap: 7px;
      flex-wrap: wrap;
    }

    .flavor-cn {
      font-family: var(--font-serif);
      font-size: 18px;
      font-weight: 700;
      color: var(--ink-primary);
      line-height: 1.2;
    }

    .flavor-en {
      font-family: var(--font-mono);
      font-size: 11.5px;
      color: var(--ink-muted);
    }

    .capture-btn {
      flex-shrink: 0;
      height: 34px;
      padding: 0 12px;
      border-radius: 8px;
      border: 1px solid var(--ink-primary);
      background: var(--ink-primary);
      color: #FFFDF9;
      font-size: 12px;
      font-weight: 500;
      display: inline-flex;
      align-items: center;
      gap: 5px;
      cursor: pointer;
      transition: all 0.16s ease;
    }

    .capture-btn.captured {
      background: var(--accent-olive);
      border-color: var(--accent-olive);
    }

    .capture-btn:disabled {
      opacity: 0.42;
      cursor: not-allowed;
    }

    .capture-btn:not(:disabled):active {
      transform: scale(0.96);
    }

    .sensory-note {
      margin: 7px 0 0;
      padding-top: 7px;
      border-top: 1px dashed var(--border-subtle);
      font-size: 12px;
      line-height: 1.5;
      color: var(--ink-secondary);
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }

    /* 已捕获风味托盘 */
    .tray-bar {
      margin-top: 8px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 8px;
    }

    .captured-chips {
      flex: 1;
      display: flex;
      align-items: center;
      gap: 5px;
      overflow-x: auto;
      scrollbar-width: none;
      min-height: 28px;
    }

    .captured-chips::-webkit-scrollbar {
      display: none;
    }

    .empty-tray-text {
      font-size: 11.5px;
      color: var(--ink-muted);
      font-style: italic;
    }

    .flavor-chip {
      display: inline-flex;
      align-items: center;
      gap: 5px;
      padding: 4px 8px;
      border-radius: 6px;
      background: var(--bg-card);
      border: 1px solid var(--border-strong);
      font-size: 11.5px;
      color: var(--ink-primary);
      white-space: nowrap;
      cursor: pointer;
    }

    .flavor-chip .chip-x {
      font-size: 12px;
      color: var(--ink-muted);
      margin-left: 2px;
    }

    .poster-trigger-btn {
      flex-shrink: 0;
      height: 30px;
      padding: 0 11px;
      border-radius: 7px;
      border: 1px solid var(--accent-rust);
      background: var(--accent-rust);
      color: #FFFDF9;
      font-size: 11.5px;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 4px;
      cursor: pointer;
      box-shadow: 0 2px 8px rgba(158, 74, 54, 0.25);
    }

    .poster-trigger-btn:active {
      transform: scale(0.96);
    }

    /* 抽屉与弹窗遮罩 */
    .modal-backdrop {
      position: absolute;
      inset: 0;
      background: rgba(28, 22, 16, 0.52);
      backdrop-filter: blur(3px);
      z-index: 40;
      display: none;
      align-items: flex-end;
      justify-content: center;
    }

    .modal-backdrop.open {
      display: flex;
    }

    .sheet-panel {
      width: 100%;
      max-height: 92dvh;
      background: var(--bg-paper);
      border-top-left-radius: 18px;
      border-top-right-radius: 18px;
      border-top: 1px solid var(--border-strong);
      display: flex;
      flex-direction: column;
      overflow: hidden;
      animation: slideUp 0.26s cubic-bezier(0.22, 1, 0.36, 1);
    }

    @keyframes slideUp {
      from { transform: translateY(100%); }
      to { transform: translateY(0); }
    }

    .sheet-header {
      flex-shrink: 0;
      padding: 13px 16px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      border-bottom: 1px solid var(--border-subtle);
      background: var(--bg-card);
    }

    .sheet-title {
      font-family: var(--font-serif);
      font-size: 16px;
      font-weight: 700;
      color: var(--ink-primary);
    }

    .sheet-header-right {
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .gear-manage-btn {
      height: 28px;
      padding: 0 9px;
      border-radius: 6px;
      border: 1px solid var(--border-strong);
      background: var(--bg-elevated);
      color: var(--ink-secondary);
      font-size: 11px;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      gap: 4px;
    }

    .close-btn {
      width: 28px;
      height: 28px;
      border-radius: 50%;
      border: 1px solid var(--border-subtle);
      background: var(--bg-elevated);
      color: var(--ink-secondary);
      font-size: 15px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
    }

    .sheet-body {
      flex: 1;
      overflow-y: auto;
      padding: 14px 16px max(20px, env(safe-area-inset-bottom));
    }

    /* 表单与常用设备预设 */
    .mode-switch {
      display: inline-flex;
      background: #E8E1D3;
      padding: 3px;
      border-radius: 8px;
      margin-bottom: 12px;
    }

    .mode-tab {
      padding: 5px 12px;
      border-radius: 6px;
      font-size: 12px;
      border: none;
      background: transparent;
      color: var(--ink-secondary);
      cursor: pointer;
      font-weight: 500;
    }

    .mode-tab.active {
      background: var(--bg-elevated);
      color: var(--ink-primary);
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
    }

    .form-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 9px;
      margin-bottom: 12px;
    }

    .form-field {
      display: flex;
      flex-direction: column;
      gap: 4px;
    }

    .form-field.full {
      grid-column: 1 / -1;
    }

    .form-label-row {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 4px;
    }

    .form-label {
      font-size: 11px;
      color: var(--ink-secondary);
      font-weight: 500;
    }

    .save-preset-inline {
      font-size: 10px;
      padding: 1px 6px;
      border-radius: 4px;
      border: 1px solid var(--accent-olive);
      background: rgba(88, 107, 81, 0.12);
      color: #3E5237;
      cursor: pointer;
      display: none;
    }

    .save-preset-inline.visible {
      display: inline-block;
    }

    .form-input {
      width: 100%;
      height: 34px;
      padding: 0 10px;
      border-radius: 7px;
      border: 1px solid var(--border-strong);
      background: var(--bg-elevated);
      color: var(--ink-primary);
      font-size: 12.5px;
      font-family: var(--font-sans);
      outline: none;
    }

    .form-input:focus {
      border-color: var(--accent-rust);
    }

    .preset-pills {
      display: flex;
      align-items: center;
      gap: 5px;
      overflow-x: auto;
      scrollbar-width: none;
      padding-top: 2px;
    }

    .preset-pills::-webkit-scrollbar {
      display: none;
    }

    .preset-pill {
      flex-shrink: 0;
      font-size: 10.5px;
      padding: 2px 7px;
      border-radius: 5px;
      border: 1px solid var(--border-subtle);
      background: var(--bg-card);
      color: var(--ink-secondary);
      cursor: pointer;
      white-space: nowrap;
      transition: all 0.14s ease;
    }

    .preset-pill.active {
      border-color: var(--accent-rust);
      background: rgba(158, 74, 54, 0.1);
      color: var(--accent-rust);
      font-weight: 600;
    }

    /* 海报预览区 */
    .poster-preview-wrap {
      background: #DFD8C8;
      border-radius: 12px;
      padding: 12px;
      display: flex;
      flex-direction: column;
      align-items: center;
      border: 1px solid var(--border-subtle);
      margin-bottom: 12px;
    }

    #posterCanvas {
      width: 100%;
      max-width: 300px;
      aspect-ratio: 3 / 4;
      border-radius: 6px;
      box-shadow: 0 10px 28px rgba(32, 25, 18, 0.18);
      background: #F6F2E9;
    }

    .action-row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 8px;
      margin-bottom: 10px;
    }

    .btn-primary {
      height: 38px;
      border-radius: 8px;
      border: 1px solid var(--ink-primary);
      background: var(--ink-primary);
      color: #FFFDF9;
      font-size: 12.5px;
      font-weight: 600;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 5px;
    }

    .btn-secondary {
      height: 38px;
      border-radius: 8px;
      border: 1px solid var(--border-strong);
      background: var(--bg-elevated);
      color: var(--ink-primary);
      font-size: 12.5px;
      font-weight: 500;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 5px;
    }

    .btn-archive {
      width: 100%;
      height: 36px;
      border-radius: 8px;
      border: 1px dashed var(--accent-olive);
      background: rgba(88, 107, 81, 0.1);
      color: #3D5036;
      font-size: 12px;
      font-weight: 600;
      cursor: pointer;
      margin-bottom: 10px;
    }

    .copy-box {
      width: 100%;
      min-height: 92px;
      padding: 10px;
      border-radius: 8px;
      border: 1px solid var(--border-subtle);
      background: var(--bg-card);
      color: var(--ink-secondary);
      font-size: 12px;
      line-height: 1.55;
      font-family: var(--font-sans);
      resize: none;
    }

    /* 常用设备管理列表 */
    .preset-section-title {
      font-family: var(--font-serif);
      font-size: 13.5px;
      font-weight: 700;
      color: var(--ink-primary);
      margin: 4px 0 8px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .preset-list {
      display: flex;
      flex-direction: column;
      gap: 6px;
      margin-bottom: 14px;
    }

    .preset-row {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 8px;
      padding: 8px 10px;
      border-radius: 8px;
      background: var(--bg-elevated);
      border: 1px solid var(--border-subtle);
    }

    .preset-row-info {
      font-size: 12.5px;
      color: var(--ink-primary);
      font-weight: 500;
    }

    .preset-row-sub {
      font-family: var(--font-mono);
      font-size: 11px;
      color: var(--ink-muted);
      margin-left: 6px;
    }

    .preset-del-btn {
      border: none;
      background: rgba(158, 74, 54, 0.1);
      color: var(--accent-rust);
      font-size: 11px;
      padding: 3px 8px;
      border-radius: 5px;
      cursor: pointer;
    }

    .add-preset-bar {
      display: flex;
      gap: 6px;
      margin-bottom: 16px;
    }

    /* 历史记录列表 */
    .log-card {
      background: var(--bg-elevated);
      border: 1px solid var(--border-strong);
      border-radius: 10px;
      padding: 11px 12px;
      margin-bottom: 10px;
    }

    .log-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      gap: 8px;
      margin-bottom: 5px;
    }

    .log-bean {
      font-family: var(--font-serif);
      font-size: 14.5px;
      font-weight: 700;
      color: var(--ink-primary);
    }

    .log-date {
      font-family: var(--font-mono);
      font-size: 10.5px;
      color: var(--ink-muted);
    }

    .log-params {
      font-size: 11.5px;
      color: var(--ink-secondary);
      line-height: 1.45;
      margin-bottom: 7px;
    }

    .log-flavors {
      display: flex;
      flex-wrap: wrap;
      gap: 4px;
      margin-bottom: 8px;
    }

    .log-flavor-tag {
      font-size: 10.5px;
      padding: 2px 6px;
      border-radius: 4px;
      color: #FFFDF9;
    }

    .log-actions {
      display: flex;
      justify-content: flex-end;
      gap: 8px;
    }

    .toast {
      position: absolute;
      top: 56px;
      left: 50%;
      transform: translateX(-50%) translateY(-10px);
      background: rgba(38, 32, 27, 0.92);
      color: #FFFDF9;
      font-size: 12px;
      padding: 6px 14px;
      border-radius: 99px;
      opacity: 0;
      pointer-events: none;
      transition: all 0.22s ease;
      z-index: 90;
      white-space: nowrap;
    }

    .toast.show {
      opacity: 1;
      transform: translateX(-50%) translateY(0);
    }
  </style>
</head>
<body>
  <div class="app-shell">
    <!-- 顶部出版印章风标题栏 -->
    <header class="top-header">
      <div class="brand-block">
        <!-- 藻井八角与萃滴建筑印章 SVG Logo -->
        <div class="brand-seal-wrap" aria-hidden="true">
          <svg width="24" height="24" viewBox="0 0 28 28" fill="none">
            <rect x="2.5" y="2.5" width="23" height="23" rx="3" stroke="#26201B" stroke-width="1.2"/>
            <polygon points="14,5 20.36,7.64 23,14 20.36,20.36 14,23 7.64,20.36 5,14 7.64,7.64" stroke="#8E8275" stroke-width="0.85" stroke-dasharray="1.5 1"/>
            <rect x="9" y="9" width="10" height="10" transform="rotate(45 14 14)" stroke="#26201B" stroke-width="0.95"/>
            <path d="M14 9.2C14 9.2 17.4 13.1 17.4 15.6C17.4 17.48 15.88 19 14 19C12.12 19 10.6 17.48 10.6 15.6C10.6 13.1 14 9.2 14 9.2Z" fill="#9E4A36" fill-opacity="0.16" stroke="#9E4A36" stroke-width="1.2"/>
            <circle cx="22.5" cy="5.5" r="1.4" fill="#9E4A36"/>
          </svg>
        </div>
        <div class="brand-title-group">
          <div class="brand-title-row">
            <span class="brand-vert-tag">低声说话</span>
            <span class="brand-title">小酌<span class="char-accent">记录</span></span>
          </div>
          <span class="brand-sub">QUIET SIP ARCHIVE · SCA SENSORY WHEEL</span>
        </div>
      </div>

      <div class="header-actions">
        <button id="soundToggleBtn" class="icon-btn" title="切换拨盘音效">
          <span id="soundIcon">🔊</span>
          <span id="soundText">音效</span>
        </button>
        <button id="logsDrawerBtn" class="icon-btn" title="查看本地品鉴记录">
          <span>档案</span>
          <span id="logsCountBadge" class="badge-count">0</span>
        </button>
      </div>
    </header>

    <!-- 三级联动面包屑 -->
    <nav class="breadcrumb-bar" id="breadcrumbBar" aria-label="风味层级导航"></nav>

    <!-- 交互式 SCA 风味轮盘 -->
    <main class="wheel-stage" id="wheelStage">
      <div class="wheel-hint">
        <span class="hint-pill" id="stageHintLeft">点选大类展开二级风味</span>
        <span class="hint-pill" id="stageHintRight">9 大类 · 84 细分</span>
      </div>
      <svg id="flavorSvg" viewBox="-210 -210 420 420">
        <defs>
          <filter id="hubShadow" x="-30%" y="-30%" width="160%" height="160%">
            <feDropShadow dx="0" dy="2" stdDeviation="3" flood-color="#26201B" flood-opacity="0.16"/>
          </filter>
        </defs>
        <g id="wheelRotor" class="wheel-rotor"></g>
        <g id="centerHub" class="center-hub" filter="url(#hubShadow)">
          <circle cx="0" cy="0" r="38" fill="#FFFDF9" stroke="#26201B" stroke-width="1.3"/>
          <circle cx="0" cy="0" r="33" fill="none" stroke="rgba(158,74,54,0.35)" stroke-width="0.7" stroke-dasharray="2 2"/>
          <text id="hubTitle" x="0" y="-3" text-anchor="middle" font-family="Noto Serif SC, serif" font-size="11.5" font-weight="700" fill="#26201B">SCA 2016</text>
          <text id="hubSub" x="0" y="11" text-anchor="middle" font-family="JetBrains Mono, monospace" font-size="8" fill="#8E8275">ALL WHEEL</text>
        </g>
      </svg>
    </main>

    <!-- 底部风味卡片与捕获托盘 -->
    <section class="inspector-dock">
      <div class="inspector-card">
        <div class="inspector-top">
          <div class="flavor-meta-left">
            <div class="flavor-tag-row">
              <span class="swatch-dot" id="inspDot" style="background:#D94E5D;"></span>
              <span class="sca-path-tag" id="inspPath">00 · 全景图谱</span>
              <span class="valence-badge valence-pos" id="inspValence" style="display:none;">正向风味</span>
            </div>
            <div class="flavor-name-row">
              <span class="flavor-cn" id="inspCn">转动或点选风味扇区</span>
              <span class="flavor-en" id="inspEn">SCA Coffee Taster's Flavor Wheel</span>
            </div>
          </div>
          <button id="captureBtn" class="capture-btn" disabled>
            <span id="captureBtnText">+ 收入本杯</span>
          </button>
        </div>
        <p class="sensory-note" id="inspNote">
          点击任意大类扇区可放大展开二、三级风味；展开后支持上下滑动转盘切换并伴随机械拨盘反馈。
        </p>

        <div class="tray-bar">
          <div class="captured-chips" id="capturedChips">
            <span class="empty-tray-text">尚未捕捉风味（支持多选）</span>
          </div>
          <button id="openPosterModalBtn" class="poster-trigger-btn">
            <span>生成小卡</span>
          </button>
        </div>
      </div>
    </section>

    <!-- 3:4 风味小卡与参数配置弹窗 -->
    <div id="posterModal" class="modal-backdrop">
      <div class="sheet-panel">
        <div class="sheet-header">
          <span class="sheet-title">本杯小酌图签 · 3:4 海报</span>
          <div class="sheet-header-right">
            <button id="openPresetModalBtn" class="gear-manage-btn">⚙ 常用设备</button>
            <button id="closePosterModalBtn" class="close-btn" aria-label="关闭">✕</button>
          </div>
        </div>
        <div class="sheet-body">
          <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:8px;">
            <div class="mode-switch">
              <button class="mode-tab active" data-mode="pourover">手冲 Pour-Over</button>
              <button class="mode-tab" data-mode="espresso">意式 Espresso</button>
            </div>
            <span style="font-family:var(--font-mono); font-size:10.5px; color:var(--ink-muted);">900 × 1200 PNG</span>
          </div>

          <div class="form-grid">
            <div class="form-field">
              <label class="form-label">豆名 / 庄园批次</label>
              <input id="inpBean" class="form-input" type="text" placeholder="如：玻利维亚 永加斯美人庄园 瑰夏" />
            </div>
            <div class="form-field">
              <label class="form-label">产区 · 处理法 · 烘焙</label>
              <input id="inpOrigin" class="form-input" type="text" placeholder="如：水洗 · 浅烘" />
            </div>

            <!-- 研磨器具 + 常用预设 -->
            <div class="form-field">
              <div class="form-label-row">
                <label class="form-label">研磨器具</label>
                <button id="saveGrinderPresetBtn" class="save-preset-inline">+ 存常用</button>
              </div>
              <input id="inpGrinder" class="form-input" type="text" placeholder="选择或输入磨豆机" />
              <div id="grinderPresetPills" class="preset-pills"></div>
            </div>

            <!-- 研磨度 -->
            <div class="form-field">
              <label class="form-label">研磨度 / 刻度</label>
              <input id="inpGrindSize" class="form-input" type="text" placeholder="如：24格 / 6.5格" />
            </div>

            <!-- 萃取设备 + 常用预设 -->
            <div class="form-field">
              <div class="form-label-row">
                <label class="form-label">萃取设备</label>
                <button id="saveBrewerPresetBtn" class="save-preset-inline">+ 存常用</button>
              </div>
              <input id="inpBrewer" class="form-input" type="text" placeholder="滤杯或意式机" />
              <div id="brewerPresetPills" class="preset-pills"></div>
            </div>

            <!-- 萃取时间 -->
            <div class="form-field">
              <label class="form-label">萃取时间</label>
              <input id="inpBrewTime" class="form-input" type="text" placeholder="如：2'10&quot; 或 28s" />
            </div>

            <div class="form-field">
              <label class="form-label" id="lblTempRatio">水温 / 粉水比</label>
              <input id="inpTempRatio" class="form-input" type="text" value="92°C · 1:15" />
            </div>
            <div class="form-field">
              <label class="form-label">海报落款印章</label>
              <input id="inpSignature" class="form-input" type="text" placeholder="低声说话的地方" />
            </div>
          </div>

          <div class="poster-preview-wrap">
            <canvas id="posterCanvas" width="900" height="1200"></canvas>
          </div>

          <div class="action-row">
            <button id="downloadPngBtn" class="btn-primary">导出高清 PNG 小卡</button>
            <button id="copyNoteBtn" class="btn-secondary">复制小酌打卡文案</button>
          </div>

          <button id="saveArchiveBtn" class="btn-archive">+ 保存本杯至本地《小酌档案》</button>

          <textarea id="notePreviewBox" class="copy-box" readonly></textarea>
        </div>
      </div>
    </div>

    <!-- 常用设备管理弹窗 -->
    <div id="presetModal" class="modal-backdrop">
      <div class="sheet-panel">
        <div class="sheet-header">
          <span class="sheet-title">常用研磨与萃取设备管理</span>
          <button id="closePresetModalBtn" class="close-btn" aria-label="关闭">✕</button>
        </div>
        <div class="sheet-body">
          <div class="preset-section-title">
            <span>常用研磨器具（可绑定默认刻度）</span>
          </div>
          <div class="add-preset-bar">
            <input id="newGrinderName" class="form-input" style="flex:1.4;" placeholder="磨豆机名称" />
            <input id="newGrinderSize" class="form-input" style="flex:0.8;" placeholder="默认刻度" />
            <button id="addGrinderBtn" class="btn-primary" style="height:34px; padding:0 12px;">添加</button>
          </div>
          <div id="grinderManageList" class="preset-list"></div>

          <div class="preset-section-title">
            <span>常用萃取设备（滤杯 / 意式机）</span>
          </div>
          <div class="add-preset-bar">
            <input id="newBrewerName" class="form-input" style="flex:1;" placeholder="设备名称（如：Hario V60 Neo）" />
            <button id="addBrewerBtn" class="btn-primary" style="height:34px; padding:0 12px;">添加</button>
          </div>
          <div id="brewerManageList" class="preset-list"></div>
        </div>
      </div>
    </div>

    <!-- 本地品鉴记录抽屉 -->
    <div id="logsModal" class="modal-backdrop">
      <div class="sheet-panel">
        <div class="sheet-header">
          <span class="sheet-title">小酌档案 · 本地品鉴记录</span>
          <button id="closeLogsModalBtn" class="close-btn" aria-label="关闭">✕</button>
        </div>
        <div class="sheet-body" id="logsListContainer"></div>
      </div>
    </div>

    <div id="toast" class="toast"></div>
  </div>

  <script>
    /*****************************************************************
     * 1. SCA 2016 标准三级风味轮数据集（9 大类 · 84 细分风味 + 感官联想）
     *****************************************************************/
    const SCA_WHEEL_DATA = [
      {
        id: "fruity",
        cn: "果香",
        en: "Fruity",
        color: "#D94E5D",
        valence: "pos",
        note: "精品浅烘咖啡最迷人的明亮调性，涵盖莓果、柑橘、核果与热带水果的鲜活酸甜感。",
        groups: [
          {
            id: "berry", cn: "莓果", en: "Berry", color: "#C93B52",
            items: [
              { id: "blackberry", cn: "黑莓", en: "Blackberry", color: "#7B2848", valence: "pos", note: "深邃饱满的紫黑色浆果甜酸，常见于日晒埃塞俄比亚或肯尼亚豆。" },
              { id: "raspberry", cn: "覆盆子", en: "Raspberry", color: "#C83254", valence: "pos", note: "清脆跳跃的红莓果酸，伴随细腻的果酱余韵。" },
              { id: "blueberry", cn: "蓝莓", en: "Blueberry", color: "#4D4B8A", valence: "pos", note: "经典日晒耶加雪菲的标志性香气，圆润多汁、果酱感明显。" },
              { id: "strawberry", cn: "草莓", en: "Strawberry", color: "#DF4C5B", valence: "pos", note: "温柔甜美的熟草莓与草莓酱气息，常见于厌氧或蜜处理批次。" }
            ]
          },
          {
            id: "dried_fruit", cn: "果干", en: "Dried Fruit", color: "#A9444B",
            items: [
              { id: "raisin", cn: "葡萄干", en: "Raisin", color: "#7B3A42", valence: "pos", note: "浓缩的深色果干甜度，常见于中烘日晒或波旁品种。" },
              { id: "prune", cn: "西梅干", en: "Prune", color: "#6A3242", valence: "pos", note: "醇厚微酸的熟李子干风味，带来扎实的醇厚度与回甘。" }
            ]
          },
          {
            id: "citrus", cn: "柑橘类", en: "Citrus Fruit", color: "#F19B2C",
            items: [
              { id: "grapefruit", cn: "西柚", en: "Grapefruit", color: "#EA6F4C", valence: "pos", note: "明亮微苦的粉红西柚果肉感，清新解腻、结构立体。" },
              { id: "orange", cn: "甜橙", en: "Orange", color: "#F28B20", valence: "pos", note: "阳光感十足的鲜榨脐橙甜酸，水洗中美洲与瑰夏常见。" },
              { id: "lemon", cn: "柠檬", en: "Lemon", color: "#F4C430", valence: "pos", note: "干净利落的黄柠檬与青柠皮油香气，高海拔水洗豆特征。" },
              { id: "lime", cn: "青柠", en: "Lime", color: "#A2C53A", valence: "pos", note: "锐利清凉的青柠酸质，常见于肯尼亚 SL28/SL34。" }
            ]
          },
          {
            id: "other_fruit", cn: "其他水果", en: "Other Fruit", color: "#E66D45",
            items: [
              { id: "peach", cn: "水蜜桃", en: "Peach", color: "#F39A74", valence: "pos", note: "汁水丰沛的白桃与黄桃甜香，瑰夏（Geisha）经典风味标识。" },
              { id: "apricot", cn: "杏子", en: "Apricot", color: "#EE8838", valence: "pos", note: "柔和细腻的核果甜酸，与蜂蜜及白花调性高度契合。" },
              { id: "apple", cn: "红苹果", en: "Apple", color: "#D95B43", valence: "pos", note: "清脆爽口的富士苹果酸甜，均衡度极佳。" },
              { id: "pear", cn: "雪梨", en: "Pear", color: "#C6C96E", valence: "pos", note: "清雅多汁的梨子甜感，常见于高海拔水洗秘鲁与玻利维亚豆。" },
              { id: "pineapple", cn: "菠萝", en: "Pineapple", color: "#E8B931", valence: "pos", note: "热带水果般的热烈果酸与成熟凤梨甜感。" },
              { id: "grape", cn: "紫葡萄", en: "Grape", color: "#8C4A78", valence: "pos", note: "多汁清甜的巨峰或康科德葡萄风味，余韵悠长。" },
              { id: "cherry", cn: "樱桃", en: "Cherry", color: "#B8293D", valence: "pos", note: "饱满圆润的红樱桃酸甜，常见于拉美高海拔卡杜艾或波旁。" },
              { id: "pomegranate", cn: "石榴", en: "Pomegranate", color: "#C73949", valence: "pos", note: "晶莹剔透的红宝石般清酸，带有微涩的果皮高级感。" },
              { id: "coconut", cn: "椰子", en: "Coconut", color: "#D9CBB5", valence: "pos", note: "顺滑奶甜的椰肉与椰子水气息，常见于特殊发酵或蜜处理。" }
            ]
          }
        ]
      },
      {
        id: "floral",
        cn: "花香",
        en: "Floral",
        color: "#DC6B9A",
        valence: "pos",
        note: "轻盈飘逸的芳香化合物，在手冲降温过程中最为明显，带来优雅的嗅觉享受。",
        groups: [
          {
            id: "black_tea", cn: "红茶感", en: "Black Tea", color: "#B55D4C",
            items: [
              { id: "earl_grey", cn: "伯爵红茶", en: "Earl Grey / Black Tea", color: "#A85241", valence: "pos", note: "干爽醇和的锡兰红茶与佛手柑茶韵，水洗埃塞经典尾韵。" }
            ]
          },
          {
            id: "floral_notes", cn: "白花与玫瑰", en: "Floral Notes", color: "#E37CA8",
            items: [
              { id: "jasmine", cn: "茉莉花", en: "Jasmine", color: "#F1D4DF", valence: "pos", note: "清幽灵动的白色茉莉花香，顶级埃塞与巴拿马瑰夏的灵魂。" },
              { id: "rose", cn: "玫瑰", en: "Rose", color: "#D65A83", valence: "pos", note: "馥郁优雅的大马士革玫瑰花瓣香气，常与荔枝、莓果相伴。" },
              { id: "chamomile", cn: "洋甘菊", en: "Chamomile", color: "#E8C96D", valence: "pos", note: "温润舒缓的草本花茶香气，带来洁净柔滑的口腔触感。" },
              { id: "orange_blossom", cn: "橙花", en: "Orange Blossom", color: "#F0B89E", valence: "pos", note: "清甜微酸的柑橘白花气息，连接花香与柑橘调的桥梁。" }
            ]
          }
        ]
      },
      {
        id: "sweet",
        cn: "甜感",
        en: "Sweet",
        color: "#E47A3A",
        valence: "pos",
        note: "焦糖化反应与美拉德反应赋予咖啡的愉悦底色，决定一杯咖啡的亲和力与回甘。",
        groups: [
          {
            id: "brown_sugar", cn: "红糖与蜜", en: "Brown Sugar", color: "#C86428",
            items: [
              { id: "honey", cn: "蜂蜜", en: "Honey", color: "#E59F36", valence: "pos", note: "清亮温润的百花蜜与洋槐蜜甜感，常见于蜜处理咖啡。" },
              { id: "caramel", cn: "焦糖", en: "Caramelized", color: "#C96A2B", valence: "pos", note: "金黄诱人的熬煮蔗糖香，平衡酸质并提升顺滑度。" },
              { id: "maple", cn: "枫糖浆", en: "Maple Syrup", color: "#AD5122", valence: "pos", note: "带有木质琥珀香气的深邃糖浆甜味。" },
              { id: "molasses", cn: "黑糖蜜", en: "Molasses", color: "#6E351B", valence: "pos", note: "浓郁厚重的深色糖蜜感，中深烘拉美豆常见基底。" }
            ]
          },
          {
            id: "vanilla_sweet", cn: "香草与绵甜", en: "Vanilla & Sweet", color: "#EEA855",
            items: [
              { id: "vanilla", cn: "香草荚", en: "Vanilla", color: "#E8C37D", valence: "pos", note: "柔和奶甜的天然香草香气，常在奶咖或中烘单品中绽放。" },
              { id: "cotton_candy", cn: "棉花糖", en: "Overall Sweet", color: "#F2B6A0", valence: "pos", note: "轻盈蓬松的蔗糖甜感，入口即化、无任何杂味。" }
            ]
          }
        ]
      },
      {
        id: "nutty_cocoa",
        cn: "坚果可可",
        en: "Nutty / Cocoa",
        color: "#9E6B4B",
        valence: "pos",
        note: "经典且令人安心的醇厚风味骨架，是意式浓缩与中度烘焙手冲的核心风味带。",
        groups: [
          {
            id: "nutty", cn: "烘焙坚果", en: "Nutty", color: "#B8855C",
            items: [
              { id: "almond", cn: "杏仁", en: "Almond", color: "#C99E72", valence: "pos", note: "干净细腻的烤扁桃仁香气，余韵清甜。" },
              { id: "hazelnut", cn: "榛子", en: "Hazelnut", color: "#A97349", valence: "pos", note: "饱满圆润的烤榛果香，与牛奶融合时宛如榛果巧克力。" },
              { id: "peanut", cn: "烤花生", en: "Peanuts", color: "#C28B4E", valence: "pos", note: "扎实浓香的烘焙花生米气息，常见于巴西日晒豆。" },
              { id: "walnut", cn: "核桃", en: "Walnut", color: "#8C5E3C", valence: "pos", note: "带有轻微木质皮壳感的成熟核桃风味。" }
            ]
          },
          {
            id: "cocoa", cn: "可可巧克力", en: "Cocoa", color: "#6F4332",
            items: [
              { id: "milk_choc", cn: "牛奶巧克力", en: "Milk Chocolate", color: "#8B5742", valence: "pos", note: "丝滑甜润的可可脂香，酸苦均衡、接受度极高。" },
              { id: "dark_choc", cn: "黑巧克力", en: "Dark Chocolate", color: "#4E2D22", valence: "pos", note: "70%以上可可含量的微苦回甘，结构沉稳、尾韵持久。" },
              { id: "cocoa_nib", cn: "可可豆碎", en: "Cocoa", color: "#633A2C", valence: "pos", note: "纯粹干燥的烘焙可可粉香气，干净不甜腻。" }
            ]
          }
        ]
      },
      {
        id: "spices",
        cn: "香料",
        en: "Spices",
        color: "#B6493A",
        valence: "pos",
        note: "温暖辛香的东方与木本香料气息，能为咖啡增添复杂的层次感与异域风情。",
        groups: [
          {
            id: "brown_spice", cn: "甜香料", en: "Brown Spice", color: "#A84434",
            items: [
              { id: "cinnamon", cn: "肉桂", en: "Cinnamon", color: "#B55239", valence: "pos", note: "温暖甘甜的锡兰肉桂卷气息，厌氧发酵或中烘豆常见。" },
              { id: "clove", cn: "丁香", en: "Clove", color: "#7D3429", valence: "pos", note: "浓郁微麻的木质花蕾辛香，常见于亚洲或陈年豆。" },
              { id: "nutmeg", cn: "肉豆蔻", en: "Nutmeg", color: "#99533B", valence: "pos", note: "温厚略带坚果脂香的烘焙香料气息。" },
              { id: "anise", cn: "八角茴香", en: "Anise", color: "#8A473E", valence: "pos", note: "清凉微甜的草本香料尾韵。" }
            ]
          },
          {
            id: "pungent", cn: "辛香与胡椒", en: "Pungent / Pepper", color: "#C95A42",
            items: [
              { id: "black_pepper", cn: "黑胡椒", en: "Pepper", color: "#6B3830", valence: "pos", note: "轻微刺激鼻腔的现磨黑胡椒粒香气，常见于印尼或坦桑尼亚豆。" },
              { id: "cardamom", cn: "绿豆蔻", en: "Pungent Spice", color: "#8E6B47", valence: "pos", note: "清新带有柑橘树脂感的芳香豆蔻气息。" }
            ]
          }
        ]
      },
      {
        id: "roasted",
        cn: "烘焙味",
        en: "Roasted",
        color: "#6B4C3B",
        valence: "pos",
        note: "咖啡豆在高温美拉德与热解阶段生成的谷物、烤面包与烟熏风味。",
        groups: [
          {
            id: "cereal", cn: "谷物与麦香", en: "Cereal", color: "#9E7B56",
            items: [
              { id: "malt", cn: "麦芽", en: "Malt", color: "#A67C4E", valence: "pos", note: "温暖醇厚的大麦芽甜香，常见于哥伦比亚或中烘拼配。" },
              { id: "toast", cn: "烤吐司", en: "Grain / Toast", color: "#8F6945", valence: "pos", note: "刚出炉的焦脆全麦面包边香气。" },
              { id: "oatmeal", cn: "燕麦", en: "Oatmeal", color: "#B89B74", valence: "pos", note: "柔和温润的熟燕麦谷物气息。" }
            ]
          },
          {
            id: "burnt", cn: "焦香与烟熏", en: "Burnt", color: "#4D382D",
            items: [
              { id: "smoky", cn: "烟熏", en: "Smoky", color: "#5C493E", valence: "neg", note: "篝火或木炭烟熏感，常见于深度烘焙或苏门答腊豆。" },
              { id: "ashy", cn: "灰烬感", en: "Ashy", color: "#665E59", valence: "neg", note: "过度烘焙带来的干燥烟灰余韵，易掩盖产地风味。" },
              { id: "acrid", cn: "焦苦", en: "Acrid", color: "#3D2B22", valence: "neg", note: "二爆密集后的碳化苦感，刺激喉咙。" },
              { id: "pipe_tobacco", cn: "烟斗丝", en: "Pipe Tobacco", color: "#734B36", valence: "pos", note: "带有甜润干草与木箱气息的陈年烟叶香。" }
            ]
          }
        ]
      },
      {
        id: "green_vegetative",
        cn: "植物草本",
        en: "Green / Vegetative",
        color: "#6A8D4E",
        valence: "pos",
        note: "源自生豆本身的植物醛类与吡嗪，适度时清新如草本茶，过重则显未熟青涩。",
        groups: [
          {
            id: "herb_like", cn: "草本与茶韵", en: "Herb-like", color: "#5E8248",
            items: [
              { id: "green_tea", cn: "绿茶", en: "Green Tea / Herb", color: "#7DA15E", valence: "pos", note: "清鲜甘爽的煎茶或龙井茶韵，带有细腻的植物回甘。" },
              { id: "mint", cn: "薄荷", en: "Mint", color: "#579678", valence: "pos", note: "清凉通透的留兰香与薄荷叶气息，尾韵冰凉。" },
              { id: "lemongrass", cn: "柠檬草", en: "Lemongrass", color: "#9AB856", valence: "pos", note: "带有柠檬清香的东南亚香茅草本调性。" }
            ]
          },
          {
            id: "beany_raw", cn: "生青与植物", en: "Raw / Vegetative", color: "#7D9654",
            items: [
              { id: "fresh_grass", cn: "青草", en: "Fresh Grass", color: "#84A352", valence: "neg", note: "刚修剪过的草坪气息，常见于发展时间不足的极浅烘。" },
              { id: "pea_pod", cn: "青豆荚", en: "Peapod", color: "#6B8744", valence: "neg", note: "未熟豌豆或生豆腥气，提示烘焙芯温不足。" },
              { id: "hay_like", cn: "干草", en: "Hay-like", color: "#A69E5E", valence: "neg", note: "干燥禾草味，常见于存放过久或含水率失衡的生豆。" }
            ]
          }
        ]
      },
      {
        id: "sour_fermented",
        cn: "酸香发酵",
        en: "Sour / Fermented",
        color: "#D4A338",
        valence: "pos",
        note: "有机酸与后制发酵代谢产物，适度如酒香果醋，过度则会转化为刺激性酸败。",
        groups: [
          {
            id: "fermented", cn: "酒香与发酵", en: "Fermented", color: "#B87A3D",
            items: [
              { id: "winey", cn: "红酒韵", en: "Winey", color: "#8C3B4A", valence: "pos", note: "醇厚饱满的赤霞珠或黑皮诺红酒单宁与果香。" },
              { id: "whiskey", cn: "威士忌", en: "Whiskey", color: "#A8632C", valence: "pos", note: "橡木桶熟成般的麦芽烈酒香，常见于酒桶发酵批次。" },
              { id: "overripe", cn: "过熟果发酵", en: "Overripe", color: "#9C6B30", valence: "neg", note: "略带酒糟与熟烂水果的厚重发酵感。" }
            ]
          },
          {
            id: "sour", cn: "尖酸与有机酸", en: "Sour", color: "#D9B23B",
            items: [
              { id: "malic_acid", cn: "苹果酸", en: "Malic Acid", color: "#B5C445", valence: "pos", note: "明亮多汁的青苹果有机酸，高级精品豆的重要标志。" },
              { id: "citric_acid", cn: "柠檬酸", en: "Citric Acid", color: "#E3C23B", valence: "pos", note: "清晰锐利的柑橘类酸质，赋予咖啡鲜活的生命力。" },
              { id: "acetic", cn: "醋酸感", en: "Acetic Acid", color: "#C99A36", valence: "neg", note: "尖锐刺鼻的食醋酸味，多因发酵失控或萃取不足引起。" }
            ]
          }
        ]
      },
      {
        id: "other",
        cn: "其他 / 杂味",
        en: "Other",
        color: "#7B8794",
        valence: "neg",
        note: "包含木质纸感与生豆瑕疵、储存污染产生的负面风味，用于杯测品控校准。",
        groups: [
          {
            id: "papery_musty", cn: "纸感与陈旧", en: "Papery / Musty", color: "#8E9499",
            items: [
              { id: "woody", cn: "木质", en: "Woody", color: "#8C7662", valence: "neg", note: "干燥旧木头或铅笔屑气息，生豆陈化或季风处理常见。" },
              { id: "cardboard", cn: "纸板味", en: "Cardboard", color: "#A39B91", valence: "neg", note: "潮湿瓦楞纸板味，熟豆氧化或生豆存放过久的典型表现。" },
              { id: "earthy", cn: "泥土感", en: "Earthy", color: "#6E5D4F", valence: "neg", note: "潮湿土壤与森林腐殖质气息，传统湿刨法曼特宁常见。" }
            ]
          },
          {
            id: "chemical", cn: "化学与瑕疵", en: "Chemical", color: "#5E6B78",
            items: [
              { id: "rubbery", cn: "橡胶味", en: "Rubber", color: "#4A5259", valence: "neg", note: "灼热轮胎或生橡胶气味，常见于劣质罗布斯塔或高温烘焙。" },
              { id: "medicinal", cn: "药水味", en: "Medicinal", color: "#5D7582", valence: "neg", note: "碘酒或消毒水般的酚类刺激味，俗称里约热内卢瑕疵。" },
              { id: "salty", cn: "咸感", en: "Salty", color: "#7C8D99", valence: "neg", note: "舌侧明显的矿物咸味，常提示萃取不足或水质矿物质失衡。" }
            ]
          }
        ]
      }
    ];

    /*****************************************************************
     * 2. Web Audio API 机械拨盘实时音效合成器
     *****************************************************************/
    class MechanicalDialAudio {
      constructor() {
        this.ctx = null;
        this.enabled = true;
        this.lastTickTime = 0;
      }
      init() {
        if (!this.ctx) {
          const AudioCtx = window.AudioContext || window.webkitAudioContext;
          if (AudioCtx) this.ctx = new AudioCtx();
        }
        if (this.ctx && this.ctx.state === "suspended") {
          this.ctx.resume();
        }
      }
      playTick(intensity = 1) {
        if (!this.enabled) return;
        this.init();
        if (!this.ctx) return;

        const now = this.ctx.currentTime;
        if (now - this.lastTickTime < 0.028) return;
        this.lastTickTime = now;

        const osc = this.ctx.createOscillator();
        const gain = this.ctx.createGain();
        const filter = this.ctx.createBiquadFilter();

        osc.type = "triangle";
        const baseFreq = 920 + Math.random() * 140;
        osc.frequency.setValueAtTime(baseFreq, now);
        osc.frequency.exponentialRampToValueAtTime(210, now + 0.022);

        filter.type = "bandpass";
        filter.frequency.setValueAtTime(1400, now);
        filter.Q.setValueAtTime(2.2, now);

        const vol = Math.min(0.22, 0.13 * intensity);
        gain.gain.setValueAtTime(vol, now);
        gain.gain.exponentialRampToValueAtTime(0.001, now + 0.024);

        osc.connect(filter);
        filter.connect(gain);
        gain.connect(this.ctx.destination);

        osc.start(now);
        osc.stop(now + 0.026);
      }
      playSelect() {
        if (!this.enabled) return;
        this.init();
        if (!this.ctx) return;
        const now = this.ctx.currentTime;
        const osc = this.ctx.createOscillator();
        const gain = this.ctx.createGain();
        osc.type = "sine";
        osc.frequency.setValueAtTime(520, now);
        osc.frequency.exponentialRampToValueAtTime(780, now + 0.055);
        gain.gain.setValueAtTime(0.11, now);
        gain.gain.exponentialRampToValueAtTime(0.001, now + 0.065);
        osc.connect(gain);
        gain.connect(this.ctx.destination);
        osc.start(now);
        osc.stop(now + 0.07);
      }
    }
    const dialAudio = new MechanicalDialAudio();

    /*****************************************************************
     * 3. 几何扇形计算工具 & 扁平风味索引构建
     *****************************************************************/
    const LEAF_LIST = [];
    const CAT_MAP = {};
    const GROUP_MAP = {};
    const LEAF_MAP = {};

    (function buildGeometry() {
      let totalLeaves = 0;
      SCA_WHEEL_DATA.forEach(cat => {
        CAT_MAP[cat.id] = cat;
        cat.groups.forEach(grp => {
          grp.parentCat = cat;
          GROUP_MAP[grp.id] = grp;
          grp.items.forEach(item => {
            item.parentGroup = grp;
            item.parentCat = cat;
            LEAF_MAP[item.id] = item;
            LEAF_LIST.push(item);
            totalLeaves++;
          });
        });
      });

      const stepDeg = 360 / totalLeaves;
      let cursor = -90; // 从正上方 12 点钟方向起算
      SCA_WHEEL_DATA.forEach((cat, cIdx) => {
        cat.index = cIdx;
        cat.startDeg = cursor;
        cat.groups.forEach((grp, gIdx) => {
          grp.index = gIdx;
          grp.startDeg = cursor;
          grp.items.forEach(item => {
            item.startDeg = cursor;
            item.endDeg = cursor + stepDeg;
            item.midDeg = cursor + stepDeg / 2;
            cursor += stepDeg;
          });
          grp.endDeg = cursor;
          grp.midDeg = (grp.startDeg + grp.endDeg) / 2;
        });
        cat.endDeg = cursor;
        cat.midDeg = (cat.startDeg + cat.endDeg) / 2;
      });
    })();

    function degToRad(deg) {
      return (deg * Math.PI) / 180;
    }

    function createAnnularSectorPath(rIn, rOut, startDeg, endDeg) {
      const a1 = degToRad(startDeg);
      const a2 = degToRad(endDeg);
      const x1Out = rOut * Math.cos(a1), y1Out = rOut * Math.sin(a1);
      const x2Out = rOut * Math.cos(a2), y2Out = rOut * Math.sin(a2);
      const x2In = rIn * Math.cos(a2), y2In = rIn * Math.sin(a2);
      const x1In = rIn * Math.cos(a1), y1In = rIn * Math.sin(a1);
      const largeArc = endDeg - startDeg > 180 ? 1 : 0;
      return [
        `M ${x1Out.toFixed(2)} ${y1Out.toFixed(2)}`,
        `A ${rOut} ${rOut} 0 ${largeArc} 1 ${x2Out.toFixed(2)} ${y2Out.toFixed(2)}`,
        `L ${x2In.toFixed(2)} ${y2In.toFixed(2)}`,
        `A ${rIn} ${rIn} 0 ${largeArc} 0 ${x1In.toFixed(2)} ${y1In.toFixed(2)}`,
        "Z"
      ].join(" ");
    }

    /*****************************************************************
     * 4. 应用状态与本地持久化（常用设备 v3 + 品鉴档案 + 落款）
     *****************************************************************/
    const STORAGE_KEYS = {
      GEAR_PRESETS: "quiet_sip_gear_presets_v3",
      LOGS: "quiet_sip_archive_logs_v1",
      SIGNATURE: "quiet_sip_signature_v1"
    };

    const DEFAULT_GEAR_PRESETS = {
      grinders: [
        { name: "Comandante C40", defaultSize: "24格" },
        { name: "Lagom Casa", defaultSize: "6.5格" },
        { name: "Mahlkönig EK43", defaultSize: "7.5格" },
        { name: "泰摩 C2", defaultSize: "18格" },
        { name: "Hario Smart G", defaultSize: "14格" }
      ],
      brewers: [
        { name: "Hario V60 Neo" },
        { name: "晴庭造物 藻井滤杯" },
        { name: "WPM KD-310P" },
        { name: "V60 01 树脂滤杯" },
        { name: "Wacaco Cuppamoka" },
        { name: "Origami 折纸滤杯" }
      ]
    };

    function loadGearPresets() {
      try {
        const raw = localStorage.getItem(STORAGE_KEYS.GEAR_PRESETS);
        if (!raw) return JSON.parse(JSON.stringify(DEFAULT_GEAR_PRESETS));
        const parsed = JSON.parse(raw);
        // 增量合并默认列表，确保新增常用滤杯与磨豆机不会丢失
        const mergedGrinders = [...(parsed.grinders || [])];
        DEFAULT_GEAR_PRESETS.grinders.forEach(dg => {
          if (!mergedGrinders.some(g => g.name.toLowerCase() === dg.name.toLowerCase())) {
            mergedGrinders.push(dg);
          }
        });
        const mergedBrewers = [...(parsed.brewers || [])];
        DEFAULT_GEAR_PRESETS.brewers.forEach(db => {
          if (!mergedBrewers.some(b => b.name.toLowerCase() === db.name.toLowerCase())) {
            mergedBrewers.push(db);
          }
        });
        return { grinders: mergedGrinders, brewers: mergedBrewers };
      } catch (e) {
        return JSON.parse(JSON.stringify(DEFAULT_GEAR_PRESETS));
      }
    }

    function saveGearPresets(data) {
      try {
        localStorage.setItem(STORAGE_KEYS.GEAR_PRESETS, JSON.stringify(data));
      } catch (e) {}
    }

    function loadLogs() {
      try {
        return JSON.parse(localStorage.getItem(STORAGE_KEYS.LOGS) || "[]");
      } catch (e) {
        return [];
      }
    }

    function saveLogs(logs) {
      try {
        localStorage.setItem(STORAGE_KEYS.LOGS, JSON.stringify(logs));
      } catch (e) {}
      updateLogsBadge();
    }

    const state = {
      zoomLevel: 0, // 0: 全景, 1: 钻取放大
      activeCatId: null,
      activeGroupId: null,
      activeLeafId: null,
      rotationDeg: 0,
      capturedIds: [],
      brewMode: "pourover", // pourover | espresso
      gearPresets: loadGearPresets(),
      logs: loadLogs(),
      lastStepIndex: -1
    };

    /*****************************************************************
     * 5. 渲染 SVG 交互式三环 SCA 风味轮
     *****************************************************************/
    const wheelSvg = document.getElementById("flavorSvg");
    const wheelRotor = document.getElementById("wheelRotor");
    const centerHub = document.getElementById("centerHub");

    function renderWheel() {
      wheelRotor.innerHTML = "";
      const r0 = 40;
      const r1 = 84;
      const r2 = 136;
      const r3 = 198;

      // 第一环：9 大类
      SCA_WHEEL_DATA.forEach(cat => {
        const path = document.createElementNS("http://www.w3.org/2000/svg", "path");
        path.setAttribute("d", createAnnularSectorPath(r0, r1, cat.startDeg + 0.35, cat.endDeg - 0.35));
        path.setAttribute("fill", cat.color);
        path.setAttribute("stroke", "#F5F1E8");
        path.setAttribute("stroke-width", "1.1");
        path.setAttribute("class", "wedge-path");
        path.dataset.type = "cat";
        path.dataset.id = cat.id;
        path.addEventListener("click", (e) => {
          e.stopPropagation();
          selectCategory(cat.id);
        });
        wheelRotor.appendChild(path);

        // 大类标签
        const midRad = degToRad(cat.midDeg);
        const rLabel = (r0 + r1) / 2;
        const lx = rLabel * Math.cos(midRad);
        const ly = rLabel * Math.sin(midRad);
        let textRot = cat.midDeg;
        if (textRot > 90 || textRot < -90) textRot += 180;

        const txt = document.createElementNS("http://www.w3.org/2000/svg", "text");
        txt.setAttribute("x", lx.toFixed(1));
        txt.setAttribute("y", ly.toFixed(1));
        txt.setAttribute("text-anchor", "middle");
        txt.setAttribute("dominant-baseline", "central");
        txt.setAttribute("fill", "#FFFDF9");
        txt.setAttribute("font-size", "9.5");
        txt.setAttribute("font-weight", "600");
        txt.setAttribute("class", "wedge-label");
        txt.setAttribute("transform", `rotate(${textRot.toFixed(1)} ${lx.toFixed(1)} ${ly.toFixed(1)})`);
        txt.textContent = cat.cn;
        wheelRotor.appendChild(txt);
      });

      // 第二环：二级分组
      SCA_WHEEL_DATA.forEach(cat => {
        cat.groups.forEach(grp => {
          const path = document.createElementNS("http://www.w3.org/2000/svg", "path");
          path.setAttribute("d", createAnnularSectorPath(r1 + 0.6, r2, grp.startDeg + 0.25, grp.endDeg - 0.25));
          path.setAttribute("fill", grp.color);
          path.setAttribute("stroke", "#F5F1E8");
          path.setAttribute("stroke-width", "0.9");
          path.setAttribute("class", "wedge-path");
          path.dataset.type = "group";
          path.dataset.id = grp.id;
          path.addEventListener("click", (e) => {
            e.stopPropagation();
            selectGroup(grp.id);
          });
          wheelRotor.appendChild(path);

          const midRad = degToRad(grp.midDeg);
          const rLabel = (r1 + r2) / 2;
          const lx = rLabel * Math.cos(midRad);
          const ly = rLabel * Math.sin(midRad);
          let textRot = grp.midDeg;
          if (textRot > 90 || textRot < -90) textRot += 180;

          const txt = document.createElementNS("http://www.w3.org/2000/svg", "text");
          txt.setAttribute("x", lx.toFixed(1));
          txt.setAttribute("y", ly.toFixed(1));
          txt.setAttribute("text-anchor", "middle");
          txt.setAttribute("dominant-baseline", "central");
          txt.setAttribute("fill", "#FFFDF9");
          txt.setAttribute("font-size", "7.8");
          txt.setAttribute("font-weight", "500");
          txt.setAttribute("class", "wedge-label");
          txt.setAttribute("transform", `rotate(${textRot.toFixed(1)} ${lx.toFixed(1)} ${ly.toFixed(1)})`);
          txt.textContent = grp.cn;
          wheelRotor.appendChild(txt);
        });
      });

      // 第三环：84 种具体风味
      LEAF_LIST.forEach(item => {
        const path = document.createElementNS("http://www.w3.org/2000/svg", "path");
        path.setAttribute("d", createAnnularSectorPath(r2 + 0.6, r3, item.startDeg + 0.15, item.endDeg - 0.15));
        path.setAttribute("fill", item.color);
        path.setAttribute("stroke", "#F5F1E8");
        path.setAttribute("stroke-width", "0.75");
        path.setAttribute("class", "wedge-path");
        path.dataset.type = "leaf";
        path.dataset.id = item.id;
        path.addEventListener("click", (e) => {
          e.stopPropagation();
          selectLeaf(item.id, true);
        });
        wheelRotor.appendChild(path);

        const midRad = degToRad(item.midDeg);
        const rLabel = (r2 + r3) / 2;
        const lx = rLabel * Math.cos(midRad);
        const ly = rLabel * Math.sin(midRad);
        let textRot = item.midDeg;
        const flip = textRot > 90 || textRot < -90;
        if (flip) textRot += 180;

        const txt = document.createElementNS("http://www.w3.org/2000/svg", "text");
        txt.setAttribute("x", lx.toFixed(1));
        txt.setAttribute("y", ly.toFixed(1));
        txt.setAttribute("text-anchor", "middle");
        txt.setAttribute("dominant-baseline", "central");
        txt.setAttribute("fill", "#FFFDF9");
        txt.setAttribute("font-size", "6.2");
        txt.setAttribute("font-weight", "500");
        txt.setAttribute("class", "wedge-label");
        txt.setAttribute("transform", `rotate(${textRot.toFixed(1)} ${lx.toFixed(1)} ${ly.toFixed(1)})`);
        txt.textContent = item.cn;
        wheelRotor.appendChild(txt);
      });

      syncVisualState();
    }

    function syncVisualState() {
      // 控制放大与右移视口（将当前扇区展开在左侧 180° 方向）
      if (state.zoomLevel === 0) {
        wheelSvg.setAttribute("viewBox", "-210 -210 420 420");
        document.getElementById("hubTitle").textContent = "SCA 2016";
        document.getElementById("hubSub").textContent = "ALL WHEEL";
        document.getElementById("stageHintLeft").textContent = "点选大类展开二级风味";
      } else {
        wheelSvg.setAttribute("viewBox", "-235 -148 296 296");
        document.getElementById("hubTitle").textContent = "← 返回";
        document.getElementById("hubSub").textContent = "OVERVIEW";
        document.getElementById("stageHintLeft").textContent = "上下滑动拨盘切换风味";
      }

      wheelRotor.setAttribute("transform", `rotate(${state.rotationDeg.toFixed(2)})`);

      // 高亮当前选中与已捕获扇区
      const paths = wheelRotor.querySelectorAll(".wedge-path");
      paths.forEach(p => {
        const t = p.dataset.type;
        const id = p.dataset.id;
        let opacity = 1;
        let stroke = "#F5F1E8";
        let strokeWidth = t === "leaf" ? "0.75" : "1";

        if (state.zoomLevel === 1 && state.activeCatId) {
          if (t === "cat" && id !== state.activeCatId) opacity = 0.28;
          if (t === "group" && GROUP_MAP[id].parentCat.id !== state.activeCatId) opacity = 0.22;
          if (t === "leaf" && LEAF_MAP[id].parentCat.id !== state.activeCatId) opacity = 0.18;
        }

        if (t === "leaf") {
          if (id === state.activeLeafId) {
            opacity = 1;
            stroke = "#26201B";
            strokeWidth = "2.2";
          } else if (state.capturedIds.includes(id)) {
            opacity = 1;
            stroke = "#FFFDF9";
            strokeWidth = "1.6";
          }
        } else if (t === "group" && id === state.activeGroupId && !state.activeLeafId) {
          stroke = "#26201B";
          strokeWidth = "1.8";
        } else if (t === "cat" && id === state.activeCatId && !state.activeGroupId) {
          stroke = "#26201B";
          strokeWidth = "2";
        }

        p.style.opacity = opacity;
        p.setAttribute("stroke", stroke);
        p.setAttribute("stroke-width", strokeWidth);
      });

      renderBreadcrumb();
      renderInspector();
    }

    function rotateTargetToLeft(targetMidDeg) {
      // 目标角度旋转至正左方（180°）
      let diff = 180 - targetMidDeg - state.rotationDeg;
      while (diff > 180) diff -= 360;
      while (diff < -180) diff += 360;
      state.rotationDeg += diff;
    }

    function selectCategory(catId) {
      const cat = CAT_MAP[catId];
      if (!cat) return;
      dialAudio.playSelect();
      state.zoomLevel = 1;
      state.activeCatId = cat.id;
      state.activeGroupId = cat.groups[0].id;
      state.activeLeafId = cat.groups[0].items[0].id;
      rotateTargetToLeft(LEAF_MAP[state.activeLeafId].midDeg);
      syncVisualState();
    }

    function selectGroup(groupId) {
      const grp = GROUP_MAP[groupId];
      if (!grp) return;
      dialAudio.playSelect();
      state.zoomLevel = 1;
      state.activeCatId = grp.parentCat.id;
      state.activeGroupId = grp.id;
      state.activeLeafId = grp.items[0].id;
      rotateTargetToLeft(LEAF_MAP[state.activeLeafId].midDeg);
      syncVisualState();
    }

    function selectLeaf(leafId, playSound = true) {
      const item = LEAF_MAP[leafId];
      if (!item) return;
      if (playSound) dialAudio.playSelect();
      state.zoomLevel = 1;
      state.activeCatId = item.parentCat.id;
      state.activeGroupId = item.parentGroup.id;
      state.activeLeafId = item.id;
      rotateTargetToLeft(item.midDeg);
      syncVisualState();
    }

    function resetToOverview() {
      dialAudio.playTick(1.2);
      state.zoomLevel = 0;
      state.activeCatId = null;
      state.activeGroupId = null;
      state.activeLeafId = null;
      state.rotationDeg = 0;
      syncVisualState();
    }

    centerHub.addEventListener("click", () => {
      if (state.zoomLevel === 1) {
        resetToOverview();
      } else {
        selectCategory(SCA_WHEEL_DATA[0].id);
      }
    });

    /*****************************************************************
     * 6. 拨盘上下滑动 & 滚轮惯性切换（伴随机械音效）
     *****************************************************************/
    const wheelStage = document.getElementById("wheelStage");
    let isDragging = false;
    let dragStartY = 0;
    let dragStartRot = 0;

    function updateActiveLeafByRotation() {
      // 计算当前正左方（180°）对应的原始角度
      let pointerOrigDeg = (180 - state.rotationDeg) % 360;
      if (pointerOrigDeg < -90) pointerOrigDeg += 360;
      if (pointerOrigDeg >= 270) pointerOrigDeg -= 360;

      let matchedIdx = -1;
      for (let i = 0; i < LEAF_LIST.length; i++) {
        const it = LEAF_LIST[i];
        if (pointerOrigDeg >= it.startDeg && pointerOrigDeg < it.endDeg) {
          matchedIdx = i;
          break;
        }
      }
      if (matchedIdx === -1) matchedIdx = 0;

      if (matchedIdx !== state.lastStepIndex) {
        state.lastStepIndex = matchedIdx;
        dialAudio.playTick(1);
        const item = LEAF_LIST[matchedIdx];
        state.activeCatId = item.parentCat.id;
        state.activeGroupId = item.parentGroup.id;
        state.activeLeafId = item.id;
        renderBreadcrumb();
        renderInspector();
      }
    }

    wheelStage.addEventListener("pointerdown", (e) => {
      if (state.zoomLevel === 0) return;
      if (e.target.closest("#centerHub")) return;
      isDragging = true;
      dragStartY = e.clientY;
      dragStartRot = state.rotationDeg;
      wheelRotor.classList.add("dragging");
    });

    window.addEventListener("pointermove", (e) => {
      if (!isDragging) return;
      const dy = e.clientY - dragStartY;
      // 向上滑动逆时针拨动，向下滑动顺时针拨动
      state.rotationDeg = dragStartRot - dy * 0.48;
      wheelRotor.setAttribute("transform", `rotate(${state.rotationDeg.toFixed(2)})`);
      updateActiveLeafByRotation();
    });

    window.addEventListener("pointerup", () => {
      if (!isDragging) return;
      isDragging = false;
      wheelRotor.classList.remove("dragging");
      if (state.activeLeafId) {
        rotateTargetToLeft(LEAF_MAP[state.activeLeafId].midDeg);
        syncVisualState();
      }
    });

    wheelStage.addEventListener("wheel", (e) => {
      if (state.zoomLevel === 0) return;
      e.preventDefault();
      state.rotationDeg -= e.deltaY * 0.14;
      updateActiveLeafByRotation();
      syncVisualState();
    }, { passive: false });

    /*****************************************************************
     * 7. 面包屑、底部卡片与捕获托盘渲染
     *****************************************************************/
    function renderBreadcrumb() {
      const bar = document.getElementById("breadcrumbBar");
      const parts = [];

      parts.push(`<button class="crumb-item ${state.zoomLevel === 0 ? "active" : "clickable"}" data-action="all">00 ALL</button>`);

      if (state.activeCatId && CAT_MAP[state.activeCatId]) {
        const cat = CAT_MAP[state.activeCatId];
        parts.push(`<span class="crumb-sep">/</span>`);
        parts.push(`<button class="crumb-item ${!state.activeGroupId ? "active" : "clickable"}" data-action="cat" data-id="${cat.id}">01 ${cat.cn}</button>`);
      }

      if (state.activeGroupId && GROUP_MAP[state.activeGroupId]) {
        const grp = GROUP_MAP[state.activeGroupId];
        parts.push(`<span class="crumb-sep">/</span>`);
        parts.push(`<button class="crumb-item ${!state.activeLeafId ? "active" : "clickable"}" data-action="grp" data-id="${grp.id}">02 ${grp.cn}</button>`);
      }

      if (state.activeLeafId && LEAF_MAP[state.activeLeafId]) {
        const leaf = LEAF_MAP[state.activeLeafId];
        parts.push(`<span class="crumb-sep">/</span>`);
        parts.push(`<button class="crumb-item active" data-action="leaf" data-id="${leaf.id}">03 ${leaf.cn}</button>`);
      }

      bar.innerHTML = parts.join("");
      bar.querySelectorAll(".crumb-item").forEach(btn => {
        btn.addEventListener("click", () => {
          const act = btn.dataset.action;
          if (act === "all") resetToOverview();
          else if (act === "cat") selectCategory(btn.dataset.id);
          else if (act === "grp") selectGroup(btn.dataset.id);
        });
      });
    }

    function renderInspector() {
      const dot = document.getElementById("inspDot");
      const pathEl = document.getElementById("inspPath");
      const valEl = document.getElementById("inspValence");
      const cnEl = document.getElementById("inspCn");
      const enEl = document.getElementById("inspEn");
      const noteEl = document.getElementById("inspNote");
      const capBtn = document.getElementById("captureBtn");
      const capText = document.getElementById("captureBtnText");

      if (state.activeLeafId && LEAF_MAP[state.activeLeafId]) {
        const item = LEAF_MAP[state.activeLeafId];
        dot.style.background = item.color;
        pathEl.textContent = `${item.parentCat.cn} › ${item.parentGroup.cn}`;
        valEl.style.display = "inline-block";
        if (item.valence === "neg") {
          valEl.className = "valence-badge valence-neg";
          valEl.textContent = "负向 / 瑕疵参照";
        } else {
          valEl.className = "valence-badge valence-pos";
          valEl.textContent = "正向风味";
        }
        cnEl.textContent = item.cn;
        enEl.textContent = item.en;
        noteEl.textContent = item.note;

        capBtn.disabled = false;
        const isCaptured = state.capturedIds.includes(item.id);
        capBtn.classList.toggle("captured", isCaptured);
        capText.textContent = isCaptured ? "✓ 已收入本杯" : "+ 收入本杯";
      } else {
        dot.style.background = "#D94E5D";
        pathEl.textContent = "00 · 全景图谱";
        valEl.style.display = "none";
        cnEl.textContent = "转动或点选风味扇区";
        enEl.textContent = "SCA Coffee Taster's Flavor Wheel";
        noteEl.textContent = "点击任意大类扇区可放大展开二、三级风味；展开后支持上下滑动转盘切换并伴随机械拨盘反馈。";
        capBtn.disabled = true;
        capBtn.classList.remove("captured");
        capText.textContent = "+ 收入本杯";
      }

      renderCapturedTray();
    }

    function renderCapturedTray() {
      const container = document.getElementById("capturedChips");
      if (state.capturedIds.length === 0) {
        container.innerHTML = `<span class="empty-tray-text">尚未捕捉风味（支持多选）</span>`;
        return;
      }

      container.innerHTML = state.capturedIds.map(id => {
        const item = LEAF_MAP[id];
        if (!item) return "";
        return `
          <span class="flavor-chip" data-id="${item.id}">
            <span class="swatch-dot" style="background:${item.color}; width:8px; height:8px;"></span>
            <span>${item.cn}</span>
            <span class="chip-x">×</span>
          </span>
        `;
      }).join("");

      container.querySelectorAll(".flavor-chip").forEach(chip => {
        chip.addEventListener("click", () => {
          const id = chip.dataset.id;
          state.capturedIds = state.capturedIds.filter(x => x !== id);
          dialAudio.playTick(0.8);
          syncVisualState();
        });
      });
    }

    document.getElementById("captureBtn").addEventListener("click", () => {
      if (!state.activeLeafId) return;
      const idx = state.capturedIds.indexOf(state.activeLeafId);
      if (idx === -1) {
        state.capturedIds.push(state.activeLeafId);
        dialAudio.playSelect();
        showToast(`已记录「${LEAF_MAP[state.activeLeafId].cn}」`);
      } else {
        state.capturedIds.splice(idx, 1);
        dialAudio.playTick(0.8);
      }
      syncVisualState();
    });

    /*****************************************************************
     * 8. 常用设备快选、自动联动与管理
     *****************************************************************/
    const inpGrinder = document.getElementById("inpGrinder");
    const inpGrindSize = document.getElementById("inpGrindSize");
    const inpBrewer = document.getElementById("inpBrewer");
    const inpBrewTime = document.getElementById("inpBrewTime");
    const inpTempRatio = document.getElementById("inpTempRatio");
    const inpBean = document.getElementById("inpBean");
    const inpOrigin = document.getElementById("inpOrigin");
    const inpSignature = document.getElementById("inpSignature");

    // 载入持久化落款
    try {
      inpSignature.value = localStorage.getItem(STORAGE_KEYS.SIGNATURE) || "低声说话的地方";
    } catch (e) {
      inpSignature.value = "低声说话的地方";
    }
    inpSignature.addEventListener("input", () => {
      try {
        localStorage.setItem(STORAGE_KEYS.SIGNATURE, inpSignature.value.trim() || "低声说话的地方");
      } catch (e) {}
      refreshPosterAndNote();
    });

    function renderGearPresetPills() {
      const gContainer = document.getElementById("grinderPresetPills");
      const bContainer = document.getElementById("brewerPresetPills");
      const curGrinder = inpGrinder.value.trim().toLowerCase();
      const curBrewer = inpBrewer.value.trim().toLowerCase();

      gContainer.innerHTML = state.gearPresets.grinders.map(g => {
        const isAct = curGrinder && g.name.toLowerCase() === curGrinder;
        return `<button type="button" class="preset-pill ${isAct ? "active" : ""}" data-name="${g.name}" data-size="${g.defaultSize || ""}">${g.name}</button>`;
      }).join("");

      gContainer.querySelectorAll(".preset-pill").forEach(btn => {
        btn.addEventListener("click", () => {
          dialAudio.playTick(0.9);
          inpGrinder.value = btn.dataset.name;
          if (btn.dataset.size) {
            inpGrindSize.value = btn.dataset.size;
          }
          checkInlineSaveBtns();
          renderGearPresetPills();
          refreshPosterAndNote();
        });
      });

      bContainer.innerHTML = state.gearPresets.brewers.map(b => {
        const isAct = curBrewer && b.name.toLowerCase() === curBrewer;
        return `<button type="button" class="preset-pill ${isAct ? "active" : ""}" data-name="${b.name}">${b.name}</button>`;
      }).join("");

      bContainer.querySelectorAll(".preset-pill").forEach(btn => {
        btn.addEventListener("click", () => {
          dialAudio.playTick(0.9);
          const name = btn.dataset.name;
          inpBrewer.value = name;
          // 智能模式联动：WPM KD-310P 自动切换意式，V60 Neo / 藻井滤杯切回手冲
          if (/310p|espresso|意式/i.test(name)) {
            switchBrewMode("espresso");
          } else if (/v60|neo|藻井|origami|cuppamoka|滤杯/i.test(name)) {
            switchBrewMode("pourover");
          }
          checkInlineSaveBtns();
          renderGearPresetPills();
          refreshPosterAndNote();
        });
      });

      checkInlineSaveBtns();
    }

    function checkInlineSaveBtns() {
      const gVal = inpGrinder.value.trim();
      const gExists = state.gearPresets.grinders.some(g => g.name.toLowerCase() === gVal.toLowerCase());
      document.getElementById("saveGrinderPresetBtn").classList.toggle("visible", Boolean(gVal && !gExists));

      const bVal = inpBrewer.value.trim();
      const bExists = state.gearPresets.brewers.some(b => b.name.toLowerCase() === bVal.toLowerCase());
      document.getElementById("saveBrewerPresetBtn").classList.toggle("visible", Boolean(bVal && !bExists));
    }

    document.getElementById("saveGrinderPresetBtn").addEventListener("click", () => {
      const name = inpGrinder.value.trim();
      if (!name) return;
      state.gearPresets.grinders.unshift({ name, defaultSize: inpGrindSize.value.trim() });
      saveGearPresets(state.gearPresets);
      renderGearPresetPills();
      showToast(`已将「${name}」加入常用磨豆机`);
    });

    document.getElementById("saveBrewerPresetBtn").addEventListener("click", () => {
      const name = inpBrewer.value.trim();
      if (!name) return;
      state.gearPresets.brewers.unshift({ name });
      saveGearPresets(state.gearPresets);
      renderGearPresetPills();
      showToast(`已将「${name}」加入常用萃取设备`);
    });

    function switchBrewMode(mode) {
      state.brewMode = mode;
      document.querySelectorAll(".mode-tab").forEach(t => {
        t.classList.toggle("active", t.dataset.mode === mode);
      });
      const lbl = document.getElementById("lblTempRatio");
      if (mode === "espresso") {
        lbl.textContent = "水温 / 粉液比";
        if (!inpTempRatio.value || inpTempRatio.value.includes("1:15")) {
          inpTempRatio.value = "93°C · 18g → 36g";
        }
        if (!inpBrewTime.value || inpBrewTime.value.includes("'")) {
          inpBrewTime.value = "28s";
        }
      } else {
        lbl.textContent = "水温 / 粉水比";
        if (!inpTempRatio.value || inpTempRatio.value.includes("→")) {
          inpTempRatio.value = "92°C · 1:15";
        }
        if (!inpBrewTime.value || inpBrewTime.value.endsWith("s")) {
          inpBrewTime.value = "2'10\"";
        }
      }
      refreshPosterAndNote();
    }

    document.querySelectorAll(".mode-tab").forEach(tab => {
      tab.addEventListener("click", () => switchBrewMode(tab.dataset.mode));
    });

    [inpBean, inpOrigin, inpGrinder, inpGrindSize, inpBrewer, inpBrewTime, inpTempRatio].forEach(el => {
      el.addEventListener("input", () => {
        checkInlineSaveBtns();
        renderGearPresetPills();
        refreshPosterAndNote();
      });
    });

    /*****************************************************************
     * 9. 建筑图签 × 独立出版单页风 3:4 高清风味小卡 (900 × 1200)
     *****************************************************************/
    function drawPosterCanvas() {
      const canvas = document.getElementById("posterCanvas");
      const ctx = canvas.getContext("2d");
      const W = 900;
      const H = 1200;

      // 1. 复古暖白纸基 + 细腻建筑方格暗纹
      ctx.fillStyle = "#F6F2E8";
      ctx.fillRect(0, 0, W, H);

      ctx.strokeStyle = "rgba(76, 62, 48, 0.055)";
      ctx.lineWidth = 1;
      for (let x = 44; x <= W - 44; x += 28) {
        ctx.beginPath();
        ctx.moveTo(x, 44);
        ctx.lineTo(x, H - 44);
        ctx.stroke();
      }
      for (let y = 44; y <= H - 44; y += 28) {
        ctx.beginPath();
        ctx.moveTo(44, y);
        ctx.lineTo(W - 44, y);
        ctx.stroke();
      }

      // 2. 建筑制图双层外框
      ctx.strokeStyle = "#26201B";
      ctx.lineWidth = 2.2;
      ctx.strokeRect(44, 44, W - 88, H - 88);

      ctx.strokeStyle = "rgba(38, 32, 27, 0.35)";
      ctx.lineWidth = 1;
      ctx.strokeRect(52, 52, W - 104, H - 104);

      // 3. 顶部图签表头（竖排小标 + 小酌记录主标题 + 编号日期）
      const now = new Date();
      const dateStr = `${now.getFullYear()}.${String(now.getMonth() + 1).padStart(2, "0")}.${String(now.getDate()).padStart(2, "0")}`;
      const modeBadge = state.brewMode === "espresso" ? "ESPRESSO / 意式浓缩" : "POUR-OVER / 手冲滤泡";

      // 左侧竖排小印
      ctx.fillStyle = "#9E4A36";
      ctx.font = "600 13px 'Noto Serif SC', serif";
      const vertChars = ["低", "声", "说", "话"];
      vertChars.forEach((ch, idx) => {
        ctx.fillText(ch, 74, 88 + idx * 16);
      });
      ctx.strokeStyle = "rgba(158, 74, 54, 0.4)";
      ctx.lineWidth = 1;
      ctx.beginPath();
      ctx.moveTo(95, 74);
      ctx.lineTo(95, 140);
      ctx.stroke();

      // 主标题：小酌记录
      ctx.fillStyle = "#26201B";
      ctx.font = "700 38px 'Noto Serif SC', serif";
      ctx.fillText("小酌记录", 110, 114);

      ctx.fillStyle = "#8E8275";
      ctx.font = "500 13px 'JetBrains Mono', monospace";
      ctx.fillText(`QUIET SIP SENSORY ARCHIVE  ·  ${modeBadge}`, 112, 138);

      // 右上观测日期与序号框
      ctx.textAlign = "right";
      ctx.fillStyle = "#26201B";
      ctx.font = "600 15px 'JetBrains Mono', monospace";
      ctx.fillText(`NO.${String(state.logs.length + 1).padStart(3, "0")}`, W - 74, 98);
      ctx.fillStyle = "#5C5248";
      ctx.font = "400 14px 'JetBrains Mono', monospace";
      ctx.fillText(dateStr, W - 74, 122);
      ctx.fillStyle = "#9E4A36";
      ctx.font = "600 12px 'JetBrains Mono', monospace";
      ctx.fillText("SCA 2016 WHEEL", W - 74, 142);
      ctx.textAlign = "left";

      // 表头分割双线
      ctx.strokeStyle = "#26201B";
      ctx.lineWidth = 1.6;
      ctx.beginPath();
      ctx.moveTo(52, 162);
      ctx.lineTo(W - 52, 162);
      ctx.stroke();

      // 4. 中部双栏主体：左侧风味清单栏 (285px) + 右侧建筑十字准星风味图谱
      const splitX = 335;
      ctx.strokeStyle = "rgba(38, 32, 27, 0.25)";
      ctx.lineWidth = 1;
      ctx.beginPath();
      ctx.moveTo(splitX, 162);
      ctx.lineTo(splitX, 825);
      ctx.stroke();

      // 左侧栏标题
      ctx.fillStyle = "#8E8275";
      ctx.font = "600 12px 'JetBrains Mono', monospace";
      ctx.fillText("01 / CAPTURED NOTES", 74, 196);
      ctx.fillStyle = "#26201B";
      ctx.font = "700 20px 'Noto Serif SC', serif";
      ctx.fillText("捕捉风味图谱", 74, 224);

      const capturedItems = state.capturedIds.map(id => LEAF_MAP[id]).filter(Boolean);
      if (capturedItems.length === 0) {
        ctx.fillStyle = "#8E8275";
        ctx.font = "400 15px 'Noto Sans SC', sans-serif";
        ctx.fillText("暂未点亮具体风味", 74, 272);
        ctx.fillText("请在风味轮中收入本杯感官", 74, 298);
      } else {
        capturedItems.slice(0, 9).forEach((item, idx) => {
          const itemY = 266 + idx * 58;
          // 色标方块
          ctx.fillStyle = item.color;
          ctx.fillRect(74, itemY - 14, 14, 14);
          ctx.strokeStyle = "#26201B";
          ctx.lineWidth = 0.8;
          ctx.strokeRect(74, itemY - 14, 14, 14);

          // 中文风味名
          ctx.fillStyle = "#26201B";
          ctx.font = "700 19px 'Noto Serif SC', serif";
          ctx.fillText(item.cn, 98, itemY);

          // 英文与所属大类
          ctx.fillStyle = "#7D7164";
          ctx.font = "400 12px 'JetBrains Mono', monospace";
          ctx.fillText(`${item.en} · ${item.parentCat.cn}`, 98, itemY + 19);

          // 细虚线分隔
          ctx.strokeStyle = "rgba(68, 55, 42, 0.12)";
          ctx.beginPath();
          ctx.moveTo(74, itemY + 30);
          ctx.lineTo(splitX - 22, itemY + 30);
          ctx.stroke();
        });
      }

      // 右侧风味轮：仅点亮捕捉到的风味及其父级路径，其余灰显
      const cx = 618;
      const cy = 492;
      const r0 = 36;
      const r1 = 86;
      const r2 = 148;
      const r3 = 224;

      // 建筑十字准星辅助线
      ctx.strokeStyle = "rgba(158, 74, 54, 0.22)";
      ctx.lineWidth = 1;
      ctx.beginPath();
      ctx.moveTo(cx - 246, cy);
      ctx.lineTo(cx + 246, cy);
      ctx.moveTo(cx, cy - 246);
      ctx.lineTo(cx, cy + 246);
      ctx.stroke();

      const activeCats = new Set(capturedItems.map(i => i.parentCat.id));
      const activeGroups = new Set(capturedItems.map(i => i.parentGroup.id));
      const activeLeaves = new Set(capturedItems.map(i => i.id));

      function drawCanvasSector(rIn, rOut, sDeg, eDeg, fill, isLit) {
        const a1 = degToRad(sDeg);
        const a2 = degToRad(eDeg);
        ctx.beginPath();
        ctx.arc(cx, cy, rOut, a1, a2, false);
        ctx.arc(cx, cy, rIn, a2, a1, true);
        ctx.closePath();
        ctx.fillStyle = isLit ? fill : "rgba(214, 207, 193, 0.42)";
        ctx.fill();
        ctx.strokeStyle = "#F6F2E8";
        ctx.lineWidth = isLit ? 1.8 : 1.1;
        ctx.stroke();
      }

      SCA_WHEEL_DATA.forEach(cat => {
        drawCanvasSector(r0, r1, cat.startDeg, cat.endDeg, cat.color, activeCats.has(cat.id));
        cat.groups.forEach(grp => {
          drawCanvasSector(r1, r2, grp.startDeg, grp.endDeg, grp.color, activeGroups.has(grp.id));
          grp.items.forEach(leaf => {
            const lit = activeLeaves.has(leaf.id);
            drawCanvasSector(r2, r3, leaf.startDeg, leaf.endDeg, leaf.color, lit);
            if (lit) {
              // 点亮风味外圈指示圆点
              const mid = degToRad(leaf.midDeg);
              const px = cx + (r3 + 12) * Math.cos(mid);
              const py = cy + (r3 + 12) * Math.sin(mid);
              ctx.beginPath();
              ctx.arc(px, py, 4.5, 0, Math.PI * 2);
              ctx.fillStyle = leaf.color;
              ctx.fill();
            }
          });
        });
      });

      // 轮盘中心印章
      ctx.beginPath();
      ctx.arc(cx, cy, r0 - 2, 0, Math.PI * 2);
      ctx.fillStyle = "#F6F2E8";
      ctx.fill();
      ctx.strokeStyle = "#26201B";
      ctx.lineWidth = 1.5;
      ctx.stroke();

      ctx.fillStyle = "#26201B";
      ctx.font = "700 13px 'Noto Serif SC', serif";
      ctx.textAlign = "center";
      ctx.fillText("小酌", cx, cy - 2);
      ctx.fillStyle = "#8E8275";
      ctx.font = "500 9px 'JetBrains Mono', monospace";
      ctx.fillText(`${capturedItems.length} NOTES`, cx, cy + 12);
      ctx.textAlign = "left";

      // 5. 底部制表铭牌参数区 (Y: 825 ~ 1148)
      ctx.strokeStyle = "#26201B";
      ctx.lineWidth = 1.6;
      ctx.beginPath();
      ctx.moveTo(52, 825);
      ctx.lineTo(W - 52, 825);
      ctx.stroke();

      const beanName = inpBean.value.trim() || "未命名单品咖啡";
      const originInfo = inpOrigin.value.trim() || "精品微批次 · 浅中烘焙";
      const grinderText = [inpGrinder.value.trim(), inpGrindSize.value.trim()].filter(Boolean).join(" · ") || "—";
      const brewerText = [inpBrewer.value.trim(), inpBrewTime.value.trim()].filter(Boolean).join(" · ") || "—";
      const tempRatioText = inpTempRatio.value.trim() || "—";
      const sigText = inpSignature.value.trim() || "低声说话的地方";

      // 豆名主行
      ctx.fillStyle = "#8E8275";
      ctx.font = "600 11px 'JetBrains Mono', monospace";
      ctx.fillText("02 / COFFEE LOT & ORIGIN", 74, 855);

      ctx.fillStyle = "#26201B";
      ctx.font = "700 26px 'Noto Serif SC', serif";
      ctx.fillText(beanName, 74, 890);

      ctx.fillStyle = "#5C5248";
      ctx.font = "400 15px 'Noto Sans SC', sans-serif";
      ctx.fillText(originInfo, 74, 916);

      // 参数分割线
      ctx.strokeStyle = "rgba(38, 32, 27, 0.22)";
      ctx.lineWidth = 1;
      ctx.beginPath();
      ctx.moveTo(52, 938);
      ctx.lineTo(W - 52, 938);
      ctx.stroke();

      // 三列设备参数表
      const col1X = 74;
      const col2X = 365;
      const col3X = 640;

      ctx.fillStyle = "#8E8275";
      ctx.font = "600 11px 'JetBrains Mono', monospace";
      ctx.fillText("GRINDER / 研磨", col1X, 968);
      ctx.fillText("BREWER / 萃取", col2X, 968);
      ctx.fillText("RECIPE / 参数", col3X, 968);

      ctx.fillStyle = "#26201B";
      ctx.font = "600 16px 'Noto Sans SC', sans-serif";
      ctx.fillText(grinderText, col1X, 996);
      ctx.fillText(brewerText, col2X, 996);
      ctx.fillText(tempRatioText, col3X, 996);

      // 底栏落款印章与同源几何徽标
      ctx.strokeStyle = "rgba(38, 32, 27, 0.22)";
      ctx.beginPath();
      ctx.moveTo(52, 1026);
      ctx.lineTo(W - 52, 1026);
      ctx.stroke();

      // 左下引文与风味摘要
      const summaryFlavors = capturedItems.length > 0
        ? capturedItems.map(i => i.cn).join(" / ")
        : "静坐片刻，记录一杯咖啡的香气层次";
      ctx.fillStyle = "#5C5248";
      ctx.font = "400 14px 'Noto Serif SC', serif";
      ctx.fillText(`风味笔记：${summaryFlavors}`, 74, 1072);

      ctx.fillStyle = "#8E8275";
      ctx.font = "400 12px 'JetBrains Mono', monospace";
      ctx.fillText("RECORDED WITH QUIET SIP ARCHIVE · SCA SENSORY WHEEL", 74, 1106);

      // 右下角藻井萃滴印章与落款
      const sealX = W - 114;
      const sealY = 1054;
      ctx.strokeStyle = "#26201B";
      ctx.lineWidth = 1.6;
      ctx.strokeRect(sealX, sealY, 38, 38);
      ctx.strokeStyle = "#9E4A36";
      ctx.lineWidth = 1.3;
      ctx.beginPath();
      ctx.moveTo(sealX + 19, sealY + 9);
      ctx.quadraticCurveTo(sealX + 27, sealY + 19, sealX + 27, sealY + 23);
      ctx.arc(sealX + 19, sealY + 23, 8, 0, Math.PI, false);
      ctx.quadraticCurveTo(sealX + 11, sealY + 19, sealX + 19, sealY + 9);
      ctx.stroke();

      ctx.textAlign = "right";
      ctx.fillStyle = "#26201B";
      ctx.font = "700 16px 'Noto Serif SC', serif";
      ctx.fillText(sigText, sealX - 14, 1078);
      ctx.fillStyle = "#9E4A36";
      ctx.font = "500 11px 'JetBrains Mono', monospace";
      ctx.fillText("SENSORY LOG", sealX - 14, 1098);
      ctx.textAlign = "left";
    }

    function generateSocialCopy() {
      const bean = inpBean.value.trim() || "今日单品手冲";
      const origin = inpOrigin.value.trim();
      const grinder = [inpGrinder.value.trim(), inpGrindSize.value.trim()].filter(Boolean).join(" ");
      const brewer = [inpBrewer.value.trim(), inpBrewTime.value.trim()].filter(Boolean).join(" · ");
      const tempRatio = inpTempRatio.value.trim();
      const capturedItems = state.capturedIds.map(id => LEAF_MAP[id]).filter(Boolean);

      const flavorLine = capturedItems.length > 0
        ? capturedItems.map(i => `${i.cn}(${i.en})`).join(" / ")
        : "干净均衡的日常一杯";

      const lines = [
        `☕️ 小酌记录｜${bean}`,
        origin ? `🌱 信息：${origin}` : null,
        grinder ? `⚙️ 研磨：${grinder}` : null,
        brewer ? `🫖 器具：${brewer}${tempRatio ? " · " + tempRatio : ""}` : (tempRatio ? `🌡️ 参数：${tempRatio}` : null),
        `🎨 风味捕捉：${flavorLine}`,
        "",
        `#咖啡风味轮 #小酌记录 #手冲咖啡 #咖啡日记 #低声说话的地方`
      ].filter(v => v !== null);

      return lines.join("\n");
    }

    function refreshPosterAndNote() {
      drawPosterCanvas();
      document.getElementById("notePreviewBox").value = generateSocialCopy();
    }

    /*****************************************************************
     * 10. 弹窗交互、导出 PNG、本地档案保存与设备管理
     *****************************************************************/
    const posterModal = document.getElementById("posterModal");
    const presetModal = document.getElementById("presetModal");
    const logsModal = document.getElementById("logsModal");

    document.getElementById("openPosterModalBtn").addEventListener("click", () => {
      // 若尚未选器具，默认带入第一个常用磨豆机与滤杯方便使用
      if (!inpGrinder.value && state.gearPresets.grinders.length > 0) {
        inpGrinder.value = state.gearPresets.grinders[0].name;
        if (!inpGrindSize.value) inpGrindSize.value = state.gearPresets.grinders[0].defaultSize || "";
      }
      if (!inpBrewer.value && state.gearPresets.brewers.length > 0) {
        inpBrewer.value = state.gearPresets.brewers[0].name;
      }
      renderGearPresetPills();
      refreshPosterAndNote();
      posterModal.classList.add("open");
    });

    document.getElementById("closePosterModalBtn").addEventListener("click", () => {
      posterModal.classList.remove("open");
    });

    document.getElementById("downloadPngBtn").addEventListener("click", () => {
      const canvas = document.getElementById("posterCanvas");
      const link = document.createElement("a");
      const beanSlug = (inpBean.value.trim() || "小酌记录").replace(/[\/:*?"<>|]/g, "_");
      link.download = `${beanSlug}_风味小卡.png`;
      link.href = canvas.toDataURL("image/png");
      link.click();
      showToast("已导出 900×1200 高清风味小卡");
    });

    document.getElementById("copyNoteBtn").addEventListener("click", () => {
      const box = document.getElementById("notePreviewBox");
      box.select();
      box.setSelectionRange(0, 99999);
      try {
        document.execCommand("copy");
        showToast("打卡文案已复制到剪贴板");
      } catch (e) {
        showToast("请长按文本框复制文案");
      }
    });

    document.getElementById("saveArchiveBtn").addEventListener("click", () => {
      const now = new Date();
      const dateStr = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")} ${String(now.getHours()).padStart(2, "0")}:${String(now.getMinutes()).padStart(2, "0")}`;
      const record = {
        id: Date.now().toString(),
        date: dateStr,
        mode: state.brewMode,
        bean: inpBean.value.trim() || "未命名咖啡豆",
        origin: inpOrigin.value.trim(),
        grinder: inpGrinder.value.trim(),
        grindSize: inpGrindSize.value.trim(),
        brewer: inpBrewer.value.trim(),
        brewTime: inpBrewTime.value.trim(),
        tempRatio: inpTempRatio.value.trim(),
        capturedIds: [...state.capturedIds]
      };
      state.logs.unshift(record);
      saveLogs(state.logs);
      refreshPosterAndNote();
      showToast("已归档至本地《小酌档案》");
    });

    // 常用设备管理抽屉
    function renderManageLists() {
      const gList = document.getElementById("grinderManageList");
      gList.innerHTML = state.gearPresets.grinders.map((g, idx) => `
        <div class="preset-row">
          <div>
            <span class="preset-row-info">${g.name}</span>
            ${g.defaultSize ? `<span class="preset-row-sub">默认 ${g.defaultSize}</span>` : ""}
          </div>
          <button class="preset-del-btn" data-type="grinder" data-idx="${idx}">删除</button>
        </div>
      `).join("");

      const bList = document.getElementById("brewerManageList");
      bList.innerHTML = state.gearPresets.brewers.map((b, idx) => `
        <div class="preset-row">
          <span class="preset-row-info">${b.name}</span>
          <button class="preset-del-btn" data-type="brewer" data-idx="${idx}">删除</button>
        </div>
      `).join("");

      document.querySelectorAll(".preset-del-btn").forEach(btn => {
        btn.addEventListener("click", () => {
          const idx = Number(btn.dataset.idx);
          if (btn.dataset.type === "grinder") {
            state.gearPresets.grinders.splice(idx, 1);
          } else {
            state.gearPresets.brewers.splice(idx, 1);
          }
          saveGearPresets(state.gearPresets);
          renderManageLists();
          renderGearPresetPills();
        });
      });
    }

    document.getElementById("openPresetModalBtn").addEventListener("click", () => {
      renderManageLists();
      presetModal.classList.add("open");
    });

    document.getElementById("closePresetModalBtn").addEventListener("click", () => {
      presetModal.classList.remove("open");
    });

    document.getElementById("addGrinderBtn").addEventListener("click", () => {
      const name = document.getElementById("newGrinderName").value.trim();
      const defaultSize = document.getElementById("newGrinderSize").value.trim();
      if (!name) return;
      state.gearPresets.grinders.unshift({ name, defaultSize });
      saveGearPresets(state.gearPresets);
      document.getElementById("newGrinderName").value = "";
      document.getElementById("newGrinderSize").value = "";
      renderManageLists();
      renderGearPresetPills();
      showToast(`已添加磨豆机：${name}`);
    });

    document.getElementById("addBrewerBtn").addEventListener("click", () => {
      const name = document.getElementById("newBrewerName").value.trim();
      if (!name) return;
      state.gearPresets.brewers.unshift({ name });
      saveGearPresets(state.gearPresets);
      document.getElementById("newBrewerName").value = "";
      renderManageLists();
      renderGearPresetPills();
      showToast(`已添加萃取设备：${name}`);
    });

    // 本地历史档案抽屉
    function updateLogsBadge() {
      document.getElementById("logsCountBadge").textContent = state.logs.length;
    }

    function renderLogsDrawer() {
      const container = document.getElementById("logsListContainer");
      if (state.logs.length === 0) {
        container.innerHTML = `<p style="text-align:center; color:var(--ink-muted); font-size:13px; margin:40px 0;">暂无本地小酌记录，捕捉风味并生成小卡后可在此归档回看。</p>`;
        return;
      }

      container.innerHTML = state.logs.map((log, idx) => {
        const gearLine = [
          log.grinder ? `研磨: ${log.grinder}${log.grindSize ? " (" + log.grindSize + ")" : ""}` : "",
          log.brewer ? `器具: ${log.brewer}${log.brewTime ? " · " + log.brewTime : ""}` : "",
          log.tempRatio || ""
        ].filter(Boolean).join(" | ");

        const tagsHtml = (log.capturedIds || []).map(id => {
          const leaf = LEAF_MAP[id];
          if (!leaf) return "";
          return `<span class="log-flavor-tag" style="background:${leaf.color};">${leaf.cn}</span>`;
        }).join("");

        return `
          <div class="log-card">
            <div class="log-header">
              <span class="log-bean">${log.bean}</span>
              <span class="log-date">${log.date}</span>
            </div>
            <div class="log-params">${log.origin ? log.origin + " · " : ""}${gearLine || "常规参数"}</div>
            <div class="log-flavors">${tagsHtml || '<span style="font-size:11px;color:var(--ink-muted);">未记录具体风味</span>'}</div>
            <div class="log-actions">
              <button class="icon-btn load-log-btn" data-idx="${idx}">载入风味轮与小卡</button>
              <button class="preset-del-btn del-log-btn" data-idx="${idx}">删除</button>
            </div>
          </div>
        `;
      }).join("");

      container.querySelectorAll(".load-log-btn").forEach(btn => {
        btn.addEventListener("click", () => {
          const log = state.logs[Number(btn.dataset.idx)];
          if (!log) return;
          state.capturedIds = [...(log.capturedIds || [])];
          inpBean.value = log.bean || "";
          inpOrigin.value = log.origin || "";
          inpGrinder.value = log.grinder || "";
          inpGrindSize.value = log.grindSize || "";
          inpBrewer.value = log.brewer || "";
          inpBrewTime.value = log.brewTime || "";
          inpTempRatio.value = log.tempRatio || "";
          if (log.mode) switchBrewMode(log.mode);
          syncVisualState();
          logsModal.classList.remove("open");
          renderGearPresetPills();
          refreshPosterAndNote();
          posterModal.classList.add("open");
          showToast("已载入该杯记录");
        });
      });

      container.querySelectorAll(".del-log-btn").forEach(btn => {
        btn.addEventListener("click", () => {
          state.logs.splice(Number(btn.dataset.idx), 1);
          saveLogs(state.logs);
          renderLogsDrawer();
        });
      });
    }

    document.getElementById("logsDrawerBtn").addEventListener("click", () => {
      renderLogsDrawer();
      logsModal.classList.add("open");
    });

    document.getElementById("closeLogsModalBtn").addEventListener("click", () => {
      logsModal.classList.remove("open");
    });

    // 音效开关
    document.getElementById("soundToggleBtn").addEventListener("click", () => {
      dialAudio.enabled = !dialAudio.enabled;
      const btn = document.getElementById("soundToggleBtn");
      btn.classList.toggle("muted", !dialAudio.enabled);
      document.getElementById("soundIcon").textContent = dialAudio.enabled ? "🔊" : "🔇";
      document.getElementById("soundText").textContent = dialAudio.enabled ? "静音" : "音效";
      if (dialAudio.enabled) dialAudio.playTick(1);
    });

    // Toast 提示
    let toastTimer = null;
    function showToast(msg) {
      const el = document.getElementById("toast");
      el.textContent = msg;
      el.classList.add("show");
      clearTimeout(toastTimer);
      toastTimer = setTimeout(() => el.classList.remove("show"), 2000);
    }

    // 初始化
    renderWheel();
    updateLogsBadge();
  </script>
</body>
</html>
