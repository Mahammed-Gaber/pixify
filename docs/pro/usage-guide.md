# دليل استخدام Pixify Pro

## نظرة عامة

Pixify Pro هو النسخة الاحترافية من Pixify: **جميع الصيغ الحديثة** (WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP)، أوضاع معالجة (Smart, Force, Optimize)، مسح تكراري، حفظ الهيكل، مدخلات متعددة، ترخيص ورموز API من لوحة التحكم.

**للأمر المناسب بسرعة:** راجع [مرجع الأوامر](../command-reference.md) — «أريد أن…» → الأمر، والتوليفات الصحيحة.

---

## الأوامر الأساسية

### الاستخدام الأساسي

```bash
pixify-pro -i ./images -o ./output
```

### تحديد صيغة الإخراج

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
pixify-pro -i ./images -o ./output -f auto    # Auto-select
```

### مسح تكراري والحفاظ على الهيكل

```bash
# مسح المجلدات الفرعية (-r أو --recursive)
pixify-pro -i ./photos -o ./output -r

# الحفاظ على هيكل المجلدات في الإخراج (افتراضي: true)
pixify-pro -i ./photos -o ./dist --keep-structure

# حفظ بجانب الأصل (فقط مع --mode optimize)
pixify-pro -i ./images -o ./out --mode optimize --inplace
```

### مدخلات متعددة (Multi-Input)

```bash
# أكثر من مجلد في أمر واحد
pixify-pro -i ./assets -i ./public -o ./dist -f webp
```

### هيكل المخرج: متى تحصل على ماذا؟

| الهدف | الأمر | النتيجة |
|-------|-------|---------|
| مجلد واحد → نفس الهيكل تحت المخرج | `-i ./photos -o ./out -r` | `out/صورة.webp`, `out/فرعي/صورة.webp` |
| مجلدات متعددة → **مجلد فرعي لكل مدخل** | `-i ./assets -i ./public -o ./dist` | `dist/assets/...`, `dist/public/...` |
| مجلدات متعددة → **كل الصور في جذر المخرج** (مسطح) | `-i ./dir1 -i ./dir2 -o ./out --keep-structure=false` | `out/صورة1.webp`, `out/صورة2.webp` (تحذير: تعارض أسماء يوقف التشغيل) |
| الكتابة **بجانب كل ملف أصلي** (بدون مجلد مخرج واحد) | `-i ./images -o ./x --mode optimize --inplace` | الملفات تبقى في `./images/` بجانب الأصل |

### Processing Modes

```bash
pixify-pro -i ./images -o ./output --mode smart    # افتراضي
pixify-pro -i ./images -o ./output --mode force     # يجبر التحويل
pixify-pro -i ./images -o ./output --mode optimize  # ضغط فقط
```

### Auto Output Mode

```bash
pixify-pro -i ./images -o ./output -f auto
# أو
pixify-pro -i ./images -o ./output --auto-output
```

### التفعيل ورموز API

```bash
# تفعيل الترخيص (مرة واحدة على الجهاز — Native فقط)
pixify-pro --activate --license-key PIXIFY-PRO-XXXX-XXXX-XXXX
```

**استخدام Pro في WSL أو VM أو Docker أو CI:**  
في هذه البيئات لا يُستخدم ملف ترخيص مخزّن؛ يكفي **رمز (Token)**. يمكنك:
- **تعيين متغير البيئة:** `export PIXIFY_TOKEN=your_token`
- **حفظ الرمز مرة واحدة (WSL/VM):** `pixify-pro auth --token your_token` — يُحفظ في `~/.pixify/config.json` وتشغيل Pro لاحقاً بدون تعيين ENV.

إنشاء الرموز من [لوحة التحكم](https://getpixify.com) فقط؛ الرمز الكامل يُعرض **مرة واحدة**. للتفاصيل: [الرموز والبيئات](tokens-and-environments.md). راجع [مرجع الأوامر](../command-reference.md) لسيناريو «الاستخدام في CI/Docker».

### دمج الأوامر

```bash
pixify-pro -i ./images -o ./output -f avif -r --keep-structure
```

**ملاحظة:** العمال (Workers) تُضبط تلقائياً في Pro لاستخدام كل الأنوية (NumCPU). لا يوجد خيار `-w/--workers`.

---

## الصيغ المدعومة

### المدخلة (Input)

- ✅ JPEG (`.jpg`, `.jpeg`)
- ✅ PNG (`.png`)
- ✅ WebP (`.webp`)
- ✅ AVIF (`.avif`)
- ✅ HEIC (`.heic`)
- ✅ HEIF (`.heif`)
- ✅ TIFF (`.tiff`, `.tif`)
- ✅ GIF (`.gif`)
- ✅ BMP (`.bmp`)

### المخرجة (Output)

- ✅ WebP (افتراضي)
- ✅ JPEG
- ✅ PNG
- ✅ AVIF
- ✅ HEIC
- ✅ HEIF
- ✅ TIFF
- ✅ GIF
- ✅ BMP
- ✅ Auto (اختيار تلقائي)

---

## Processing Modes

### Smart Mode (افتراضي)

**السلوك:**
- Auto-detect صيغة الإدخال
- Auto-optimize إذا كان مفيداً
- Auto-skip إذا لا فائدة

**متى تستخدمه:**
- الاستخدام العادي (90% من الحالات)
- تريد أفضل قرار تلقائي

**مثال:**
```bash
pixify-pro -i ./images -o ./output
```

---

### Force Mode

**السلوك:**
- يجبر التحويل للصيغة المحددة
- يتجاهل جميع قواعد Smart Skip
- يحول حتى لو نفس الصيغة

**متى تستخدمه:**
- تريد إعادة encode بجودة مختلفة
- تريد تغيير إعدادات الضغط
- تريد إزالة metadata
- تريد إجبار التحويل رغم Smart Skip (حالات خاصة: WebP/AVIF → نفس الصيغة)

**مثال:**
```bash
pixify-pro -i ./webp_images -o ./output -f webp --mode force
```

---

### Optimize Mode

**السلوك:**
- نفس الصيغة لكن إعادة ضغط
- PNG: lossless optimization (فقط إذا قل الحجم)
- JPEG: recompression (فقط إذا قل الحجم بنسبة 5%+)
- WebP/AVIF: غير مدعوم (Skip - already highly optimized)
- HEIC/HEIF: غير مدعوم (Skip - already highly optimized, H.265 based)
- Animated GIF: غير مدعوم (Skip - would break animation)
- Static GIF: مدعوم (Convert to WebP - saves up to 92%)
- **Metadata:** يُزال افتراضيًا (استخدم `--keep-metadata` للاحتفاظ به)

**متى تستخدمه:**
- تريد ضغط PNG بدون تغيير الصيغة
- تريد تحسين JPEG بدون تغيير الصيغة
- تريد تقليل الحجم مع الحفاظ على الصيغة
- تريد الاحتفاظ بـ metadata (كاميرا، GPS، تاريخ، إلخ)

**أمثلة:**
```bash
# ضغط PNG مع إزالة metadata (افتراضي)
pixify-pro -i ./png_images -o ./output -f png --mode optimize

