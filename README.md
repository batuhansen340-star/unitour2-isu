# UniTour #2 — Etkinlik Sayfası

İSÜ Blockchain & Finance × Garanti BBVA Kripto × Avalanche Team1 Türkiye
**6 Mayıs 2026 · İstinye Üniversitesi**

Tek dosyalık statik sayfa: anket, sosyal medya, Luma linki, hatıra. Mobil-öncelikli (QR'dan açılacak). Build adımı yok, npm install gerekmez.

---

## 📁 Proje yapısı

```
unitour2-isu/
├── index.html          ← Sayfanın tamamı (tek dosya, Tailwind CDN)
├── SURVEY.md           ← Google Forms'a hazır anket soruları
├── generate-qr.sh      ← QR kod üretici (deploy sonrası çalıştır)
├── qr/                 ← Üretilen QR çıktıları (deploy sonrası)
└── README.md
```

---

## 🚀 3 Adımda Yayında

### 1️⃣ Anketi oluştur (5 dk)
1. [`SURVEY.md`](./SURVEY.md) dosyasını aç.
2. [forms.google.com](https://forms.google.com)'da boş form aç, blokları sırayla yapıştır.
3. **Gönder → Link → "URL'yi kısalt" ✅** → linki kopyala.
4. [`index.html`](./index.html) içindeki `SURVEY_URL` değişkenine yapıştır:
   ```js
   const SURVEY_URL = "https://forms.gle/AbCdEfGhIj";
   ```

### 2️⃣ Deploy (2 dk — 3 seçenek var, biri yeterli)

#### 🟢 Vercel (önerilen — en hızlı)
```bash
cd /Users/batuuhansen/Desktop/unitour2-isu
npx vercel --prod
```
İlk seferde GitHub ile login ister, sonra her `vercel --prod` komutu yayına alır.
URL örneği: `https://unitour2-isu.vercel.app`

#### 🟡 Netlify Drop (sıfır setup)
1. [app.netlify.com/drop](https://app.netlify.com/drop) → klasörü sürükle-bırak.
2. Anında URL alırsın. İstersen ücretsiz custom domain bağla.

#### 🟠 GitHub Pages
1. Yeni repo aç → bu klasörü push et.
2. Settings → Pages → Source: `main / root` → Save.
3. URL: `https://USERNAME.github.io/unitour2-isu`

### 3️⃣ QR kodları üret (30 sn)
Deploy URL'in elinde olunca:
```bash
cd /Users/batuuhansen/Desktop/unitour2-isu
bash generate-qr.sh https://unitour2-isu.vercel.app
```

`qr/` klasörü 3 dosya üretir:
- `unitour2-qr.png` — 1200px, koyu mavi (afiş için)
- `unitour2-qr.svg` — vektörel (Figma/Illustrator)
- `unitour2-qr-light.png` — beyaz (koyu zemin üzerine)

---

## 📊 Tıklama analitiği

Tüm linkler otomatik UTM ile dökülüyor:
- **Afiş QR** → `?utm_source=qr&utm_medium=poster&utm_campaign=unitour2_isu`
- **Sayfadaki anket butonu** → `?utm_source=qr&utm_medium=event&utm_campaign=unitour2_isu`
- **Instagram tıklaması** → `utm_content=instagram`
- **Luma tıklaması** → `utm_content=luma`

### Dashboard nereden bakılır?
- **Vercel** → otomatik built-in analytics ("Analytics" sekmesi). Ücretsiz.
- **Google Forms** → Forms → "Yanıtlar" sekmesi. UTM bilgisini "utm_source" gizli alanı ile yakalamak istersen, Forms'ta gizli soru ekle (opsiyonel).
- **Instagram link clicks** → Instagram Insights'tan hesap takibi.

---

## 🎨 İçerik özeti

Sayfada yer alan bölümler:
- **Hero** — "Etkinlik tamamlandı" badge + tarih + lokasyon + ana CTA
- **Anket** — Google Forms linki, büyük gradient kart
- **Konuşmacılar** — Batuhan Demir, Hürsel Çay, Ömer Aksu (3 kart, marka renkli)
- **Bağlantıda kal** — Instagram + Luma
- **Partnerler** — Garanti BBVA Kripto, Avalanche Team1, İSÜ, ISU Blockchain & Finance, İEK
- **Footer** — kısa açıklama, sosyal linkler, copyright

### Mobile-first
Tasarım önce mobil için kuruldu (QR'dan açılacak). Tablet/desktop'ta otomatik genişler.

### Erişilebilirlik
- `prefers-reduced-motion` desteği (animasyonlar kapanır)
- Yüksek kontrast (WCAG AA)
- Semantic HTML, alt text, ARIA labels

---

## 🔧 Hızlı düzenlemeler

| Ne değiştirmek istersen | Nereye bak |
|---|---|
| Anket linki | `index.html` → `const SURVEY_URL` |
| Konuşmacı bilgisi | `index.html` → `<!-- KONUŞMACILAR -->` bölümü |
| Renk paleti | `index.html` → `<style>` ve `tailwind.config` |
| Hero başlığı / metin | `index.html` → `<!-- HERO -->` bölümü |
| Sosyal medya linki | `index.html` → `instagram.com/isublockchain` araması yap |

---

## 🧪 Yerel olarak görmek için

```bash
cd /Users/batuuhansen/Desktop/unitour2-isu
python3 -m http.server 8000
# Sonra: http://localhost:8000
```

Veya VS Code "Live Server" eklentisi.

---

## 📌 Notlar

- **Tailwind CDN** kullanıyoruz (production-ready). Build adımı yok, ama internet gerekiyor (sayfayı açmak için her cihazda zaten gerekli).
- **Google Forms** linki yapıştırılmazsa buton "Anket yakında" olur — kırılmaz.
- Tarih kontrolü yok — sayfa kalıcı olarak "etkinlik tamamlandı" modunda. UniTour #3 için yeni klasör açıp bu klasörü kopyala.
