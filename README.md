# GT PSP Steering Curve

A control plugin for **Gran Turismo PSP** that adds an adjustable **steering sensitivity curve** (expo): the analog stick stays calm and precise around center, with full lock kept right at the edge. Built on top of [RemasteredControls_GTpsp](https://github.com/Kethen/RemasteredControls_GTpsp).

- adjustable steering curve — less twitchy off-center, full lock unchanged at the edge
- tune it live in-game on the D-pad, or set it once in a config file
- *(inherited from the base mod)* vector throttle/brake on the right stick for better RWD control

### Why

I found this mod and it worked great playing on an emulator with a PS5 controller. But the PS Vita's analog sticks have such short side-to-side travel that the steering still felt too sensitive there — every small correction sent the car darting across the screen. So I added a sensitivity curve to dial that back.

### Usage

Load the prx with the game — see the plugin guides for [PPSSPP](https://www.ppsspp.org/docs/reference/plugins/), [PS Vita / Adrenaline](https://consolemods.org/wiki/Vita:Adrenaline#Adding_Plugins), and [PSP](https://www.reddit.com/r/PSP/wiki/plugins/).

On PS Vita / Adrenaline:
1. copy `GTRemastered.prx` to `ux0:/pspemu/seplugins/`
2. add to `ux0:/pspemu/seplugins/game.txt`: `ms0:/seplugins/GTRemastered.prx 1`
3. fully quit and relaunch the game

Two builds are provided — install either one as `GTRemastered.prx`:
- **`GTRemastered.prx`** — silent.
- **`GTRemastered-logged.prx`** — logs each steering change to `ux0:/pspemu/PSP/GTRemastered.log`, so you can read back the exact value you've dialed in.

### Controls

- **Steering** — left analog stick (runs through the curve)
- **Throttle / Brake** — right stick up / down *(needs a right stick — Vita or an emulator; original PSP has none, so it's steering-only there)*
- **Live tuning** — D-pad **Right** = expo +5, **Left** = expo −5, **Up** = reset to default

### Settings

To set the curve once instead of tuning live, write `ux0:/pspemu/PSP/GTRemastered_settings.txt` (on PSP: `ms0:/PSP/GTRemastered_settings.txt` or `ef0:/PSP/...`). One line:

```
<expo 0-100> [edge 1-127] [center deadzone 0-100]
```

- **expo** *(0–100)* — curve strength, and the only number most people need to touch. `0` = linear, higher = calmer center. Default `95`.
- **edge** *(optional)* — the stick deflection that reaches full lock. Default `127` (the very edge); lower it only if your stick can't physically reach full throw.
- **center deadzone** *(optional)* — counts near center to ignore, kills resting jitter. Default `6`.

eg. just a calmer-than-default center:
```
60
```

The default `95` is simply where I landed — I like it heavier and calmer than most people will. If it feels numb, drop it to `50–60`. Changes apply on the next game launch.

### The curve

`output = (1 − e)·x + e·x³`, where `x` is stick deflection (0–1) and `e` is `expo`/100. The `x³` term flattens the response near center for fine inputs and steepens it toward the edge — and it always reaches 100% at full stick, so **full lock stays pinned to the edge at any setting.**

| expo | center | steering at half-stick |
|---:|---|---|
| 0 | linear (basically stock) | 50% |
| 60 | clearly calmer | 28% |
| 95 *(default)* | heavy, very precise | 22% |

### Compatibility

- **Tested:** PS Vita + Adrenaline, EU `UCES01245` v2.00.
- **Should also work (untested by me):** PSP emulator (PPSSPP) and original PSP hardware. Other game versions the base mod supports: US `UCUS98632` v2.00, JP `UCJS10100` v1.01, ASIA `UCAS40265` v1.00.

### Credits

Built on [RemasteredControls_GTpsp](https://github.com/Kethen/RemasteredControls_GTpsp) by Katharine Chui (based on TheFloW's *RemasteredControls*), with thanks to [pspdev](https://github.com/pspdev) and [ghidra-allegrex](https://github.com/kotcrab/ghidra-allegrex). Licensed **GPLv3** — see `LICENSE`.

— Beckett · [beckettharriman.com](https://beckettharriman.com)
