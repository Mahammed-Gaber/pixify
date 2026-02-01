<div id="arabic" dir="rtl">

**[English Version](#english) | [النسخة العربية](#arabic)**

<div align="center">

![Pixify Cover](assets/pixify-cover.png)

</div>

# Pixify

**Pixify** هو محوّل صور عالي الأداء مبني على libvips، مصمم لمعالجة آلاف الصور بسرعة وبجودة ثابتة، مع دعم كامل للعمل Offline وعلى جميع الأنظمة.

**الإصدار الأول** يشمل **Pixify Free** و **Pixify Pro** معاً — يمكنك التحميل والبدء فوراً.

---

## المميزات

- **Ultra-fast parallel processing** — معالجة متوازية فائقة السرعة
- **Smart WebP compression** — جودة ثابتة Q80
- **Massive size reduction** — تقليل الحجم بشكل كبير
- **Real-time progress bar** — شريط تقدم دقيق
- **Full offline workflow** — بدون أي اتصال بالإنترنت
- **Cross-platform binaries** — لكل الأنظمة
- **Detailed finishing report** — تقرير نهائي شامل

---

## Pixify Free

نسخة مجانية بالكامل مع تحويل غير محدود للصور.

**الإمكانيات:**
- **المدخل:** JPG / PNG (مجلد واحد)
- **المخرج:** WebP (Q80)
- **تخطي تلقائي** للملفات الموجودة
- **تقرير نهائي شامل**
- **يعمل بالكامل Offline**
- معالجة متوازية محسّنة (عدد عمال تلقائي)

---

## Pixify Pro

نسخة احترافية متاحة الآن مع صيغ إضافية وتحكم كامل.

**الإمكانيات:**
- **صيغ الإدخال/الإخراج:** WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP
- **جودة قابلة للتعديل** (0–100)
- **وضع المعالجة:** Smart (افتراضي), Force, Optimize
- **مسح تكراري** (`-r`, `--recursive`) — معالجة المجلدات الفرعية
- **الحفاظ على هيكل المجلدات** (`--keep-structure`) في الإخراج
- **حفظ بجانب الأصل** (`--inplace`) مع وضع Optimize
- **مدخلات متعددة** (`-i` قابل للتكرار) — مثال: `-i assets -i public -o dist`
- **كشف التعارض** — رفض التشغيل عند تعارض أسماء الملفات في الإخراج مع اقتراح الحل
- **تفعيل ترخيص** مع رسائل واضحة (حد الأجهزة، انتهاء الصلاحية، إلخ)
- **رموز API لـ CI/CD و Docker** — تُخزَّن بشكل آمن (هاش)، ويُعرض الرمز الكامل مرة واحدة فقط عند الإنشاء؛ في لوحة التحكم يظهر الرمز مُقنَّعاً (مثل pix_****abcd)
- **عمال تلقائي** — استخدام كامل لقوة المعالج (NumCPU)

**للحصول على Pro:** [getpixify.com](https://getpixify.com) | [الأسعار](https://getpixify.com/pricing)

### مقارنة سريعة: Free و Pro

| الميزة | Free | Pro |
|--------|------|-----|
| صيغ الإدخال | JPG, PNG | WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP |
| صيغ الإخراج | WebP فقط | جميع الصيغ أعلاه + Auto |
| الجودة | ثابتة (80) | قابلة للتعديل (0–100) |
| مسح تكراري (`-r`) | ❌ | ✅ |
| الحفاظ على هيكل المجلدات | ❌ | ✅ (`--keep-structure`) |
| حفظ بجانب الأصل (`--inplace`) | ❌ | ✅ (مع Optimize) |
| مدخلات متعددة (`-i` متكرر) | ❌ | ✅ |
| كشف التعارض عند الإخراج | ❌ | ✅ |
| وضع المعالجة (Smart / Force / Optimize) | Smart فقط | ✅ |
| تفعيل ترخيص + توكن CI/CD | ❌ | ✅ |
| العمال | تلقائي (نصف الأنوية) | تلقائي (كل الأنوية) |

---

## التحميل

**تحميل Pixify Free:**

[https://github.com/Mahammed-Gaber/pixify/releases](https://github.com/Mahammed-Gaber/pixify/releases)

**Latest Release (v1.0.0):**

| Platform | Download |
|----------|----------|
| **Windows** | [Pixify-Free-Windows-v1.0.0.zip](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/Pixify-Free-Windows-v1.0.0.zip) |
| **Linux** | [Pixify-Free-Linux-v1.0.0.zip](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/Pixify-Free-Linux-v1.0.0.zip) |
| **macOS** | [Pixify-Free-macOS-v1.0.0.zip](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/Pixify-Free-macOS-v1.0.0.zip) |

---

## البدء السريع

### 1. تثبيت libvips

```bash
# Linux
sudo apt install libvips-dev

# macOS
brew install vips

# Windows
# راجع دليل التثبيت الكامل أدناه
```

[دليل التثبيت الكامل](./docs/install-libvips.md) - يتضمن روابط تحميل مباشرة

### 2. استخدام Pixify

```bash
# تحويل صور (Free)
pixify-free -i ./photos -o ./webp

# Pro: مسح تكراري + الحفاظ على الهيكل
pixify-pro -i ./photos -o ./output -r --keep-structure

# Pro: مدخلات متعددة
pixify-pro -i ./assets -i ./public -o ./dist -f webp

# عرض المساعدة
pixify-free --help
pixify-pro --help
```

---

## Showcase

مثال على التقرير النهائي:

```
Done 500 images in 1m15.234s

=== Pixify Free Report ===
Total images: 500
Total before: 120.5 MB
Total after:  18.3 MB
Saved:        102.2 MB (84.8%)
```

[المزيد من الأمثلة والنتائج](./docs/showcase.md)

---

## Tech Behind Pixify

- **Go 1.24** - لغة البرمجة
- **libvips 8.17** - محرك معالجة الصور عالي الأداء
- **Parallel processing** - معالجة متوازية متقدمة
- **Memory-optimized queue** - إدارة ذاكرة محسّنة
- **Streaming encoder** - ترميز تدفقي

[تفاصيل تقنية أكثر](./docs/performance.md)

---

## Why Pixify?

- **Offline بالكامل** — جميع العمليات محلية، خصوصية وأمان كامل
- **سرعة فائقة** — معالجة متوازية متقدمة
- **جودة عالية** — تقليل الحجم بشكل كبير مع الحفاظ على الجودة
- **سهولة الاستخدام** — واجهة سطر أوامر بسيطة، يعمل مباشرة بعد التثبيت

---

## Documentation

- [دليل تثبيت libvips](./docs/install-libvips.md) - تعليمات مفصلة لكل نظام
- [مميزات Pixify](./docs/features.md) - جميع المميزات بالتفصيل (Free و Pro)
- [الأداء والسرعة](./docs/performance.md) - مقاييس الأداء والنتائج
- [Showcase وأمثلة](./docs/showcase.md) - أمثلة حقيقية ونتائج
- [Pixify Free](./docs/free.md) - توثيق النسخة المجانية
- [Pixify Pro - دليل الاستخدام](./docs/pro/usage-guide.md) - أوامر Pro والمودات والتفعيل والتوكن
- [سجل التغييرات](./docs/changelog.md) - تاريخ الإصدارات

---

## Support

- **Issues:** [GitHub Issues](https://github.com/Mahammed-Gaber/pixify/issues)
- **Documentation:** [docs/](./docs/)
- **Installation Help:** [دليل التثبيت](./docs/install-libvips.md)

---

## Links

- [libvips Documentation](https://www.libvips.org/)
- [Pixify Free Releases](https://github.com/Mahammed-Gaber/pixify/releases)
- [دليل التحميل](#arabic)

---

</div>

---

<div id="english" dir="ltr">

**[English Version](#english) | [النسخة العربية](#arabic)**

<div align="center">

![Pixify Cover](assets/pixify-cover.png)

</div>

# Pixify

**Pixify** is a high-performance image converter built on libvips, designed to process thousands of images quickly with consistent quality, with full support for offline operation on all platforms.

**First release** includes both **Pixify Free** and **Pixify Pro** — download and get started right away.

---

## Features

- **Ultra-fast parallel processing** — Super-fast parallel processing
- **Smart WebP compression** — Fixed quality Q80
- **Massive size reduction** — Significant size reduction
- **Real-time progress bar** — Accurate progress bar
- **Full offline workflow** — No internet connection required
- **Cross-platform binaries** — For all platforms
- **Detailed finishing report** — Comprehensive final report

---

## Pixify Free

Fully free version with unlimited image conversions.

**Capabilities:**
- **Input:** JPG / PNG (single directory)
- **Output:** WebP (Q80)
- **Auto-skip** existing files
- **Detailed finishing report**
- **Fully offline operation**
- Optimized parallel processing (auto workers)

---

## Pixify Pro

Professional version available now with extra formats and full control.

**Capabilities:**
- **Input/Output formats:** WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP
- **Adjustable quality** (0–100)
- **Processing modes:** Smart (default), Force, Optimize
- **Recursive scan** (`-r`, `--recursive`) — process subdirectories
- **Keep folder structure** (`--keep-structure`) in output
- **Save next to original** (`--inplace`) with Optimize mode
- **Multiple inputs** (`-i` repeatable) — e.g. `-i assets -i public -o dist`
- **Collision detection** — reject when output filenames would clash, with clear guidance
- **License activation** with clear messages (machine limit, expired, etc.)
- **API tokens for CI/CD & Docker** — stored securely (hashed); the full token is shown only once at creation; the dashboard displays a masked form (e.g. pix_****abcd)
- **Auto workers** — full CPU usage (NumCPU)

**Get Pro:** [getpixify.com](https://getpixify.com) | [Pricing](https://getpixify.com/pricing)

### Quick comparison: Free vs Pro

| Feature | Free | Pro |
|--------|------|-----|
| Input formats | JPG, PNG | WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP |
| Output formats | WebP only | All above + Auto |
| Quality | Fixed (80) | Adjustable (0–100) |
| Recursive scan (`-r`) | ❌ | ✅ |
| Keep folder structure | ❌ | ✅ (`--keep-structure`) |
| Save next to original (`--inplace`) | ❌ | ✅ (with Optimize) |
| Multiple inputs (`-i` repeatable) | ❌ | ✅ |
| Output collision detection | ❌ | ✅ |
| Processing modes (Smart / Force / Optimize) | Smart only | ✅ |
| License activation + CI/CD token | ❌ | ✅ |
| Workers | Auto (half cores) | Auto (all cores) |

---

## Downloads

**Download Pixify Free:**

[https://github.com/Mahammed-Gaber/pixify/releases](https://github.com/Mahammed-Gaber/pixify/releases)

**Latest Release (v1.0.0):**

| Platform | Download |
|----------|----------|
| **Windows** | [Pixify-Free-Windows-v1.0.0.zip](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/Pixify-Free-Windows-v1.0.0.zip) |
| **Linux** | [Pixify-Free-Linux-v1.0.0.zip](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/Pixify-Free-Linux-v1.0.0.zip) |
| **macOS** | [Pixify-Free-macOS-v1.0.0.zip](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/Pixify-Free-macOS-v1.0.0.zip) |

---

## Quick Start

### 1. Install libvips

```bash
# Linux
sudo apt install libvips-dev

# macOS
brew install vips

# Windows
# See full installation guide below
```

[Full Installation Guide](./docs/install-libvips.md) - Includes direct download links

### 2. Use Pixify

```bash
# Convert images (Free)
pixify-free -i ./photos -o ./webp

# Pro: recursive + keep structure
pixify-pro -i ./photos -o ./output -r --keep-structure

# Pro: multiple inputs
pixify-pro -i ./assets -i ./public -o ./dist -f webp

# Show help
pixify-free --help
pixify-pro --help
```

---

## Showcase

Example of final report:

```
Done 500 images in 1m15.234s

=== Pixify Free Report ===
Total images: 500
Total before: 120.5 MB
Total after:  18.3 MB
Saved:        102.2 MB (84.8%)
```

[More Examples & Results](./docs/showcase.md)

---

## Tech Behind Pixify

- **Go 1.24** - Programming language
- **libvips 8.17** - High-performance image processing engine
- **Parallel processing** - Advanced parallel processing
- **Memory-optimized queue** - Optimized memory management
- **Streaming encoder** - Streaming encoding

[More Technical Details](./docs/performance.md)

---

## Why Pixify?

- **Fully offline** — All operations are local, complete privacy and security
- **Ultra-fast** — Advanced parallel processing
- **High quality** — Significant size reduction while maintaining quality
- **Easy to use** — Simple command-line interface, works immediately after installation

---

## Documentation

- [libvips Installation Guide](./docs/install-libvips.md) - Detailed instructions for each platform
- [Pixify Features](./docs/features.md) - All features (Free & Pro)
- [Performance & Speed](./docs/performance.md) - Performance metrics and results
- [Showcase & Examples](./docs/showcase.md) - Real examples and results
- [Pixify Free](./docs/free.md) - Free edition documentation
- [Pixify Pro Usage Guide](./docs/pro/usage-guide.md) - Pro commands, modes, activation, token
- [Changelog](./docs/changelog.md) - Release history

---

## Support

- **Issues:** [GitHub Issues](https://github.com/Mahammed-Gaber/pixify/issues)
- **Documentation:** [docs/](./docs/)
- **Installation Help:** [Installation Guide](./docs/install-libvips.md)

---

## Links

- [libvips Documentation](https://www.libvips.org/)
- [Pixify Free Releases](https://github.com/Mahammed-Gaber/pixify/releases)
- [Download Guide](#english)

---

**Pixify** — Optimized Image Converter | Powered by Pixify Engine

</div>
