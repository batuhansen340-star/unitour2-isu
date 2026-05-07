# 🎨 Claude Design Prompt — Markalı QR Kart

> **Nasıl kullanılır:**
> 1. [claude.ai](https://claude.ai) → yeni sohbet (Use Artifacts açık)
> 2. Aşağıdaki `--- PROMPT ---` arası tüm metni yapıştır
> 3. Etkinlik afişini de ekle (paperclip)
> 4. Çıkan artifact bir HTML sayfası → "Download PNG" butonu olacak → indir → afiş/sosyal post için kullan
> 5. Çıktı **scan edilebilir** olmalı — promptta "test taraması" şartı var

---

--- PROMPT ---

# Rolün

Sen bir senior brand designer + frontend dev'sin. Apple keynote arkaplanları, Stripe dökümantasyonu, Linear changelog kartları — bu seviyede iş çıkarıyorsun. Bugün bir markalı QR kod kartı tasarlayacaksın. Generic kara-beyaz QR değil; **afişin parçası gibi görünen, kendi başına paylaşılabilir bir tasarım objesi**.

# Bağlam

Bu QR kart **3 yerde kullanılacak**:
1. **Etkinlik afişi köşesinde** (basılı, A3 poster)
2. **Sosyal medya post'unda** (1080×1350 Instagram story / portrait)
3. **Slayt sunumunda** (geniş, 1920×1080 banner şeklinde)

QR kod, UniTour #2 etkinliğinin landing sayfasına yönlendiriyor. Sayfa: `https://unitour2-isu.vercel.app` (placeholder, sonra swap).

# Marka

**Etkinlik:** UniTour #2 — İSÜ Blockchain & Finance × Garanti BBVA Kripto × Avalanche Team1 Türkiye

**Renk paleti** (afişten):
- Birincil koyu mavi: `#0A1539`
- Derin parlak mavi: `#0066FF`
- Açık vurgu: `#3B9EFF`
- Beyaz: `#FFFFFF`
- (Sadece dikkat çekmek için minik aksent) Avalanche kırmızı: `#E84142`

**Tipografi:**
- Başlık: **Space Grotesk** 700 (bold, yakın letter-spacing)
- Etiket / küçük metin: **Inter** 500/600
- Mono detaylar: **JetBrains Mono** (varsa, opsiyonel)

**Mood:** Premium, kurumsal güven + Web3 enerjisi. Kart elle tutulmuş bir festival pass'i + bir Apple invite tasarımı arası.

# Teknik şartlar

**Output:** Tek `index.html` artifact'i. İçinde:
1. `qr-code-styling` library'si CDN'den (`https://unpkg.com/qr-code-styling@1.6.0-rc.1/lib/qr-code-styling.js`)
2. URL → custom-styled QR oluşturan JS
3. QR'ı çevreleyen, dışa indirilebilir bir **kart kompozisyonu** (HTML/CSS, görsel olarak poster-ready)
4. Sağ üstte **"Download as PNG"** butonu — kartı 3x DPI'da indirir (`html-to-image` library kullan: `https://unpkg.com/html-to-image@1.11.11/dist/html-to-image.js`)
5. URL'yi swap için tek `const URL = "..."` değişkeni en üstte

**QR-styling parametreleri** (kullan):
```js
new QRCodeStyling({
  width: 800,
  height: 800,
  type: 'svg',
  data: URL + '?utm_source=qr&utm_medium=poster&utm_campaign=unitour2_isu',
  qrOptions: { errorCorrectionLevel: 'H' },
  dotsOptions: {
    type: 'extra-rounded',           // veya 'classy-rounded' — sen seç
    gradient: {
      type: 'linear',
      rotation: 0.785,                // 45deg
      colorStops: [
        { offset: 0, color: '#0066FF' },
        { offset: 1, color: '#0A1539' },
      ],
    },
  },
  cornersSquareOptions: {
    type: 'extra-rounded',
    color: '#0A1539',
  },
  cornersDotOptions: {
    type: 'dot',
    color: '#0066FF',
  },
  backgroundOptions: { color: '#FFFFFF' },
  imageOptions: {
    crossOrigin: 'anonymous',
    margin: 8,
    imageSize: 0.28,
    hideBackgroundDots: true,
  },
  // Ortadaki logo: küçük "U2" rozet (SVG'yi inline yap, base64'e çevirmen gerekmiyor)
});
```

# 3 Varyant Kartı

Tek sayfada **3 ayrı kart varyantı** üret, her biri ayrı indirilebilir. Üstte 3 sekme veya yan yana 3 preview:

## Varyant A — Poster Köşesi (Square 1200×1200)

**Layout:**
- 1200×1200 square, `bg: #0A1539` üzerine `radial-gradient` ile mavi parıltı (sol-üst)
- Üst-sol: Küçük U2 rozet (40px gradient kare) + "UniTour #2" yazısı (Space Grotesk 600, beyaz)
- Sağ-üst: Avalanche kırmızı küçük "LIVE" benzeri bir rozet — yerine "BLOCKCHAIN UNITED" gibi 1-2 kelimelik bir tagline (small caps, tracking 0.2em)
- **Merkezde QR** (640×640, ortalanmış, beyaz arka planlı yumuşak köşeli kart içinde — `border-radius: 32px`, `box-shadow: 0 30px 80px rgba(0,0,0,0.5)`)
- QR'ın altında 16px boşluk + büyük başlık: **"Etkinliği değerlendir"** (Space Grotesk 700, white)
- Onun altında küçük: "11 soru · 2 dakika · anonim" (Inter 500, beyaz/60%)
- En altta 3-cümle değer önerisi: ikon + kısa metin satırları:
  - 📅 6 Mayıs 2026 · İSÜ V-123
  - 🎤 Garanti BBVA Kripto + Avalanche Team1
  - 💬 Geri bildirimini bırak

## Varyant B — Story Format (1080×1350, Instagram portrait)

**Layout:**
- Üstten 1/3: marka headerı, gradient overlay, büyük "UniTour #2" başlığı
- Ortada (en geniş): 700×700 QR, beyaz kart içinde, hafif rotated (-2deg) — "elle tutulan invite" hissi
- Alt 1/3: ana CTA "Tara → Geri bildirimini bırak" (büyük, beyaz tipografi) + minik ikonlar şeridi (anket, fotoğraflar, sonraki etkinlikler)
- Sağ-alt köşede minik footer: `@isublockchain`

## Varyant C — Slayt Banner (1920×1080, sunum için)

**Layout:**
- Sol 60%: tipografik blok — büyük "ETKİNLİK BİTTİ. 2 DAKİKAN VAR MI?" başlığı, alt satırda "Anketi doldur, bir sonrakini birlikte yapalım." Sky-brand gradient text efekti hero başlığı için.
- Sağ 40%: QR (700×700), beyaz cam-morphism kart içinde, soft shadow + glow
- Altta footer şeridi: 5 partner ismi yatay, ince beyaz ayraçlarla
- Arka plan: koyu mavi + subtle grid pattern + 2 mavi orb blur

# Tasarım kuralları

**KULLAN:**
- ✅ Yumuşak köşeler (`32px+`) — kartlar yumuşak hissetsin
- ✅ Glow / bloom: QR kart altında mavi yumuşak parıltı (poster yüzeyinden hafifçe çıksın)
- ✅ Subtle CSS grid arka plan (mask ile fade)
- ✅ 1px iç border `rgba(255,255,255,0.08)` cam kartlarda
- ✅ Letter-spacing detayları: small caps etiketlerde `0.2em`
- ✅ "Tara" yazısının yanında küçük → ok ikonu (motion ile sağa kayar, statik render'da bile)

**KULLANMA:**
- ❌ Generic kara-beyaz QR (varsayılan) — biz custom yaptık
- ❌ Çok fazla emoji
- ❌ Stock photo background
- ❌ Bullet point listeleri (yatay ikon-metin satırları kullan)
- ❌ "Scan to learn more" gibi clichéd İngilizce CTA — tüm metin Türkçe
- ❌ 8-bit / pixel art / "blockchain meme" estetiği — bu bir kurumsal etkinlik
- ❌ QR'ı küçük yapma (kartın bir kenarının min 50%'si olmalı)

# Scan edilebilirlik şartı (KRİTİK)

QR çalışmazsa kart işe yaramaz. Aşağıdakileri **garantile**:

1. **Error correction `H` (high)** — kullandık ✅
2. **Logo merkezi `imageSize: 0.28`'den büyük olmasın** (max %30 alan)
3. **QR background tamamen düz beyaz** (gradient veya pattern KOYMA QR'ın arkasına)
4. **Kontrast:** QR dot rengi `#0A1539` (lightness ~10), background `#FFFFFF` (~100). Yeterli.
5. **Quiet zone:** QR çevresinde min 4 modül = 32px beyaz boşluk
6. **Logo arkasında `hideBackgroundDots: true`** — okunmayı engellemesin
7. Artifact'i teslim etmeden önce browser'da render et, **iPhone kamerasıyla taranabildiğini sözlü olarak belirt** ("Test edildi — okunuyor" notu yaz).

# Mini logo (QR ortasına gömülecek)

Inline SVG, 80×80 viewport. Şöyle olsun:
- Yumuşak köşeli kare arka plan (`fill: url(#grad)` — linear gradient `#3B9EFF → #0066FF`)
- İçinde Space Grotesk 700 ile beyaz "U2" yazısı, ortalanmış
- Çevresinde 4px beyaz halo (QR dotlarından ayırmak için)

# Indirme akışı

Sağ üstte 3 sekmeli toolbar:
- `[Poster A] [Story B] [Banner C]` — tıklayınca preview değişir
- Sağda `Download PNG` butonu — gradient mavi, beyaz metin, hover'da glow
- Tıklanınca `html-to-image` ile o anki kartı 3× DPI'da indir
- Dosya adı: `unitour2-qr-{variant}.png`

# Kabul kriterleri

- [ ] 3 varyant da görsel olarak premium, "afişin yanında durabilir" hissi
- [ ] QR taranabiliyor (arkadaşına telefon kamerasıyla göster, açılıyor mu?)
- [ ] Renkler tam afiş paletinde (`#0A1539`, `#0066FF`, `#3B9EFF`)
- [ ] Tipografi: Space Grotesk başlıkta, Inter gövdede
- [ ] Logo (U2) QR ortasında, kart içeriğine bağlı, dot'larla çatışmıyor
- [ ] PNG indirme çalışıyor, 3× DPI yüksek çözünürlük
- [ ] Tüm metin Türkçe, hata yok
- [ ] URL tek değişkende swap edilebilir

# Son not

Bu kart, etkinliğin görsel mührü. Birisi Instagram'da gördüğünde "Bunu kim tasarladı, çok güzel olmuş" diyebilmeli. Generic değil; spesifik, opinionated, premium.

Tek artifact'te teslim et. Tarz ve sadeliği koru. Şüpheye düşersen daha minimal tarafa kay.

--- /PROMPT ---
