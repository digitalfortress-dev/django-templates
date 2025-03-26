<p align="center">
  <a href="https://www.digitalfortress.dev/">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://digitalfortress-s3-bucket-vpcxuhhdwecuj.s3.amazonaws.com/Group+1410083530.svg">
      <img alt="Digital Fortress logo" src="https://digitalfortress-s3-bucket-vpcxuhhdwecuj.s3.amazonaws.com/Group+1410083530.svg">
    </picture>    
  </a>
</p>

---

# Django template

## Prerequisites
- [Python](https://www.python.org/) v3.11
- [PostgreSQL](https://www.postgresql.org/)

## Usage

### Setup environment

1. Install dependencies
   ```
   pip install -r requirements_dev.txt
   ```
2. Init .env file
   ```
   cp .env.example .env
   ```
3. Update .env variables
4. Migrate database
   ```
   python manage.py migrate
   ```

### Launch
   ```
   python manage.py runserver 0.0.0.0:8000
   ```

### Docker
1. Build image
   ```
   docker build \
   --build-arg ENV=dev \
   --build-arg SECRET_KEY=your_key \
   --build-arg ALLOWED_HOSTS=localhost \
   --build-arg HOST=http://localhost:8000/ \
   --build-arg DB_NAME=django_template \
   --build-arg DB_USERNAME=your_username \
   --build-arg DB_PASSWORD=your_password \
   --build-arg DB_HOST=host.docker.internal \
   --build-arg DB_PORT=5432 \
   --build-arg JWT_SIGNING_KEY=your_key \
   --build-arg CORS_ALLOWED_ORIGINS=http://localhost:8000 \
   -t django-template:latest .
   ```
2. Run container
   ```
   docker run -p 8000:80 django-template
   ```

## License

This project is Copyright (c) 2023 and onwards Digital Fortress. It is free software and may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: /LICENSE

## About
<a href="https://www.digitalfortress.dev/">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://digitalfortress-s3-bucket-vpcxuhhdwecuj.s3.amazonaws.com/Group+1410083530.svg">
    <img alt="Digital Fortress logo" src="https://digitalfortress-s3-bucket-vpcxuhhdwecuj.s3.amazonaws.com/Group+1410083530.svg" width="160">
  </picture>
</a>

This project is made and maintained by Digital Fortress.

We are an experienced team in R&D, software, hardware, cross-platform mobile and DevOps.

See more of [our projects][projects] or do you need to complete one?

-> [Let’s connect with us][website]

[projects]: https://github.com/digitalfortress-dev
[website]: https://www.digitalfortress.dev
