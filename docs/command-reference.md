# Pixify Command Reference — مساعد الأوامر

**[English](#english) | [العربية](#arabic)**

---

<div id="english">

## Quick decision: Free or Pro?

| Your goal | Use | Command pattern |
|-----------|-----|------------------|
| JPG/PNG → WebP, **one folder only**, no recursion or extra options | **Free** | `pixify-free -i <input> -o <output>` |
| Convert to WebP (single folder **or** recursive / multi-folder; or you already use Pro) | **Pro** | `pixify-pro -i <input> -o <output>` (default format is webp) |
| Multiple formats (AVIF, HEIC, TIFF…), recursive, keep structure | **Pro** | `pixify-pro -i <input> -o <output> -f <format> -r --keep-structure` |
| Same format, just recompress (PNG/JPEG) | **Pro** | `pixify-pro -i <input> -o <output> -f <format> --mode optimize` |
| Replace originals in place (write next to each file; no single output folder) | **Pro** | `pixify-pro -i <folder> --mode optimize --inplace` |
| Multiple input folders → one output, **each input as a subfolder** (e.g. `out/dir1/`, `out/dir2/`) | **Pro** | `pixify-pro -i <dir1> -i <dir2> -o <output>` (default `--keep-structure=true`) |
| Multiple input folders → **all images in output root** (no subfolders; flat) | **Pro** | `pixify-pro -i <dir1> -i <dir2> -o <output> --keep-structure=false` (add `-r` if recursive) |
| CI/CD, Docker, headless (no GUI) | **Pro** | Set `PIXIFY_TOKEN` or (WSL/VM) run `pixify-pro auth --token <token>` once; see [Tokens and environments](pro/tokens-and-environments.md) |

---

## Pixify Free — Options at a glance

| Option | Short | Long | Required? | Description |
|--------|-------|------|------------|-------------|
| Input directory | `-i` | `--input` | **Yes** | Single folder containing JPG/PNG (and optionally WebP; WebP is skipped). |
| Output directory | `-o` | `--output` | **Yes** | Where to write WebP files. |
| Help | `-h` | `--help` | No | Show usage. |
| Version | `-v` | `--version` | No | Show version. |

**Fixed behavior (no flags):** Output format = WebP, quality = 80, Smart mode, auto workers, skip existing files. One input folder only; no recursive scan.

**Valid combinations:** The only variable is input path and output path. All other behavior is fixed.

| Scenario | Command |
|----------|---------|
| Basic convert | `pixify-free -i ./photos -o ./webp` |
| Absolute paths | `pixify-free -i /path/to/images -o /path/to/output` |

---

## Pixify Pro — Options at a glance

| Option | Short | Long | Required? | Compatible with | Description |
|--------|-------|------|------------|-----------------|-------------|
| Input directory(s) | `-i` | `--input` | **Yes** (at least one) | All | Can be repeated: `-i assets -i public`. |
| Output directory | `-o` | `--output` | **Yes** (unless `--inplace`) | All | Output folder. Ignored when `--inplace` is set. |
| Format | `-f` | `--format` | No (default: webp) | All | `webp`, `jpeg`, `png`, `avif`, `heic`, `heif`, `tiff`, `gif`, `bmp`, `auto`. |
| Mode | — | `--mode` | No (default: smart) | All | `smart`, `force`, `optimize`. |
| Quality | `-q` | `--quality` | No (default: 80) | All | 10–100. |
| Recursive | `-r` | `--recursive` | No | All | Process subdirectories. |
| Keep structure | — | `--keep-structure` | No (default: true) | All | Preserve folder structure in output. |
| In-place | — | `--inplace` | No | **Only with `--mode optimize`** | Write next to originals; `-o` ignored. |
| Auto output format | — | `--auto-output` | No | All | Auto-select output format from input. |
| Keep metadata | — | `--keep-metadata` | No | **Only with `--mode optimize`** | Preserve EXIF/metadata. |
| Activate license | — | `--activate` | No | With `--license-key` | Activate Pro license (native PC). |
| License key | — | `--license-key` | For activation | With `--activate` | Your Pro license key. |
| Save token (WSL/VM/CI) | — | `auth --token <token>` | No | Subcommand: `pixify-pro auth --token X` | Save token to `~/.pixify/config.json`; use in WSL/VM so you don’t need `PIXIFY_TOKEN` each time. |
| Version | `-v` | `--version` | No | — | Show version and license status. |
| Help | `-h` | `--help` | No | — | Show full help. |

---

## Pro: Valid combinations (what works with what)

| Combination | Valid? | Notes |
|-------------|--------|-------|
| `--inplace` | ✅ Only with `--mode optimize` | In-place overwrites next to originals. |
| `--keep-metadata` | ✅ Only with `--mode optimize` | Preserves EXIF/GPS etc. |
| `-i dir1 -i dir2 -o out` | ✅ | Multiple inputs → one output (structure preserved with `--keep-structure`). |
| `-f auto` or `--auto-output` | ✅ | Output format chosen per image from input format. |
| `-r` (recursive) | ✅ | Use with any mode/format. |
| `--mode optimize` without `-f` | ✅ | Format preserved from input (e.g. PNG→PNG, JPEG→JPEG). |
| `--mode force` | ✅ | Converts every image to `-f` format. |
| `--mode smart` | ✅ | Skips or optimizes based on rules (see [Pro usage guide](pro/usage-guide.md)). |

**Invalid / not supported:**

- `--inplace` without `--mode optimize` → Error.
- `--keep-metadata` without `--mode optimize` → Error.
- Token *creation* (new token) → Only from the [dashboard](https://getpixify.com). Use `pixify-pro auth --token X` to *save* an existing token (WSL/VM).

---

## “I want to…” → Command (Pro)

| I want to… | Command |
|------------|---------|
| Convert everything to WebP (default) | `pixify-pro -i ./images -o ./output` |
| Convert to AVIF with recursion | `pixify-pro -i ./photos -o ./avif -f avif -r` |
| Keep folder structure (input subfolders mirrored under output) | `pixify-pro -i ./photos -o ./out -r --keep-structure` (default is true) |
| Multiple folders → one output **with a subfolder per input** (e.g. `out/assets/`, `out/public/`) | `pixify-pro -i ./assets -i ./public -o ./dist -f webp` |
| **All images in the output root** (no subfolders; flat; add `-r` if recursive) | `pixify-pro -i ./dir1 -i ./dir2 -o ./out --keep-structure=false` |
| Recompress PNG/JPEG in place (write next to originals; only with `--mode optimize`) | `pixify-pro -i ./images --mode optimize --inplace` |
| Auto format per image | `pixify-pro -i ./mixed -o ./out -f auto` |
| Best quality, minimal loss | `pixify-pro -i ./images -o ./out -q 95` |
| Activate license (native) | `pixify-pro --activate --license-key PIXIFY-PRO-XXXX-XXXX-XXXX` |
| Use in CI/Docker | Set `PIXIFY_TOKEN`; run `pixify-pro -i ... -o ...` as usual. See [Tokens and environments](pro/tokens-and-environments.md). |
| Use in WSL/VM (save token once) | `pixify-pro auth --token YOUR_TOKEN` then run `pixify-pro -i ... -o ...` without setting ENV. |

**Notes:** **In-place** (`--inplace`) = write next to each original file; only with `--mode optimize`. It does **not** put all images in one folder. With `--inplace`, `-o/--output` is optional and ignored if provided. **Flat output** (all in root) = `--keep-structure=false`. If two inputs have the same filename, the tool will stop and suggest `--keep-structure` or `--inplace`.

### Quick presets (Pro)

| Preset | Goal | Command |
|--------|------|---------|
| Light | Minimal quality impact, small size reduction | `pixify-pro -i ./images --mode optimize --inplace -q 80 -e 6` |
| Balanced | Good quality/size balance for most photos | `pixify-pro -i ./images --mode optimize --inplace -q 70 -e 8` |
| Aggressive | Higher reduction, more visible quality impact | `pixify-pro -i ./images --mode optimize --inplace -q 60 -e 10` |
| Max saving (format conversion) | Strong reduction (often better than optimize-only) | `pixify-pro -i ./images -o ./out-webp --mode smart -f webp -q 75 -e 8` |

---

## Free: “I want to…” → Command

| I want to… | Command |
|------------|---------|
| Convert JPG/PNG in a folder to WebP | `pixify-free -i ./photos -o ./webp` |
| See version | `pixify-free -v` |
| See help | `pixify-free -h` |

Free has no format/mode/recursive options; one input folder, one output folder, WebP only (quality 80). **If you need WebP with recursion, multiple folders, or already use Pro,** use `pixify-pro -i <input> -o <output>` (default format is webp).

---

## See also

- [Pixify Free — Full usage guide](free/usage-guide.md)
- [Pixify Pro — Full usage guide](pro/usage-guide.md)
- [Install libvips](install-libvips.md) (required before first run)
- [Features overview](features.md)

---

</div>

---

<div id="arabic" dir="rtl">

## اختيار سريع: Free أم Pro؟

| هدفك | الاستخدام | نمط الأمر |
|------|-----------|-----------|
| JPG/PNG → WebP، **مجلد واحد فقط**، بدون تكراري أو خيارات إضافية | **Free** | `pixify-free -i <مدخل> -o <مخرج>` |
| تحويل إلى WebP (مجلد واحد **أو** تكراري/عدة مجلدات؛ أو أنك تستخدم Pro أصلاً) | **Pro** | `pixify-pro -i <مدخل> -o <مخرج>` (الافتراضي webp) |
| صيغ متعددة (AVIF, HEIC, TIFF…)، تكراري، حفظ الهيكل | **Pro** | `pixify-pro -i <مدخل> -o <مخرج> -f <صيغة> -r --keep-structure` |
| نفس الصيغة مع إعادة ضغط فقط (PNG/JPEG) | **Pro** | `pixify-pro -i <مدخل> -o <مخرج> -f <صيغة> --mode optimize` |
| الكتابة بجانب كل ملف أصلي (في مكانه؛ ليس تجميعاً في مجلد واحد) | **Pro** | `pixify-pro -i <مجلد> --mode optimize --inplace` |
| مجلدات مدخل متعددة → مخرج واحد، **كل مدخل كمجلد فرعي** (مثلاً `مخرج/مجلد1/`, `مخرج/مجلد2/`) | **Pro** | `pixify-pro -i <مجلد1> -i <مجلد2> -o <مخرج>` (الافتراضي keep-structure=true) |
| مجلدات مدخل متعددة → **كل الصور في جذر المخرج** (بدون مجلدات فرعية) | **Pro** | `pixify-pro -i <مجلد1> -i <مجلد2> -o <مخرج> --keep-structure=false` (أضف `-r` للتكرار) |
| CI/CD أو Docker أو بدون واجهة | **Pro** | تفعيل مرة واحدة، ثم استخدام رمز API من لوحة التحكم؛ التشغيل مع `PIXIFY_TOKEN=<الرمز>` |

---

## Pixify Free — الخيارات في لمحة

| الخيار | Short | Long | مطلوب؟ | الوصف |
|--------|-------|------|--------|-------|
| مجلد المدخل | `-i` | `--input` | **نعم** | مجلد واحد فيه JPG/PNG (واختيارياً WebP؛ يتم تخطي WebP). |
| مجلد المخرج | `-o` | `--output` | **نعم** | مكان كتابة ملفات WebP. |
| المساعدة | `-h` | `--help` | لا | عرض الاستخدام. |
| الإصدار | `-v` | `--version` | لا | عرض الإصدار. |

**سلوك ثابت (بدون أعلام):** صيغة المخرج = WebP، الجودة = 80، وضع Smart، عمال تلقائي، تخطي الملفات الموجودة. مجلد مدخل واحد فقط؛ لا مسح تكراري.

**التوليفات الصحيحة:** المتغير الوحيد هو مسار المدخل والمخرج. باقي السلوك ثابت.

| السيناريو | الأمر |
|-----------|-------|
| تحويل أساسي | `pixify-free -i ./photos -o ./webp` |
| مسارات مطلقة | `pixify-free -i /path/to/images -o /path/to/output` |

---

## Pixify Pro — الخيارات في لمحة

| الخيار | Short | Long | مطلوب؟ | متوافق مع | الوصف |
|--------|-------|------|--------|-----------|-------|
| مجلد/مجلات المدخل | `-i` | `--input` | **نعم** (واحد على الأقل) | الكل | قابل للتكرار: `-i assets -i public`. |
| مجلد المخرج | `-o` | `--output` | **نعم** (إلا مع `--inplace`) | الكل | مجلد المخرج. يُتجاهل مع `--inplace`. |
| الصيغة | `-f` | `--format` | لا (افتراضي: webp) | الكل | `webp`, `jpeg`, `png`, `avif`, `heic`, `heif`, `tiff`, `gif`, `bmp`, `auto`. |
| الوضع | — | `--mode` | لا (افتراضي: smart) | الكل | `smart`, `force`, `optimize`. |
| الجودة | `-q` | `--quality` | لا (افتراضي: 80) | الكل | 10–100. |
| تكراري | `-r` | `--recursive` | لا | الكل | معالجة المجلدات الفرعية. |
| الحفاظ على الهيكل | — | `--keep-structure` | لا (افتراضي: true) | الكل | الحفاظ على هيكل المجلدات في المخرج. |
| في المكان | — | `--inplace` | لا | **فقط مع `--mode optimize`** | الكتابة بجانب الأصل؛ يُتجاهل `-o`. |
| صيغة مخرج تلقائية | — | `--auto-output` | لا | الكل | اختيار صيغة المخرج تلقائياً من المدخل. |
| الاحتفاظ بالبيانات الوصفية | — | `--keep-metadata` | لا | **فقط مع `--mode optimize`** | الاحتفاظ بـ EXIF والبيانات الوصفية. |
| تفعيل الترخيص | — | `--activate` | لا | مع `--license-key` | تفعيل ترخيص Pro. |
| مفتاح الترخيص | — | `--license-key` | للتفعيل | مع `--activate` | مفتاح ترخيص Pro. |
| الإصدار | `-v` | `--version` | لا | — | عرض الإصدار وحالة الترخيص. |
| المساعدة | `-h` | `--help` | لا | — | عرض المساعدة الكاملة. |

---

## Pro: توليفات صحيحة (ما الذي يعمل مع ماذا)

| التوليفة | صالحة؟ | ملاحظات |
|----------|--------|---------|
| `--inplace` | ✅ فقط مع `--mode optimize` | الكتابة في المكان بجانب الملفات الأصلية. |
| `--keep-metadata` | ✅ فقط مع `--mode optimize` | الاحتفاظ بـ EXIF/GPS وغيرها. |
| `-i dir1 -i dir2 -o out` | ✅ | مدخلات متعددة → مخرج واحد (الهيكل يُحفظ مع `--keep-structure`). |
| `-f auto` أو `--auto-output` | ✅ | اختيار صيغة المخرج لكل صورة من المدخل. |
| `-r` (تكراري) | ✅ | مع أي وضع/صيغة. |
| `--mode optimize` بدون `-f` | ✅ | الحفاظ على صيغة المدخل (مثلاً PNG→PNG، JPEG→JPEG). |
| `--mode force` | ✅ | تحويل كل صورة إلى صيغة `-f`. |
| `--mode smart` | ✅ | تخطي أو تحسين حسب القواعد (انظر [دليل Pro](pro/usage-guide.md)). |

**غير مدعوم:**

- `--inplace` بدون `--mode optimize` → خطأ.
- `--keep-metadata` بدون `--mode optimize` → خطأ.
- توليد الرمز من سطر الأوامر → غير متاح؛ إنشاء الرموز من [لوحة التحكم](https://getpixify.com) فقط. استخدم `PIXIFY_TOKEN` في CI/Docker.

---

## «أريد أن…» → الأمر (Pro)

| أريد أن… | الأمر |
|----------|-------|
| تحويل كل شيء إلى WebP (افتراضي) | `pixify-pro -i ./images -o ./output` |
| تحويل إلى AVIF مع مسح تكراري | `pixify-pro -i ./photos -o ./avif -f avif -r` |
| الحفاظ على هيكل المجلدات (مرآة المجلدات تحت المخرج) | `pixify-pro -i ./photos -o ./out -r --keep-structure` (الافتراضي true) |
| مجلدات متعددة → مخرج واحد **مع مجلد فرعي لكل مدخل** (مثلاً `مخرج/assets/`, `مخرج/public/`) | `pixify-pro -i ./assets -i ./public -o ./dist -f webp` |
| **كل الصور في جذر المخرج** (بدون مجلدات فرعية؛ أضف `-r` للتكرار) | `pixify-pro -i ./dir1 -i ./dir2 -o ./out --keep-structure=false` |
| إعادة ضغط PNG/JPEG في المكان (الكتابة بجانب الأصل؛ فقط مع `--mode optimize`) | `pixify-pro -i ./images --mode optimize --inplace` |
| صيغة تلقائية حسب الصورة | `pixify-pro -i ./mixed -o ./out -f auto` |
| أعلى جودة مع أقل فقد | `pixify-pro -i ./images -o ./out -q 95` |
| تفعيل الترخيص | `pixify-pro --activate --license-key PIXIFY-PRO-XXXX-XXXX-XXXX` |
| الاستخدام في CI/Docker | إنشاء الرمز من لوحة التحكم → تعيين `PIXIFY_TOKEN` → تشغيل `pixify-pro -i ... -o ...` كالمعتاد. |

**ملاحظات:** **في المكان** (`--inplace`) = الكتابة بجانب كل ملف أصلي؛ فقط مع `--mode optimize`. لا يضع كل الصور في مجلد واحد. مع `--inplace` يكون `-o/--output` اختياريًا، وإذا تم تمريره يتم تجاهله. **مخرج مسطح** (كل الملفات في الجذر) = `--keep-structure=false`. إذا كان لمدخلين اسم ملف واحد، البرنامج يتوقف ويقترح `--keep-structure` أو `--inplace`.

### ترشيحات سريعة (Pro)

| الترشيح | الهدف | الأمر |
|---------|-------|-------|
| خفيف | أقل تأثير على الجودة مع تقليل بسيط | `pixify-pro -i ./images --mode optimize --inplace -q 80 -e 6` |
| متوازن | توازن ممتاز جودة/حجم لمعظم الصور | `pixify-pro -i ./images --mode optimize --inplace -q 70 -e 8` |
| قوي | تقليل أعلى مع تأثير أوضح على الجودة | `pixify-pro -i ./images --mode optimize --inplace -q 60 -e 10` |
| أقصى توفير (مع تحويل صيغة) | تقليل قوي غالبًا أفضل من optimize فقط | `pixify-pro -i ./images -o ./out-webp --mode smart -f webp -q 75 -e 8` |

---

## Free: «أريد أن…» → الأمر

| أريد أن… | الأمر |
|----------|-------|
| تحويل JPG/PNG في مجلد إلى WebP | `pixify-free -i ./photos -o ./webp` |
| عرض الإصدار | `pixify-free -v` |
| عرض المساعدة | `pixify-free -h` |

في Free لا توجد خيارات صيغة/وضع/تكراري؛ مجلد مدخل واحد، مجلد مخرج واحد، WebP فقط (جودة 80). **إذا احتجت WebP مع مسح تكراري أو مجلدات متعددة أو كنت تستخدم Pro أصلاً،** استخدم `pixify-pro -i <مدخل> -o <مخرج>` (الصيغة الافتراضية webp).

---

## اطلع أيضاً

- [Pixify Free — دليل الاستخدام الكامل](free/usage-guide.md)
- [Pixify Pro — دليل الاستخدام الكامل](pro/usage-guide.md)
- [تثبيت libvips](install-libvips.md) (مطلوب قبل أول تشغيل)
- [نظرة عامة على المميزات](features.md)

</div>
