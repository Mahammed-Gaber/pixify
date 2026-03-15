# Pixify Free — Usage Guide

**[English](#english) | [العربية](#arabic)**

---

<div id="english" dir="ltr">

## English

### Overview

Pixify Free is the free edition of Pixify: converts **JPEG and PNG** to **WebP** at fixed quality (80), single input folder. Images are processed locally. First-time run may require internet for activation; daily/monthly limits apply (see Limits below).

**Quick command lookup:** see [Command Reference](../command-reference.md) — “I want to…” → command.

---

### Basic Commands

#### Basic usage

```bash
pixify-free -i ./images -o ./output
```

With long options:

```bash
pixify-free --input ./images --output ./output
```

#### Version and help

```bash
pixify-free -v
# or
pixify-free --version

pixify-free -h
# or
pixify-free --help
```

---

### Fixed Settings

| Setting | Value | Notes |
|---------|-------|-------|
| **Output format** | WebP | Fixed — cannot be changed |
| **Quality** | 80 | Fixed — cannot be changed |
| **Workers** | NumCPU / 2 | Set automatically (about 50% of CPU cores); no `-w` flag in Free |
| **Mode** | Smart | Fixed — cannot be changed |
| **SkipExisting** | true | Skips files already present in output |

**Limits (Free edition):** Daily and monthly image quotas apply. Pro removes limits.

---

### Supported Formats

**Input:** JPEG (`.jpg`, `.jpeg`), PNG (`.png`), WebP (`.webp` — skipped automatically)

**Output:** WebP only (`.webp`)

---

### Conversion Matrix

| Input | Output | Result | Reason |
|-------|--------|--------|--------|
| JPEG | WebP | CONVERT | Supported |
| PNG | WebP | CONVERT | Supported |
| WebP | WebP | SKIP | Smart: “already optimal” |

---

### Behavior

**1. JPEG → WebP**  
`pixify-free -i ./jpg_images -o ./output` → CONVERT (quality 80, workers auto)

**2. PNG → WebP**  
`pixify-free -i ./png_images -o ./output` → CONVERT (quality 80, workers auto)

**3. WebP → WebP**  
`pixify-free -i ./webp_images -o ./output` → SKIP (Smart: “already optimal”, no decode)

**4. Mixed files**  
JPEG/PNG → CONVERT; WebP → SKIP

---

### Examples

**Convert a folder:**
```bash
pixify-free -i ./photos -o ./webp_output
```

**Windows paths:**
```bash
pixify-free -i "C:\Users\Photos" -o "C:\Users\WebP"
```

**Linux/macOS paths:**
```bash
pixify-free -i /home/user/photos -o /home/user/webp
```

---

### Smart Skip: WebP → WebP

Always **SKIP**. Re-encoding lossy WebP degrades quality with no benefit. Message: “already optimal”.

---

### Common Errors

| Error | Cause | Fix |
|-------|-------|-----|
| You must pass -i/--input and -o/--output | Input or output folder missing | Use `pixify-free -i ./images -o ./output` |
| libvips initialization failed | libvips not installed or DLL missing | Linux: `sudo apt install libvips-dev`; macOS: `brew install vips`; Windows: [install guide](https://github.com/Mahammed-Gaber/pixify/blob/main/docs/install-libvips.md) |
| unsupported input format | File has .jpg/.png extension but is actually AVIF, HEIC, etc. | Free supports only JPEG, PNG, WebP. Use Pixify Pro for other formats. |

---

### Important Notes

1. **Quality is fixed:** WebP quality is 80 and cannot be changed  
2. **Workers:** Set automatically (NumCPU/2); no `-w`/`--workers` option in Free. Pro allows full CPU.  
3. **WebP is skipped:** Smart mode skips WebP without processing  
4. **SkipExisting:** Skips files already in the output directory  
5. **Progress bar:** Shows progress and ETA in real time  
6. **Limits:** Free has daily/monthly quotas; first run may need internet for activation  

---

### Report (after run)

```
Done 420 images in 1m21.745896388s

=== Pixify Free Report ===
Total images: 420
Total before: 65.2 MB
Total after:  11.7 MB
Saved:        53.5 MB (82.1%)
```

---

### Requirements (to run Pixify Free)

- **libvips** installed on your system (required for the app to run).  
  Linux: `sudo apt install libvips-dev` · macOS: `brew install vips` · Windows: see [install guide](https://github.com/Mahammed-Gaber/pixify/blob/main/docs/install-libvips.md).
- Pre-built binary from [Releases](https://github.com/Mahammed-Gaber/pixify/releases) or **Homebrew** (`brew install mahammed-gaber/pixify/pixify-free`).

**© 2025 Mohammed Gaber • Proprietary • Freeware Edition — Free for personal and commercial use**

</div>

---

<div id="arabic" dir="rtl">

## العربية

### نظرة عامة

Pixify Free هو النسخة المجانية من Pixify: تحويل **JPEG و PNG** إلى **WebP** بجودة ثابتة (80)، مجلد مدخل واحد. المعالجة محلية؛ التشغيل الأول قد يتطلب إنترنت للتفعيل، وتُطبّق حدود يومية/شهرية.

**للأمر المناسب بسرعة:** راجع [مرجع الأوامر](../command-reference.md) — «أريد أن…» → الأمر.

---

### الأوامر الأساسية

#### الاستخدام الأساسي

```bash
pixify-free -i ./images -o ./output
```

أو باستخدام الأسماء الطويلة:

```bash
pixify-free --input ./images --output ./output
```

#### عرض الإصدار والمساعدة

```bash
pixify-free -v
# أو
pixify-free --version

pixify-free -h
# أو
pixify-free --help
```

---

### الإعدادات الثابتة

| الإعداد | القيمة | ملاحظات |
|---------|--------|---------|
| **Output Format** | WebP | ثابت - لا يمكن تغييره |
| **Quality** | 80 | ثابت - لا يمكن تغييره |
| **Workers** | NumCPU / 2 | تلقائي (حوالي 50% من الأنوية)، لا يوجد خيار -w في Free |
| **Mode** | Smart | ثابت - لا يمكن تغييره |
| **SkipExisting** | true | ثابت - يتخطى الملفات الموجودة |

**حدود النسخة المجانية:** تطبّق حصص يومية/شهرية للصور. Pro بدون حدود.

---

### الصيغ المدعومة

**المدخلة:** JPEG (`.jpg`, `.jpeg`), PNG (`.png`), WebP (`.webp` — يتخطى تلقائياً)

**المخرجة:** WebP فقط (`.webp`)

---

### مصفوفة التحويل

| صيغة الإدخال | صيغة الإخراج | النتيجة | السبب |
|--------------|--------------|---------|-------|
| JPEG | WebP | CONVERT | تحويل مدعوم |
| PNG | WebP | CONVERT | تحويل مدعوم |
| WebP | WebP | SKIP | Smart Mode: "already optimal" |

---

### السلوك التفصيلي

**1. JPEG → WebP:** `pixify-free -i ./jpg_images -o ./output` → CONVERT (جودة 80، workers تلقائي)

**2. PNG → WebP:** `pixify-free -i ./png_images -o ./output` → CONVERT (جودة 80، workers تلقائي)

**3. WebP → WebP:** `pixify-free -i ./webp_images -o ./output` → SKIP (Smart: "already optimal"، لا فك تشفير)

**4. ملفات مختلطة:** JPEG/PNG → CONVERT؛ WebP → SKIP

---

### أمثلة عملية

تحويل مجلد، مسارات Windows، مسارات Linux/macOS — كما في القسم الإنجليزي أعلاه.

---

### Smart Skip: WebP → WebP

**السلوك:** SKIP دائماً. **السبب:** إعادة encode للـ WebP lossy تدهور الجودة بدون فائدة. **الرسالة:** "already optimal".

---

### الأخطاء الشائعة

| الخطأ | السبب | الحل |
|-------|-------|-----|
| You must pass -i/--input and -o/--output | لم يُحدد مجلد الإدخال أو الإخراج | استخدم `pixify-free -i ./images -o ./output` |
| libvips initialization failed | libvips غير مثبت أو DLL مفقود | Linux: apt install libvips-dev؛ macOS: brew install vips؛ Windows: [دليل التثبيت](https://github.com/Mahammed-Gaber/pixify/blob/main/docs/install-libvips.md) |
| unsupported input format | الملف بامتداد .jpg/.png لكنه صيغة أخرى (AVIF, HEIC...) | Free يدعم JPEG, PNG, WebP فقط. استخدم Pixify Pro للصيغ الأخرى. |

---

### ملاحظات مهمة

1. **الجودة ثابتة:** لا يمكن تغيير جودة WebP (80)
2. **العمال:** يُضبط تلقائياً (NumCPU/2)، لا يوجد خيار -w في Free؛ Pro يستخدم كل الأنوية
3. **WebP يتخطى تلقائياً:** Smart Mode يتخطى WebP بدون معالجة
4. **SkipExisting:** يتخطى الملفات الموجودة في مجلد الإخراج
5. **Progress Bar:** يعرض التقدم والـ ETA في الوقت الفعلي
6. **الحدود:** Free له حصص يومية/شهرية؛ التشغيل الأول قد يحتاج إنترنت للتفعيل

---

### الإحصائيات النهائية والمتطلبات

بعد انتهاء المعالجة يعرض البرنامج: Total images, Total before/after, Saved.

**المتطلبات (لتشغيل Pixify Free):** تثبيت **libvips** على النظام (Linux: apt install libvips-dev؛ macOS: brew install vips؛ Windows: راجع [دليل التثبيت](https://github.com/Mahammed-Gaber/pixify/blob/main/docs/install-libvips.md)). التطبيق نفسه: من [Releases](https://github.com/Mahammed-Gaber/pixify/releases) أو Homebrew.  

**© 2025 Mohammed Gaber • Proprietary • Freeware Edition — مجاني للاستخدام الشخصي والتجاري**

</div>
