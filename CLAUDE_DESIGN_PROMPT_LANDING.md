# 🎨 Claude Design Prompt — UniTour #2 Landing Page

> **Nasıl kullanılır:**
> 1. [claude.ai](https://claude.ai) → yeni sohbet
> 2. Sol-altta **"Use artifacts"** açık olduğundan emin ol
> 3. Aşağıdaki `--- PROMPT ---` ve `--- /PROMPT ---` arasındaki tüm metni kopyala
> 4. Sohbete yapıştır + **etkinlik afişini ek olarak ekle** (paperclip ikonu)
> 5. Çıkan artifact'ı indir → `index.html` olarak kaydet
> 6. Repo'daki mevcut `index.html`'in üzerine yaz, push et — URL aynı, QR çalışmaya devam eder

---

--- PROMPT ---

# Rolün

Sen Awwwards SOTD kazanan, kinetic typography ve interaction design uzmanı bir senior product designer + frontend developer'sın. Apple, Linear, Vercel, Stripe seviyesinde işler çıkarıyorsun. Bu görevin kritik: 200+ üniversite öğrencisinin etkinlik sonrası sayfayı QR'dan tarayıp geri bildirim bırakacağı bir landing page tasarlayacaksın. **Mobile-first** — masaüstüne sonra bakacağız.

# Bağlam

**Etkinlik:** UniTour #2 — bahar dönemi üniversite turunun ikinci durağı.
**Düzenleyen:** İSÜ Blockchain & Finance topluluğu (İstinye Üniversitesi).
**Konuklar:** Garanti BBVA Kripto + Avalanche Team1 Türkiye ekibi.
**Tarih:** 6 Mayıs 2026, Çarşamba, 13.00 — İSÜ Konferans Salonu V-123.
**Sayfa türü:** Post-event recap + memnuniyet anketi sayfası. Etkinlik bitti, hedef şu:

1. **Asıl iş** → ankete tıklatmak (büyük, net, yakın)
2. Etkinlik anısını yaşatmak (konuşmacılar, partnerler)
3. Topluluk takibi → Instagram + Luma

**Hedef kitle:** Türk üniversite öğrencileri (Z kuşağı), Web3'e ilgili. Mobilde, ayakta, dikkati 5 saniye. İlk skroll'da anketi görmeli.

# Marka & Mood

**Üst marka tonu:** Premium, kurumsal güven (Garanti BBVA mavi gücü) + cesur ve genç (Avalanche kırmızı sıcaklığı + Web3 enerjisi). **Asla cringe değil, asla generic değil.**

**Renk paleti** (kullanılacak — afişten alındı):
- `--ink-950: #05091F` — en derin arka plan
- `--ink-900: #0A1539` — primary surface
- `--ink-800: #0F1F4D` — yükseltilmiş kart
- `--ink-700: #16307A` — hover/glow
- `--sky-brand: #3B9EFF` — primary accent (link, button, ışık)
- `--sky-deep: #0066FF` — derin vurgu (gradient sonu)
- `--avalanche: #E84142` — sadece Avalanche temalı rozetlerde
- `--text: #E6ECFF` — gövde metni
- `--text-muted: rgba(230,236,255,0.6)`

**Tipografi:**
- Display (başlıklar): **Space Grotesk** 700/800
- Gövde: **Inter** 400/500/600
- Ekstra büyük başlıklarda `letter-spacing: -0.02em`, `line-height: 1.02`

**Mood referansları:** Linear.app değişim sayfası, Vercel Ship 2024, Apple WWDC keynote'u, ETH Denver site. **AVOID:** Bootstrap'çı, Material UI'ci, agency-template'çi vibe.

# Görsel referans

Sohbete eklediğim afişe bak: koyu mavi gradient, beyaz büyük tipografi, 3 konuşmacı portresi alt alta, Garanti BBVA + Team1 logoları altta. Sayfa bu afişin **dijital uzantısı** gibi hissetmeli — aynı mavi tonu, aynı tipografik enerji, ama ekrana özel kinetik dokunuşlar.

# İÇERİK (kelime kelime kullan, çevirme, hiçbir şey atlama)

## Sticky Nav

- Sol: küçük "U2" rozet (gradient kare) + `UniTour #2` (yanında küçük mavi #2)
- Sağ:
  - "Anket" linki (ana scroll target)
  - "Konuşmacılar" linki (sm+)
  - **@isublockchain** butonu (beyaz arka plan, Instagram ikonu, koyu metin) — tıklanınca https://www.instagram.com/isublockchain/

## Hero Section

**Üstte mini badge:**
- Yeşil yanıp sönen ping nokta + `ETKİNLİK TAMAMLANDI` (uppercase, tracking 0.18em, emerald-300)

**Ana başlık (H1):** *(2 satır)*
- Satır 1: `UniTour #2` — gradient text (beyaz → açık mavi → sky-brand)
- Satır 2: `İSÜ kampüsünde tamamlandı.`

**Subhead paragraf:**
> Garanti BBVA Kripto ve Avalanche Team1 Türkiye ekibini İstinye Üniversitesi'nde ağırladık. Web3'ün geleceğini birlikte konuştuk, bağlantılar kurduk.

**Meta strip** (3 cam-kart, yatay flex, mobilde wrap):
1. 📅 ikonu — `6 Mayıs 2026` **bold** + `Çarşamba · 13.00` muted
2. 📍 ikonu — `İSÜ Konferans Salonu` **bold** + `V-123` muted
3. 👥 ikonu — `3 konuşmacı` **bold** + `Q&A · networking` muted

**Primary CTA button** (büyük, gradient, parlayan):
- "Geri bildirimini bırak" + `· 2 dakika` + sağa ok ikonu
- Tıklayınca `#anket`'e smooth scroll

**Mikro yazı altında:** "Bir sonraki UniTour'u senin için daha iyi yapacağız."

## Anket Bölümü (id="anket")

Tek büyük cam-morphism kart (rounded-3xl). Köşelerden sky-brand ve sky-deep blur orb'ları taşsın.

**Üst eyebrow:** `— MEMNUNİYET ANKETİ` (tracking-wide, sky-brand)

**H2:** "Etkinliği nasıl buldun?"

**Açıklama:**
> 11 kısa soru, ~2 dakika. Cevapların anonim. Her geri bildirim, bir sonraki UniTour'un yolunu çiziyor.

**Sağ tarafta (mobilde altta):**
- "Ankete başla →" butonu — beyaz arka plan, koyu mavi metin, hover'da hafif lift
- Altta küçük metin: "Google Forms üzerinden"

**Anket linki:** placeholder olarak `https://forms.gle/UNITOUR2-FORM-PLACEHOLDER` kullan, JS değişkeni olarak `SURVEY_URL` const'unda tanımla — kolay swap için.

**JS davranışı:** Tıklanırken otomatik UTM ekle (`?utm_source=qr&utm_medium=event&utm_campaign=unitour2_isu`).

## Konuşmacılar Bölümü (id="konusmacilar")

**Eyebrow:** `— KONUŞMACILAR`
**H2:** "Sahnedeki ekip"

**3 kart grid (mobilde stack, sm+ üç sütun):**

Her kart cam-morphism, hover'da hafif lift + border parlamaıs.

| Kişi | Rol | Şirket rozeti |
|------|-----|---------------|
| **Batuhan Demir** | Business Development Manager | Garanti BBVA Kripto (yeşil renkte rozet, dot + metin) |
| **Hürsel Çay** | Türkiye Country Lead | Avalanche Team1 (kırmızı renkte rozet) |
| **Ömer Aksu** | Tech Member | Avalanche Team1 Türkiye (kırmızı rozet) |

**Avatar:** her kartta sol üstte 56px gradient kare (sky-brand → sky-deep), içinde beyaz initials (`BD`, `HÇ`, `ÖA`). Düz fotoğraf KULLANMA — initial-avatar daha tutarlı + premium.

## Bağlantıda Kal Bölümü

**Eyebrow:** `— BAĞLANTIDA KAL`
**H2:** "Etkinlik bitti, yolculuk devam ediyor"

**2 büyük link kartı (grid sm:cols-2):**

### Kart 1 — Instagram
- Sol: 56px renkli gradient kare (Instagram brand: #F58529 → #DD2A7B → #8134AF), içinde Instagram ikonu
- Eyebrow: `INSTAGRAM` (uppercase, tracking)
- Title: `@isublockchain`
- Subtitle: `Etkinlik fotoğrafları, duyurular, bir sonraki UniTour`
- Sağda hover'da öne çıkan dış-link ok ikonu
- Link: `https://www.instagram.com/isublockchain/`

### Kart 2 — Luma
- Sol: 56px gradient kare (rose-500 → rose-700), içinde stilize "etkinlik" ikonu (4 çizgi + nokta merkez)
- Eyebrow: `LUMA`
- Title: `Etkinlik sayfası`
- Subtitle: `Katılımcı listesi, hatıra fotoğrafları, sonraki etkinlikler`
- Link: `https://luma.com/unitour2-isu`

**JS davranışı:** Bu iki linke de UTM ekle, ayrıca `utm_content=instagram` ve `utm_content=luma` ekle.

## Partnerler

Sade. Ortalanmış küçük eyebrow:
> `— BU ETKİNLİK BİRLİKTE VAR OLDU —`

Cam kart içinde 5-sütunlu grid (mobilde 2x3), her hücrede kurum ismi:
1. **Garanti BBVA** / Kripto
2. **Avalanche** / Team1 Türkiye
3. **İstinye** / Üniversitesi
4. **İSÜ Blockchain** / & Finance
5. **İEK** / Topluluk

Sade tipografi yeter — gerçek logo yok elimde, isim + alt-açıklama kombinasyonu temiz görünüyor.

## Footer

İki kolon:
- Sol: U2 rozet + `UniTour #2 — İSÜ` + 2-cümle açıklama: "UniTour, İSÜ Blockchain & Finance topluluğunun bahar dönemi üniversite turudur. Her durakta farklı bir Web3 ekibi."
- Sağ: `@isublockchain · Luma` linkleri + `© 2026 İSÜ Blockchain & Finance · Tüm hakları saklıdır.`

# Tasarım yönü (kritik detaylar)

**Background:** Tek-renk değil — koyu navy üzerinde 2 yumuşak radial gradient orb (üst-sol mavi parıltı, üst-sağ derin mavi). Üzerinde 48px CSS grid pattern, kenarlara doğru radial mask ile fade.

**Glassmorphism:** Kartlarda `backdrop-filter: blur(12px)`, `border: 1px solid rgba(255,255,255,0.10)`, hafif beyaz tonlu lineer gradient overlay (üstten alta `0.06 → 0.02`).

**Gradient text:** Hero başlığında `linear-gradient(120deg, #FFFFFF 0%, #B5D5FF 40%, #3B9EFF 100%)` — `background-clip: text` ile.

**Animated shine button:** Primary CTA'da 200% genişlikte gradient, 6s sonsuz pozisyon kaymasıyla "ışık geçiyor" hissi.

**Glow ring:** Aksiyon elemanlarına `box-shadow: 0 0 60px -10px rgba(59,158,255,0.55)` — pahalı görünür.

**Reveal-on-scroll:** Tüm kartlar `IntersectionObserver` ile fade-up. Stagger gerekmez, eşzamanlı yeter.

**Hover micro-interactions:**
- Kartlarda: `bg` hafif beyazlama + 1px translateY
- Linklerde: ok 2-3px sağa kayar
- Butonlarda: shadow yumuşak büyür

**`prefers-reduced-motion`:** TÜM animasyonları `none` yap. Test et.

**Selection rengi:** `selection:bg-sky-brand/30 selection:text-white` — küçük detay, premium hisset.

# Teknik şartlar

**Output:** Tek dosya `index.html` (HTML + inline `<style>` + `<script>`). React/Next.js DEĞİL — saf HTML, çünkü statik host'a deploy edilecek (GitHub Pages / Netlify / Vercel static).

**Tailwind:** Play CDN üzerinden (`https://cdn.tailwindcss.com?plugins=forms`). `tailwind.config` inline tanımla custom renkler ve animasyonlar için.

**Fontlar:** Google Fonts preconnect + tek `<link>` ile Inter + Space Grotesk yükle.

**Bağımlılık:** Hiçbir build tool, hiçbir node_modules. Tek dosya, çift tıkla aç → çalış.

**Mobile:** 320px - 480px ekranlarda kusursuz olmalı. Hero'nun altında Anket CTA scroll'a gerek kalmadan **ya görünür** ya da bir-iki swipe sonra. **Anket'e ulaşmak 1 swipe'tan fazla sürmesin.**

**Boyut hedefi:** index.html < 35KB (Tailwind CDN dışında).

**SEO + Open Graph:**
```html
<title>UniTour #2 — İSÜ Blockchain & Finance</title>
<meta name="description" content="Garanti BBVA Kripto × Avalanche Team1 Türkiye, İstinye Üniversitesi'nde. 6 Mayıs 2026 etkinliğinin geri bildirim ve hatıra sayfası." />
<meta property="og:title" content="UniTour #2 — İSÜ Blockchain" />
<meta property="og:description" content="Etkinliğe katıldıysan 2 dakikanı ayır, geri bildirimini bırak." />
<meta property="og:type" content="website" />
<meta name="theme-color" content="#0A1539" />
<meta name="color-scheme" content="dark" />
```

**Erişilebilirlik:**
- Tüm interaktif öğelerde `aria-label` veya görünür etiket
- Renk kontrastı WCAG AA (test edilebilir)
- Klavye odak halkası belirgin (`focus-visible:ring-2 ring-sky-brand`)
- Semantic HTML: `<header>`, `<main>`, `<section>`, `<footer>`

# Kaçınılması gerekenler (anti-patterns)

❌ Stok fotoğraf
❌ Generic shadcn/ui card pattern (oversaturated, herkes kullanıyor)
❌ Hover'da büyüme efektleri (cringe)
❌ Glassmorphism abartısı (kartların ARASINDA da blur olmasın)
❌ "Astronaut" / "rocket" / "stars background" 2018 illustrasyonları
❌ Çok fazla emoji (max 4-5 yerde, fonksiyonel)
❌ Lorem ipsum (hiçbir yerde)
❌ `console.log` veya yorum kalıntıları
❌ "Built with React" tipi tanıtım
❌ Footer'da "Powered by ..." yazısı

# Kabul kriterleri (delivery checklist)

- [ ] Tek `index.html` dosyası, çift tıklayınca açılıyor
- [ ] Mobile (375px) görünümde her şey kusursuz, anket CTA hero'dan max 1 swipe uzakta
- [ ] Konuşmacı kartlarında doğru rozet renkleri (Garanti=yeşil, Avalanche=kırmızı)
- [ ] Primary CTA'da animated shine var
- [ ] Reveal-on-scroll çalışıyor
- [ ] `prefers-reduced-motion: reduce` ile animasyonlar kapanıyor
- [ ] Instagram + Luma linkleri otomatik UTM ekliyor
- [ ] Anket URL'si `SURVEY_URL` const'unda — placeholder kalsın, sonradan değişecek
- [ ] Lighthouse performance > 95, accessibility > 95
- [ ] Sayfa açıldığında "WOW" hissi: gradient hero, parlayan CTA, cam kartlar — tek bakışta premium

# Son not

Bu sayfa **profesyonel bir topluluk imajının dijital yüzü**. Garanti BBVA gibi bir kurumsal partneri ve Avalanche gibi bir uluslararası ekibi taşıyor. Generic bir "linktree" değil. Sayfanın hissi şu cümleyi söyletmeli: *"Bu topluluk gerçekten ciddi iş yapıyor — bir sonrakine de geleceğim."*

Son artifact'i tek seferde teslim et. Şüpheye düştüğünde **daha sade** tarafa kay, ama **daha az opinionated** tarafa kayma.

--- /PROMPT ---
