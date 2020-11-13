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
- В ансибле прописан динамический инвентори, который может на инстансы с терраформа раскатать монолит reddit'а полученный из docker hub'а
