<div id="arabic" dir="rtl">

**[English Version](#english) | [النسخة العربية](#arabic)**

# سجل التغييرات

## الإصدار الأول — v1.0.0 (إطلاق Free و Pro معاً)

الإصدار الأول من Pixify يشمل **Pixify Free** و **Pixify Pro** معاً.

---

### Pixify Free (v1.0.0)

#### المميزات

- تحويل JPG/PNG إلى WebP
- جودة ثابتة 80
- Progress bar في الوقت الفعلي
- تقرير إحصائيات شامل
- معالجة متوازية (عمال تلقائي)
- دعم Windows، Linux، macOS
- يعمل بالكامل Offline

#### التحسينات

- تحسين الأداء واستخدام الذاكرة
- رسائل خطأ واضحة
- دليل مساعدة شامل

---

### Pixify Pro (v1.0.0)

#### المميزات

- **صيغ الإدخال/الإخراج:** WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP + Auto
- **جودة قابلة للتعديل** (0–100)
- **أوضاع المعالجة:** Smart (افتراضي), Force, Optimize
- **مسح تكراري** (`-r`, `--recursive`) — معالجة المجلدات الفرعية
- **الحفاظ على هيكل المجلدات** (`--keep-structure`) في الإخراج
- **حفظ بجانب الأصل** (`--inplace`) مع وضع Optimize
- **مدخلات متعددة** (`-i` قابل للتكرار) — مثال: `-i assets -i public -o dist`
- **كشف التعارض** — رفض التشغيل عند تعارض أسماء الملفات مع اقتراح الحل
- **حماية Symlinks** — تخطي الملفات خارج شجرة الإدخال مع تحذير
- **تفعيل ترخيص** — رسائل واضحة (حد الأجهزة، انتهاء الصلاحية، إلخ)
- **رموز API لـ CI/CD و Docker** — تُخزَّن بشكل آمن (هاش)، الرمز الكامل يُعرض مرة واحدة فقط عند الإنشاء؛ لوحة التحكم تعرض الرموز مُقنَّعة (مثل pix_****abcd)، مع اسم مستعار وانتهاء اختياري وإلغاء من لوحة التحكم
- **عمال تلقائي** — استخدام كامل لقوة المعالج (NumCPU)

#### التفاصيل

- مفتاح الترخيص يُعرض بشكل جزئي في الواجهة؛ أخطاء التفعيل (مثل 403) تعرض رسالة الخادم
- رموز API: تخزين آمن (هاش)، عرض الرمز الكامل مرة واحدة فقط، لوحة التحكم تعرض الشكل المُقنَّع، إلغاء الرمز بالمعرف أو الترخيص

---

## التحديثات المستقبلية

### المخطط

- تحسينات الأداء
- دعم صيغ إضافية
- واجهة رسومية (اختياري)
- معالجة متقدمة للصور

---

[العودة إلى الصفحة الرئيسية](../README.md)

---

</div>

---

<div id="english" dir="ltr">

**[English Version](#english) | [النسخة العربية](#arabic)**

# Changelog

## First Release — v1.0.0 (Free & Pro Together)

The first release of Pixify includes both **Pixify Free** and **Pixify Pro**.

---

### Pixify Free (v1.0.0)

#### Features

- Convert JPG/PNG to WebP
- Fixed quality 80
- Real-time progress bar
- Comprehensive statistics report
- Parallel processing (auto workers)
- Support for Windows, Linux, macOS
- Fully offline operation

#### Improvements

- Performance and memory optimization
- Clear error messages
- Comprehensive help guide

---

### Pixify Pro (v1.0.0)

#### Features

- **Input/Output formats:** WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP + Auto
- **Adjustable quality** (0–100)
- **Processing modes:** Smart (default), Force, Optimize
- **Recursive scan** (`-r`, `--recursive`) — process subdirectories
- **Keep folder structure** (`--keep-structure`) in output
- **Save next to original** (`--inplace`) with Optimize mode
- **Multiple inputs** (`-i` repeatable) — e.g. `-i assets -i public -o dist`
- **Collision detection** — reject when output filenames would clash, with clear guidance
- **Symlink protection** — skip files outside input tree with warning
- **License activation** — clear messages (machine limit, expired, etc.)
- **API tokens for CI/CD & Docker** — stored securely (hashed); full token shown only once at creation; dashboard shows masked form (e.g. pix_****abcd), with alias, optional expiry, and revocation from dashboard
- **Auto workers** — full CPU usage (NumCPU)

#### Details

- License key is partially masked in the UI; activation errors (e.g. 403) show the server message
- API tokens: secure (hashed) storage, full token shown once at creation, dashboard shows masked form, revocation by token ID or license

---

## Future Updates

### Planned

- Performance improvements
- Additional format support
- Graphical interface (optional)
- Advanced image processing

---

[Back to Home](../README.md)

</div>
