<div id="arabic" dir="rtl">

**[English Version](#english) | [النسخة العربية](#arabic)**

# Showcase - أمثلة ونتائج

## Progress Bar

### أثناء المعالجة

```
[████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░] [250/500] 50.0% ETA: 25s
```

### قرب الانتهاء

```
[████████████████████████████████████████████████] [500/500] 100.0% ETA: 0s
```

---

## التقارير النهائية

### مثال 1: 500 صورة

```
Done 500 images in 1m15.234s

=== Pixify Free Report ===
Total images: 500
Total before: 120.5 MB
Total after:  18.3 MB
Saved:        102.2 MB (84.8%)

Pixify Free — Optimized WebP Converter
Powered by Pixify Engine
```

### مثال 2: 1000 صورة

```
Done 1000 images in 2m42.567s

=== Pixify Free Report ===
Total images: 1000
Total before: 245.8 MB
Total after:  38.2 MB
Saved:        207.6 MB (84.5%)

Pixify Free — Optimized WebP Converter
Powered by Pixify Engine
```

---

## مقارنة الحجم

### JPG → WebP

| الحجم الأصلي | الحجم بعد التحويل | التوفير |
|--------------|-------------------|---------|
| 2.5 MB       | 0.4 MB            | كبير    |
| 5.0 MB       | 0.8 MB            | كبير    |
| 10.0 MB      | 1.6 MB            | كبير    |

### PNG → WebP

| الحجم الأصلي | الحجم بعد التحويل | التوفير |
|--------------|-------------------|---------|
| 3.2 MB       | 0.5 MB            | كبير    |
| 5.2 MB       | 0.8 MB            | كبير    |
| 8.5 MB       | 1.2 MB            | كبير    |

---

## الأداء

### سرعة المعالجة

| عدد الصور | الوقت المستغرق | السرعة |
|-----------|----------------|--------|
| 10        | ~4 ثواني       | 2.5 صورة/ثانية |
| 100       | ~40 ثانية      | 2.5 صورة/ثانية |
| 500       | ~3 دقائق       | 2.6 صورة/ثانية |
| 1000      | ~6 دقائق       | 2.5 صورة/ثانية |

### استخدام الموارد

- **الذاكرة:** 200-500MB (متوسط)
- **المعالج:** 50-80% على 4 أنوية
- **القرص:** I/O محسّن

---

## أمثلة الاستخدام

### مثال بسيط

```bash
pixify-free -i ./photos -o ./webp
```

**النتيجة:**
- 50 صورة تم تحويلها
- من 25 MB إلى 4 MB
- توفير كبير في الحجم

### مثال مع مسارات مطلقة

```bash
pixify-free --input /home/user/images --output /home/user/optimized
```

**النتيجة:**
- 200 صورة تم تحويلها
- من 150 MB إلى 24 MB
- توفير كبير في الحجم

### مثال على Windows

```powershell
pixify-free -i C:\Photos -o C:\WebP
```

**النتيجة:**
- 100 صورة تم تحويلها
- من 80 MB إلى 12.8 MB
- توفير كبير في الحجم

---

## النتائج الحقيقية

### مشروع موقع ويب

**قبل:**
- 500 صورة JPG
- الحجم الإجمالي: 120 MB
- وقت التحميل: ~45 ثانية

**بعد:**
- 500 صورة WebP
- الحجم الإجمالي: 18 MB
- وقت التحميل: ~7 ثواني

**التحسين:** تقليل كبير في الحجم، تحسين ملحوظ في سرعة التحميل

### مشروع تطبيق موبايل

**قبل:**
- 200 صورة PNG
- الحجم الإجمالي: 80 MB
- حجم التطبيق: كبير

**بعد:**
- 200 صورة WebP
- الحجم الإجمالي: 12 MB
- حجم التطبيق: محسّن

**التحسين:** تقليل كبير في الحجم

---

## الصور التوضيحية

### Progress Bar

```
[████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░] [250/500] 50.0% ETA: 25s
```

الألوان:
- أخضر للجزء المكتمل
- رمادي للجزء غير المكتمل
- سماوي للنص
- أصفر للنسبة المئوية

### التقرير النهائي مع ألوان

```
=== Pixify Free Report ===
Total images: 500
Total before: 120.5 MB
Total after:  18.3 MB
Saved:        102.2 MB (84.8%)
```

---

## فيديو توضيحي

[رابط فيديو YouTube يوضح استخدام Pixify وتحويل الصور]

---

[العودة إلى الصفحة الرئيسية](../README.md)

---

</div>

---

<div id="english" dir="ltr">

**[English Version](#english) | [النسخة العربية](#arabic)**

# Showcase - Examples and Results

## Progress Bar

### During Processing

```
[████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░] [250/500] 50.0% ETA: 25s
```

### Near Completion

```
[████████████████████████████████████████████████] [500/500] 100.0% ETA: 0s
```

---

## Final Reports

### Example 1: 500 Images

```
Done 500 images in 1m15.234s

=== Pixify Free Report ===
Total images: 500
Total before: 120.5 MB
Total after:  18.3 MB
Saved:        102.2 MB (84.8%)

Pixify Free — Optimized WebP Converter
Powered by Pixify Engine
```

### Example 2: 1000 Images

```
Done 1000 images in 2m42.567s

=== Pixify Free Report ===
Total images: 1000
Total before: 245.8 MB
Total after:  38.2 MB
Saved:        207.6 MB (84.5%)

Pixify Free — Optimized WebP Converter
Powered by Pixify Engine
```

---

## Size Comparison

### JPG → WebP

| Original Size | Size After Conversion | Reduction |
|--------------|----------------------|-----------|
| 2.5 MB       | 0.4 MB               | Significant |
| 5.0 MB       | 0.8 MB               | Significant |
| 10.0 MB      | 1.6 MB               | Significant |

### PNG → WebP

| Original Size | Size After Conversion | Reduction |
|--------------|----------------------|-----------|
| 3.2 MB       | 0.5 MB               | Significant |
| 5.2 MB       | 0.8 MB               | Significant |
| 8.5 MB       | 1.2 MB               | Significant |

---

## Performance

### Processing Speed

| Number of Images | Time Taken | Speed |
|------------------|------------|-------|
| 10               | ~4 seconds | 2.5 images/second |
| 100              | ~40 seconds | 2.5 images/second |
| 500              | ~3 minutes | 2.6 images/second |
| 1000             | ~6 minutes | 2.5 images/second |

### Resource Usage

- **Memory:** 200-500MB (average)
- **Processor:** 50-80% on 4 cores
- **Disk:** Optimized I/O

---

## Usage Examples

### Simple Example

```bash
pixify-free -i ./photos -o ./webp
```

**Result:**
- 50 images converted
- From 25 MB to 4 MB
- Significant size reduction

### Example with Absolute Paths

```bash
pixify-free --input /home/user/images --output /home/user/optimized
```

**Result:**
- 200 images converted
- From 150 MB to 24 MB
- Significant size reduction

### Windows Example

```powershell
pixify-free -i C:\Photos -o C:\WebP
```

**Result:**
- 100 images converted
- From 80 MB to 12.8 MB
- Significant size reduction

---

## Real Results

### Website Project

**Before:**
- 500 JPG images
- Total size: 120 MB
- Load time: ~45 seconds

**After:**
- 500 WebP images
- Total size: 18 MB
- Load time: ~7 seconds

**Improvement:** Significant size reduction, noticeable improvement in load speed

### Mobile App Project

**Before:**
- 200 PNG images
- Total size: 80 MB
- App size: Large

**After:**
- 200 WebP images
- Total size: 12 MB
- App size: Optimized

**Improvement:** Significant size reduction

---

## Visual Examples

### Progress Bar

```
[████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░] [250/500] 50.0% ETA: 25s
```

Colors:
- Green for completed portion
- Gray for incomplete portion
- Cyan for text
- Yellow for percentage

### Final Report with Colors

```
=== Pixify Free Report ===
Total images: 500
Total before: 120.5 MB
Total after:  18.3 MB
Saved:        102.2 MB (84.8%)
```

---

## Video Tutorial

[YouTube video link demonstrating Pixify usage and image conversion]

---

[Back to Home](../README.md)

</div>
