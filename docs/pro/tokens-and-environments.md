# Tokens and Environments — الرموز والبيئات

**[English](#english) | [العربية](#arabic)**

This guide explains how Pixify Pro handles **different run environments** (your PC, WSL, Docker, CI, cloud, VM) and how to use **tokens** so Pro works everywhere.

---

<div id="english">

## English

### What are “environments”?

Pixify Pro detects where it is running:

| Environment | Description | How Pro gets authorization |
|-------------|-------------|----------------------------|
| **Native** | Your normal PC (Windows, macOS, Linux) | License key activation once → cached in `~/.pixify/license.bin` |
| **WSL** | Windows Subsystem for Linux | **Token** (from config file or `PIXIFY_TOKEN`) — no license cache required |
| **VM** | Virtual machine | **Token** (from config file or `PIXIFY_TOKEN`) |
| **Docker** | Container | **Token** from `PIXIFY_TOKEN` only |
| **CI** | GitHub Actions, GitLab CI, etc. | **Token** from `PIXIFY_TOKEN` (or GitHub Secret) |
| **Cloud** | AWS, GCP, Azure, etc. | **Token** from `PIXIFY_TOKEN` |

In **ephemeral** environments (WSL, VM, Docker, CI, Cloud), Pro does **not** require a license cache file. It only needs a **valid token**.

---

### Two ways to provide the token

1. **Environment variable (all environments)**  
   Set `PIXIFY_TOKEN` to your Pro token (from [getpixify.com](https://getpixify.com) dashboard).

2. **Config file (WSL and VM only)**  
   Save the token once; Pro will read it from `~/.pixify/config.json`.  
   - On WSL: `~` = `/home/youruser`, so file is `/home/youruser/.pixify/config.json`.  
   - Use the **auth** command to save it (see below).

---

### Command: `pixify-pro auth --token YOUR_TOKEN`

Use this to **save your token** so you don’t have to set `PIXIFY_TOKEN` every time (handy in WSL and VMs).

```bash
pixify-pro auth --token YOUR_PRO_TOKEN
```

- **What it does:** Checks the token (if the server is reachable), then writes it to `~/.pixify/config.json`.  
- **If offline:** Token is still saved; you’ll see a short message to verify when online.  
- **After this:** You can run `pixify-pro -i ./photos -o ./out` in WSL/VM without setting `PIXIFY_TOKEN`.

**Where to get the token:** [getpixify.com](https://getpixify.com) → your account → API tokens. Create a token and copy it (it’s shown only once).

---

### Summary by environment

| Where you run | Token from | If no token |
|---------------|------------|-------------|
| **Native PC** | Optional (Pro uses license cache from activation) | Use `pixify-pro --activate --license-key YOUR_KEY` |
| **WSL** | 1) `~/.pixify/config.json` (e.g. via `auth --token`) 2) `PIXIFY_TOKEN` | Message: set `PIXIFY_TOKEN` or run `pixify-pro auth --token YOUR_TOKEN` |
| **VM** | Same as WSL | Same as WSL |
| **Docker / CI / Cloud** | `PIXIFY_TOKEN` only | Message: set `PIXIFY_TOKEN` (or add as GitHub Secret in CI) |

---

### License cache reset (machine change)

If you move the license cache to another machine (or change hardware so the machine ID changes), Pro may show:

**"License cache was reset due to system changes. Re-authenticating..."**

This is normal. The old cache is removed so it can’t be used on the wrong machine. On a **native** PC, run activation again with your license key. In **WSL/VM/Docker/CI/Cloud**, use a token (config or `PIXIFY_TOKEN`) as above.

---

### Quick links

- **Pro usage (all commands):** [Pro usage guide](usage-guide.md)  
- **Command reference:** [Command reference](../command-reference.md)  
- **CI/Docker tokens (how to create):** [getpixify.com](https://getpixify.com)  
- **Changelog (what’s new):** [Changelog](../changelog.md)

</div>

---

<div id="arabic" dir="rtl">

## العربية

### ما هي «البيئات»؟

Pixify Pro يكتشف أين يعمل:

| البيئة | الوصف | كيف يحصل Pro على التفويض |
|--------|--------|---------------------------|
| **Native** | جهازك العادي (Windows, macOS, Linux) | تفعيل بالرقم التسلسلي مرة واحدة → يُخزَّن في `~/.pixify/license.bin` |
| **WSL** | Windows Subsystem for Linux | **رمز (Token)** من ملف الإعدادات أو `PIXIFY_TOKEN` — بدون حاجة لملف ترخيص |
| **VM** | آلة افتراضية | **Token** من ملف الإعدادات أو `PIXIFY_TOKEN` |
| **Docker** | حاوية | **Token** من `PIXIFY_TOKEN` فقط |
| **CI** | GitHub Actions, GitLab CI، إلخ | **Token** من `PIXIFY_TOKEN` (أو GitHub Secret) |
| **Cloud** | AWS, GCP, Azure، إلخ | **Token** من `PIXIFY_TOKEN` |

في البيئات **العابرة** (WSL, VM, Docker, CI, Cloud) لا يطلب Pro ملف ترخيص مخزّن. يكفيه **رمز (Token)** صالح.

---

### طريقتان لتوفير الرمز

1. **متغير البيئة (جميع البيئات)**  
   اضبط `PIXIFY_TOKEN` على رمز Pro الخاص بك (من لوحة [getpixify.com](https://getpixify.com)).

2. **ملف الإعدادات (WSL و VM فقط)**  
   احفظ الرمز مرة واحدة؛ Pro يقرأه من `~/.pixify/config.json`.  
   - في WSL: `~` = `/home/اسم_المستخدم`، أي الملف `/home/اسم_المستخدم/.pixify/config.json`.  
   - استخدم أمر **auth** لحفظه (انظر أدناه).

---

### الأمر: `pixify-pro auth --token YOUR_TOKEN`

يُستخدم **لحفظ الرمز** حتى لا تحتاج لتعيين `PIXIFY_TOKEN` في كل مرة (مفيد في WSL والآلات الافتراضية).

```bash
pixify-pro auth --token YOUR_PRO_TOKEN
```

- **ماذا يفعل:** يتحقق من الرمز (إن كان السيرفر متاحاً)، ثم يكتبه في `~/.pixify/config.json`.  
- **إن لم يكن هناك إنترنت:** يُحفظ الرمز مع تحذير بالتحقق لاحقاً عند الاتصال.  
- **بعد ذلك:** يمكنك تشغيل `pixify-pro -i ./photos -o ./out` في WSL/VM بدون تعيين `PIXIFY_TOKEN`.

**من أين تحصل على الرمز:** [getpixify.com](https://getpixify.com) → حسابك → رموز API. أنشئ رمزاً وانسخه (يُعرض مرة واحدة فقط).

---

### ملخص حسب البيئة

| أين تشغّل | مصدر الرمز | إن لم يوجد رمز |
|-----------|------------|----------------|
| **جهازك العادي** | اختياري (Pro يستخدم كاش الترخيص من التفعيل) | استخدم `pixify-pro --activate --license-key YOUR_KEY` |
| **WSL** | 1) `~/.pixify/config.json` (مثلاً عبر `auth --token`) 2) `PIXIFY_TOKEN` | رسالة: اضبط `PIXIFY_TOKEN` أو نفّذ `pixify-pro auth --token YOUR_TOKEN` |
| **VM** | نفس WSL | نفس WSL |
| **Docker / CI / Cloud** | `PIXIFY_TOKEN` فقط | رسالة: اضبط `PIXIFY_TOKEN` (أو أضفه كـ GitHub Secret في CI) |

---

### إعادة تعيين كاش الترخيص (تغيّر الجهاز)

إذا نُقل كاش الترخيص لجهاز آخر (أو تغيّر الهاردوير فتبدّل معرف الجهاز)، قد يظهر Pro:

**"License cache was reset due to system changes. Re-authenticating..."**

هذا طبيعي. يتم حذف الكاش القديم لئلا يُستخدم على جهاز غير مفعّل. على جهاز **عادي** نفّذ التفعيل مرة أخرى برقم الترخيص. في **WSL/VM/Docker/CI/Cloud** استخدم رمزاً (من الملف أو `PIXIFY_TOKEN`) كما سبق.

---

### روابط سريعة

- **دليل Pro (كل الأوامر):** [دليل استخدام Pro](usage-guide.md)  
- **مرجع الأوامر:** [مرجع الأوامر](../command-reference.md)  
- **رموز CI/Docker (كيفية الإنشاء):** [getpixify.com](https://getpixify.com)  
- **سجل التغييرات (ما الجديد):** [سجل التغييرات](../changelog.md)

</div>
