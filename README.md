# Gran Turismo PSP Steering Curve

A control plugin for **Gran Turismo PSP** that adds an adjustable **steering sensitivity curve** (expo): the analog stick stays calm and precise around center, with full lock kept at the edge. Built on top of [RemasteredControls\_GTpsp](https://github.com/Kethen/RemasteredControls_GTpsp).

* adjustable steering curve — less twitchy off-center, full lock unchanged at the edge
* set the curve once in a config file — or tune it live in-game with the optional adjustable build
* *(inherited from the base mod)* vector throttle/brake on the right stick for better RWD control

### Why

I found Kethen's remastered controls mod and it worked great playing on an emulator with a PS5 controller. However since the PS Vita's analog sticks have such short side-to-side travel the steering still felt too sensitive and every small correction sent the car darting across the screen. So I added this exponential sensitivity curve to dial that effect back on this hardware.

### Usage

On PS Vita / Adrenaline:

1. copy `GTRemastered.prx` to `ux0:/pspemu/seplugins/`
2. add to `ux0:/pspemu/seplugins/game.txt`: `ms0:/seplugins/GTRemastered.prx 1`
3. fully quit and relaunch the game

Two builds are provided. They differ only by the in-game tuner. Install whichever you want — copy it to `seplugins/` **renamed to `GTRemastered.prx`**:

* **`GTRemastered.prx`** — non-adjustable. Set the curve once in the settings file; no in-game controls. The simple choice for most people.
* **`GTRemastered-adjustable.prx`** — adds a D-pad tuner to dial the curve in live while driving (see Controls). Rename it to `GTRemastered.prx` on the device.

Load the prx with the game — see the plugin guides for [PPSSPP](https://www.ppsspp.org/docs/reference/plugins/), [PS Vita / Adrenaline](https://consolemods.org/wiki/Vita:Adrenaline#Adding_Plugins), and [PSP](https://www.reddit.com/r/PSP/wiki/plugins/).

### Controls

* **Steering** — left analog stick (runs through the curve)
* **Throttle / Brake** — right stick up / down *(needs a right stick — Vita or an emulator; original PSP has none, so it's steering-only there)*
* **Live tuning** *(adjustable build only)* — D-pad **Right** = expo +5, **Left** = expo −5, **Up** = reset to default

### Settings

To set the curve once instead of tuning live, write `ux0:/pspemu/PSP/GTRemastered_settings.txt` (on PSP: `ms0:/PSP/GTRemastered_settings.txt` or `ef0:/PSP/...`). One line:

Put the **expo** number on it — that's the curve strength, and the only setting most people ever touch:

```
60
```

`0` means no curve at all (stock feel); the higher the number, the calmer and more precise the center. With no settings file, it defaults to `95`.

That one number is all you need. To go further, add up to two more values after it on the same line, separated by spaces, in this order — **expo edge deadzone**:

```
95 127 6
```

* **expo** `0–100` — the curve strength above. Default `95`.
* **edge** `1–127` — how far you push the stick before it reaches full lock. Leave it at `127` (the very edge) unless your stick physically can't reach the edge. Default `127`.
* **center deadzone** `0–100` — a small dead spot at the center so a resting stick doesn't drift on its own. Default `6`.

The default `95` is simply where I landed, purely personal preference. If it feels numb or still too sensitive, change it. Changes apply on the next game launch.

### The curve

`output = (1 − e)·x + e·x³`, where `x` is stick deflection (0–1) and `e` is `expo`/100. The `x³` term flattens the response near center for fine inputs and steepens it toward the edge — and it always reaches 100% at full stick, so **full lock stays pinned to the edge at any setting.**

|expo|center|steering at half-stick|
|-:|-|-|
|0|linear (basically stock)|50%|
|60|clearly calmer|28%|
|95 *(default)*|heavy, very precise|22%|

### Compatibility

* **Tested:** PS Vita + Adrenaline, EU `UCES01245` v2.00.
* **Should also work (untested by me):** PSP emulator (PPSSPP) and original PSP hardware. Other game versions the base mod supports: US `UCUS98632` v2.00, JP `UCJS10100` v1.01, ASIA `UCAS40265` v1.00.

### Credits

Built on [RemasteredControls\_GTpsp](https://github.com/Kethen/RemasteredControls_GTpsp) by Katharine Chui (based on TheFloW's *RemasteredControls*), with thanks to [pspdev](https://github.com/pspdev) and [ghidra-allegrex](https://github.com/kotcrab/ghidra-allegrex). Licensed **GPLv3** — see `LICENSE`.

— Beckett · [beckettharriman.com](https://beckettharriman.com)

