# [5주차 개발일지] 영화 앱

## 📌 구현화면

<img width="400" src="/gif/week5.gif">

## 📌 사용한 API

- [카카오 로그인 API](https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api)
  - 닉네임과 프로필 사진 가져옴

- [일별 박스오피스 API](https://www.kobis.or.kr/kobisopenapi/homepg/apiservice/searchServiceInfo.do)
- [주간 박스오피스 API](https://www.kobis.or.kr/kobisopenapi/homepg/apiservice/searchServiceInfo.do)
  - 1~10위 보여줌

- [영화 상세정보 API ](https://www.kobis.or.kr/kobisopenapi/homepg/apiservice/searchServiceInfo.do)
  - 일별 순위, 주간 순위에 있는 영화나 검색한 영화를 클릭하면 보여줌
- [영화목록 API](https://www.kobis.or.kr/kobisopenapi/homepg/apiservice/searchServiceInfo.do)
  - 검색한 영화 목록 보여줌
- [Naver Map API](https://www.ncloud.com/product/applicationService/maps)
- [영화 상영업체 API](https://data.gg.go.kr/portal/data/service/selectServicePage.do?page=1&rows=10&sortColumn=&sortDirection=&infId=GRF4D0ECQVG34A1CMG331418540&infSeq=1&order=&searchWord=영화관)
  - 상영관 마커를 띄워줌
  - 현재 위치로 자동으로 이동
    



## 📌 트러블 슈팅

```swift
"The data couldn’t be read because it is missing"
```

- 영화 상영업체 JSON 데이터를 파싱 과정에서 이 에러가 자꾸 뜸
  - json에서 swift struct로 자동 변환해주는 `quickType` 사이트로 **해결**
  - 프로퍼티명 잘못쓰고 옵셔널을 붙이지 않아서 생긴 문제
    

```swift
// 한글 인코딩
    let urlString = "<http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=66fe30704179395a87cdaa98664e6a63&movieNm=\\(searchResult)>"
    guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
    guard let url = URL(string: encodedString) else { return }
```

- 검색한 영화 목록 데이터 파싱 안됨 → 쿼리에 한글이 들어가서 생긴 에러
  - 한글 인코딩 해주며 **해결**
    

```swift
'cyclone' is not a recognized processor for this target (ignoring processor)
```

- Naver Map이 시뮬레이터에서 위 에러와 함께 뜨지 않음 → **미해결**
- [여기](https://developer.apple.com/forums/thread/658330)에서 보면 m1칩 문제라고 함
- 실제 디바이스에선 실행이 되어서 이걸로 진행

