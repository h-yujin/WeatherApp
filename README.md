# WeatherApp   
![스크린샷 2024-03-20 오전 10 34 39](https://github.com/h-yujin/WeatherApp/assets/60815411/6e0abc05-a742-4071-a8f3-3acb6f0d88a1)
> 아키텍쳐 공부를 위해 제작해 본 날씨 정보 앱   
1. SwiftUI, MVVM 패턴   
2. 클린 아키텍처   



![스크린샷 2024-03-20 오전 10 43 36](https://github.com/h-yujin/WeatherApp/assets/60815411/de3ef7ba-842c-41b2-b7a9-4245445f5412)


:point_right: 클린 아키텍처   
-------------
- Data Layer : 네트워크 통신을 담당합니다. APIController가 실제 네트워크 통신을 담당하며, 결과를 Repository가 Domain Layer인 Service에 전달하게 됩니다.
- Domain Layer : 앱의 비즈니스 로직을 담당합니다. Service가 여기에 해당됩니다. Repository로부터 전달받은 DTO를 Model로 변환하여 ViewModel에 전달합니다.
- Presentation Layer : MVVM의 View와 ViewModel로 정의하여 UI 구현을 담당합니다.

MVVM에서 ViewModel의 비즈니스 로직을 다른 Layer로 분리하여 직접 네트워킹이나 데이터베이스 접근을 분리시킬 수 있습니다. 
이를 통해 MVVM을 독립적으로 사용하여 Testable한 코드를 작성할 수 있습니다.
또한 DI Contrainer를 통해 Service의 의존성을 주입받아 Presentation Layer와 Domain Layer의 의존성을 낮췄습니다.
