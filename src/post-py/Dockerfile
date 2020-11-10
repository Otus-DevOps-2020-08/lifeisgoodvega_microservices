FROM python:3.6.0-alpine

WORKDIR /app
COPY ./requirements.txt ./

RUN apk --no-cache --update add build-base && \
    pip install -r /app/requirements.txt && \
    apk del build-base

COPY docker_build.sh \
     helpers.py \
     post_app.py \
     VERSION \
     ./

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

ENTRYPOINT ["python3", "post_app.py"]
