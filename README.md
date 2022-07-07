# Cara penggunaan SDK
## Pertama
di Podfile kalian perlu meng-import sdk dengan cara di bawah (Anda bisa lihat contohnya di file podfile)

    pod 'ios-sdk-astrapay'

    post_install do |installer|
     installer.pods_project.targets.each do |target|
       target.build_configurations.each do |config|
         config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        end
      end
    end

## Kedua
    setup SDK dengan Auth Token dan tentukan build mode yang diinginkan
    dan meng-delegate delegasi dari QRNewRouterClass yang berisi 4 fungsi yang dijelaskan
    di tahap ke dua:

    , contoh:
    
    func setupSDK(){
        QRConfigurationSdk.AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk4NTQsImRldmljZUlkIjoiMTIzIiwidHJhbnNhY3Rpb25JZCI6IiIsInRyYW5zYWN0aW9uVHlwZSI6IiIsIm5iZiI6MTY1NTgwOTQ1NywiZXhwIjoxNjU1ODEzMDU3LCJpYXQiOjE2NTU4MDk0NTcsImp0aSI6ImU2NjdlNjMwLTU0YjQtNGIzZS1iMWMwLTM5NGI3MmU1NjI3OCIsImVtYWlsIjpbImdpbGJlcnQuc3ViYXlAYXN0cmFwYXkuY29tIl19.MhygTVbWfTlSbKxypqUrT8IHP87xKIal3rd4Q7pCTftmDrWIF31PGL8pOQ4Nd1aBelEhK2mbAbkDFAVbzItsd2LGdQ_nfnJH5rac2KDd6xN0WxXl07e3VMskgBMrlGtedhMHhx4IMdkcC6uXn5ezmnDbPNL5DpykcAsPbQWe8DE1VZrd_3OoUyHhwyd30Rtau20LIa61Hnv5gpUwQXplHR7oUJn6L875agKF5WzDEHhP2-hV-auPV7s6KJQZgdNdyMz_EFcMkgi9X_NhIWerfCRJkVlZBO6nfrsVvfYLqsx6IEHZD5Hg35JxjmBs1DRL20UNBiy01LIMf9PMlOR0Jg"
        QRConfigurationSdk.BUILD_MODE = .uat
        QRConfigurationSdk.SDK_TOKEN = "b983e0e72dd81d804262b9f1a7973ea11a2149df"
        QRNewRouter.sharedInstance.delegate = self
    }

## Ketiga
Mengimplementasikan 4 fungsi atau callback:
- func OnCancel(viewController: UIViewController)
  - untuk mengimplementasikan tombol back di QRScanner page
- func onComplete(viewController: UIViewController)
  - Untuk mengimplementasikan tombol "Kembali ke Beranda" pada Halaman Transaction Sukses
- func onForbidden(viewControler: UIViewController)
  - Untuk mengimplementasikan jika token habis
- func onShowHistory(viewController: UIViewController)
  - Untuk mengimplementasikan tombol "Lihat Riwayat" di halaman Transaction Process jika saat melakukan transaksi mengalami timeout
- func onProcessing(viewController: UIViewController)
  - Untuk mengimplementasikan tombol "Kembali Ke Beranda" pada halaman Transaction Process
- func onFailed(viewController: UIViewController)
  - Untuk mengimpelemtasikan Kembali Ke Beranda pada halaman Transaction Failed


## Keempat
Anda perlu meng-trigger fungsi:
**QRNewRouter.sharedInstance.navigateToQrScan(from: self)**
dengan tujuan agar dapat berpindah ke page QRScanner

Untuk penggunaan Webview-topup, anda dapat memanggil fungsi:
**WebviewRouter.sharedInstance.navigateToWebviewRouter(self)**


**Anda bisa melihat contoh implementasi dari semua ini di kelas ViewController**