# ضغط PNG مع الاحتفاظ بـ metadata
pixify-pro -i ./png_images -o ./output -f png --mode optimize --keep-metadata
```

---

## Auto Output Mode

### كيف يعمل

Auto Output Mode يختار الصيغة تلقائياً بناءً على صيغة الإدخال:

| صيغة الإدخال | صيغة الإخراج (Smart) | صيغة الإخراج (Force) |
|--------------|---------------------|----------------------|
| JPEG | WebP | WebP |
| PNG | WebP | WebP |
| WebP | SKIP | WebP (Force) |
| AVIF | SKIP | AVIF (Force) |
| HEIC/HEIF | AVIF | AVIF |
| GIF | WebP | WebP |
| TIFF | WebP | WebP |
| BMP | WebP | WebP |

### الاستخدام

```bash
# تفعيل Auto Output
pixify-pro -i ./images -o ./output -f auto

# مع Force Mode
pixify-pro -i ./images -o ./output -f auto --mode force
```

---

## Smart Skip Rules

### القاعدة 1: WebP/AVIF → نفس الصيغة

| Mode | النتيجة | السبب |
|------|---------|-------|
| Smart | SKIP | إعادة encode تدهور الجودة |
| Force | CONVERT | Force conversion |
| Optimize | SKIP | غير مدعوم |

---

### القاعدة 2: HEIC/HEIF → نفس الصيغة

| Mode | النتيجة | السبب |
|------|---------|-------|
| Smart | SKIP | Already optimal (H.265 based) |
| Force | CONVERT | Force conversion |
| Optimize | SKIP | Already highly optimized |

---

### القاعدة 3: JPEG → PNG

| Mode | النتيجة | السبب |
|------|---------|-------|
| Smart | SKIP | زيادة الحجم بدون فائدة |
| Force | CONVERT | Force conversion |
| Optimize | SKIP | صيغ مختلفة |

---

### القاعدة 4: JPEG → JPEG

| Mode | النتيجة | السبب |
|------|---------|-------|
| Smart | SKIP | إعادة encode تدهور الجودة |
| Force | CONVERT | Force conversion |
| Optimize | OPTIMIZE | إذا قل الحجم 5%+ |

---

### القاعدة 5: PNG → PNG

| Mode | النتيجة | السبب |
|------|---------|-------|
| Smart | OPTIMIZE | إذا قل الحجم (lossless) |
| Force | CONVERT | Force conversion |
| Optimize | OPTIMIZE | إذا قل الحجم |

---

### القاعدة 6: Animated GIF → GIF (Optimize Mode)

| Mode | النتيجة | السبب |
|------|---------|-------|
| Optimize | SKIP | Animated GIF optimization would break animation |
| Smart | CONVERT | Static GIF → WebP (saves up to 92%) |
| Force | CONVERT | Force conversion |

---

## مصفوفة التحويل الشاملة

| Input | Output | Mode | AutoOutput | النتيجة |
|-------|--------|------|-------------|---------|
| JPEG | WebP | Smart | false | CONVERT |
| PNG | WebP | Smart | false | CONVERT |
| WebP | WebP | Smart | false | SKIP |
| AVIF | AVIF | Smart | false | SKIP |
| HEIC | HEIC | Smart | false | SKIP |
| HEIF | HEIF | Smart | false | SKIP |
| JPEG | JPEG | Smart | false | SKIP |
| JPEG | PNG | Smart | false | SKIP |
| PNG | PNG | Smart | false | OPTIMIZE/SKIP |
| WebP | WebP | Force | false | CONVERT |
| AVIF | AVIF | Force | false | CONVERT |
| HEIC | HEIC | Force | false | CONVERT |
| HEIF | HEIF | Force | false | CONVERT |
| JPEG | JPEG | Force | false | CONVERT |
| JPEG | PNG | Force | false | CONVERT |
| PNG | PNG | Force | false | CONVERT |
| PNG | PNG | Optimize | false | OPTIMIZE/SKIP |
| JPEG | JPEG | Optimize | false | OPTIMIZE/SKIP |
| WebP | WebP | Optimize | false | SKIP |
| AVIF | AVIF | Optimize | false | SKIP |
| HEIC | HEIC | Optimize | false | SKIP |
| HEIF | HEIF | Optimize | false | SKIP |
| Animated GIF | GIF | Optimize | false | SKIP |
| Static GIF | GIF | Optimize | false | CONVERT (WebP) |
| JPEG | ? | Smart | true | CONVERT (WebP) |
| PNG | ? | Smart | true | CONVERT (WebP) |
| WebP | ? | Smart | true | SKIP |
| AVIF | ? | Smart | true | SKIP |
| HEIC | ? | Smart | true | CONVERT (AVIF) |
| HEIF | ? | Smart | true | CONVERT (AVIF) |
| WebP | ? | Force | true | CONVERT (WebP) |
| AVIF | ? | Force | true | CONVERT (AVIF) |

---

## سيناريوهات عملية

### السيناريو 1: تحويل جميع الصور لـ WebP

```bash
pixify-pro -i ./photos -o ./webp_output
```

**النتيجة:** JPEG/PNG → WebP, WebP → SKIP

---

### السيناريو 2: تحويل لـ AVIF مع مسح تكراري

```bash
pixify-pro -i ./photos -o ./avif_output -f avif -r
```

**النتيجة:** جميع الصور في المجلد والمجلدات الفرعية → AVIF (عمال تلقائي)

---

### السيناريو 3: ضغط PNG فقط (نفس الصيغة)

```bash
pixify-pro -i ./png_images -o ./optimized -f png --mode optimize
```

**النتيجة:** PNG → PNG (إذا قل الحجم)

---

### السيناريو 4: إعادة encode WebP بجودة أعلى

```bash
pixify-pro -i ./webp_images -o ./reencoded -f webp --mode force
```

**النتيجة:** WebP → WebP (Force)

---

### السيناريو 5: Auto Output مع Force Mode

```bash
pixify-pro -i ./mixed_images -o ./output -f auto --mode force
```

**النتيجة:** اختيار تلقائي مع Force conversion

---

### السيناريو 6: تحسين JPEG بدون تغيير الصيغة

```bash
pixify-pro -i ./jpg_images -o ./optimized -f jpeg --mode optimize
```

**النتيجة:** JPEG → JPEG (إذا قل الحجم 5%+)

---

### السيناريو 7: تحويل HEIC لـ AVIF

```bash
pixify-pro -i ./heic_images -o ./avif_output -f avif
```

**النتيجة:** HEIC → AVIF

---

## الأخطاء الشائعة

### خطأ: "Invalid output format"

**السبب:** صيغة غير مدعومة

**الحل:** استخدم: `webp`, `jpeg`, `png`, `avif`, `heic`, `heif`, `tiff`, `gif`, `bmp`, `auto`

---

### خطأ: "Invalid processing mode"

**السبب:** Mode غير صحيح

**الحل:** استخدم: `smart`, `force`, `optimize`

---

### خطأ: "no encoder registered for format"

**السبب:** Pro encoder غير مفعّل

**الحل:** تأكد من استدعاء `pro.EnableProFeatures()` (يحدث تلقائياً في CLI)

---

### خطأ: "libvips initialization failed"

**السبب:** libvips غير مثبت أو DLL مفقود

**الحل:**

**Linux:**
```bash
sudo apt install libvips-dev
```

**macOS:**
```bash
brew install vips
```

**Windows:** راجع [دليل التثبيت](https://github.com/Mahammed-Gaber/pixify/blob/main/docs/install-libvips.md)

---

## Metadata Handling

### السلوك الافتراضي

**إزالة metadata افتراضيًا في جميع المودات:**
- Smart Mode: ✅ Metadata يُزال
- Force Mode: ✅ Metadata يُزال
- Optimize Mode: ✅ Metadata يُزال (افتراضي)

**السبب:**
- تقليل حجم الملف (10-50 KB لكل صورة)
- الخصوصية (إزالة معلومات GPS والموقع)
- الأمان (إزالة معلومات حساسة)

### الاحتفاظ بـ Metadata

**متاح فقط في Optimize Mode:**

```bash
# ضغط PNG مع الاحتفاظ بـ metadata
pixify-pro -i ./images -o ./output -f png --mode optimize --keep-metadata
```

**متى تستخدمه:**
- تريد الاحتفاظ بمعلومات الكاميرا (EXIF)
- تريد الاحتفاظ بمعلومات GPS
- تريد الاحتفاظ بتاريخ التصوير
- تريد الاحتفاظ بـ Color Profile

**ملاحظة:** `--keep-metadata` يعمل فقط مع `--mode optimize`. في Smart و Force Mode، metadata يُزال دائماً.

---

## ملاحظات مهمة

1. **Quality:** قابل للتعديل (افتراضي 80)
2. **Workers:** تلقائي في Pro — يستخدم NumCPU (كل الأنوية). لا يوجد خيار `-w/--workers`
3. **SkipExisting:** يعمل في جميع المودات (افتراضي: true)
4. **Auto Output:** متاح فقط في Pro
5. **Processing Modes:** متاحة فقط في Pro
6. **Metadata:** يُزال افتراضيًا في جميع المودات (يمكن الاحتفاظ به فقط في Optimize Mode مع `--keep-metadata`)
7. **كشف التعارض:** عند عدم استخدام `--keep-structure` ولا `--inplace`، إذا كان أكثر من ملف سيُكتب بنفس الاسم في الإخراج، يُرفض التشغيل مع اقتراح استخدام `--keep-structure` أو `--inplace`

---

## الإحصائيات النهائية

بعد انتهاء المعالجة، يعرض البرنامج:

```
Done 420 images in 1m21.745896388s

=== Pixify Pro Report ===
Total images: 420
Total before: 65.2 MB
Total after:  11.7 MB
Saved:        53.5 MB (82.1%)
```

---

## المتطلبات

- Go 1.25.4 أو أحدث
- libvips (C library) - يجب تثبيته على النظام
- CGO مفعّل (`CGO_ENABLED=1`)
- Pixify Pro license (للاستخدام التجاري)

---

## الترخيص

© 2025 Mohammed Gaber • Proprietary • Commercial License Required

Pixify Pro — Professional Image Converter

---

تم إنشاء هذا الدليل بناءً على الكود الحالي في `pixify-core` و `Pixify-Pro`.

