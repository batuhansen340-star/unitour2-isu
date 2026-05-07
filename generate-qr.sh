#!/usr/bin/env bash
# UniTour #2 — QR kod generator
# Kullanım:  bash generate-qr.sh https://unitour2-isu.vercel.app

set -euo pipefail

URL="${1:-}"

if [ -z "$URL" ]; then
  echo "❌ Kullanım: bash generate-qr.sh <DEPLOYED_URL>"
  echo "   Örnek:  bash generate-qr.sh https://unitour2-isu.vercel.app"
  exit 1
fi

# UTM ekle (afişten gelen tıklamayı ayrı görebilmek için)
QR_URL="${URL}?utm_source=qr&utm_medium=poster&utm_campaign=unitour2_isu"

OUTDIR="$(dirname "$0")/qr"
mkdir -p "$OUTDIR"

# Renk paleti (afişle aynı koyu mavi)
DARK="0A1539FF"
LIGHT="FFFFFFFF"

echo "🔗 URL: $QR_URL"
echo "📦 Çıktılar: $OUTDIR/"
echo ""

# 1) PNG — yüksek çözünürlük (afiş baskısı için ideal), koyu mavi/beyaz
npx --yes qrcode "$QR_URL" \
  -o "$OUTDIR/unitour2-qr.png" \
  -t png \
  -w 1200 \
  -q 2 \
  -e H \
  -d "$DARK" \
  -l "$LIGHT"

# 2) SVG — sonsuz ölçeklenebilir (Figma / InDesign / Illustrator)
npx --yes qrcode "$QR_URL" \
  -o "$OUTDIR/unitour2-qr.svg" \
  -t svg \
  -q 2 \
  -e H \
  -d "$DARK" \
  -l "$LIGHT"

# 3) PNG — beyaz QR (koyu zemin üzerine, slayt/sosyal post için)
npx --yes qrcode "$QR_URL" \
  -o "$OUTDIR/unitour2-qr-light.png" \
  -t png \
  -w 1200 \
  -q 2 \
  -e H \
  -d "$LIGHT" \
  -l "$DARK"

# 4) PNG — saf siyah/beyaz (geriye dönük uyumluluk, en güvenli okuma)
npx --yes qrcode "$QR_URL" \
  -o "$OUTDIR/unitour2-qr-mono.png" \
  -t png \
  -w 1200 \
  -q 2 \
  -e H

echo ""
echo "✅ QR kodlar hazır:"
ls -lh "$OUTDIR/"
echo ""
echo "💡 İpucu: Afişe basarken 'H' (high) error correction kullanıldı."
echo "   Logo gömmek istersen ortaya %30'a kadar yer kaplayabilir, kod yine okunur."
echo "   Önerilen baskı boyutu: minimum 2.5cm × 2.5cm (yakın taramada güvenli)."
