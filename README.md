# UniTour #2 — Etkinlik Sayfası

İSÜ Blockchain & Finance × Garanti BBVA Kripto × Avalanche Team1 Türkiye
**6 Mayıs 2026 · İstinye Üniversitesi · Konferans Salonu V-123**

> Bu klasör, etkinliğe özel landing page + memnuniyet anketi + markalı QR kod paketinin tamamı.
> Hiçbir build yok, hiçbir node_modules yok. Çift tıkla aç, çalışır.

---

## 📁 Dosyalar (kısa özet)

| Dosya | Ne işe yarar |
|---|---|
| **`index.html`** | Sayfanın tamamı — tek dosya, Tailwind CDN, mobile-first |
| **`SURVEY.md`** | Google Forms'a yapıştır-bitti 11 soru (manuel yöntem) |
| **`create-form.gs`** | Tek tıkla Google Form oluşturucu (otomatik yöntem — önerilen) |
| **`CLAUDE_DESIGN_PROMPT_LANDING.md`** | claude.ai'ye yapıştırınca premium landing page üretir |
| **`CLAUDE_DESIGN_PROMPT_QR.md`** | claude.ai'ye yapıştırınca markalı QR kart üretir (3 varyant) |
| **`generate-qr.sh`** | Komut satırı QR generator (4 varyant: PNG mavi/beyaz/mono + SVG) |
| **`qr/`** | Üretilmiş QR çıktıları |

---

## 🚀 5 Adımda Yayında

### 1️⃣ Google Form'u oluştur (~30 sn)

