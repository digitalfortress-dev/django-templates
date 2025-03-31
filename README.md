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

## Usage

### Option 1: Run with Docker Compose

#### Prerequisites
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

#### Steps
1. Start the application using Docker Compose:
   ```
   docker-compose -f ./docker-compose.local.yml up -d
   ```

2. Access the application at [http://localhost:8000](http://localhost:8000).

   - API documentation URL: [http://localhost:8000/api/v1/docs](http://localhost:8000/api/v1/docs)

3. To stop the application:
   ```
   docker-compose -f ./docker-compose.local.yml down
   ```

---

### Option 2: Run Manually

#### Prerequisites
- [PostgreSQL](https://www.postgresql.org/)
- [uv](https://docs.astral.sh/uv/)

#### Setup Environment

1. Install dependencies:
   ```
   uv sync
   source .venv/bin/activate
   ```

2. Initialize the `.env` file:
   ```
   cp .env.example .env
   ```

3. Update the `.env` file with your environment variables.

4. Migrate the database:
   ```
   python manage.py migrate
   ```

#### Launch Application

1. Start the development server:
   ```
   python manage.py runserver 0.0.0.0:8000
   ```

2. Access the application at [http://localhost:8000](http://localhost:8000).

   - API documentation URL: [http://localhost:8000/api/v1/docs](http://localhost:8000/api/v1/docs)

---

### Docker (Manual Build and Run)

#### Prerequisites
- [Docker](https://www.docker.com/)

#### Steps
1. Build the Docker image:
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

2. Run the Docker container:
   ```
   docker run -p 8000:80 django-template
   ```

---

## Install Pre-commit Hooks

To ensure code quality, install pre-commit hooks:
```
pre-commit install
```

---

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
