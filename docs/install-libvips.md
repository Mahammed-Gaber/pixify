<div id="arabic" dir="rtl">

**[English Version](#english) | [النسخة العربية](#arabic)**

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

### فيديو توضيحي

📹 **شاهد هذا الفيديو** لمعرفة كيفية تثبيت libvips على Windows خطوة بخطوة:

[![تثبيت libvips على Windows]](assets/install-libvips-windows.mp4)

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

---

</div>

---

<div id="english" dir="ltr">

**[English Version](#english) | [النسخة العربية](#arabic)**

# Installing libvips

Pixify Free requires the `libvips` library to run image conversion operations. This guide explains how to install libvips on different operating systems.

---

## Windows

**Note:** For Pixify Free, the `web` version of libvips is sufficient. It contains WebP support only.

### Manual Installation

1. Download the latest version from [libvips Windows builds](https://github.com/libvips/build-win64-mxe/releases)

   **Direct download links (v8.17.3):**
   
   - **Web version (recommended for Pixify):** [vips-dev-w64-web-8.17.3.zip](https://github.com/libvips/build-win64-mxe/releases/download/v8.17.3/vips-dev-w64-web-8.17.3.zip) - ~11 MB
     - Contains WebP support (sufficient for Pixify Free)
     - Smaller size and faster download
   
   - **Full version (optional):** [vips-dev-w64-all-8.17.3.zip](https://github.com/libvips/build-win64-mxe/releases/download/v8.17.3/vips-dev-w64-all-8.17.3.zip) - ~20 MB
     - Contains all formats and full support
     - Use if you need additional format support

2. Extract the zip file to `C:\vips`
3. Add `C:\vips\bin` to the `PATH` environment variable:
   - Open "System Properties" > "Environment Variables"
   - Add `C:\vips\bin` to `Path` in "System variables"
   - Restart Terminal

### Video Tutorial

📹 **Watch this video** to see how to install libvips on Windows step by step:

[![Installing libvips on Windows]](assets/install-libvips-windows.mp4)

### Verify Installation

```powershell
vips --version
```

**Note:** If you used the `web` version, you'll get full WebP support which is all you need for Pixify Free. The `all` version contains additional format support but is not necessary.

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

### Verify Installation

```bash
pkg-config --modversion vips
```

Or:

```bash
vips --version
```

---

## macOS

### Using Homebrew (recommended)

```bash
brew install vips
```

### Using MacPorts

```bash
sudo port install vips
```

### Verify Installation

```bash
vips --version
```

---

## Troubleshooting

### Windows: "vips.dll not found"

- Make sure `C:\vips\bin` is added to `PATH`
- Restart Terminal after modifying `PATH`
- Verify `vips.dll` exists in `C:\vips\bin`

### Linux: "pkg-config: command not found"

```bash
sudo apt install pkg-config
```

### Linux: "libvips not found"

- Make sure you installed `libvips-dev` and not just `libvips`
- On Ubuntu/Debian: `sudo apt install libvips-dev`
- On Fedora: `sudo dnf install vips-devel`

### macOS: "vips: command not found"

- Make sure Homebrew is installed: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Run `brew install vips`

---

## Useful Links

- [libvips Documentation](https://www.libvips.org/)
- [libvips GitHub](https://github.com/libvips/libvips)
- [Windows Builds](https://github.com/libvips/build-win64-mxe/releases)

---

## Support

If you encounter installation issues:

1. Make sure you follow the steps for your operating system
2. Check the installed libvips version: `vips --version`
3. Review the "Troubleshooting" section above
4. Open an issue on GitHub with your operating system details and error

---

Last updated: 2025

</div>
