# 🚀 SHIP — AnyDesk Üzerinden 5 Dakikada Bitir

Mac'e AnyDesk ile bağlandıktan sonra **3 adım, sırayla**. Hepsi bittiğinde site canlı, QR çalışıyor, anket toplama açık.

---

## 1️⃣ Google Form'u oluştur (~2 dk)

1. Mac'in tarayıcısında **[script.google.com](https://script.google.com)** aç
2. Sağ üstten **"+ Yeni proje"**
3. Sol panel'de açılan editöre, **`~/Desktop/unitour2-isu/create-form.gs`** dosyasının içeriğini yapıştır:
   - Finder → `~/Desktop/unitour2-isu/create-form.gs` → çift tıkla aç (TextEdit) → tümünü kopyala
   - Apps Script editörüne yapıştır (varsayılan kodun üstüne)
4. Üstteki **▶ Çalıştır** (Run) butonuna bas → fonksiyon olarak `createUniTour2Survey` seçili olsun
5. İlk seferde Google izin diyalogu çıkar → **"İzinleri inceleyin"** → kendi hesabını seç → **"Gelişmiş" → "(güvensiz) projeye git"** → **"İzin ver"**
6. Çalışma bitince alt panelde **"Yürütme günlüğü"** açılır, içinde 3 link görürsün:
   ```
   📝 EDIT URL  : ...
   🔗 PUBLIC URL : https://forms.gle/AbCdEfGh
   📊 SHEET URL : ...
   ```
7. **PUBLIC URL'i kopyala** — sonraki adımda lazım

---

## 2️⃣ Tek komutla deploy (~3 dk)

Mac'te **Terminal**'i aç (Spotlight: `cmd+space` → "Terminal"). Aşağıdaki komutu yapıştır, `BURAYA_FORM_LINKINI` yerine kopyaladığın PUBLIC URL'i koy:

```bash
cd ~/Desktop/unitour2-isu && bash deploy.sh "BURAYA_FORM_LINKINI"
```

**Örnek:**
```bash
cd ~/Desktop/unitour2-isu && bash deploy.sh "https://forms.gle/AbCdEfGh"
```

Script otomatik olarak:
- ✅ Form URL'ini index.html'e yapıştırır
- ✅ GitHub'da public repo açar (`unitour2-isu`)
- ✅ Kodu push'lar
- ✅ GitHub Pages'i aktif eder
- ✅ Build'i bekler (2-3 dk içinde URL canlı olur)
- ✅ QR'ları gerçek URL ile yeniden üretir
- ✅ QR'ları repo'ya push'lar

Bittiğinde terminalde şu çıktı görünür:
```
═════════════════════════════════════════════
  ✅  HAZIR — UniTour #2 yayında
═════════════════════════════════════════════

  🌐 Site:   https://batuhansen340-star.github.io/unitour2-isu
  📦 Repo:   https://github.com/batuhansen340-star/unitour2-isu
  📋 Form:   https://forms.gle/AbCdEfGh
  📱 QR:     qr/unitour2-qr.png  (afiş)
            qr/unitour2-qr.svg  (vektörel)
```

---

## 3️⃣ Test (~30 sn)

1. Telefonunla **`qr/unitour2-qr.png`**'i tara
2. Sayfa açılmalı, "Anket başla" butonuna tıkla → form açılmalı
3. Test cevapla → Sheet'e yansıdı mı kontrol et (`SHEET URL` linkinden)

✅ **Bitti.** Bir sonraki UniTour afişine `qr/unitour2-qr.svg`'i koy.

---

## ❓ Sorun çıkarsa

| Belirti | Çözüm |
|---|---|
| `gh: command not found` | `brew install gh` çalıştır, sonra `gh auth login` |
| `403 Forbidden` (Pages) | Manuel: github.com → repo → Settings → Pages → Source: main / root |
| Site 5 dk sonra hâlâ açılmıyor | Repo → Actions sekmesinde build hatası var mı bak |
| QR çalışmıyor | `qr/unitour2-qr-mono.png` (saf siyah-beyaz) varyantını dene, en güvenli okuyucu |

---

## 🎨 (Opsiyonel) Premium tasarım yükseltmesi

Site canlıya çıktıktan sonra istersen:
1. [claude.ai](https://claude.ai) → yeni sohbet (Use Artifacts ✅)
2. `CLAUDE_DESIGN_PROMPT_LANDING.md` içeriğini yapıştır + etkinlik afişini ekle
3. Çıkan artifact'ı indir → mevcut `index.html`'in üzerine yaz
4. Terminal:
   ```bash
   cd ~/Desktop/unitour2-isu
   git add index.html
   git commit -m "feat: premium tasarım"
   git push
   ```
5. 1-2 dakika içinde Pages otomatik yeniden deploy eder, URL aynı kalır, QR çalışmaya devam eder.
