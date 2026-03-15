<div id="arabic" dir="rtl">

**[English Version](#english) | [النسخة العربية](#arabic)**

# Pixify Pro - التوثيق الكامل

## نظرة عامة

Pixify Pro هو النسخة الاحترافية من Pixify — متاح في **الإصدار الأول** مع Free. جميع المميزات المتقدمة للمطورين والمشاريع الكبيرة.

**الدليل التفصيلي للأوامر والأمثلة:** [دليل استخدام Pro](./pro/usage-guide.md)

---

## المميزات الإضافية (الإصدار الأول)

### صيغ إضافية

- **إدخال/إخراج:** WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP
- اختيار تلقائي للصيغة (Auto)
- جودة قابلة للتعديل (0–100)

### معالجة المجلدات والملفات

- **مسح تكراري** (`-r`, `--recursive`) — معالجة المجلدات الفرعية
- **الحفاظ على هيكل المجلدات** (`--keep-structure`) في الإخراج
- **حفظ بجانب الأصل** (`--inplace`) مع وضع Optimize
- **مدخلات متعددة** (`-i` قابل للتكرار) — مثال: `-i assets -i public -o dist`
- **كشف التعارض** — رفض عند تعارض أسماء الملفات مع اقتراح الحل

### الترخيص والاستخدام الاحترافي

- **تفعيل ترخيص** (جهاز عادي) مع رسائل واضحة (حد الأجهزة، انتهاء الصلاحية، إلخ)
- **رمز (Token) لـ WSL و VM و Docker و CI و Cloud** — من `PIXIFY_TOKEN` أو (WSL/VM) من `~/.pixify/config.json` عبر `pixify-pro auth --token YOUR_TOKEN`
- **عمال تلقائي** — استخدام كامل لقوة المعالج (NumCPU)

---

## التثبيت

### المتطلبات

- **libvips** — يجب تثبيته أولاً
- راجع [دليل تثبيت libvips](./install-libvips.md)

### تحميل

- **Pro:** [getpixify.com](https://getpixify.com) | [الأسعار](https://getpixify.com/pricing)
- **Free:** [Releases](https://github.com/Mahammed-Gaber/pixify/releases)

---

## الاستخدام

### الصيغة الأساسية

```bash
pixify-pro -i <input_dir> -o <output_dir> [options]
```

### أمثلة سريعة

```bash
# تحويل إلى WebP (افتراضي)
pixify-pro -i ./photos -o ./webp

# تحويل إلى AVIF مع مسح تكراري
pixify-pro -i ./photos -o ./avif -f avif -r

# مدخلات متعددة + الحفاظ على الهيكل
pixify-pro -i ./assets -i ./public -o ./dist --keep-structure

# تفعيل الترخيص (جهاز عادي)
pixify-pro --activate --license-key PIXIFY-PRO-XXXX-XXXX-XXXX

# حفظ الرمز لـ WSL/VM (بدون كاش ترخيص)
pixify-pro auth --token YOUR_PRO_TOKEN
```

**للقائمة الكاملة:** [دليل استخدام Pro](./pro/usage-guide.md) | **WSL/VM/Docker/CI:** [الرموز والبيئات](./pro/tokens-and-environments.md)

---

## الأوامر (ملخص)

| Flag | الوصف | مطلوب |
|------|-------|-------|
| `-i`, `--input` | مجلد الصور (قابل للتكرار لمدخلات متعددة) | نعم* |
| `-o`, `--output` | مجلد الإخراج (اختياري مع `--inplace`) | نعم* |
| `-f`, `--format` | الصيغة (webp, jpeg, png, avif, heic, heif, tiff, gif, bmp, auto) | لا |
| `-r`, `--recursive` | مسح تكراري للمجلدات الفرعية | لا |
| `--keep-structure` | الحفاظ على هيكل المجلدات في الإخراج | لا (افتراضي: true) |
| `--inplace` | حفظ بجانب الأصل (فقط مع Optimize) | لا |
| `--activate` | تفعيل الترخيص (مع `--license-key`) | لا |
| `auth --token <token>` | حفظ الرمز في الإعدادات (WSL/VM)； انظر [الرموز والبيئات](pro/tokens-and-environments.md) | لا |
| `-h`, `--help` | عرض رسالة المساعدة | لا |

---

## الصيغ المدعومة

### المدخلة
- JPEG, PNG, WebP, AVIF, HEIC, HEIF, TIFF, GIF, BMP

### المخرجة
- WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP, Auto

---

## الأداء

- **السرعة:** أسرع من Free مع إعدادات محسّنة
- **التوفير:** حتى 90% في الحجم
- **المرونة:** تحكم كامل في الإعدادات

---

## الدعم

- دعم فني مخصص
- تحديثات منتظمة
- ميزات جديدة أولوية

---

[العودة إلى الصفحة الرئيسية](../README.md)

---

</div>

---

<div id="english" dir="ltr">

**[English Version](#english) | [النسخة العربية](#arabic)**

# Pixify Pro - Complete Documentation

## Overview

Pixify Pro is the professional version of Pixify — available in the **first release** alongside Free. All advanced features for developers and large projects.

**Full command and example guide:** [Pro Usage Guide](./pro/usage-guide.md)

---

## Additional Features (First Release)

### Extra Formats

- **Input/Output:** WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP
- Auto format selection
- Adjustable quality (0–100)

### Folder & File Handling

- **Recursive scan** (`-r`, `--recursive`) — process subdirectories
- **Keep folder structure** (`--keep-structure`) in output
- **Save next to original** (`--inplace`) with Optimize mode
- **Multiple inputs** (`-i` repeatable) — e.g. `-i assets -i public -o dist`
- **Collision detection** — reject when output filenames clash, with clear guidance

### Licensing & Pro Use

- **License activation** (native PC) with clear messages (machine limit, expired, etc.)
- **Token for WSL, VM, Docker, CI, Cloud** — from `PIXIFY_TOKEN` or (WSL/VM) from `~/.pixify/config.json` via `pixify-pro auth --token YOUR_TOKEN`
- **Auto workers** — full CPU usage (NumCPU)

---

## Installation

### Requirements

- **libvips** — Must be installed first
- See [libvips Installation Guide](./install-libvips.md)

### Download

- **Pro:** [getpixify.com](https://getpixify.com) | [Pricing](https://getpixify.com/pricing)
- **Free:** [Releases](https://github.com/Mahammed-Gaber/pixify/releases)

---

## Usage

### Basic Syntax

```bash
pixify-pro -i <input_dir> -o <output_dir> [options]
```

### Quick Examples

```bash
# Convert to WebP (default)
pixify-pro -i ./photos -o ./webp

# Convert to AVIF with recursive scan
pixify-pro -i ./photos -o ./avif -f avif -r

# Multiple inputs + keep structure
pixify-pro -i ./assets -i ./public -o ./dist --keep-structure

# Activate license (native PC)
pixify-pro --activate --license-key PIXIFY-PRO-XXXX-XXXX-XXXX

# Save token for WSL/VM (no license cache needed)
pixify-pro auth --token YOUR_PRO_TOKEN
```

**For full command list and examples:** [Pro Usage Guide](./pro/usage-guide.md)

---

## Commands (Summary)

| Flag | Description | Required |
|------|-------------|----------|
| `-i`, `--input` | Input directory (repeatable for multiple inputs) | Yes* |
| `-o`, `--output` | Output directory (optional with `--inplace`) | Yes* |
| `-f`, `--format` | Format (webp, jpeg, png, avif, heic, heif, tiff, gif, bmp, auto) | No |
| `-r`, `--recursive` | Recursive scan of subdirectories | No |
| `--keep-structure` | Keep folder structure in output | No (default: true) |
| `--inplace` | Save next to original (Optimize mode only) | No |
| `--activate` | Activate license (with `--license-key`) | No |
| `auth --token <token>` | Save token to config (WSL/VM); see [Tokens and environments](pro/tokens-and-environments.md) | No |
| `-h`, `--help` | Show help message | No |

---

## Supported Formats

### Input
- JPEG, PNG, WebP, AVIF, HEIC, HEIF, TIFF, GIF, BMP

### Output
- WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP, Auto

---

## Performance

- **Speed:** Faster than Free with optimized settings
- **Reduction:** Up to 90% size reduction
- **Flexibility:** Full control over settings

---

## Support

- Dedicated technical support
- Regular updates
- Priority for new features

---

[Back to Home](../README.md)

</div>
