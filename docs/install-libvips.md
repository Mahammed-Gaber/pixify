# تثبيت libvips

Pixify Free يتطلب مكتبة `libvips` لتشغيل عمليات تحويل الصور. هذا الدليل يوضح كيفية تثبيت libvips على مختلف أنظمة التشغيل.

---

## Windows

**ملاحظة:** لـ Pixify Free، النسخة `web` من libvips كافية تماماً للتشغيل. تحتوي على دعم WebP المطلوب فقط.

### التثبيت اليدوي

1. قم بتحميل أحدث إصدار من [libvips Windows builds](https://github.com/libvips/build-win64-mxe/releases)

   **روابط تحميل مباشرة (v8.17.3):**
   
   - **نسخة Web (موصى بها لـ Pixify):** [vips-dev-w64-web-8.17.3.zip](https://github.com/libvips/build-win64-mxe/releases/download/v8.17.3/vips-dev-w64-web-8.17.3.zip) - ~11 MB
     - تحتوي على دعم WebP (كافية لـ Pixify Free)
     - حجم أصغر وأسرع في التحميل
   
   - **نسخة كاملة (اختياري):** [vips-dev-w64-all-8.17.3.zip](https://github.com/libvips/build-win64-mxe/releases/download/v8.17.3/vips-dev-w64-all-8.17.3.zip) - ~20 MB
     - تحتوي على جميع الصيغ والدعم الكامل
     - استخدمها إذا كنت تحتاج دعم صيغ إضافية

2. استخرج الملف المضغوط إلى `C:\vips`
3. أضف `C:\vips\bin` إلى متغير البيئة `PATH`:
   - افتح "System Properties" > "Environment Variables"
   - أضف `C:\vips\bin` إلى `Path` في "System variables"
   - أعد تشغيل Terminal

### التحقق من التثبيت

```powershell
vips --version
```

**ملاحظة:** إذا استخدمت النسخة `web`، ستحصل على دعم WebP الكامل وهو كل ما تحتاجه لـ Pixify Free. النسخة `all` تحتوي على دعم إضافي لصيغ أخرى لكنها ليست ضرورية.

---

## Linux

### Ubuntu / Debian

```bash
sudo apt update
sudo apt install libvips-dev
```

### Fedora / RHEL / CentOS

```bash
sudo dnf install vips-devel
```

### Arch Linux / Manjaro

```bash
sudo pacman -S libvips
```

### openSUSE

```bash
sudo zypper install libvips-devel
```

### التحقق من التثبيت

```bash
pkg-config --modversion vips
```

أو:

```bash
vips --version
```

---

## macOS

### باستخدام Homebrew (موصى بها)

```bash
brew install vips
```

### باستخدام MacPorts

```bash
sudo port install vips
```

### التحقق من التثبيت

```bash
vips --version
```

---

## استكشاف الأخطاء

### Windows: "vips.dll not found"

- تأكد من إضافة `C:\vips\bin` إلى `PATH`
- أعد تشغيل Terminal بعد تعديل `PATH`
- تحقق من وجود `vips.dll` في `C:\vips\bin`

### Linux: "pkg-config: command not found"

```bash
sudo apt install pkg-config
```

### Linux: "libvips not found"

- تأكد من تثبيت `libvips-dev` وليس فقط `libvips`
- على Ubuntu/Debian: `sudo apt install libvips-dev`
- على Fedora: `sudo dnf install vips-devel`

### macOS: "vips: command not found"

- تأكد من تثبيت Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- قم بتشغيل `brew install vips`

---

## روابط مفيدة

- [libvips Documentation](https://www.libvips.org/)
- [libvips GitHub](https://github.com/libvips/libvips)
- [Windows Builds](https://github.com/libvips/build-win64-mxe/releases)

---

## الدعم

إذا واجهت مشاكل في التثبيت:

1. تأكد من اتباع الخطوات الخاصة بنظام التشغيل الخاص بك
2. تحقق من إصدار libvips المثبت: `vips --version`
3. راجع قسم "استكشاف الأخطاء" أعلاه
4. افتح issue على GitHub مع تفاصيل نظام التشغيل والخطأ

---

تم آخر تحديث: 2025

