FROM python:3.7-slim as production

ENV PYTHONUNBUFFERED=1
WORKDIR /app/

RUN apt-get update && \
    apt-get install -y \
    bash \
    build-essential \
    gcc \
    libffi-dev \
    musl-dev \
    openssl \
    postgresql \
    libpq-dev

COPY requirments/prod.txt ./requirements/prod.txt
RUN pip install -r ./requirements/prod.txt

COPY manage.py ./manage.py
COPY setup.cfg ./setup.cfg
COPY Makefile ./Makefile
COPY static ./static
COPY instructor_website ./instructor_website

EXPOSE 8000

FROM production as development

COPY requirments/dev.txt ./requirements/dev.txt
RUN pip install -r ./requirements/dev.txt

COPY . .