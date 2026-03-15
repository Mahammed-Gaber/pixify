<div id="english" dir="ltr">

**[English](#english) | [النسخة العربية](#arabic)**

<div align="center">

<img src="assets/logo_pixify.PNG" alt="Pixify Cover" width="280" />

</div>

# Pixify — Professional Image Converter

**Pixify** is a high-performance image converter built on **libvips**, designed to process thousands of images quickly with consistent quality, with full support for **offline** operation on **all platforms**.

---

## Why Pixify?

- **Ultra-fast** — Parallel processing that uses your CPU fully; thousands of images in minutes.
- **Professional quality** — Smart algorithms preserve quality while cutting size (often 70–85% savings).
- **Privacy and security** — All processing is local; no uploads, no tracking.
- **Easy to use** — Simple commands; works right after installing libvips.
- **Two clear editions** — **Free** for personal and open projects, **Pro** for teams and organizations with extra formats, licensing, and API tokens.

---

## Editions: Free and Pro

| | **Pixify Free** | **Pixify Pro** |
|---|-----------------|----------------|
| **Purpose** | Convert JPG/PNG to WebP at fixed quality | Advanced conversion, multiple formats, processing modes, licensing, CI/CD |
| **Input/Output** | JPG, PNG → WebP (quality 80) | WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP + Auto |
| **Folders** | Single input folder, no recursive scan | Recursive scan, keep structure, multiple inputs, in-place |
| **Licensing** | Fully free | Pro license + API tokens (CI/Docker/WSL/VM); `auth --token` to save token |
| **Download** | [Releases](https://github.com/Mahammed-Gaber/pixify/releases) | [getpixify.com](https://getpixify.com) \| [Pricing](https://getpixify.com/pricing) |

---

## Quick Start

### 1. Install libvips (required once)

```bash
# Linux
sudo apt install libvips-dev

# macOS
brew install vips

# Windows
# See full installation guide below
```

**[Full libvips installation guide](./docs/install-libvips.md)** — Step-by-step instructions and download links for every platform.

### 2. Run Pixify

```bash
# Free: convert one folder to WebP (no extra options)
pixify-free -i ./photos -o ./webp

# Pro: convert to WebP (single folder or recursive/multi-folder — default is webp)
pixify-pro -i ./photos -o ./webp

# Pro: convert with recursive scan and keep folder structure
pixify-pro -i ./photos -o ./output -r --keep-structure

# Show help and command reference
pixify-free --help
pixify-pro --help
```

**[Command Reference (command assistant)](./docs/command-reference.md)** — “I want to…” → command. **Pro in WSL or Docker/CI:** [Tokens and environments](docs/pro/tokens-and-environments.md).

---

## Downloads

**Pixify Free (latest release):**

| Platform | Link |
|----------|------|
| **Windows** | [Pixify-Free-Windows-v1.0.0.zip](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/Pixify-Free-Windows-v1.0.0.zip) |
| **Linux (x86_64)** | [pixify-free-linux-amd64.tar.gz](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-linux-amd64.tar.gz) |
| **macOS (Apple Silicon)** | [pixify-free-darwin-arm64.tar.gz](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-arm64.tar.gz) |
| **macOS (Intel)** | [pixify-free-darwin-amd64.tar.gz](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-amd64.tar.gz) |

**Or via Homebrew (macOS/Linux):**
```bash
brew install mahammed-gaber/pixify/pixify-free
```

**Pixify Pro:** [getpixify.com](https://getpixify.com) | [Pricing](https://getpixify.com/pricing)

---

## Documentation

| Document | Description |
|----------|-------------|
| **[Command Reference](docs/command-reference.md)** | Command assistant: Free and Pro options, valid combinations, “I want to…” → command |
| **[Tokens and environments (Pro)](docs/pro/tokens-and-environments.md)** | Using Pro in WSL, VM, Docker, CI; `auth --token` and config file |
| [Documentation index](docs/README.md) | Full list of guides and references |
| [Install libvips](docs/install-libvips.md) | Installation instructions per platform |
| [Features](docs/features.md) | Feature overview and use cases |
| [Pixify Free — Usage guide](docs/free/usage-guide.md) | Free edition guide |
| [Pixify Pro — Usage guide](docs/pro/usage-guide.md) | Pro edition guide |
| [Performance](docs/performance.md) \| [Showcase](docs/showcase.md) | Benchmarks and real-world examples |
| [Changelog](docs/changelog.md) | Release history |

---

## Support and links

- **Help:** [GitHub Issues](https://github.com/Mahammed-Gaber/pixify/issues)
- **Website and licensing:** [getpixify.com](https://getpixify.com) | [Pricing](https://getpixify.com/pricing)
- **Install via Homebrew (macOS/Linux):** [homebrew-pixify](https://github.com/Mahammed-Gaber/homebrew-pixify)
- **libvips:** [Official documentation](https://www.libvips.org/)

---

**Pixify** — Optimized image converter for professionals | [getpixify.com](https://getpixify.com)

</div>

---

<div id="arabic" dir="rtl">

**[English](#english) | [النسخة العربية](#arabic)**

<div align="center">

<img src="assets/logo_pixify.PNG" alt="Pixify Cover" width="280" />

</div>

# Pixify — محوّل الصور الاحترافي

**Pixify** أداة تحويل صور عالية الأداء مبنية على **libvips**، مصممة لمعالجة آلاف الصور بسرعة وجودة ثابتة، مع دعم كامل للعمل **بدون إنترنت** وعلى **جميع المنصات**.

---

## لماذا Pixify؟

- **سرعة فائقة** — معالجة متوازية تستغل قوة المعالج بالكامل؛ آلاف الصور في دقائق.
- **جودة احترافية** — خوارزميات ذكية تحافظ على الجودة وتقلّل الحجم بشكل كبير (غالباً 70–85% توفير).
- **خصوصية وأمان** — كل العمليات محلية؛ لا رفع للصور ولا تتبع.
- **سهل الاستخدام** — أوامر بسيطة، يعمل فوراً بعد تثبيت libvips.
- **نسختان واضحتان** — **Free** للمشاريع الشخصية والمجانية، **Pro** للفرق والمؤسسات مع صيغ إضافية وترخيص ورموز API.

---

## النسختان: Free و Pro

| | **Pixify Free** | **Pixify Pro** |
|---|-----------------|----------------|
| **الهدف** | تحويل JPG/PNG إلى WebP بجودة ثابتة | تحويل متقدم، صيغ متعددة، أوضاع معالجة، ترخيص، CI/CD |
| **المدخل/المخرج** | JPG, PNG → WebP (جودة 80) | WebP, JPEG, PNG, AVIF, HEIC, HEIF, TIFF, GIF, BMP + Auto |
| **المجلدات** | مجلد مدخل واحد، لا مسح تكراري | مسح تكراري، حفظ هيكل المجلدات، مدخلات متعددة، حفظ في المكان |
| **الترخيص** | مجاني بالكامل | ترخيص Pro + رموز API (CI/Docker/WSL/VM)؛ أمر `auth --token` لحفظ الرمز |
| **التحميل** | [Releases](https://github.com/Mahammed-Gaber/pixify/releases) | [getpixify.com](https://getpixify.com) \| [الأسعار](https://getpixify.com/pricing) |

---

## البدء السريع

### 1. تثبيت libvips (مطلوب مرة واحدة)

```bash
# Linux
sudo apt install libvips-dev

# macOS
brew install vips

# Windows
# راجع دليل التثبيت الكامل أدناه
```

**[دليل تثبيت libvips الكامل](./docs/install-libvips.md)** — تعليمات مفصلة وروابط تحميل لكل نظام.

### 2. تشغيل Pixify

```bash
# Free: تحويل مجلد واحد إلى WebP (بدون خيارات إضافية)
pixify-free -i ./photos -o ./webp

# Pro: تحويل إلى WebP (مجلد واحد أو تكراري/عدة مجلدات — الافتراضي webp)
pixify-pro -i ./photos -o ./webp

# Pro: تحويل مع مسح تكراري وحفظ الهيكل
pixify-pro -i ./photos -o ./output -r --keep-structure

# عرض المساعدة ومرجع الأوامر
pixify-free --help
pixify-pro --help
```

**[مرجع الأوامر](./docs/command-reference.md)** — «أريد أن…» → الأمر. **استخدام Pro في WSL أو Docker/CI:** [الرموز والبيئات](docs/pro/tokens-and-environments.md).

---

## التحميل

**Pixify Free (أحدث إصدار):**

| المنصة | الرابط |
|--------|--------|
| **Windows** | [Pixify-Free-Windows-v1.0.0.zip](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/Pixify-Free-Windows-v1.0.0.zip) |
| **Linux (x86_64)** | [pixify-free-linux-amd64.tar.gz](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-linux-amd64.tar.gz) |
| **macOS (Apple Silicon)** | [pixify-free-darwin-arm64.tar.gz](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-arm64.tar.gz) |
| **macOS (Intel)** | [pixify-free-darwin-amd64.tar.gz](https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-amd64.tar.gz) |

**أو عبر Homebrew (macOS/Linux):**
```bash
brew install mahammed-gaber/pixify/pixify-free
```

**Pixify Pro:** [getpixify.com](https://getpixify.com) | [الأسعار](https://getpixify.com/pricing)

---

## التوثيق

| المستند | الوصف |
|---------|--------|
| **[مرجع الأوامر](docs/command-reference.md)** | مساعد الأوامر: Free و Pro، التوليفات الصحيحة، «أريد أن…» → الأمر |
| **[الرموز والبيئات (Pro)](docs/pro/tokens-and-environments.md)** | استخدام Pro في WSL و VM و Docker و CI؛ أمر `auth --token` وملف الإعدادات |
| [فهرس التوثيق](docs/README.md) | قائمة بجميع الأدلة والمراجع |
| [تثبيت libvips](docs/install-libvips.md) | تعليمات التثبيت لكل نظام |
| [المميزات](docs/features.md) | نظرة عامة على المميزات وحالات الاستخدام |
| [Pixify Free — دليل الاستخدام](docs/free/usage-guide.md) | دليل النسخة المجانية |
| [Pixify Pro — دليل الاستخدام](docs/pro/usage-guide.md) | دليل النسخة الاحترافية |
| [الأداء والعرض](docs/performance.md) \| [Showcase](docs/showcase.md) | مقاييس وأمثلة حقيقية |
| [سجل التغييرات](docs/changelog.md) | تاريخ الإصدارات |

---

## الدعم والروابط

- **المساعدة:** [GitHub Issues](https://github.com/Mahammed-Gaber/pixify/issues)
- **الموقع والترخيص:** [getpixify.com](https://getpixify.com) | [الأسعار](https://getpixify.com/pricing)
- **تثبيت عبر Homebrew (macOS/Linux):** [homebrew-pixify](https://github.com/Mahammed-Gaber/homebrew-pixify)
- **libvips:** [التوثيق الرسمي](https://www.libvips.org/)

---

**Pixify** — محوّل صور محسّن للمحترفين | [getpixify.com](https://getpixify.com)

</div>
