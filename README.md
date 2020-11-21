[![Build Status](https://travis-ci.com/Otus-DevOps-2020-08/lifeisgoodvega_microservices.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2020-08/lifeisgoodvega_microservices)

# lifeisgoodvega_microservices
lifeisgoodvega microservices repository

## Домашнее задание docker-2
В процессе работы сделано
- Создан image на основе ubuntu, разница между image и container зафиксирована в dockermonolith/docker-1.log
- Docker-machine настроен на yc
- Создан image с докером и помещён в dockerhub
- В облаке создан host для docker и запущен reddit через docker
- Локально протестирован reddit

Проделано задание со звёздочкой:
- Сделан packer сценарий, который в качестве провижионера использует ансибл плейбук, который раскатывает docker
- Сделана terraform-структура, которая может поднять N инстансов
- В ансибле прописан динамический инвентори, который может на инстансы с терраформа раскатать монолит (плейбук monolith.yml) reddit'а полученный из docker hub'а

## Домашнее задание docker-3
Первое задание со звёздочкой с передачей ENV переменных через docker run.
Очерёдность команд:
- docker run -d --network=reddit --network-alias=for_posts --network-alias=for_comments -v reddit_db:/data/db mongo:latest
- docker run -d --network=reddit --network-alias=post_service --env POST_DATABASE_HOST=for_posts lifeisgoodvega/post:1.0
- docker run -d --network=reddit --network-alias=comment_service --env COMMENT_DATABASE_HOST=for_comments lifeisgoodvega/comment:1.0
- docker run -d --network=reddit -p 9292:9292 --env POST_SERVICE_HOST=post_service --env COMMENT_SERVICE_HOST=comment_service lifeisgoodvega/ui:1.0

Оптимизация для ui контейнера позволило сократить образ до 275 мегабайт

Также было проверено, что volume используется и посты с комментариями остаются после перезапуска контейнеров

## Домашнее задание docker-4
Вывод из контейнера с network = host практически не отличается от вывода самого docker-host за исключением формата вывода. Вывод сохранил в папку docker-4-artifacts

При запуске контейнера с nginx и network = host, работает только контейнер запущенный первый, посколько последующие вышли с ошибкой из-за невозможности занять тот же интерфейс

При запуске контейнера nginx с network = none был создан отдельный namespace

Был создан файл для env переменных, которые по умолчанию подхватывает docker-compose

Docker-compose по умолчанию делает префикс по имени директории, префикс можно задать так
```docker-compose -p MY_PROJECT up -d```

В docker-compose.override.yml были добавлены volume'ы для app папки сервисов ui, post и comment. Так же была переопределена команда запуска
