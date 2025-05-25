# mini_posts_app
Flutter приложение, написаное с использованием **Provider** и **ChangeNotifier**

**Flutter SDK**: 3.29.3

# Для запуска:
1. Клонируйте репозиторий себе на ПК.
2. Откройте код в удобной IDE (для написания использовался VSCode).
3. Запустите эмулятор или подключите физ. устройство.
4. На выбор запустите в debug или в release моде:

```bash
flutter run
```

# Альтернатива
1. Установите APK-файл на физическое устройство.
2. Запустите приложение.

# Технологии
**Provider** отвечает за предоставление данных и управление состоянием между виджетами.
**ChangeNotifier** — класс, который уведомляет слушателей об изменениях данных.

# Структура проекта
## **/lib/core**
- domain/navigation/router.dart — навигация
- presentation/bottom_nav_bar.dart — нижняя панель навигации
- domain/di_container/ — DI-контейнер
- utils/filter_posts.dart — утилита для фильтрации постов
- domain/post_fetch_exception.dart — исключения при получении постов
## **/lib/features**
### features/mini_posts/
- presentation/main_page/ — экран со списком постов
- presentation/detailed_post_page/ — экран с подробной информацией о посте
- data/model/ — модель поста
- data/data_source/ — реализация API-клиента через Retrofit
- domain/repository/ — интерфейсы репозиториев
### features/feedback/
- presentation/ — страница обратной связи


## Юнит-тесты
**Юнит-тест** для утилиты фильтрации находится в:
test/filter_test.dart

## Для запуска тестов выполните: 
```bash
flutter test
```