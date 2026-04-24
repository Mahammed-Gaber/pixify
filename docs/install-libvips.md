<div id="english" dir="ltr">

**[English Version](#english) | [النسخة العربية](#arabic)**

# Installing libvips

Pixify Free requires the `libvips` library to run image conversion operations. This guide explains how to install libvips on different operating systems.

---

## Windows

**Note:** For Pixify Free, the `web` version of libvips is sufficient. It contains WebP support only.

### Manual Installation

1. Download the latest version from [libvips Windows builds](https://github.com/libvips/build-win64-mxe/releases)

   **Direct download links (v8.18.2):**
   
   - **Web version (recommended for Pixify):** [vips-dev-w64-web-8.18.2.zip](https://github.com/libvips/build-win64-mxe/releases/download/v8.18.2/vips-dev-x64-web-8.18.2.zip) - ~11 MB
     - Contains WebP support (sufficient for Pixify Free)
     - Smaller size and faster download
   
   - **Full version (optional):** [vips-dev-w64-all-8.18.2.zip](https://github.com/libvips/build-win64-mxe/releases/download/v8.18.2/vips-dev-x64-all-8.18.2.zip) - ~20 MB
     - Contains all formats and full support
     - Use if you need additional format support

2. Extract the zip file to `C:\vips`
3. Add `C:\vips\bin` to the `PATH` environment variable:
   - Open "System Properties" > "Environment Variables"
   - Add `C:\vips\bin` to `Path` in "System variables"
   - Restart Terminal

### Automated install (PowerShell — faster download)

The official script is published on GitHub (same file as the documentation site references). It:

- Prefers **BITS** (`Start-BitsTransfer`) or **curl** for fast downloads, then falls back to `Invoke-WebRequest`
- Installs under `%USERPROFILE%\.pixify\vips` and adds the `bin` folder to your **user** PATH
- Skips re-download if the same build is already installed (use `-Force` to reinstall)

**Recommended:** open **PowerShell as Administrator** if policy blocks scripts, then run:

```powershell
irm https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-vips.ps1 | iex
```

If execution policy errors appear, run once: `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`, then run the line above again.

**Optional flags** (`-AllBuild`, `-Force`, `-VipsVersion`): the one-liner cannot pass arguments. Save the script and run it locally (no Git clone needed):

```powershell
irm https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-vips.ps1 -OutFile "$env:TEMP\install-vips.ps1"
& "$env:TEMP\install-vips.ps1" -AllBuild
```

Examples: `-AllBuild` (larger “all” formats zip), `-Force` (reinstall), `-VipsVersion 8.18.2` (pin version).

Then open a **new** terminal and run `vips --version`.

### Video Tutorial

📹 **Watch this video** to see how to install libvips on Windows step by step:

<div align="center">

**[▶️ Watch Video (7 MB)](https://github.com/Mahammed-Gaber/pixify/raw/main/assets/install-libvips-windows.mp4)**

> **Note:** Click the link above to watch the video in your browser or download it

</div>

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
sudo apt install libvips
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

- Make sure the libvips `bin` folder is on `PATH` (e.g. `C:\vips\bin` after a manual install, or `%USERPROFILE%\.pixify\vips\vips-dev-8.18\bin` after `install-vips.ps1`)
- Restart Terminal after modifying `PATH`
- Verify `vips.dll` exists in that `bin` folder

### Linux: "pkg-config: command not found"

```bash
sudo apt install pkg-config
```

### Linux: "libvips not found"

- Make sure you installed `libvips` and not just `libvips`
- On Ubuntu/Debian: `sudo apt install libvips`
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

---

<div id="arabic" dir="rtl">

**[English Version](#english) | [النسخة العربية](#arabic)**

# تثبيت libvips

Pixify Free يتطلب مكتبة `libvips` لتشغيل عمليات تحويل الصور. هذا الدليل يوضح كيفية تثبيت libvips على مختلف أنظمة التشغيل.

---

## Windows

**ملاحظة:** لـ Pixify Free، النسخة `web` من libvips كافية تماماً للتشغيل. تحتوي على دعم WebP المطلوب فقط.

### التثبيت اليدوي

1. قم بتحميل أحدث إصدار من [libvips Windows builds](https://github.com/libvips/build-win64-mxe/releases)

   **روابط تحميل مباشرة (v8.18.0):**
   
   - **نسخة Web (موصى بها لـ Pixify):** [vips-dev-x64-web-8.18.2.zip](https://github.com/libvips/build-win64-mxe/releases/download/v8.18.2/vips-dev-x64-web-8.18.0.zip) - ~11 MB
     - تحتوي على دعم WebP (كافية لـ Pixify Free)
     - حجم أصغر وأسرع في التحميل
   
   - **نسخة كاملة (اختياري):** [vips-dev-w64-all-8.18.2.zip](https://github.com/libvips/build-win64-mxe/releases/download/v8.18.2/vips-dev-x64-all-8.18.2.zip) - ~20 MB
     - تحتوي على جميع الصيغ والدعم الكامل
     - استخدمها إذا كنت تحتاج دعم صيغ إضافية

2. استخرج الملف المضغوط إلى `C:\vips`
3. أضف `C:\vips\bin` إلى متغير البيئة `PATH`:
   - افتح "System Properties" > "Environment Variables"
   - أضف `C:\vips\bin` إلى `Path` في "System variables"
   - أعد تشغيل Terminal

### تثبيت تلقائي (PowerShell — تحميل أسرع)

السكربت الرسمي منشور على GitHub (نفس الملف المذكور في التوثيق). يقوم بـ:

- تفضيل **BITS** أو **curl** للتحميل السريع، ثم الرجوع إلى `Invoke-WebRequest` عند الحاجة
- التثبيت تحت `%USERPROFILE%\.pixify\vips` وإضافة مجلد `bin` إلى **PATH** للمستخدم
- تخطي إعادة التحميل إذا كان نفس الإصدار مثبتاً (استخدم `-Force` لإعادة التثبيت)

**الموصى به:** افتح **PowerShell** (كمسؤول إذا منع السياسة التشغيل)، ثم:

```powershell
irm https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-vips.ps1 | iex
```

إذا ظهر خطأ بسياسة التنفيذ، نفّذ مرة واحدة: `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` ثم أعد تشغيل الأمر أعلاه.

**خيارات اختيارية** (`-AllBuild`، `-Force`، `-VipsVersion`): أمر السطر الواحد لا يمرّر معاملات. احفظ السكربت ثم شغّله محلياً (بدون استنساخ أي مستودع):

```powershell
irm https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-vips.ps1 -OutFile "$env:TEMP\install-vips.ps1"
& "$env:TEMP\install-vips.ps1" -AllBuild
```

أمثلة: `-AllBuild` (نسخة all الأكبر)، `-Force` (إعادة تثبيت)، `-VipsVersion 8.18.0` (إصدار محدد).

ثم افتح **طرفية جديدة** وشغّل `vips --version`.

### فيديو توضيحي

📹 **شاهد هذا الفيديو** لمعرفة كيفية تثبيت libvips على Windows خطوة بخطوة:

<div align="center">

**[▶️ مشاهدة الفيديو (7 MB)](https://github.com/Mahammed-Gaber/pixify/raw/main/assets/install-libvips-windows.mp4)**

> **ملاحظة:** اضغط على الرابط أعلاه لمشاهدة الفيديو في المتصفح أو تحميله

</div>

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
sudo apt install libvips
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

- تأكد من أن مجلد `bin` الخاص بـ libvips مضاف إلى `PATH` (مثلاً `C:\vips\bin` بعد التثبيت اليدوي، أو `%USERPROFILE%\.pixify\vips\vips-dev-8.18\bin` بعد تشغيل `install-vips.ps1`)
- أعد تشغيل Terminal بعد تعديل `PATH`
- تحقق من وجود `vips.dll` داخل مجلد `bin` نفسه

### Linux: "pkg-config: command not found"

```bash
sudo apt install pkg-config
```

### Linux: "libvips not found"

- تأكد من تثبيت `libvips-dev` وليس فقط `libvips`
- على Ubuntu/Debian: `sudo apt install libvips`
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
