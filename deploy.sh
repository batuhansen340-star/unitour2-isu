#!/usr/bin/env bash
# UniTour #2 — Tek-komut end-to-end deploy
#
# KULLANIM:
#   bash deploy.sh "https://forms.gle/SENİN_FORM_LINKIN"
#
# Ne yapar:
#   1) Form URL'ini index.html'e yapıştırır
#   2) GitHub'a public repo açar + push'lar
#   3) GitHub Pages'i aktif eder
#   4) Pages live olunca QR kodunu gerçek URL ile yeniden üretir
#   5) QR'ları commit eder, push'lar
#   6) Final URL ve QR yollarını yazdırır

set -euo pipefail

FORM_URL="${1:-}"
REPO_NAME="unitour2-isu"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# ---- renk yardımcıları ----
B=$'\033[1m'; G=$'\033[32m'; Y=$'\033[33m'; R=$'\033[31m'; C=$'\033[36m'; D=$'\033[0m'

step() { echo ""; echo "${C}▸ $1${D}"; }
ok()   { echo "${G}✅ $1${D}"; }
warn() { echo "${Y}⚠  $1${D}"; }
fail() { echo "${R}❌ $1${D}"; exit 1; }

# ---- 0. Validate ----
[ -z "$FORM_URL" ] && fail "Kullanım: bash deploy.sh \"https://forms.gle/...\""
[[ "$FORM_URL" =~ ^https?:// ]] || fail "Form URL geçersiz: $FORM_URL"

command -v gh >/dev/null    || fail "gh CLI bulunamadı. brew install gh"
command -v git >/dev/null   || fail "git bulunamadı."
command -v npx >/dev/null   || fail "npx bulunamadı (Node.js gerekli)."

gh auth status >/dev/null 2>&1 || fail "gh auth gerekli: gh auth login"

step "0/6  Hazırlık doğrulandı"
ok "gh authed: $(gh api user --jq .login)"
ok "Form URL: $FORM_URL"

# ---- 1. Form URL'i index.html'e yapıştır ----
step "1/6  Form URL'i index.html'e işleniyor"
if grep -q 'REPLACE_WITH_GOOGLE_FORM_URL' index.html; then
  # macOS sed -i için boş string gerek
  sed -i '' "s|REPLACE_WITH_GOOGLE_FORM_URL|$FORM_URL|" index.html
  ok "SURVEY_URL güncellendi"
elif grep -q 'const SURVEY_URL = "https' index.html; then
  # Daha önceki bir URL'yi değiştir
  sed -i '' "s|const SURVEY_URL = \"https[^\"]*\"|const SURVEY_URL = \"$FORM_URL\"|" index.html
  ok "SURVEY_URL yeni URL ile değiştirildi"
else
  warn "index.html içinde SURVEY_URL placeholder bulunamadı, manuel kontrol et"
fi

git add index.html
git -c user.email="257037540+batuhansen340-star@users.noreply.github.com" \
    -c user.name="batuhansen340-star" \
    commit -q -m "feat: anket linkini bağla" 2>/dev/null || echo "  (değişiklik yok)"

# ---- 2. Public repo aç + push ----
step "2/6  GitHub'da public repo açılıyor: $REPO_NAME"
if gh repo view "$REPO_NAME" >/dev/null 2>&1; then
  warn "Repo zaten var, push'a geçiyorum"
  if ! git remote get-url origin >/dev/null 2>&1; then
    OWNER=$(gh api user --jq .login)
    git remote add origin "https://github.com/$OWNER/$REPO_NAME.git"
  fi
  git push -u origin main
else
  gh repo create "$REPO_NAME" \
    --public \
    --source=. \
    --push \
    --description "UniTour #2 — İSÜ Blockchain × Garanti BBVA Kripto × Avalanche Team1 — etkinlik sayfası"
fi
OWNER=$(gh api user --jq .login)
REPO_FULL="$OWNER/$REPO_NAME"
ok "Repo: https://github.com/$REPO_FULL"

# ---- 3. GitHub Pages aktif et ----
step "3/6  GitHub Pages aktif ediliyor"
PAGES_RESPONSE=$(gh api -X POST "/repos/$REPO_FULL/pages" \
  -f "source[branch]=main" -f "source[path]=/" 2>&1 || true)

if echo "$PAGES_RESPONSE" | grep -q '"html_url"'; then
  ok "Pages aktif edildi"
elif echo "$PAGES_RESPONSE" | grep -qi "already"; then
  ok "Pages zaten aktifti"
else
  echo "$PAGES_RESPONSE" | head -3
  warn "Pages enable çağrısı belirsiz; devam ediyorum (genelde 2 saniye sonra hazır)"
fi

LIVE_URL="https://${OWNER}.github.io/${REPO_NAME}"
ok "Hedef URL: $LIVE_URL"

# ---- 4. Pages build'i bekle ----
step "4/6  Pages build'i bekleniyor (2-3 dakika sürebilir)"
TRIES=0; MAX_TRIES=60  # 60 * 5s = 5 dk
until curl -fsSL -o /dev/null -w "%{http_code}" "$LIVE_URL" 2>/dev/null | grep -q "200"; do
  TRIES=$((TRIES+1))
  if [ $TRIES -ge $MAX_TRIES ]; then
    warn "5 dakikada cevap gelmedi. Repo Settings → Pages'i kontrol et."
    warn "Build durumu: https://github.com/$REPO_FULL/actions"
    break
  fi
  printf "."
  sleep 5
done
echo ""
HTTP_STATUS=$(curl -fsSL -o /dev/null -w "%{http_code}" "$LIVE_URL" 2>/dev/null || echo "000")
if [ "$HTTP_STATUS" = "200" ]; then
  ok "Site canlı: $LIVE_URL"
else
  warn "Site henüz erişilebilir değil (HTTP $HTTP_STATUS); QR'ı yine de oluşturuyorum"
fi

# ---- 5. QR'ı gerçek URL ile yeniden üret ----
step "5/6  QR kodları gerçek URL ile yeniden üretiliyor"
rm -rf qr && mkdir -p qr

QR_URL="${LIVE_URL}?utm_source=qr&utm_medium=poster&utm_campaign=unitour2_isu"
DARK="0A1539FF"; LIGHT="FFFFFFFF"

npx --yes qrcode "$QR_URL" -o qr/unitour2-qr.png       -t png -w 1200 -q 2 -e H -d "$DARK"  -l "$LIGHT" >/dev/null
npx --yes qrcode "$QR_URL" -o qr/unitour2-qr.svg       -t svg          -q 2 -e H -d "$DARK"  -l "$LIGHT" >/dev/null
npx --yes qrcode "$QR_URL" -o qr/unitour2-qr-light.png -t png -w 1200 -q 2 -e H -d "$LIGHT" -l "$DARK"  >/dev/null
npx --yes qrcode "$QR_URL" -o qr/unitour2-qr-mono.png  -t png -w 1200 -q 2 -e H >/dev/null
ok "4 varyant QR üretildi: qr/"

# ---- 6. QR commit + push ----
step "6/6  Final commit + push"
git add qr/ index.html
git -c user.email="257037540+batuhansen340-star@users.noreply.github.com" \
    -c user.name="batuhansen340-star" \
    commit -q -m "feat: QR kodları gerçek deploy URL'i ile üretildi" 2>/dev/null || echo "  (değişiklik yok)"
git push origin main

# ---- BİTTİ ----
echo ""
echo "${B}${G}════════════════════════════════════════════════════════${D}"
echo "${B}${G}  ✅  HAZIR — UniTour #2 yayında${D}"
echo "${B}${G}════════════════════════════════════════════════════════${D}"
echo ""
echo "  ${B}🌐 Site:${D}   $LIVE_URL"
echo "  ${B}📦 Repo:${D}   https://github.com/$REPO_FULL"
echo "  ${B}📋 Form:${D}   $FORM_URL"
echo "  ${B}📱 QR:${D}     qr/unitour2-qr.png  (afiş)"
echo "             qr/unitour2-qr.svg  (vektörel)"
echo ""
echo "  ${C}Telefonla qr/unitour2-qr.png'i tara, $LIVE_URL açılmalı.${D}"
echo ""
