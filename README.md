# PDTH HUD Reborn — Update 247 兼容修复版

非官方修复版。基于第三方 PAYDAY 2 HUD mod **PDTH HUD Reborn** 修改，使其兼容 PAYDAY 2 **Update 247**。

## 适用环境
- PAYDAY 2 **Update 247**（Diesel Engine 3.0，64 位，DX11，资源打包为 `assets/*.crate`）
- **SuperBLT** + **BeardLib** v5.1.0
- 使用游戏标准字体渲染（DX11 下原 mod 自带的旧 Diesel 字体资源已不再被引擎加载）

## 问题现象
原版在 U247 下：HUD 提示文字（交互提示「按 F 捡起」、队友姓名、袭击角标等）先显示为下划线，后完全不可见。

## 修复内容
1. `add.xml`：移除指向不存在 gui 的 `<gui>` 行（修复硬崩溃）；移除旧 `<font>` 声明，不再用 mod 自带坏字体覆盖游戏字体。
2. `Assets/fonts` → `Assets/_disabled_fonts`：禁用 mod 自带的旧 Diesel 二进制 `.font`（DX11 下渲染为下划线）。
3. `Hooks/TweakData.lua`：无条件把旧字体键（`menu.small_font`、`hud.small_font`、`hud_players.timer_font` 等）强制重定向到引擎确实能渲染的 `pd2_*` 键，解决「文本对象存在但不渲染」。

## 安装
将本仓库内容放入 `PAYDAY 2/mods/PDTH Hud/`，在已启用 SuperBLT + BeardLib 的情况下启动游戏即可。

## 免责声明
本仓库为对 PDTH HUD Reborn 的修改版，仅用于个人环境兼容 Update 247。版权归原作者所有；如原作者要求移除，请告知。
