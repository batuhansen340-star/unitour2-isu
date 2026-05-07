# 📋 UniTour #2 — Memnuniyet Anketi (Google Forms)

> **Nasıl kullanılır:** [forms.google.com](https://forms.google.com) → "Boş Form" → aşağıdaki blokları sırayla kopyala-yapıştır. Toplam: ~3 dakika.

---

## ⚙️ Form ayarları

- **Başlık:** `UniTour #2 — Memnuniyet Anketi`
- **Açıklama:**
  > 6 Mayıs 2026 — İSÜ Blockchain & Finance × Garanti BBVA Kripto × Avalanche Team1 Türkiye etkinliği için geri bildirimlerin değerli. 11 kısa soru, ~2 dakika. Cevapların anonim.
- **Ayarlar → Genel:**
  - ✅ E-posta adreslerini topla → **KAPALI** (anonimlik için)
  - ✅ Yanıtları sınırla → **KAPALI**
- **Ayarlar → Sunum:**
  - ✅ İlerleme çubuğunu göster → **AÇIK**
  - ✅ Soru sırasını karıştır → **KAPALI**
- **Tema:**
  - Renk: koyu mavi (`#0A1539` veya `#0066FF`)
  - Üst görsel: etkinlik afişi (opsiyonel)

---

## 🧩 Sorular

### 1. Hangi okuldan / programdan geliyorsun?
**Tip:** Kısa cevap
**Zorunlu:** ❌ Hayır
*(örn. "İSÜ — İşletme 3. sınıf")*

---

### 2. Etkinliği genel olarak nasıl değerlendirirsin?
**Tip:** Doğrusal ölçek (1–10)
**Zorunlu:** ✅ Evet
- 1 etiketi: `Hiç memnun değilim`
- 10 etiketi: `Mükemmeldi`

---

### 3. Sunum içeriklerinin **kalitesini** nasıl buldun?
**Tip:** Doğrusal ölçek (1–5)
**Zorunlu:** ✅ Evet
- 1 etiketi: `Zayıf`
- 5 etiketi: `Çok iyi`

---

### 4. Konuşmacıların bilgi paylaşımını nasıl buldun?
**Tip:** Çoklu seçim grid (matris)
**Zorunlu:** ✅ Evet

|                          | 1 ⭐ | 2 ⭐ | 3 ⭐ | 4 ⭐ | 5 ⭐ |
|--------------------------|------|------|------|------|------|
| Batuhan Demir (Garanti BBVA Kripto) |  |  |  |  |  |
| Hürsel Çay (Avalanche Team1)        |  |  |  |  |  |
| Ömer Aksu (Avalanche Team1 TR)      |  |  |  |  |  |

> **Forms'ta nasıl:** "Çoklu seçim ızgarası" → Satırlara isimleri, sütunlara `1 ⭐ … 5 ⭐` yaz.

---

### 5. Organizasyonu (lokasyon, akış, ikramlar) nasıl buldun?
**Tip:** Doğrusal ölçek (1–5)
**Zorunlu:** ✅ Evet

---

### 6. En çok hangi sunum / konu dikkatini çekti?
**Tip:** Açıklama paragrafı
**Zorunlu:** ❌ Hayır
*(Açık uçlu — kalite sinyali için altın)*

---

### 7. Bir sonraki UniTour'da hangi konuları görmek isterdin?
**Tip:** Onay kutuları (birden fazla seçilebilir)
**Zorunlu:** ❌ Hayır
- DeFi & getiri stratejileri
- NFT'nin kullanım alanları (oyun, kimlik, sanat)
- Türkiye'de kripto regülasyonu
- Stablecoin'ler ve ödeme altyapıları
- Kariyer & Web3'te iş bulmak
- Akıllı kontrat geliştirme (teknik)
- Kurumsal blockchain kullanımı
- ✏️ **Diğer:** _______ *(serbest metin)*

---

### 8. Bir sonraki UniTour etkinliğine gelir misin?
**Tip:** Çoktan seçmeli
**Zorunlu:** ✅ Evet
- 🟢 Kesinlikle gelirim
- 🟡 Belki — konuya göre
- 🔴 Sanmıyorum

---

### 9. Bir arkadaşına önerir misin? (NPS)
**Tip:** Doğrusal ölçek (0–10)
**Zorunlu:** ✅ Evet
- 0 etiketi: `Asla önermem`
- 10 etiketi: `Kesinlikle önereceğim`

---

### 10. Web3 fırsatlarından (staj, etkinlik, topluluk) haberdar olmak ister misin?
**Tip:** Kısa cevap
**Zorunlu:** ❌ Hayır
**Yardımcı metin:** *İletişim için e-posta veya Telegram bırakabilirsin (opsiyonel).*

---

### 11. Eklemek istediğin başka bir şey var mı? 💬
**Tip:** Açıklama paragrafı
**Zorunlu:** ❌ Hayır
*(En kıymetli kutu — açık uçlu öneriler genelde buradan çıkar.)*

---

## ✅ Form bitiş ekranı (Confirmation)

**Mesaj:**
> Teşekkürler! 💙
> Geri bildirimin bir sonraki UniTour'un yolunu çiziyor.
> Takipte kal: [@isublockchain](https://www.instagram.com/isublockchain/)

---

## 🔗 Form oluşturulduktan sonra

1. **"Yanıtları topla"** kontrol et — Google Sheets'e otomatik akıyor mu?
2. **"Gönder"** → **🔗 link** sekmesi → **"URL'yi kısalt"** ✅ → linki kopyala
3. Linki [`index.html`](./index.html) dosyasındaki `SURVEY_URL` değişkenine yapıştır:
   ```js
   const SURVEY_URL = "https://forms.gle/SENİN_LINK_BURASI";
   ```
4. Site otomatik UTM parametresi ekleyecek (`?utm_source=qr&utm_medium=event&utm_campaign=unitour2_isu`).

---

## 📊 Yanıt analizi için ipucu

- Forms → "Yanıtlar" → **"Sayfaya bağla"** ile Google Sheets'e otomatik akıt.
- NPS hesaplama: `Promoters (9-10) % − Detractors (0-6) %`.
- Açık uçlu cevapları (Soru 6, 11) tek tek oku — gerçek içgörü orada.
