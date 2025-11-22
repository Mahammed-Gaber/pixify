# Pixify

**Pixify** هو محوّل صور عالي الأداء مبني على libvips، مصمم لمعالجة آلاف الصور بسرعة وبجودة ثابتة، مع دعم كامل للعمل Offline وعلى جميع الأنظمة.

---

## Features

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

**Capabilities:**
- **Input:** JPG / PNG
- **Output:** WebP (Q80)
- **Auto-skip** للملفات الموجودة
- **تقرير نهائي شامل**
- **يعمل بالكامل Offline**

---

## Pro (Coming Soon)

نسخة احترافية قادمة مع ميزات إضافية:

- AVIF, SVG, HEIF support
- Adjustable quality
- Advanced optimizations

**ملاحظة:** النسخة الاحترافية ستكون متاحة قريباً. يمكنك متابعة التحديثات من خلال هذا الـ repository.

---

## Downloads

**تحميل Pixify Free:**

[https://github.com/Mahammed-Gaber/pixify/releases](https://github.com/Mahammed-Gaber/pixify/releases)

**Latest Release (v1.0.0):**

| Platform | Download |
|----------|----------|
| **Windows** | [Pixify-Free-Windows-v1.0.0.zip](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/Pixify-Free-Windows-v1.0.0.zip) |
| **Linux** | [Pixify-Free-Linux-v1.0.0.zip](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/Pixify-Free-Linux-v1.0.0.zip) |
| **macOS** | [Pixify-Free-macOS-v1.0.0.zip](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/Pixify-Free-macOS-v1.0.0.zip) |

---

## Quick Start

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
# تحويل صور
pixify-free -i ./photos -o ./webp

# استخدام الأسماء الكاملة
pixify-free --input /path/to/images --output /path/to/output

# عرض المساعدة
pixify-free --help
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
- [مميزات Pixify](./docs/features.md) - جميع المميزات بالتفصيل
- [الأداء والسرعة](./docs/performance.md) - مقاييس الأداء والنتائج
- [Showcase وأمثلة](./docs/showcase.md) - أمثلة حقيقية ونتائج
- [Pixify Free Documentation](./docs/free.md) - توثيق النسخة المجانية
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
- [دليل التحميل](#downloads)

---

**Pixify** — Optimized Image Converter | Powered by Pixify Engine
