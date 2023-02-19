# TestForHedgehog
В данном проекте использовал архитектуру MVP.
Для управления сторонними зависимости выбрал Swift Package Manager.
Сторонние библиотеки: KingFisher, SnapKit.
Сетевой слой сделан на async/await.

## 1. MainView
>Экран поиска картинок
>При вводе запроса начинается анимация Activity Indicator и продолжается до окончания загрузки.
>Клавиатура исчезает при начале прокручивания collectionView.
>При нажатии на картинку, она открывается во весь экран.
>![Simulator Screen Shot - iPhone 8 - 2023-02-19 at 13 19 11](https://user-images.githubusercontent.com/95681991/219942361-c1f8bd05-084d-4a82-abef-f419a212777c.png)
>![Simulator Screen Shot - iPhone 8 - 2023-02-19 at 13 19 21](https://user-images.githubusercontent.com/95681991/219942472-183eefa8-0bfb-4321-a763-128de41a7f4c.png)
>![Simulator Screen Shot - iPhone 8 - 2023-02-19 at 13 19 05](https://user-images.githubusercontent.com/95681991/219942476-52ffbc1a-4483-4b9f-96dd-3c39b55da5de.png)

## 2. FullScreenPhotoView
> Экран отображения картинок на полный экран.
>При перелистывании на кнопки происходит кастомная анимация.
>При нажатии на кнопку "Open original source", открывается View с сайтом оригинально источника.
>![Simulator Screen Shot - iPhone 8 - 2023-02-19 at 13 19 38](https://user-images.githubusercontent.com/95681991/219942675-efafb693-7a66-48d1-b5c2-8506933e6815.png)

## 3. ShowOriginalView
>Экран отображения оригинального источника.
>Открывается модально. Для закрытия нужно смахнуть вью вниз.
> ![Simulator Screen Shot - iPhone 8 - 2023-02-19 at 13 19 55](https://user-images.githubusercontent.com/95681991/219942899-42a2610d-da9a-48b5-8e07-a7980f14820e.png)
