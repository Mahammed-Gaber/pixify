<div id="arabic" dir="rtl">

**[English Version](#english) | [النسخة العربية](#arabic)**

# Pixify Free — التوثيق المختصر

## نظرة عامة

Pixify Free هو النسخة المجانية من Pixify: تحويل **JPG و PNG** إلى **WebP** بجودة ثابتة (80)، مجلد مدخل واحد، بدون إنترنت.

**للأمر المناسب بسرعة:** راجع [مرجع الأوامر](command-reference.md).

---

## التثبيت

### المتطلبات

- **libvips** - يجب تثبيته أولاً
- راجع [دليل تثبيت libvips](./install-libvips.md)

### تحميل

قم بتحميل أحدث إصدار من [Releases](https://github.com/Mahammed-Gaber/pixify/releases).

---

## الاستخدام

### الصيغة الأساسية

```bash
pixify-free -i <input_dir> -o <output_dir>
```

### الأمثلة

```bash
# مثال بسيط
pixify-free -i ./photos -o ./webp

# استخدام مسارات مطلقة
pixify-free --input /home/user/images --output /home/user/optimized
```

---

## الأوامر

| Flag | الوصف | مطلوب |
|------|-------|-------|
| `-i`, `--input` | مجلد الصور المدخلة | نعم |
| `-o`, `--output` | مجلد حفظ الصور المحولة | نعم |
| `-h`, `--help` | عرض رسالة المساعدة | لا |

---

## المميزات

- تحويل JPG/PNG إلى WebP
- جودة ثابتة 80
- معالجة متوازية محسّنة (عدد عمال تلقائي)
- Progress bar في الوقت الفعلي
- تقرير إحصائيات شامل
- **المدخل:** مجلد واحد فقط (`-i` مرة واحدة)
- **لا مسح تكراري** — يقتصر على الملفات داخل المجلد المحدد مباشرة

---

## الصيغ المدعومة

### المدخلة
- JPG / JPEG
- PNG

### المخرجة
- WebP (جودة 80)

---

## الأداء

- **السرعة:** معالجة سريعة للصور
- **التوفير:** تقليل كبير في الحجم
- **الذاكرة:** إدارة ذكية تلقائية

---

## استكشاف الأخطاء

راجع [دليل تثبيت libvips](install-libvips.md) للمشاكل الشائعة.

---

**دليل الاستخدام الكامل:** [Pixify Free — دليل الاستخدام](free/usage-guide.md)  
**مرجع الأوامر:** [command-reference.md](command-reference.md)

[العودة إلى الصفحة الرئيسية](../README.md)

---

</div>

---

<div id="english" dir="ltr">

**[English Version](#english) | [النسخة العربية](#arabic)**

# Pixify Free — Short Reference

## Overview

Pixify Free is the free edition: convert **JPG and PNG** to **WebP** at fixed quality (80), single input folder, fully offline.

**For the right command quickly:** see [Command Reference](command-reference.md).

---

## Installation

### Requirements

- **libvips** - Must be installed first
- See [libvips Installation Guide](./install-libvips.md)

### Download

Download the latest version from [Releases](https://github.com/Mahammed-Gaber/pixify/releases).

---

## Usage

### Basic Syntax

```bash
pixify-free -i <input_dir> -o <output_dir>
```

### Examples

```bash
# Simple example
pixify-free -i ./photos -o ./webp

# Using absolute paths
pixify-free --input /home/user/images --output /home/user/optimized
```

---

## Commands

| Flag | Description | Required |
|------|-------------|----------|
| `-i`, `--input` | Input images directory | Yes |
| `-o`, `--output` | Output directory for converted images | Yes |
| `-h`, `--help` | Show help message | No |

---

## Features

- Convert JPG/PNG to WebP
- Fixed quality 80
- Optimized parallel processing (auto workers)
- Real-time progress bar
- Comprehensive statistics report
- **Input:** single directory only (`-i` once)
- **No recursive scan** — only files directly inside the given folder

---

## Supported Formats

### Input
- JPG / JPEG
- PNG

### Output
- WebP (quality 80)

---

## Performance

- **Speed:** Fast image processing
- **Size Reduction:** Significant size reduction
- **Memory:** Automatic smart management

---

## Troubleshooting

See [libvips Installation Guide](install-libvips.md) for common issues.

---

**Full usage guide:** [Pixify Free — Usage guide](free/usage-guide.md)  
**Command reference:** [command-reference.md](command-reference.md)

[Back to Home](../README.md)

</div>
