## 📌 구현화면
<img width="300" src="/gif/week2.gif">

## 📌 사용한 LifeCycle

- `viewDidAppear` - 팝업창 띄울때 사용

```swift
// 팝업 창 체크
  override func viewDidAppear(_ animated: Bool) {
    print(UserDefaults.standard.bool(forKey: "popUp"))
    if UserDefaults.standard.bool(forKey: "popUp") == true {
      let popUpVC = PopUpViewController()
      popUpVC.modalPresentationStyle = .overCurrentContext
      self.present(popUpVC, animated: false)
    }
  }
```

- `viewWillAppear` - 네비게이션바 숨길 때 사용

```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
  }
```

- `sceneDidBecomeActive`, `sceneWillResignActive` - 스위처 모드에서 이미지뷰 처리

```swift
// 액티브 상태가 됐을 경우 - 이미지뷰 삭제
  func sceneDidBecomeActive(_ scene: UIScene) {
    if let imageView = imageView {
      imageView.removeFromSuperview()
    }
  }

  // Switcher모드 - window에 이미지 추가
  func sceneWillResignActive(_ scene: UIScene) {
    guard let window = window else {
      return
    }
    imageView = UIImageView(frame: window.frame)
    imageView?.image = UIImage(named: "switcher")
    window.addSubview(imageView!)
  }
```

## 📌 트러블슈팅

💡 **두 번째 VC에서 첫 번째 VC로 dismiss 하면서 데이터를 전달하고 싶음**

1. **`viewWillAppear` 로 표시**

```swift
// 첫번째 VC
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("optionCount\(optionCount)")
    if optionCount != 0 {
      optionLabel.text = "샷추가(\(String(optionCount))"
    }
  }
```

```swift
// 두번째 VC
@IBAction func ClickedSelect(_ sender: Any) {
    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailCoffeeMenu") as? DetailCoffeeMenuViewController else { return }
    vc.optionCount = count
    dismiss(animated: false)
  }
```
위처럼 구현했으나 `fullScreen`으로 presentStyle을 설정하지 않아 dismiss를 해도 `viewWillAppear`가 호출되지 않음 → **실패**

1. **`Protocol` 사용하여 `delegate` 로 데이터 전달**

```swift
// 두번째 VC

//1. 프로토콜 정의
protocol OptionCountProtocol {
  func dataSend(optionCount: Int)
}

// 2.delegate 프로퍼티 선언
var delegate: OptionCountProtocol?

// 3. 선택 버튼을 클릭하면 dataSend 호출
@IBAction func ClickedSelect(_ sender: Any) {
    delegate?.dataSend(optionCount: count) // delegate로 선택 옵션 수량 보냄
}
```

```swift
// 첫번째 VC

// 1. 프로토콜 채택 후 구현
extension DetailCoffeeMenuViewController: OptionCountProtocol {
  func dataSend(optionCount: Int) {
    print("dataSend")
    self.optionCount = optionCount
    if optionCount != 0 {
      optionLabel.text = "샷추가(\(String(optionCount)))"
    }
  }
}

// 2. delegate 대리자 위임
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "optionSegue" {
      guard let vc: OptionMenuViewController = segue.destination as? OptionMenuViewController else { return }
      vc.delegate = self
    }
}
```
두 번째 VC에서 선택한 옵션 첫번째 VC에 표시함 → **해결**
