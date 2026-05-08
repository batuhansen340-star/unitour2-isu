# 🎨 Claude Design Prompt — Beyond The Chain'26 Zirvesi

> **Nasıl kullanılır:**
> 1. [claude.ai](https://claude.ai) → yeni sohbet (model: en yetenekli olan, **Use Artifacts ✅**)
> 2. Aşağıdaki `--- PROMPT ---` ile `--- /PROMPT ---` arasındaki **TÜM metni** kopyala
> 3. Sohbete yapıştır
> 4. (Opsiyonel ama tavsiye edilir) Şu görselleri ek olarak yükle:
>    - Mevcut sayfa screenshot'ı (mobilde ekran görüntüsü)
>    - `assets/logo.png` (resmi ISU Blockchain & Finance logosu)
>    - Etkinlik afişi
> 5. Çıkan artifact tek dosyalık `index.html` — indir, mevcut `beyond/index.html`'in üstüne yaz, push et
> 6. Vercel auto-deploy'da olmadığı için: `cd beyond && npx vercel --prod --yes` ile yeniden yayına al

---

--- PROMPT ---

# Rolün

Sen Awwwards "Site of the Day" kazanan, Apple keynote sayfaları, Linear changelog'ları ve Stripe doc'ları seviyesinde iş çıkaran bir senior product designer + frontend developer'sın. **Bu görev kritik:** İstinye Üniversitesi Blockchain ve Finans Kulübü'nün "Beyond The Chain'26 Zirvesi" etkinlik sayfasını profesyonelleştireceksin. Sayfa bir gerçek tasarımcının elinden çıkmış gibi durmalı — generic LLM-output gibi DEĞİL.

**Kalite çıtası:** Kullanıcı sayfayı açtığında "Bunu kim tasarladı, kalbim?" hissi vermeli. Her detay kasıtlı: tipografi rütbeleri, beyaz boşluk, mikro-etkileşimler, renk hiyerarşisi.

# Bağlam

**Etkinlik:** Beyond The Chain'26 Zirvesi
**Düzenleyen:** İstinye Üniversitesi Blockchain ve Finans Kulübü
**Tarih:** 15 Mayıs 2026, Cuma, 12.00 – 16.45
**Yer:** İstinye Üniversitesi · Vadi Ana Kampüs · Kongre Merkezi
**Konu:** Yapay zeka, finans, blockchain, kariyer ve Web3 zirvesi
**10 konuşmacı:** üniversite, IBM, Odeabank, Rlay Hub, Chainlink, IBW, Avalanche Team1, Turkish Technology

**Hedef kitle:** Türk üniversite öğrencileri (Z kuşağı), Web3'e ilgili. Çoğu sayfayı **QR'dan tarayıp telefonda** açacak — mobile-first, dikkat 5 saniye, ilk skroll'da fark yarat.

**Mevcut canlı versiyon:** `beyondthechain26.vercel.app` — yapı doğru, içerik tam, ama tasarım tonu hâlâ "Tailwind komponent" gibi. Sen bunu **gerçek tasarımcı işine** çevireceksin.

# Marka

**Kulüp logosu:** Hexagonal mavi blockchain logosu + "ISU BLOCKCHAIN & FINANCE" yazısı. (Sohbete eklediğim `logo.png`'yi ortada beyaz kart içinde göster.)

**Renk paleti** (afişle uyumlu, **navy + sky-brand** — mor değil):
- `--ink-950: #05091F` (en derin BG)
- `--ink-900: #0A1539` (ana surface)
- `--ink-800: #0F1F4D` (yükseltilmiş kart)
- `--ink-700: #16307A` (hover/glow)
- `--sky-brand: #3B9EFF` (PRIMARY accent, link, vurgu)
- `--sky-deep: #0066FF` (gradient sonu, derin)
- Text: `#E6ECFF` (gövde), `#FFFFFF` (vurgu), `rgba(230,236,255,0.6)` (muted)

**Tipografi (Google Fonts):**
- **Display (başlıklar):** Cormorant Garamond 600/700 + 400 italic — klasik, edebi, premium gazete havası
- **Sans (gövde):** Inter 400/500/600 — modern, okunabilir
- Headings'de `letter-spacing: -0.01em` ila `-0.02em`, `line-height: 1.05` ila `1.1`
- Saat/sayı'da `tabular-nums` zorunlu (timeline hizalama için)

**Mood referansları:**
- Apple Newsroom etkinlik sayfaları (sıcak serif başlıklar)
- Linear "Built for the way" sayfası (tipografi rütbesi)
- Stripe Sessions hero (gradient + serif)
- Apollo Magazine'in dijital sürümü (italic kullanımı)
- **AVOID:** Bootstrap kart şablonları, Material UI gradients, "Web3 hacker neon", emoji-fest

# YAPI (sırasıyla, hiç değiştirme)

```
1. Logo (beyaz kart içinde, ortalanmış)
2. Hero: başlık + alt başlık
3. Meta strip: tarih + saat + lokasyon
4. 5 tema rozeti
5. 4 sosyal ikon (IG · YT · X · LinkedIn)
6. 6 pill kart (Linktree-tarzı)
7. Akış timeline (17 satır — DOLU)
8. Etkinlik Hakkında — Beş Tema şeması (5 detaylı kart)
9. Mini stat strip (5+ saat · 10 konuşmacı · 5 tema)
10. Linktree pill CTA
11. Footer
```

# İÇERİK (kelime kelime kullan, hiçbir şey atlama, çevirme)

## 2. Hero
- **Başlık (H1, display serif):** `Beyond The Chain'26 Zirvesi`
  - "'26" italik, font-weight 500
- **Alt başlık (italik display):** `İstinye Üniversitesi Blockchain ve Finans Kulübü`

## 3. Meta strip
- **Tarih:** `15 Mayıs 2026 · Cuma`
- **Saat:** `12.00 – 16.45` (tabular nums)
- **Yer:** `İstinye Üniversitesi · Vadi Ana Kampüs · Kongre Merkezi`

## 4. 5 Tema rozeti (yatay, küçük pill rozet)
- Yapay Zeka · Finans · Blockchain · Kariyer · Web3

## 5. 4 sosyal ikon (linkler)
- Instagram → `https://www.instagram.com/isublockchain/`
- YouTube → `https://www.youtube.com/@isublockchain`
- X → `https://x.com/isublockchain`
- LinkedIn → `https://www.linkedin.com/in/istinye-university-blockchain-and-finance-club/`

## 6. 6 Pill kart (Linktree-tarzı: ikon sol + metin orta + 3-nokta sağ)
1. **Instagram** → `https://www.instagram.com/isublockchain/`
2. **LinkedIn** → `https://www.linkedin.com/in/istinye-university-blockchain-and-finance-club/`
3. **YouTube** → `https://www.youtube.com/@isublockchain`
4. **X** → `https://x.com/isublockchain`
5. **ISU Blockchain & Finance Club** → `https://isublockchain.tech/`
6. **Istinye University Blockchain and Finance Tech · Luma** → `https://luma.com/user/isublockchain`

## 7. AKIŞ — 17 satırlık timeline (saat + isim + ünvan)

| Saat | İçerik |
|---|---|
| 11.30 – 12.00 | **Kayıt & Karşılama** |
| 12.00 – 12.05 | **İlksen Aden Kömürcü** — _Açılış · Kulüp Başkanı_ |
| 12.05 – 12.10 | **Dr. Öğr. Üyesi Merve Yurdabak** — _Açılış · Kulüp Danışman Hocası_ |
| 12.10 – 12.50 | **Gaye Çalışkaner** — _IBM · Strategy Designer_ |
| 12.50 – 13.10 | **Emine Zengin** — _Odeabank · BT Yönetişim Müdürü_ |
| 13.10 – 13.20 | _Kahve arası & networking_ (mola — soluk göster) |
| 13.20 – 13.40 | **Sinancan Öztürk** — _Rlay Hub · Kurucu_ |
| 13.40 – 13.50 | **Samet Dökmeci** — _Chainlink Türkiye · Community Manager_ |
| 13.50 – 14.00 | _Mola_ (soluk) |
| 14.00 – 14.20 | **Dr. Irmak Yolcu** — _İstanbul Blockchain Women (IBW) · Yönetim Kurulu Üyesi_ |
| 14.20 – 14.40 | _Öğle arası & networking_ (soluk) |
| 14.40 – 15.00 | **Hürsel Çay** — _Avalanche Team1 Türkiye · Country Lead_ |
| 15.00 – 15.40 | **Turan Sert & Merve Yurdabak** — _Q&A oturumu_ |
| 15.40 – 15.50 | _Kahve arası & networking_ (soluk) |
| 15.50 – 16.10 | **Oya Aydınlık** — _Odeabank · Yönetim Kurulu Üyesi_ |
| 16.10 – 16.40 | **Hüseyin Çam** — _Turkish Technology · IT Team Lead_ |
| 16.40 – 16.45 | **Kapanış** |

## 8. Etkinlik Hakkında — 5 tema kartı

| Tema | Kısa açıklama |
|---|---|
| **Yapay Zeka** | Üretken AI'nın finans ve blockchain ile kesişimi |
| **Finans** | Geleneksel finansın dijital dönüşümü ve kripto piyasaları |
| **Blockchain** | Merkeziyetsiz altyapı, akıllı kontratlar ve dApp ekosistemi |
| **Kariyer** | Web3 dünyasında iş bulma yolları, networking ve fırsat keşfi |
| **Web3** | Token ekonomisi, DAO'lar ve geleceğin merkeziyetsiz interneti |

## 9. Mini stat strip (3 sütun)
- `5+` SAAT
- `10` KONUŞMACI
- `5` TEMA

## 10. Linktree pill CTA
- "Linktree'de beyondthechain ile katılın" → `https://linktr.ee/beyondthechain`

## 11. Footer
- "İSÜ Blockchain ve Finans Kulübü · 2026" (italic, küçük, muted)

# Tasarım yönü (kritik — burası "kusursuz" yapan yer)

## Tipografi (en kritik fark)
- **Hero başlık:** Cormorant Garamond 700, 32-40px (mobil), `letter-spacing: -0.015em`, `line-height: 1.05`. "'26" italik 500. Beyaz → açık mavi gradient text mask.
- **Section başlıkları:** Display serif, 24-30px, italik küçük "eyebrow" üstte (`tracking: 0.32em uppercase, sky-brand, 10px`).
- **Konuşmacı isimleri:** Cormorant 600, 17px, beyaz.
- **Konuşmacı pozisyonu:** Cormorant 400 italic, 12.5px, white/60. **"·" ile ayır** (örn. "IBM · Strategy Designer").
- **Saatler:** Cormorant 500 italic, 14px, sky-brand, **tabular-nums**.
- **Body metin:** Inter 400, 13-14px, white/85.

## Renk hiyerarşi
- **Tek bir accent kullan:** `#3B9EFF` (sky-brand). Sadece linkler, vurgular, eyebrow'larda.
- Geri kalan: white tonları (100, 85, 65, 40, 20).
- **Gradient:** sadece BG için, içerikte değil.
- Hover'da: opacity yükselt, renk değiştirme.

## Boşluk ritmi
- Sections arası: `mt-12` ile `mt-16` arası (konteksta göre)
- Card içi: `py-3 px-3.5`
- Pill kart yüksekliği: 52-56px
- Hairline divider: `--sky-brand 0.45 alpha`, 60-70% genişlik, ortalanmış

## BG sistemi (zarif gradient + spotlights)
```css
background:
  radial-gradient(900px 700px at 15% -5%, #16307A 0%, transparent 55%),
  radial-gradient(800px 600px at 110% 25%, rgba(0,102,255,0.22) 0%, transparent 60%),
  radial-gradient(1100px 800px at 50% 100%, rgba(59,158,255,0.10) 0%, transparent 65%),
  linear-gradient(180deg, #05091F 0%, #0A1539 25%, #16307A 55%, #0A1539 80%, #05091F 100%);
```

## Pill kartlar (Linktree-tarzı + mavi glow)
```css
background:
  radial-gradient(150% 280% at 50% 50%, rgba(59,158,255,0.32) 0%, rgba(0,102,255,0.10) 50%, transparent 80%);
border: 1px solid rgba(255,255,255,0.22);
border-radius: 14px;
padding: 14px 44px 14px 52px;
```
- İkon sol (24×24, padded square, transparent BG, white stroke ikon)
- Metin orta (centered, 15px, font-weight 500)
- 3-nokta dots sağ (white/55, decorative)
- Hover: border 0.36, BG saturate +10%, translateY(-1px)

## Akış timeline — burada parla
- Sol kenarda dikey çizgi (`linear-gradient sky-brand 0.35 → 0.05`)
- Her madde başında 9px `sky-brand` daire + glow halo (`box-shadow: 0 0 0 4px sky-brand 0.18`)
- Mola/networking satırları: gri nokta (sky-brand yerine `white/35`), opacity 0.7
- Saat: italik display serif, sky-brand
- İsim: bold display serif, beyaz
- Pozisyon: italic display serif, white/60, "·" separator
- **Mikro detay:** Q&A satırında "Q&A" mono font ile yaz (`JetBrains Mono` opsiyonel)

## Mikro etkileşimler
- Reveal-on-scroll: `IntersectionObserver`, fade-up 0.55s ease-out
- Hover'da kartlarda: 1px lift + border parlaması (translate Y dikkatli)
- Linkte: ok ikonu 2px sağa kayar
- **`prefers-reduced-motion: reduce`** ile TÜM animasyonları kapat (zorunlu)
- Selection rengi: `bg-sky-brand/30 text-white`

## Decorative touches (gerçek tasarımcı işareti)
- Section eyebrow'larda **küçük ornamental ayraçlar** (örn. tarih satırından önce `—`)
- Footer'dan önce **hairline divider** (60% genişlik, sky-brand alpha)
- Logo etrafında **subtle drop-shadow** (rgba navy 0.2)
- Q&A gibi özel oturumlarda **mono accent** (typewriter feel)
- Akış sonunda kapanış satırı: **sadece nokta yok, kart içinde** dramatik final

# Teknik şartlar

- **Output:** Tek dosya `index.html`, inline `<style>` ve `<script>`. React/Next.js DEĞİL.
- **Tailwind:** Play CDN (`https://cdn.tailwindcss.com`). Inline `tailwind.config` ile renkler.
- **Fontlar:** Google Fonts preconnect + tek `<link>`: `Cormorant+Garamond:ital,wght@0,500;0,600;0,700;1,400;1,500;1,600&family=Inter:wght@400;500;600;700`
- **Logo dosyası:** `<img src="assets/logo.png">` referansla — kullanıcı dosyayı klasöre koyacak.
- **Bağımlılık:** Hiç. Tek dosya, çift tıkla aç → çalış.
- **Hedef genişlik:** `max-width: 460px` ortalanmış (Linktree-tarzı). Tablet/desktop'ta da bu kalsın — etkinlik sayfası genişletilmez.
- **Boyut:** index.html < 30KB.

# SEO + Open Graph
```html
<title>Beyond The Chain '26 Zirvesi</title>
<meta name="description" content="İstinye Üniversitesi Blockchain ve Finans Kulübü — 15 Mayıs 2026 · Yapay zeka, finans, blockchain ve Web3 zirvesi." />
<meta property="og:title" content="Beyond The Chain '26 Zirvesi" />
<meta property="og:description" content="İstinye Üniversitesi · 15 Mayıs 2026 · Yapay Zeka · Finans · Blockchain · Kariyer · Web3" />
<meta name="theme-color" content="#0A1539" />
<link rel="icon" type="image/png" href="assets/logo.png" />
```

# UTM otomatik ekleme (JS)
Tüm `[data-utm]` linklerine query params ekle:
```js
?utm_source=qr&utm_medium=event&utm_campaign=beyond_chain_26&utm_content=<dataset.utm>
```

# Kaçınılması gerekenler

❌ Hover'da büyüme (cringe)
❌ Bouncy animasyonlar (cubic-bezier abartısı)
❌ "Web3 hacker neon green/purple" estetiği
❌ Stock illustrations, AI-generated images
❌ Glassmorphism abartısı (her kartta blur)
❌ Çok fazla emoji (max 1-2 yerde, fonksiyonel)
❌ "Powered by ___" footer
❌ Cookie banner / popup / modal — yok
❌ Newsletter signup — istenmedi
❌ Karusel slider — istenmedi
❌ "Save the date" gimmick — istenmedi
❌ Generic shadcn/ui card görünümü
❌ "Built with React/Next.js" markası

# Kabul kriterleri

- [ ] Tek dosyalık `index.html`, çift tık → çalışıyor
- [ ] Mobile (375px) görünümde her şey kusursuz, scroll akıcı
- [ ] Cormorant Garamond başlıklar yüklü ve render oluyor
- [ ] Hero'da gradient text efekti var
- [ ] 6 pill kart Linktree-tarzı (ikon-metin-3nokta)
- [ ] 17 satırlık akış timeline DOLU, mola satırları soluk + farklı renk nokta
- [ ] 5 tema kartı detaylı açıklama ile
- [ ] Mini stat strip (5+ saat · 10 konuşmacı · 5 tema)
- [ ] Linktree CTA pill alta
- [ ] Footer minimal, hairline divider
- [ ] `prefers-reduced-motion: reduce` ile animasyonlar kapanıyor
- [ ] Lighthouse mobil performans > 95, accessibility > 95
- [ ] **Sayfayı açtığında "Bunu kim tasarladı?" hissi var**

# Son not

Bu sayfa **gerçek bir kulübün gerçek bir etkinliği için**. Kulüp danışmanı, başkan, 10 konuşmacı, IBM ve Odeabank gibi kurumsal partnerler. Sayfa onlara saygı gösterecek seviyede olmalı.

Şüpheye düştüğünde: **daha az** ekle, **daha sessiz** yap, **daha okunaklı** kıl. Generic LLM-output görünümünden uzak dur. Tipografi rütbesi ve beyaz boşluk = gerçek tasarımcı işareti.

Tek artifact'te teslim et. Kullanıcı indirip `beyond/index.html` üzerine yazacak.

--- /PROMPT ---

---

## 📎 Ekstra: claude.ai'ye yüklenecek dosyalar

1. **`assets/logo.png`** — `~/Desktop/unitour2-isu/beyond/assets/logo.png` (resmi ISU Blockchain logosu)
2. **Mevcut sayfanın screenshot'ı** — `https://beyondthechain26.vercel.app` aç → mobil/desktop screenshot al
3. **Etkinlik afişi** (varsa) — başlangıçta sana attığım poster

claude.ai sohbetinde paperclip → bu 3 dosyayı ekle → prompt yapıştır → "Send".

## 🔧 Çıktıyı uygulama

Claude artifact'i tek HTML dosyası verecek. Şu adımları izle:

```bash
# 1. Artifact'i indir (claude.ai'de "Download" butonu)
# 2. Mevcut beyond/index.html'in üzerine yaz:
cp ~/Downloads/beyond-claude-design.html ~/Desktop/unitour2-isu/beyond/index.html

# 3. Push:
cd ~/Desktop/unitour2-isu
git add beyond/index.html
git -c user.email="257037540+batuhansen340-star@users.noreply.github.com" \
    -c user.name="batuhansen340-star" \
    commit -m "feat(beyond): Claude Design v2 tasarım"
USER_APPROVED_MAIN_PUSH=1 git push origin main

# 4. Vercel re-deploy:
cd beyond
npx vercel --prod --yes
npx vercel alias set <yeni-deploy-url> beyondthechain26.vercel.app
```

URL aynı (`beyondthechain26.vercel.app`), QR çalışmaya devam eder, sayfa yeni tasarımla yenilenir.

---

## 💡 İpuçları

- **Birden fazla version alabilirsin:** Claude'a "Önce daha minimal bir versiyon, sonra daha cesur bir versiyon yap" diyebilirsin. İki artifact karşılaştırırsın.
- **Iterate et:** İlk çıktı %85 iyi olur. "Hero'yu daha büyük yap", "akış timeline'ında saatleri daha vurgulu yap" gibi spesifik değişiklikler iste.
- **Logo'yu yüklemen önemli:** Aksi halde Claude SVG ile temsili logo yapar, gerçek olmaz.
