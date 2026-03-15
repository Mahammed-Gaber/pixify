# Pixify Pro — Usage Guide

**[English](#english) | [العربية](#arabic)**

---

<div id="english" dir="ltr">

## English

### Overview

Pixify Pro is the professional edition of Pixify: **all modern formats** (WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP), processing modes (Smart, Force, Optimize), recursive scan, structure preservation, multiple inputs, and license/API tokens from the dashboard.

**Quick command lookup:** see [Command Reference](../command-reference.md) — “I want to…” → command and valid combinations.

---

### Basic Commands

#### Basic usage

```bash
pixify-pro -i ./images -o ./output
```

#### Output format

```bash
pixify-pro -i ./images -o ./output -f webp    # WebP (default)
pixify-pro -i ./images -o ./output -f jpeg    # JPEG
pixify-pro -i ./images -o ./output -f png     # PNG
pixify-pro -i ./images -o ./output -f avif    # AVIF
pixify-pro -i ./images -o ./output -f heic    # HEIC
pixify-pro -i ./images -o ./output -f heif    # HEIF
pixify-pro -i ./images -o ./output -f tiff    # TIFF
pixify-pro -i ./images -o ./output -f gif     # GIF
pixify-pro -i ./images -o ./output -f bmp     # BMP
pixify-pro -i ./images -o ./output -f auto    # Auto-select
```

#### Recursive scan and structure

```bash
# Recursive (-r or --recursive)
pixify-pro -i ./photos -o ./output -r

# Preserve folder structure in output (default: true)
pixify-pro -i ./photos -o ./dist --keep-structure

# In-place next to originals (only with --mode optimize)
pixify-pro -i ./images -o ./out --mode optimize --inplace
```

#### Multiple inputs

```bash
pixify-pro -i ./assets -i ./public -o ./dist -f webp
```

#### Output structure: what you get

| Goal | Command | Result |
|------|---------|--------|
| Single folder → same structure under output | `-i ./photos -o ./out -r` | `out/photo.webp`, `out/sub/photo.webp` |
| Multiple folders → **subfolder per input** | `-i ./assets -i ./public -o ./dist` | `dist/assets/...`, `dist/public/...` |
| Multiple folders → **flat** (all in output root) | `-i ./dir1 -i ./dir2 -o ./out --keep-structure=false` | `out/photo1.webp`, `out/photo2.webp` (name clashes can stop the run) |
| **In-place** next to each original | `-i ./images -o ./x --mode optimize --inplace` | Files stay in `./images/` next to originals |

#### Processing modes

```bash
pixify-pro -i ./images -o ./output --mode smart    # default
pixify-pro -i ./images -o ./output --mode force    # force conversion
pixify-pro -i ./images -o ./output --mode optimize # same format, recompress only
```

#### Auto output

```bash
pixify-pro -i ./images -o ./output -f auto
# or
pixify-pro -i ./images -o ./output --auto-output
```

#### Activation and API tokens

```bash
# Activate license (once per machine — native only)
pixify-pro --activate --license-key PIXIFY-PRO-XXXX-XXXX-XXXX
```

**Using Pro in WSL, VM, Docker, or CI:**  
In these environments the stored license file is not used; a **token** is enough. You can:
- **Set env:** `export PIXIFY_TOKEN=your_token`
- **Save token once (WSL/VM):** `pixify-pro auth --token your_token` — stored in `~/.pixify/config.json`, then run Pro without setting ENV.

Tokens are created from the [dashboard](https://getpixify.com) only; the full token is shown **once**. Details: [Tokens and environments](tokens-and-environments.md). For CI/Docker: [Command Reference](../command-reference.md).

#### Combined example

```bash
pixify-pro -i ./images -o ./output -f avif -r --keep-structure
```

**Note:** Workers are set automatically in Pro (NumCPU). There is no `-w/--workers` option.

---

### Supported Formats

**Input:** JPEG, PNG, WebP, AVIF, HEIC, HEIF, TIFF, GIF, BMP  

**Output:** WebP (default), JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP, Auto

---

### Processing Modes (detail)

#### Smart (default)

- Auto-detect input format
- Auto-optimize when useful
- Auto-skip when there’s no benefit

Use for: general use (most cases).

```bash
pixify-pro -i ./images -o ./output
```

#### Force

- Converts to the chosen format every time
- Ignores Smart skip rules
- Use for: re-encode with different quality, change compression, strip metadata, or force WebP/AVIF re-encode.

```bash
pixify-pro -i ./webp_images -o ./output -f webp --mode force
```

#### Optimize

- Same format, recompress only
- PNG: lossless optimization (only if size decreases)
- JPEG: recompress (only if ≥5% size reduction)
- WebP/AVIF/HEIC/HEIF: skip (already optimized)
- Animated GIF: skip (would break animation)
- Static GIF: convert to WebP (large savings)
- **Metadata:** removed by default; use `--keep-metadata` to keep it.

Use for: compress PNG/JPEG without changing format.

```bash
pixify-pro -i ./png_images -o ./output -f png --mode optimize
pixify-pro -i ./png_images -o ./output -f png --mode optimize --keep-metadata
```

---

### Auto Output Mode

| Input | Output (Smart) | Output (Force) |
|-------|----------------|----------------|
| JPEG | WebP | WebP |
| PNG | WebP | WebP |
| WebP | SKIP | WebP |
| AVIF | SKIP | AVIF |
| HEIC/HEIF | AVIF | AVIF |
| GIF | WebP | WebP |
| TIFF/BMP | WebP | WebP |

```bash
pixify-pro -i ./images -o ./output -f auto
pixify-pro -i ./images -o ./output -f auto --mode force
```

---

### Smart Skip Rules (summary)

- **WebP/AVIF → same format:** Smart/Optimize → SKIP; Force → CONVERT
- **HEIC/HEIF → same format:** Smart/Optimize → SKIP; Force → CONVERT
- **JPEG → PNG:** Smart/Optimize → SKIP; Force → CONVERT
- **JPEG → JPEG:** Smart → SKIP; Force → CONVERT; Optimize → OPTIMIZE if ≥5% smaller
- **PNG → PNG:** Smart/Optimize → OPTIMIZE if smaller; Force → CONVERT
- **Animated GIF (Optimize):** SKIP (keeps animation)

---

### Full Conversion Matrix

| Input | Output | Mode | AutoOutput | Result |
|-------|--------|------|------------|--------|
| JPEG | WebP | Smart | false | CONVERT |
| PNG | WebP | Smart | false | CONVERT |
| WebP | WebP | Smart | false | SKIP |
| AVIF | AVIF | Smart | false | SKIP |
| HEIC/HEIF | same | Smart | false | SKIP |
| JPEG | JPEG | Smart | false | SKIP |
| JPEG | PNG | Smart | false | SKIP |
| PNG | PNG | Smart | false | OPTIMIZE/SKIP |
| WebP/AVIF/HEIC/HEIF | same | Force | false | CONVERT |
| PNG | PNG | Optimize | false | OPTIMIZE/SKIP |
| JPEG | JPEG | Optimize | false | OPTIMIZE/SKIP |
| WebP/AVIF/HEIC/HEIF | same | Optimize | false | SKIP |
| Animated GIF | GIF | Optimize | false | SKIP |
| Static GIF | GIF | Optimize | false | CONVERT (WebP) |
| JPEG/PNG | ? | Smart | true | CONVERT (WebP) |
| WebP/AVIF | ? | Smart | true | SKIP |
| HEIC/HEIF | ? | Smart | true | CONVERT (AVIF) |
| WebP/AVIF | ? | Force | true | CONVERT |

---

### Example Scenarios

**All images to WebP:**
```bash
pixify-pro -i ./photos -o ./webp_output
```

**To AVIF, recursive:**
```bash
pixify-pro -i ./photos -o ./avif_output -f avif -r
```

**PNG optimize only (same format):**
```bash
pixify-pro -i ./png_images -o ./optimized -f png --mode optimize
```

**Re-encode WebP (Force):**
```bash
pixify-pro -i ./webp_images -o ./reencoded -f webp --mode force
```

**HEIC → AVIF:**
```bash
pixify-pro -i ./heic_images -o ./avif_output -f avif
```

**JPEG optimize (same format):**
```bash
pixify-pro -i ./jpg_images -o ./optimized -f jpeg --mode optimize
```

---

### Common Errors

| Error | Cause | Fix |
|-------|-------|-----|
| Invalid output format | Unsupported format | Use: `webp`, `jpeg`, `png`, `avif`, `heic`, `heif`, `tiff`, `gif`, `bmp`, `auto` |
| Invalid processing mode | Wrong mode | Use: `smart`, `force`, `optimize` |
| no encoder registered for format | Pro build or license issue | Reinstall from [getpixify.com](https://getpixify.com) or contact support |
| libvips initialization failed | libvips missing | Install: Linux `sudo apt install libvips-dev`, macOS `brew install vips`, Windows see [install guide](https://github.com/Mahammed-Gaber/pixify/blob/main/docs/install-libvips.md) |

---

### Metadata

- **Default:** metadata is removed in all modes (smaller files, privacy).
- **Keep metadata:** only in Optimize mode: `--mode optimize --keep-metadata`. Not available in Smart/Force.

---

### Important Notes

1. **Quality:** configurable (default 80)
2. **Workers:** automatic in Pro (NumCPU); no `-w/--workers`
3. **SkipExisting:** works in all modes (default: true)
4. **Name clashes:** if multiple files would write to the same output path, the run is rejected; use `--keep-structure` or `--inplace` as needed

---

### Report (after run)

```
Done 420 images in 1m21.745896388s

=== Pixify Pro Report ===
Total images: 420
Total before: 65.2 MB
Total after:  11.7 MB
Saved:        53.5 MB (82.1%)
```

---

### Requirements (to run Pixify Pro)

- **libvips** installed on your system (same as Free).  
  Linux: `sudo apt install libvips-dev` · macOS: `brew install vips` · Windows: see [install guide](https://github.com/Mahammed-Gaber/pixify/blob/main/docs/install-libvips.md).
- **Pixify Pro license** — purchase and activate at [getpixify.com](https://getpixify.com). Required for commercial use.

---

**© 2025 Mohammed Gaber • Proprietary • Commercial License Required**

</div>

---

<div id="arabic" dir="rtl">

## العربية

### نظرة عامة

Pixify Pro هو النسخة الاحترافية من Pixify: **جميع الصيغ الحديثة** (WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP)، أوضاع معالجة (Smart, Force, Optimize)، مسح تكراري، حفظ الهيكل، مدخلات متعددة، ترخيص ورموز API من لوحة التحكم.

**للأمر المناسب بسرعة:** راجع [مرجع الأوامر](../command-reference.md) — «أريد أن…» → الأمر، والتوليفات الصحيحة.

---

### الأوامر الأساسية

#### الاستخدام الأساسي

```bash
pixify-pro -i ./images -o ./output
```

#### تحديد صيغة الإخراج

```bash
pixify-pro -i ./images -o ./output -f webp    # WebP (افتراضي)
pixify-pro -i ./images -o ./output -f jpeg    # JPEG
pixify-pro -i ./images -o ./output -f png     # PNG
pixify-pro -i ./images -o ./output -f avif    # AVIF
pixify-pro -i ./images -o ./output -f heic    # HEIC
pixify-pro -i ./images -o ./output -f heif    # HEIF
pixify-pro -i ./images -o ./output -f tiff    # TIFF
pixify-pro -i ./images -o ./output -f gif     # GIF
pixify-pro -i ./images -o ./output -f bmp     # BMP
pixify-pro -i ./images -o ./output -f auto    # اختيار تلقائي
```

#### مسح تكراري والحفاظ على الهيكل

```bash
# مسح المجلدات الفرعية (-r أو --recursive)
pixify-pro -i ./photos -o ./output -r

# الحفاظ على هيكل المجلدات في الإخراج (افتراضي: true)
pixify-pro -i ./photos -o ./dist --keep-structure

# حفظ بجانب الأصل (فقط مع --mode optimize)
pixify-pro -i ./images -o ./out --mode optimize --inplace
```

#### مدخلات متعددة

```bash
pixify-pro -i ./assets -i ./public -o ./dist -f webp
```

#### هيكل المخرج: متى تحصل على ماذا؟

| الهدف | الأمر | النتيجة |
|-------|-------|---------|
| مجلد واحد → نفس الهيكل تحت المخرج | `-i ./photos -o ./out -r` | `out/صورة.webp`, `out/فرعي/صورة.webp` |
| مجلدات متعددة → مجلد فرعي لكل مدخل | `-i ./assets -i ./public -o ./dist` | `dist/assets/...`, `dist/public/...` |
| مجلدات متعددة → مسطح في جذر المخرج | `-i ./dir1 -i ./dir2 -o ./out --keep-structure=false` | `out/صورة1.webp`, `out/صورة2.webp` |
| الكتابة بجانب كل ملف أصلي | `-i ./images -o ./x --mode optimize --inplace` | الملفات تبقى في `./images/` بجانب الأصل |

#### أوضاع المعالجة

```bash
pixify-pro -i ./images -o ./output --mode smart    # افتراضي
pixify-pro -i ./images -o ./output --mode force    # إجبار التحويل
pixify-pro -i ./images -o ./output --mode optimize # ضغط فقط، نفس الصيغة
```

#### Auto Output

```bash
pixify-pro -i ./images -o ./output -f auto
# أو
pixify-pro -i ./images -o ./output --auto-output
```

#### التفعيل ورموز API

```bash
# تفعيل الترخيص (مرة واحدة على الجهاز — Native فقط)
pixify-pro --activate --license-key PIXIFY-PRO-XXXX-XXXX-XXXX
```

**استخدام Pro في WSL أو VM أو Docker أو CI:**  
يكفي **رمز (Token)**: تعيين `export PIXIFY_TOKEN=your_token` أو حفظه مرة واحدة (WSL/VM): `pixify-pro auth --token your_token` — يُحفظ في `~/.pixify/config.json`. إنشاء الرموز من [لوحة التحكم](https://getpixify.com) فقط؛ الرمز الكامل يُعرض **مرة واحدة**. للتفاصيل: [الرموز والبيئات](tokens-and-environments.md).

#### دمج الأوامر

```bash
pixify-pro -i ./images -o ./output -f avif -r --keep-structure
```

**ملاحظة:** العمال (Workers) تُضبط تلقائياً في Pro (NumCPU). لا يوجد خيار `-w/--workers`.

---

### الصيغ المدعومة

**المدخلة:** JPEG, PNG, WebP, AVIF, HEIC, HEIF, TIFF, GIF, BMP  

**المخرجة:** WebP (افتراضي), JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP, Auto

---

### أوضاع المعالجة (تفصيل)

#### Smart (افتراضي)

- كشف تلقائي لصيغة الإدخال، تحسين أو تخطي حسب الفائدة. للاستخدام العادي.

#### Force

- إجبار التحويل للصيغة المحددة. للإعادة encode بجودة مختلفة أو إزالة metadata.

#### Optimize

- نفس الصيغة مع إعادة ضغط. PNG/JPEG: تحسين إذا قل الحجم. WebP/AVIF/HEIC/HEIF: SKIP. **Metadata:** يُزال افتراضيًا؛ `--keep-metadata` للاحتفاظ به (فقط مع Optimize).

---

### قواعد Smart Skip (ملخص)

- WebP/AVIF → نفس الصيغة: Smart/Optimize → SKIP؛ Force → CONVERT
- HEIC/HEIF → نفس الصيغة: Smart/Optimize → SKIP؛ Force → CONVERT
- JPEG → PNG: Smart/Optimize → SKIP؛ Force → CONVERT
- JPEG → JPEG: Smart → SKIP؛ Force → CONVERT؛ Optimize → OPTIMIZE إذا قل 5%+
- PNG → PNG: Smart/Optimize → OPTIMIZE إذا قل الحجم؛ Force → CONVERT
- Animated GIF (Optimize): SKIP

---

### مصفوفة التحويل الشاملة

| Input | Output | Mode | AutoOutput | النتيجة |
|-------|--------|------|-------------|---------|
| JPEG | WebP | Smart | false | CONVERT |
| PNG | WebP | Smart | false | CONVERT |
| WebP | WebP | Smart | false | SKIP |
| AVIF | AVIF | Smart | false | SKIP |
| HEIC/HEIF | same | Smart | false | SKIP |
| JPEG | JPEG | Smart | false | SKIP |
| JPEG | PNG | Smart | false | SKIP |
| PNG | PNG | Smart | false | OPTIMIZE/SKIP |
| WebP/AVIF/HEIC/HEIF | same | Force | false | CONVERT |
| PNG | PNG | Optimize | false | OPTIMIZE/SKIP |
| JPEG | JPEG | Optimize | false | OPTIMIZE/SKIP |
| WebP/AVIF/HEIC/HEIF | same | Optimize | false | SKIP |
| Animated GIF | GIF | Optimize | false | SKIP |
| Static GIF | GIF | Optimize | false | CONVERT (WebP) |
| JPEG/PNG | ? | Smart | true | CONVERT (WebP) |
| WebP/AVIF | ? | Smart | true | SKIP |
| HEIC/HEIF | ? | Smart | true | CONVERT (AVIF) |
| WebP/AVIF | ? | Force | true | CONVERT |

---

### سيناريوهات عملية

تحويل الكل لـ WebP، تحويل لـ AVIF مع -r، ضغط PNG فقط، إعادة encode WebP (Force)، HEIC → AVIF، تحسين JPEG — الأوامر كما في القسم الإنجليزي أعلاه.

---

### الأخطاء الشائعة

| الخطأ | السبب | الحل |
|-------|-------|-----|
| Invalid output format | صيغة غير مدعومة | استخدم: webp, jpeg, png, avif, heic, heif, tiff, gif, bmp, auto |
| Invalid processing mode | Mode غير صحيح | استخدم: smart, force, optimize |
| no encoder registered | مشكلة تثبيت أو ترخيص Pro | إعادة التثبيت من [getpixify.com](https://getpixify.com) أو التواصل مع الدعم |
| libvips initialization failed | libvips غير مثبت | Linux: apt install libvips-dev؛ macOS: brew install vips؛ Windows: [دليل التثبيت](https://github.com/Mahammed-Gaber/pixify/blob/main/docs/install-libvips.md) |

---

### Metadata

الافتراضي: إزالة metadata في كل المودات. الاحتفاظ به: فقط مع `--mode optimize --keep-metadata`.

---

### ملاحظات مهمة

1. **Quality:** قابل للتعديل (افتراضي 80)
2. **Workers:** تلقائي في Pro (NumCPU)، لا يوجد -w/--workers
3. **SkipExisting:** يعمل في جميع المودات (افتراضي: true)
4. **تعارض الأسماء:** استخدام --keep-structure أو --inplace عند الحاجة

---

### التقرير النهائي

يعرض البرنامج بعد الانتهاء: Total images, Total before/after, Saved.

---

### المتطلبات والترخيص

- **libvips** مثبت على النظام (مثل Free). Linux: apt install libvips-dev · macOS: brew install vips · Windows: [دليل التثبيت](https://github.com/Mahammed-Gaber/pixify/blob/main/docs/install-libvips.md).
- **ترخيص Pixify Pro** — الشراء والتفعيل من [getpixify.com](https://getpixify.com). مطلوب للاستخدام التجاري.

**© 2025 Mohammed Gaber • Proprietary • Commercial License Required**

</div>