**Yol A — Otomatik (önerilen):**
1. [script.google.com](https://script.google.com) → **Yeni proje**
2. [`create-form.gs`](./create-form.gs) içeriğini kopyala, açılan editöre yapıştır
3. Üstten **Çalıştır → `createUniTour2Survey`**
4. İlk seferde Google izin ister (Drive + Forms) → onayla
5. **Yürütme günlüğü** panelinde 3 link çıkar:
   - 📝 EDIT URL
   - 🔗 **PUBLIC URL** ← bu önemli, kopyala
   - 📊 SHEET URL (yanıtlar otomatik akacak)

**Yol B — Manuel:** [`SURVEY.md`](./SURVEY.md)'deki 11 soruyu forms.google.com'a kopyala.

### 2️⃣ Form linkini index.html'e yapıştır

[`index.html`](./index.html) dosyasını aç, üst tarafta `<script>` içindeki şu satırı bul:

```js
const SURVEY_URL = "REPLACE_WITH_GOOGLE_FORM_URL";
```

Buraya bir önceki adımdan kopyaladığın **PUBLIC URL**'i yapıştır:

```js
const SURVEY_URL = "https://forms.gle/AbCdEfGh123";
```

> Site otomatik UTM ekleyecek (`?utm_source=qr&utm_medium=event&utm_campaign=unitour2_isu`).
> Ankete kaç kişinin QR'dan geldiğini ölçebileceksin.

### 3️⃣ Sayfayı yayınla (3 seçenek, biri yeterli)

#### 🟢 Yöntem A — Netlify Drop (en hızlı, sıfır kayıt)
1. [app.netlify.com/drop](https://app.netlify.com/drop) aç
2. Bu klasörü tarayıcıya **sürükle-bırak**
3. Anında URL alırsın: `https://random-name-123.netlify.app`
4. İstersen tek tıkla custom domain bağla

#### 🟡 Yöntem B — Vercel CLI
```bash
cd ~/Desktop/unitour2-isu
npx vercel --prod
```
İlk seferde GitHub login ister (tarayıcı üzerinden). URL: `https://unitour2-isu.vercel.app`

#### 🟠 Yöntem C — GitHub Pages
1. [github.com/new](https://github.com/new) → public repo `unitour2-isu`
2. ```bash
   cd ~/Desktop/unitour2-isu
   git remote add origin https://github.com/USERNAME/unitour2-isu.git
   git push -u origin main
   ```
3. Repo → **Settings → Pages → Source: `main / root`** → **Save**
4. URL: `https://USERNAME.github.io/unitour2-isu/`

### 4️⃣ Markalı QR kodu üret

**Yol A — Komut satırı (hızlı, 4 varyant):**
```bash
cd ~/Desktop/unitour2-isu
bash generate-qr.sh https://senin-deploy-url.netlify.app
```

`qr/` klasörü dolar:
- `unitour2-qr.png` — koyu mavi, 1200px (afiş için)
- `unitour2-qr.svg` — vektörel (Figma/Illustrator)
- `unitour2-qr-light.png` — beyaz, koyu zemine
- `unitour2-qr-mono.png` — saf siyah-beyaz (geriye uyum)

**Yol B — Premium markalı kart (Claude Design):**
1. [claude.ai](https://claude.ai) yeni sohbet aç (Use Artifacts ✅)
2. [`CLAUDE_DESIGN_PROMPT_QR.md`](./CLAUDE_DESIGN_PROMPT_QR.md) içeriğini kopyala-yapıştır
3. Etkinlik afişini de eke (paperclip)
4. Çıkan artifact'te **Download PNG** butonu var → 3 varyantı indir (poster, story, slayt)

### 5️⃣ (Opsiyonel) Premium tasarım yükseltmesi

`index.html` zaten yüksek kalitede — ama "Awwwards seviyesi" istiyorsan:

1. [claude.ai](https://claude.ai) yeni sohbet (Use Artifacts ✅)
2. [`CLAUDE_DESIGN_PROMPT_LANDING.md`](./CLAUDE_DESIGN_PROMPT_LANDING.md) içeriğini yapıştır
3. Etkinlik afişini ekle (paperclip)
4. Çıkan artifact → **Download** → mevcut `index.html`'in üzerine yaz
5. Yeniden deploy et — URL aynı, QR çalışmaya devam eder

---

## 🧪 Yerel önizleme

Tarayıcıda görmek istersen:
```bash
cd ~/Desktop/unitour2-isu
python3 -m http.server 8910
# Sonra: http://localhost:8910
```

VS Code'da **Live Server** eklentisi de aynı işi yapar.

---

## 📊 Tıklama analitiği

Tüm linkler otomatik UTM'li:

| Yer | Parametreler |
|---|---|
| Afiş QR | `?utm_source=qr&utm_medium=poster&utm_campaign=unitour2_isu` |
| Sayfadaki anket butonu | `?utm_source=qr&utm_medium=event&utm_campaign=unitour2_isu` |
| Instagram tıklaması | `+ utm_content=instagram` |
| Luma tıklaması | `+ utm_content=luma` |

**Dashboard nereden bakılır?**
- **Vercel/Netlify** → built-in Analytics (hangi sayfa, kaç ziyaret, referrer)
- **Google Forms → Yanıtlar** sekmesi (anket cevapları)
- **Yanıtlar Sheet** → `create-form.gs` otomatik bir Sheet oluşturdu, oradan canlı veri çek

---

## 🎨 Marka rehberi (hızlı referans)

| Kullanım | Renk |
|---|---|
| En koyu arka plan | `#05091F` |
| Primary surface | `#0A1539` |
| Yükseltilmiş kart | `#0F1F4D` |
| Primary accent | `#3B9EFF` |
| Derin mavi (gradient sonu) | `#0066FF` |
| Avalanche kırmızı (sadece rozet) | `#E84142` |
| Gövde metni | `#E6ECFF` |

**Tipografi:**
- Başlık: **Space Grotesk** 700/800 (`-0.02em` letter-spacing)
- Gövde: **Inter** 400/500/600

---

## 🔧 Sık değişiklikler

| Ne değiştirmek istersen | Nereye bak |
|---|---|
| Anket linki | `index.html` → `const SURVEY_URL` |
| Konuşmacı bilgisi | `index.html` → `<!-- KONUŞMACILAR -->` bölümü |
| Renk paleti | `index.html` → `<style>` bloğu + `tailwind.config` |
| Hero başlığı / metin | `index.html` → `<!-- HERO -->` bölümü |
| Sosyal medya linkleri | `index.html` → `instagram.com/isublockchain` ara |
| Etkinlik tarihi | `index.html` → "6 Mayıs 2026" ara |

---

## ✅ Pre-launch checklist

- [ ] Google Form oluşturuldu (`create-form.gs` çalıştırıldı)
- [ ] PUBLIC URL `index.html` içindeki `SURVEY_URL`'e yapıştırıldı
- [ ] Site bir hosta deploy edildi (URL alındı)
- [ ] Mobilde (gerçek telefon) test: hero görünüyor, anket CTA'sı 1 swipe içinde, butonlar tıklanıyor
- [ ] QR kod telefon kamerasıyla taranıp doğru sayfayı açıyor
- [ ] Anket başından sonuna doldurulup gönderildi (test yanıtı), Sheet'e yansıdı
- [ ] Instagram + Luma linkleri yeni sekmede açılıyor

---

## 📌 Notlar

- **Tarih kontrolü yok** — sayfa kalıcı olarak "Etkinlik tamamlandı" modunda. UniTour #3 için bu klasörü kopyala, içeriği değiştir.
- **Tailwind CDN** production-ready (build adımı yok). İnternet gerekir, ama QR'dan açılacağı için zaten internetli açılıyor.
- **Anket linki yapıştırılmazsa** buton "Anket yakında" olur — kırılmaz.
- **`prefers-reduced-motion`** desteği var — animasyonlardan rahatsız olanlar için otomatik kapanır.
