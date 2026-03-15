<div id="arabic" dir="rtl">

**[English Version](#english) | [النسخة العربية](#arabic)**

# مميزات Pixify

**للحصول على الأمر المناسب بسرعة:** راجع [مرجع الأوامر](command-reference.md) — «أريد أن…» → الأمر، وخيارات Free و Pro والتوليفات الصحيحة.

![مقارنة Free و Pro](../assets/screenshots/features-comparison.png)

---

## المميزات الأساسية

### سرعة فائقة

- **معالجة متوازية:** معالجة متعددة الصور في نفس الوقت
- **ذاكرة محسّنة:** استخدام ذكي للذاكرة
- **خوارزميات محسّنة:** استخدام libvips عالية الأداء

### جودة عالية

- **حفظ الجودة:** خوارزميات ذكية تحافظ على جودة الصور
- **تقليل الحجم:** تقليل كبير في حجم الملفات
- **نتائج ممتازة:** جودة بصرية عالية مع حجم صغير

### Offline بالكامل

- **لا حاجة للإنترنت:** جميع العمليات تتم محلياً
- **خصوصية كاملة:** صورك تبقى على جهازك فقط
- **أمان:** لا توجد اتصالات خارجية

### سهولة الاستخدام

- **واجهة بسيطة:** سطر أوامر واضح وسهل
- **لا إعدادات معقدة:** يعمل مباشرة بعد التثبيت
- **توثيق شامل:** دليل كامل لكل شيء

---

## مميزات Pixify Free

### التحويل الأساسي

- تحويل JPG/PNG إلى WebP
- جودة ثابتة 80 (توازن مثالي)
- تخطي تلقائي للملفات الموجودة

### التقدم والمراقبة

- Progress bar في الوقت الفعلي
- تقرير إحصائيات شامل
- معلومات ETA دقيقة

### الأداء

- معالجة متوازية متقدمة
- ذاكرة محسّنة
- معالجة سريعة للصور

---

## مميزات Pixify Pro

### صيغ إضافية

- **إدخال/إخراج:** WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP
- اختيار تلقائي للصيغة (Auto) حسب الإدخال
- جودة قابلة للتعديل (0–100)

### أوضاع المعالجة

- **Smart** (افتراضي) — تخطي ذكي وتحسين عند الحاجة
- **Force** — إجبار التحويل للصيغة المحددة
- **Optimize** — نفس الصيغة مع إعادة ضغط (PNG/JPEG)

### معالجة المجلدات والملفات

- **مسح تكراري** (`-r`, `--recursive`) — معالجة المجلدات الفرعية
- **الحفاظ على هيكل المجلدات** (`--keep-structure`) في الإخراج
- **حفظ بجانب الأصل** (`--inplace`) مع وضع Optimize
- **مدخلات متعددة** (`-i` قابل للتكرار) — مثال: `-i assets -i public -o dist`
- **كشف التعارض** — رفض التشغيل عند تعارض أسماء الملفات في الإخراج مع اقتراح الحل
- **حماية Symlinks** — تخطي الملفات خارج شجرة الإدخال مع تحذير (عند استخدام `--keep-structure`)

### الترخيص والاستخدام الاحترافي

- **تفعيل ترخيص** مع رسائل واضحة (حد الأجهزة، انتهاء الصلاحية، إلغاء الترخيص)
- **رموز API لـ WSL و VM و CI و Docker:** في البيئات العابرة (WSL، VM، Docker، CI، Cloud) يكفي **رمز (Token)** — من متغير `PIXIFY_TOKEN` أو (في WSL/VM) من ملف الإعدادات بعد تنفيذ **`pixify-pro auth --token YOUR_TOKEN`**. الرموز تُنشأ من لوحة التحكم فقط؛ الرمز الكامل يُعرض مرة واحدة. انظر [الرموز والبيئات](pro/tokens-and-environments.md).
- **عمال تلقائي** — استخدام كامل لقوة المعالج (NumCPU)

---

## مقارنة سريعة

| الميزة | Free | Pro |
|--------|------|-----|
| WebP | ✅ | ✅ |
| JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP | ❌ | ✅ |
| جودة قابلة للتخصيص | ❌ | ✅ |
| مسح تكراري (`-r`) | ❌ | ✅ |
| الحفاظ على هيكل المجلدات | ❌ | ✅ |
| حفظ بجانب الأصل (`--inplace`) | ❌ | ✅ |
| مدخلات متعددة (`-i` متكرر) | ❌ | ✅ |
| كشف التعارض عند الإخراج | ❌ | ✅ |
| أوضاع Smart / Force / Optimize | Smart فقط | ✅ |
| تفعيل ترخيص + توكن CI/CD | ❌ | ✅ |

---

## حالات الاستخدام

### للمطورين

- تحسين صور المواقع
- تحضير صور للتطبيقات
- معالجة جماعية للصور

### للمصممين

- تحويل صيغ الصور (WebP, AVIF, HEIC, TIFF, إلخ)
- تحسين حجم الملفات
- معالجة متعددة الصيغ (Pro)

### للمشاريع الكبيرة

- معالجة آلاف الصور
- أتمتة سير العمل
- تحسين الأداء

---

## الأداء

### السرعة

- **صورة واحدة:** أقل من ثانية
- **100 صورة:** أقل من دقيقة
- **1000 صورة:** بضع دقائق

### التوفير في الحجم

- **JPG → WebP:** تقليل كبير في الحجم
- **PNG → WebP:** تقليل كبير في الحجم
- **متوسط التوفير:** توفير ملحوظ

---

## الأمان والخصوصية

### Offline بالكامل

- لا توجد اتصالات خارجية
- جميع البيانات محلية
- لا توجد تتبع أو تحليلات

### برمجيات احتكارية

- Pixify (المجاني والاحترافي) مغلق المصدر — لا يوفّر كود المصدر للجمهور
- الترخيص يحدد شروط الاستخدام؛ راجع [الشروط](https://getpixify.com/terms) و [EULA](https://getpixify.com/eula)
- التحديثات والدعم وفق الخطة والترخيص

---

## الدعم والمراجع

- **مرجع الأوامر:** [command-reference.md](command-reference.md) — مساعد الأوامر لـ Free و Pro
- **التوثيق:** [فهرس التوثيق](README.md)
- **الدعم:** [GitHub Issues](https://github.com/Mahammed-Gaber/pixify/issues) | [getpixify.com](https://getpixify.com)

---

[العودة إلى الصفحة الرئيسية](../README.md)

---

</div>

---

<div id="english" dir="ltr">

**[English Version](#english) | [النسخة العربية](#arabic)**

# Pixify Features

**For the right command quickly:** see [Command Reference](command-reference.md) — “I want to…” → command, Free and Pro options, and valid combinations.

![Free vs Pro feature comparison chart](../assets/screenshots/features-comparison.png)

---

## Core Features

### Ultra-Fast Speed

- **Parallel processing:** Process multiple images simultaneously
- **Optimized memory:** Smart memory usage
- **Optimized algorithms:** Using high-performance libvips

### High Quality

- **Quality preservation:** Smart algorithms maintain image quality
- **Size reduction:** Significant reduction in file size
- **Excellent results:** High visual quality with small size

### Fully Offline

- **No internet required:** All operations are local
- **Complete privacy:** Your images stay on your device only
- **Security:** No external connections

### Easy to Use

- **Simple interface:** Clear and easy command line
- **No complex settings:** Works immediately after installation
- **Comprehensive documentation:** Complete guide for everything

---

## Pixify Free Features

### Basic Conversion

- Convert JPG/PNG to WebP
- Fixed quality 80 (perfect balance)
- Automatic skip for existing files

### Progress and Monitoring

- Real-time progress bar
- Comprehensive statistics report
- Accurate ETA information

### Performance

- Advanced parallel processing
- Optimized memory
- Fast image processing

---

## Pixify Pro Features

### Additional Formats

- **Input/Output:** WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP
- Auto format selection based on input
- Adjustable quality (0–100)

### Processing Modes

- **Smart** (default) — Smart skip and optimize when beneficial
- **Force** — Force conversion to target format
- **Optimize** — Same format with recompression (PNG/JPEG)

### Folder & File Handling

- **Recursive scan** (`-r`, `--recursive`) — process subdirectories
- **Keep folder structure** (`--keep-structure`) in output
- **Save next to original** (`--inplace`) with Optimize mode
- **Multiple inputs** (`-i` repeatable) — e.g. `-i assets -i public -o dist`
- **Collision detection** — reject when output filenames would clash, with clear guidance
- **Symlink protection** — skip files outside input tree with warning (when using `--keep-structure`)

### Licensing & Pro Use

- **License activation** with clear messages (machine limit, expired, revoked)
- **API tokens for WSL, VM, CI & Docker:** In ephemeral environments (WSL, VM, Docker, CI, Cloud) a **token** is enough — set `PIXIFY_TOKEN` or (WSL/VM) run **`pixify-pro auth --token YOUR_TOKEN`** to save to `~/.pixify/config.json`. Tokens are created from the dashboard only; full token is shown once. See [Tokens and environments](pro/tokens-and-environments.md).
- **Auto workers** — full CPU usage (NumCPU)

---

## Quick Comparison

| Feature | Free | Pro |
|---------|------|-----|
| WebP | ✅ | ✅ |
| JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP | ❌ | ✅ |
| Customizable quality | ❌ | ✅ |
| Recursive scan (`-r`) | ❌ | ✅ |
| Keep folder structure | ❌ | ✅ |
| Save next to original (`--inplace`) | ❌ | ✅ |
| Multiple inputs (`-i` repeatable) | ❌ | ✅ |
| Output collision detection | ❌ | ✅ |
| Smart / Force / Optimize modes | Smart only | ✅ |
| License activation + CI/CD token | ❌ | ✅ |

---

## Use Cases

### For Developers

- Optimize website images
- Prepare images for applications
- Batch image processing

### For Designers

- Convert image formats (WebP, AVIF, HEIC, TIFF, etc.)
- Optimize file sizes
- Multi-format processing (Pro)

### For Large Projects

- Process thousands of images
- Workflow automation
- Performance optimization

---

## Performance

### Speed

- **Single image:** Less than a second
- **100 images:** Less than a minute
- **1000 images:** A few minutes

### Size Reduction

- **JPG → WebP:** Significant size reduction
- **PNG → WebP:** Significant size reduction
- **Average reduction:** Noticeable savings

---

## Security and Privacy

### Fully Offline

- No external connections
- All data is local
- No tracking or analytics

### Proprietary Software

- Pixify (Free and Pro) is closed source — source code is not publicly available
- License defines terms of use; see [Terms](https://getpixify.com/terms) and [EULA](https://getpixify.com/eula)
- Updates and support according to plan and license

---

## Support and references

- **Command reference:** [command-reference.md](command-reference.md) — Command assistant for Free and Pro
- **Documentation:** [Documentation index](README.md)
- **Support:** [GitHub Issues](https://github.com/Mahammed-Gaber/pixify/issues) | [getpixify.com](https://getpixify.com)

---

[Back to Home](../README.md)

</div>
