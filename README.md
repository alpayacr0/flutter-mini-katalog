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

|                     Login                     |                    Hatalı Giriş                     |                  Ana Sayfa                   |
| :-------------------------------------------: | :-------------------------------------------------: | :------------------------------------------: |
| <img src="screenshots/login.png" width="200"> | <img src="screenshots/login-error.png" width="200"> | <img src="screenshots/home.png" width="200"> |

|                Filtrelenmiş Ana Sayfa                 |                      Sepet Rozeti                       |                     Boş Sepet                      |
| :---------------------------------------------------: | :-----------------------------------------------------: | :------------------------------------------------: |
| <img src="screenshots/home-filtered.png" width="200"> | <img src="screenshots/home-cart-badge.png" width="200"> | <img src="screenshots/cart-empty.png" width="200"> |

|                     Dolu Sepet                      |                       Ürün Detay                       |                     Checkout                     |
| :-------------------------------------------------: | :----------------------------------------------------: | :----------------------------------------------: |
| <img src="screenshots/cart-filled.png" width="200"> | <img src="screenshots/product-detail.png" width="200"> | <img src="screenshots/checkout.png" width="200"> |

|                     Sipariş Başarılı                     |
| :------------------------------------------------------: |
| <img src="screenshots/checkout-success.png" width="200"> |

## Not

Bu proje eğitim/demo amaçlıdır. Gerçek ödeme sistemi veya üretim e-ticaret altyapısı içermez.
