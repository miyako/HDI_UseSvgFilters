![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_UseSvgFilters

Applying SVG filter primitives -- Gaussian blur, offset and blend -- to a shape built with the 4D SVG component and rendered through Direct2D. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v15**; restored so it runs on current 4D releases.

## What it demonstrates

- Building an SVG document in memory with the 4D SVG component (`SVG_New`, `SVG_New_rect`, `SVG_New_group`, `SVG_New_textArea`) and exporting it to a picture with `SVG_Export_to_picture`.
- Defining a named filter with `SVG_Define_filter` and attaching it to an object with `SVG_SET_FILTER`.
- The three filter primitives in isolation: blur (`SVG_Filter_Blur`), offset (`SVG_Filter_Offset`) and blend (`SVG_Filter_Blend`).
- Chaining primitives via named results (`blurResult` -> `alphaBlurOffset` -> `finalFilter`) to build a drop-shadow-plus-blend effect.
- Choosing the blur source (`SourceGraphic` vs `SourceAlpha`), the deviation, the offset and the blend mode from form controls.
- Forcing the Direct2D rendering path with `SET DATABASE PARAMETER(Direct2D status; Direct2D software)`.

## Key commands

| Command | Used for |
|---|---|
| `SVG_New` / `SVG_Export_to_picture` | Create the SVG root and render it to a picture variable |
| `SVG_Define_filter` / `SVG_SET_FILTER` | Declare a filter and bind it to the text area |
| `SVG_Filter_Blur` | Gaussian blur with a chosen deviation and source |
| `SVG_Filter_Offset` | Displace the (blurred) result by X/Y |
| `SVG_Filter_Blend` | Blend the offset result back over `SourceGraphic` |
| `SET DATABASE PARAMETER` | Select the Direct2D rendering engine |

## How it works

`Demo_Start` opens `HDI2` as a dialog. The form method (`Project/Sources/Forms/HDI2/method.4dm`) runs on `On Load`: it sets up the parameter arrays (`blurSource`, `Deviation`, `OffsetX`/`OffsetY`, `BlendMode`), forces Direct2D via `SET DATABASE PARAMETER`, and builds an initial unfiltered SVG -- a darkblue rectangle plus an orange "Hello World!" text area -- into the process picture `<>pict`.

Each button rebuilds the same base SVG and layers on one filter, so they read as a progression. `btnBlur` defines a `blur` filter and applies `SVG_Filter_Blur`; `btnOffset` applies `SVG_Filter_Offset`; `BtnBlend` (`ObjectMethods/BtnBlend.4dm`) chains blur then offset, reusing the named result `blurResult`; and `BtnBlend1` adds `SVG_Filter_Blend` on top, combining the offset shadow with the original graphic under a selectable blend mode -- the most complete effect in the demo. `Button3` draws the shape with no filter for comparison. Every button ends with `SVG_Export_to_picture` to refresh `<>pict`.

## Points of interest

- The Windows limitation the original demo warned about (only the "Normal" blend mode supported) no longer exists thanks to Direct2D support -- all blend modes now render on Windows.
- Filters are wired together purely by naming their outputs: `SVG_Filter_Blur` writes `blurResult`, `SVG_Filter_Offset` consumes it and writes `alphaBlurOffset`, and `SVG_Filter_Blend` consumes that -- there is no imperative pipeline, just SVG result references.
- `SET DATABASE PARAMETER(Direct2D status; Direct2D software)` pins the software Direct2D path so the filtered output is consistent regardless of the GPU.

## References

- [4D documentation: SET DATABASE PARAMETER](https://developer.4d.com/docs/commands/set-database-parameter)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)

## Screenshots

<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/e137be5b-ba3e-4958-a456-6da5fd712b3f" />
