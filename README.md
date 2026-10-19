# Mini Katalog Uygulaması

## Proje Hakkında

Bu proje, Flutter mobil geliştirme eğitimi kapsamında geliştirilmiş temel seviyede bir mini katalog uygulamasıdır. Uygulama; ürün listeleme, ürün detay ekranı, sepet ekleme/silme, arama/filtreleme ve temel local storage kullanımını içerir.

## Özellikler

- Login ekranı
- Ürün listesi ve arama kutusu
- Ürün detay sayfası
- Sepet ekranı
- Sepet ikonunda ürün adedi rozeti
- Basit checkout akışı
- API verisi çekme
- Shared Preferences ile kullanıcı bilgisi saklama

## Kullanılan Teknolojiler

- Flutter SDK 3.13.5+
- Dart SDK 3.x
- http
- shared_preferences
- Material Design

## Kurulum ve Çalıştırma

1. Projeyi klonlayın:

```bash
git clone <REPOSITORY_URL>
cd mini_katalog
```

2. Bağımlılıkları yükleyin:

```bash
flutter pub get
```

3. Uygulamayı çalıştırın:

```bash
flutter run
```

## Ekran Görüntüleri

Aşağıdaki ekran görüntüleri proje teslimi için kullanılabilir:

- Login ekranı: screenshots/login.png
- Hatalı giriş ekranı: screenshots/login-error.png
- Ana sayfa: screenshots/home.png
- Filtrelenmiş ana sayfa: screenshots/home-filtered.png
- Sepet rozeti görünümü: screenshots/home-cart-badge.png
- Boş sepet: screenshots/cart-empty.png
- Dolu sepet: screenshots/cart-filled.png
- Ürün detay: screenshots/product-detail.png
- Checkout ekranı: screenshots/checkout.png
- Sipariş başarılı ekranı: screenshots/checkout-success.png

## Not

Bu proje eğitim/demo amaçlıdır. Gerçek ödeme sistemi veya üretim e-ticaret altyapısı içermez.
