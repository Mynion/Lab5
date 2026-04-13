# Sprawozdanie – Laboratorium 5

## Budowa obrazu

```bash
docker build -t moja-aplikacja --build-arg VERSION=1.0 .
```

## Uruchomienie kontenera

```bash
docker run -d -p 8080:80 --name moja-apka moja-aplikacja
```

## Sprawdzenie działania

```bash
docker ps
docker inspect --format='{{.State.Health.Status}}' moja-apka
```

## Wynik

<img width="423" height="208" alt="image" src="https://github.com/user-attachments/assets/44c2b497-1ab4-4397-b66e-20f530cc4136" />

