# PDTH HUD Reborn — Update 247 Compatibility Fix

> Unofficial patch for the third-party PAYDAY 2 HUD mod **PDTH HUD Reborn**, making it work on PAYDAY 2 **Update 247**.
> 中文说明见文末「中文说明」一节。

## Overview

PDTH HUD Reborn is a HUD overhaul mod for PAYDAY 2. On **Update 247** (Diesel Engine 3.0, 64-bit, DX11, assets packaged as `assets/*.crate`), its HUD text stopped rendering correctly. This repository contains a patched version that fixes those text-rendering issues while keeping the original HUD layout and behavior.

## Compatibility

| Requirement | Detail |
|---|---|
| Game version | PAYDAY 2 **Update 247** (Diesel Engine 3.0, 64-bit, DX11) |
| Loader | **SuperBLT** |
| Dependency | **BeardLib** v5.1.0 |
| Fonts | Renders with the game's standard fonts (the mod's legacy Diesel fonts are no longer loaded by the DX11 engine) |

## The Problem (Update 247)

On Update 247, HUD text such as the interaction prompt ("Press F to …"), teammate names, and assault banners would:

1. first render as **underlines**, then
2. become **completely invisible** (the text objects still existed with correct position/size/alpha, but nothing was drawn).

Root cause: the mod shipped legacy Diesel-format `.font` binaries that overrode the game's fonts via `add.xml` and `Assets/fonts`, and its Lua still referenced old font keys (`menu.small_font`, `hud.small_font`, `hud_players.timer_font`, …) that point to merged-font paths the DX11 engine no longer loads.

## What This Fix Does

1. **`add.xml`** — removed the `<gui>` line pointing to a non-existent GUI (this caused a hard crash), and removed the legacy `<font>` declaration so the mod no longer overrides the game's fonts with its broken fonts.
2. **`Assets/fonts` → `Assets/_disabled_fonts`** — the mod's legacy Diesel `.font` files are disabled (they rendered as underlines under DX11).
3. **`Hooks/TweakData.lua`** — unconditionally redirects the old font keys (`menu.small_font`, `menu.small_font_noshadow`, `hud.small_font`, `hud_players.timer_font`, `hud.medium_font_noshadow`, and the related `*_font_size` keys) to the `pd2_*` keys the engine actually renders, fixing "text exists but is not drawn".

## Installation

1. Install **SuperBLT** and **BeardLib** v5.1.0.
2. Copy the contents of this repository into `PAYDAY 2/mods/PDTH Hud/`.
3. Launch the game. The HUD text should now render normally.

## Troubleshooting

If HUD text breaks again after an update:
- Check whether `add.xml` was rewritten with a `<font>` declaration.
- Check whether `Assets/_disabled_fonts` was renamed back to `Assets/fonts`.
- Check whether the font redirect shim in `Hooks/TweakData.lua` was overwritten.

## Disclaimer & License

This is an **unofficial modification** of PDTH HUD Reborn, provided only to make it compatible with Update 247 on the author's personal setup. All copyrights belong to the original author(s). If the original author requests removal, please get in touch.

---

## 中文说明

PDTH HUD Reborn 是 PAYDAY 2 的一款 HUD 改版 mod。在 **Update 247**（Diesel Engine 3.0，64 位，DX11，资源打包为 `assets/*.crate`）下，其 HUD 文字无法正常渲染。本仓库为修复版，在保留原 HUD 布局与行为的前提下修复了文字显示问题。

### 兼容环境
- 游戏版本：PAYDAY 2 **Update 247**（Diesel Engine 3.0，64 位，DX11）
- 加载器：**SuperBLT**
- 依赖：**BeardLib** v5.1.0
- 字体：使用游戏标准字体渲染（mod 自带的旧 Diesel 字体在 DX11 下已不再被引擎加载）

### 问题现象
Update 247 下，交互提示（"按 F 捡起"）、队友姓名、袭击角标等 HUD 文字：先显示为**下划线**，后**完全不可见**（文本对象仍存在、坐标/尺寸/透明度均正常，但未被绘制）。

根因：mod 自带的旧 Diesel 格式 `.font` 通过 `add.xml` 与 `Assets/fonts` 覆盖了游戏字体；其 Lua 仍引用旧字体键（`menu.small_font`、`hud.small_font`、`hud_players.timer_font` 等），这些键指向 DX11 引擎不再加载的合并字体路径。

### 修复内容
1. **`add.xml`**：移除指向不存在 GUI 的 `<gui>` 行（修复硬崩溃）；移除旧 `<font>` 声明，不再用坏字体覆盖游戏字体。
2. **`Assets/fonts` → `Assets/_disabled_fonts`**：禁用 mod 自带的旧 Diesel 二进制 `.font`（DX11 下渲染为下划线）。
3. **`Hooks/TweakData.lua`**：无条件把旧字体键（`menu.small_font`、`menu.small_font_noshadow`、`hud.small_font`、`hud_players.timer_font`、`hud.medium_font_noshadow` 及相关 `*_font_size` 键）强制重定向到引擎确实能渲染的 `pd2_*` 键，解决"文本存在但不渲染"。

### 安装
1. 安装 **SuperBLT** 与 **BeardLib** v5.1.0。
2. 将本仓库内容放入 `PAYDAY 2/mods/PDTH Hud/`。
3. 启动游戏，HUD 文字应正常显示。

### 免责声明
本仓库为对 PDTH HUD Reborn 的**非官方修改版**，仅用于个人环境兼容 Update 247。版权归原作者所有；如原作者要求移除，请告知。
