# AstraPay SDK Example Project
This repository is an example about how to implement AstraPay Sdk in your project.


## Steps to implement SDK

- Put this in your pod file
  - pod 'qris_sdk_astrapay' , '0.0.0.3'
  - post_install do |installer|
      installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
      end
      end
- pod install on your root project, (notes: it will download library that Astrapay Sdk use in your project)
- to provide authorization token to Astrapay Sdk and and to define build mode on Astrapay SDK, you should do these
  - You should make an instance of class QRConfigurationSdk
  - you should delegate of delegate of QRConfigurationSdk's instance
```
 override func viewDidLoad() {
        super.viewDidLoad()
        self.qrConfigurationSdk.delegateSdk = self
        self.setupRouter()
        self.setupButton()

    }
```
  - Implement datasource protocol named QRConfigurationSdkDataSource
    ```
    extension ViewController: QRConfigurationSdkDataSource{
    var authenticationToken: String? {
        return   "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk4NTQsImRldmljZUlkIjoiMTIzIiwidHJhbnNhY3Rpb25JZCI6IiIsInRyYW5zYWN0aW9uVHlwZSI6IiIsIm5iZiI6MTY1MDk4ODgzOSwiZXhwIjoxNjUwOTkyNDM5LCJpYXQiOjE2NTA5ODg4MzksImp0aSI6ImYwY2EwMDk3LWRkNzgtNDY3Mi04Y2Y1LTJmOTdhZWJlNTNhMyIsImVtYWlsIjpbImdpbGJlcnQuc3ViYXlAYXN0cmFwYXkuY29tIl19.BnqNhJXVtXilUYUuGvtp8v5LDs8UEuDVJCCZqtDDOPMhgmzzDqfL6bnriVVUnD82N3pOzv-CteATuc8eAogqMUcbr0F49dZAGgMMe1wrlOJ2kQMUrdqALxgUE2I1S6kbvs35PxOfpNJEn2daRF4Hfe1Jg9O08GzxnnYGmnR8jDbTT609xD1y38QGLGLkvpyag2vFdQCzOeWMMTAgX62wznhgMOgFU4DPvPczPkBo6kmIUY8HG5PNgFhIcx3O1YMLnwHFOXx6vimOvl812kEg-RGQCv1W_xd2oqEocLjZ4NkxVAAnsF5jUc3q_IdVEGGRoNyp4Ooo38aDOXweX9NUfQ"
    }
    
    var buildMode: BuildMode? {
        return .sit
      }
    }
    ```
  - You should trigger this function ("execute()") in order to your Auth token and build mode that you provide can be implemented by Astrapay Sdk->
    ```
            self.qrConfigurationSdk.execute()
    ```
- Then we still have protocol that you have to implement and you can implement as you like
  - didGoBackToHome(viewController: UIViewController)
    - this method implement "Kembali Ke Beranda"'s button
  - didUnAuthorized(viewControler: UIViewController)
    - you should implement this function if the authorization token that you provide is not valid to hit our API
  - didGoToHistoryList(viewController: UIViewController)
    - this method implement "Lihat Riwayat"'s button
- How to implement didGoBackToHome, didUnAuthorized, didGoToHistoryList?
  - you should put QRNewRouter's instance that Astrapay SDK has created in your own variabel and delegate of QRNewRouterProtocol to your class
    ```
        func setupRouter(){
        self.router = QRNewRouter.qrNewRouterShared
        self.router?.delegate = self
    }
    ```
  - implement all of the method, here is the example:
    ```
    class ViewController: UIViewController, QRNewRouterProtocol {
    func didGoBackToHome(viewController: UIViewController) {
        let homeVC = HomeViewController()
        viewController.navigationController?.pushViewController(homeVC, animated: true)
    }

    func didUnAuthorized(viewControler: UIViewController) {
        let loginVC = LoginViewController()
        viewControler.navigationController?.pushViewController(loginVC, animated: true)
    }

    func didGoToHistoryList(viewController: UIViewController) {
        let historyVC = HistoryViewController()
        viewController.navigationController?.pushViewController(historyVC, animated: true)
    }
    ```
  - And to start to move Sdk's QR Scanner, you should trigger function QRNewRouter.navivagetToQrScan(from: "Your view controller class")
    ```
     QRNewRouter.navigateToQrScan(from: self)
    ```
