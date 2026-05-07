/**
 * UniTour #2 — Memnuniyet Anketi (Otomatik Form Oluşturucu)
 *
 * Tek tıkla Google Form'u kendi hesabında oluşturur.
 *
 * NASIL ÇALIŞTIRILIR:
 *   1) https://script.google.com → "Yeni proje"
 *   2) Bu dosyanın içeriğini yapıştır (Code.gs üzerine)
 *   3) Üstte "Çalıştır" (▶ Run) butonuna bas → "createUniTour2Survey" seç
 *   4) İlk seferde Google izin ister: "Drive" + "Forms" erişimi onayla
 *   5) Logs panelinde 2 link çıkar:
 *      - 📝 EDIT URL (formu düzenlemek için)
 *      - 🔗 PUBLIC URL  (sayfaya yapıştırılacak link — bu önemli)
 *   6) PUBLIC URL'i kopyala, repo'da index.html → SURVEY_URL değişkenine yapıştır
 */

function createUniTour2Survey() {
  const form = FormApp.create('UniTour #2 — Memnuniyet Anketi');
  form.setTitle('UniTour #2 — Memnuniyet Anketi');
  form.setDescription(
    '6 Mayıs 2026 — İSÜ Blockchain & Finance × Garanti BBVA Kripto × Avalanche Team1 Türkiye etkinliği için geri bildirimlerin değerli. ' +
    '11 kısa soru, ~2 dakika. Cevapların anonim.'
  );
  form.setCollectEmail(false);
  form.setShowLinkToRespondAgain(false);
  form.setProgressBar(true);
  form.setShuffleQuestions(false);
  form.setConfirmationMessage(
    'Teşekkürler! 💙 Geri bildirimin bir sonraki UniTour\'un yolunu çiziyor. ' +
    'Takipte kal: instagram.com/isublockchain'
  );

  // 1
  form.addTextItem()
    .setTitle('Hangi okuldan / programdan geliyorsun?')
    .setHelpText('Örn: İSÜ — İşletme 3. sınıf')
    .setRequired(false);

  // 2
  form.addScaleItem()
    .setTitle('Etkinliği genel olarak nasıl değerlendirirsin?')
    .setBounds(1, 10)
    .setLabels('Hiç memnun değilim', 'Mükemmeldi')
    .setRequired(true);

  // 3
  form.addScaleItem()
    .setTitle('Sunum içeriklerinin kalitesini nasıl buldun?')
    .setBounds(1, 5)
    .setLabels('Zayıf', 'Çok iyi')
    .setRequired(true);

  // 4 — Konuşmacı grid (matris)
  form.addGridItem()
    .setTitle('Konuşmacıların bilgi paylaşımını nasıl buldun?')
    .setRows([
      'Batuhan Demir (Garanti BBVA Kripto)',
      'Hürsel Çay (Avalanche Team1)',
      'Ömer Aksu (Avalanche Team1 Türkiye)'
    ])
    .setColumns(['1 ⭐', '2 ⭐', '3 ⭐', '4 ⭐', '5 ⭐'])
    .setRequired(true);

  // 5
  form.addScaleItem()
    .setTitle('Organizasyonu (lokasyon, akış, ikramlar) nasıl buldun?')
    .setBounds(1, 5)
    .setLabels('Zayıf', 'Çok iyi')
    .setRequired(true);

  // 6
  form.addParagraphTextItem()
    .setTitle('En çok hangi sunum / konu dikkatini çekti?')
    .setHelpText('Birkaç cümle yeter — açık uçlu cevap.')
    .setRequired(false);

  // 7
  form.addCheckboxItem()
    .setTitle('Bir sonraki UniTour\'da hangi konuları görmek isterdin?')
    .setHelpText('Birden fazla seçebilirsin.')
    .setChoiceValues([
      'DeFi & getiri stratejileri',
      'NFT\'nin kullanım alanları (oyun, kimlik, sanat)',
      'Türkiye\'de kripto regülasyonu',
      'Stablecoin\'ler ve ödeme altyapıları',
      'Kariyer & Web3\'te iş bulmak',
      'Akıllı kontrat geliştirme (teknik)',
      'Kurumsal blockchain kullanımı'
    ])
    .showOtherOption(true)
    .setRequired(false);

  // 8
  form.addMultipleChoiceItem()
    .setTitle('Bir sonraki UniTour etkinliğine gelir misin?')
    .setChoiceValues([
      'Kesinlikle gelirim',
      'Belki — konuya göre',
      'Sanmıyorum'
    ])
    .setRequired(true);

  // 9 — NPS
  form.addScaleItem()
    .setTitle('Bir arkadaşına önerir misin? (0 = asla, 10 = kesinlikle)')
    .setBounds(0, 10)
    .setLabels('Asla önermem', 'Kesinlikle önereceğim')
    .setRequired(true);

  // 10
  form.addTextItem()
    .setTitle('Web3 fırsatlarından (staj, etkinlik, topluluk) haberdar olmak ister misin?')
    .setHelpText('İletişim için e-posta veya Telegram bırakabilirsin (opsiyonel).')
    .setRequired(false);

  // 11
  form.addParagraphTextItem()
    .setTitle('Eklemek istediğin başka bir şey var mı? 💬')
    .setHelpText('En kıymetli kutu — açık uçlu öneri / serzenişt / övgü her şey gelsin.')
    .setRequired(false);

  // Yanıtları otomatik Sheets'e bağla
  const sheet = SpreadsheetApp.create('UniTour #2 — Anket Yanıtları');
  form.setDestination(FormApp.DestinationType.SPREADSHEET, sheet.getId());

  const editUrl = form.getEditUrl();
  const publicUrl = form.shortenFormUrl(form.getPublishedUrl());
  const sheetUrl = sheet.getUrl();

  Logger.log('');
  Logger.log('✅ FORM HAZIR');
  Logger.log('-----------------------------------');
  Logger.log('📝 EDIT URL  (formu düzenlemek için): ' + editUrl);
  Logger.log('🔗 PUBLIC URL (siteye yapıştırılacak): ' + publicUrl);
  Logger.log('📊 SHEET URL (yanıtlar burada birikecek): ' + sheetUrl);
  Logger.log('-----------------------------------');
  Logger.log('');
  Logger.log('Sonraki adım: PUBLIC URL\'i kopyala, ');
  Logger.log('repo\'daki index.html dosyasında SURVEY_URL = "..." satırına yapıştır.');

  return { editUrl, publicUrl, sheetUrl };
}
