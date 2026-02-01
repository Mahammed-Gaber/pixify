# دليل استخدام Pixify Free

## نظرة عامة

Pixify Free هو النسخة المجانية من أداة تحويل الصور. يدعم تحويل **JPEG و PNG فقط** إلى **WebP** بجودة ثابتة (80).

---

## الأوامر الأساسية

### الاستخدام الأساسي

```bash
pixify-free -i ./images -o ./output
```

أو باستخدام الأسماء الطويلة:

```bash
pixify-free --input ./images --output ./output
```

### عرض الإصدار

```bash
pixify-free -v
# أو
pixify-free --version
```

### عرض المساعدة

```bash
pixify-free -h
# أو
pixify-free --help
```

---

## الإعدادات الثابتة

| الإعداد | القيمة | ملاحظات |
|---------|--------|---------|
| **Output Format** | WebP | ثابت - لا يمكن تغييره |
| **Quality** | 80 | ثابت - لا يمكن تغييره |
| **Workers** | 4 | ثابت - لا يمكن تغييره |
| **Mode** | Smart | ثابت - لا يمكن تغييره |
| **SkipExisting** | true | ثابت - يتخطى الملفات الموجودة |

---

## الصيغ المدعومة

### المدخلة (Input)

- ✅ **JPEG** (`.jpg`, `.jpeg`)
- ✅ **PNG** (`.png`)
- ⏭️ **WebP** (`.webp`) - يتخطى تلقائياً

### المخرجة (Output)

- ✅ **WebP** فقط (`.webp`)

---

## مصفوفة التحويل

| صيغة الإدخال | صيغة الإخراج | النتيجة | السبب |
|--------------|--------------|---------|-------|
| JPEG | WebP | CONVERT | تحويل مدعوم |
| PNG | WebP | CONVERT | تحويل مدعوم |
| WebP | WebP | SKIP | Smart Mode: "already optimal" |

---

## السلوك التفصيلي

### 1. JPEG → WebP

**الأمر:**
```bash
pixify-free -i ./jpg_images -o ./output
```

**النتيجة:** CONVERT
- تحويل JPEG إلى WebP
- جودة: 80
- معالجة متوازية: 4 workers

---

### 2. PNG → WebP

**الأمر:**
```bash
pixify-free -i ./png_images -o ./output
```

**النتيجة:** CONVERT
- تحويل PNG إلى WebP
- جودة: 80
- معالجة متوازية: 4 workers

---

### 3. WebP → WebP

**الأمر:**
```bash
pixify-free -i ./webp_images -o ./output
```

**النتيجة:** SKIP
- Smart Mode يتخطى WebP تلقائياً
- السبب: "already optimal"
- لا يتم فتح الصورة (يوفر الموارد)

---

### 4. ملفات مختلطة

**الأمر:**
```bash
pixify-free -i ./mixed_images -o ./output
```

**النتيجة:**
- JPEG → WebP: CONVERT
- PNG → WebP: CONVERT
- WebP → WebP: SKIP

---

## أمثلة عملية

### مثال 1: تحويل مجلد كامل

```bash
pixify-free -i ./photos -o ./webp_output
```

### مثال 2: مسارات Windows

```bash
pixify-free -i "C:\Users\Photos" -o "C:\Users\WebP"
```

### مثال 3: مسارات Linux/macOS

```bash
pixify-free -i /home/user/photos -o /home/user/webp
```

---

## Smart Skip Rules

### القاعدة: WebP → WebP

**السلوك:** SKIP دائماً

**السبب:** إعادة encode للـ lossy codecs (WebP) تدهور الجودة بدون فائدة

**الرسالة:** "already optimal"

---

## الأخطاء الشائعة

### خطأ: "You must pass -i/--input and -o/--output"

**السبب:** لم يتم تحديد مجلد الإدخال أو الإخراج

**الحل:**
```bash
pixify-free -i ./images -o ./output
```

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

### خطأ: "unsupported input format"

**السبب:** الملف بامتداد `.jpg` أو `.png` لكنه فعلياً صيغة أخرى (AVIF, HEIC, إلخ)

**الحل:** Free يدعم فقط JPEG, PNG, WebP. استخدم Pixify Pro للصيغ الأخرى.

---

## ملاحظات مهمة

1. **الجودة ثابتة:** لا يمكن تغيير جودة WebP (80)
2. **عدد العمال ثابت:** لا يمكن تغيير عدد العمال (4)
3. **WebP يتخطى تلقائياً:** Smart Mode يتخطى WebP بدون معالجة
4. **SkipExisting:** يتخطى الملفات الموجودة في output directory
5. **Progress Bar:** يعرض التقدم في الوقت الفعلي مع ETA

---

## الإحصائيات النهائية

بعد انتهاء المعالجة، يعرض البرنامج:

```
Done 420 images in 1m21.745896388s

=== Pixify Free Report ===
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

---

## الترخيص

© 2025 Mohammed Gaber • Proprietary • Freeware Edition

Pixify Free — Free for personal and commercial use

---

تم إنشاء هذا الدليل بناءً على الكود الحالي في `pixify-core` و `Pixify-Free`.

