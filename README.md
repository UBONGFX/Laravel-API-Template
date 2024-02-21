# Laravel API Template

Welcome to the Laravel API Template, a starter pack for building APIs using **Laravel with Octane**. This repository contains a **pre-configured** Laravel setup, optimized for **high-performance** and rapid development, and includes a **lightweight Docker** file for easy deployment and development. This repo can be used as a Template to kick-start new projects.

## Features

- **Laravel with Octane**: Leverages the power of Laravel Octane for superior performance.
- **Lightweight Docker Setup**: Includes a Docker file that is optimized for lightweight and efficient containerization.
- **Pre-configured Essentials**: Out-of-the-box configurations for quick and effective API development.
- **Scalability and Speed**: Designed with scalability in mind to handle high loads and enhance development speed.

## Getting Started

This section will guide you through the setup and installation of the Laravel API Template, for local developement and docker. 

### Prerequisites

- PHP 8.3
- Laravel 10.10
- Composer 2.6.6
- RoadRunner 2023.3.10
- Docker 24.0.7

### Local Installation 

1. Install PHP Dependencies
    Use Composer to install the PHP dependencies:

    ```bash
    composer install
    ```
2. Environment Configuration:

    Create a copy of the `.env.example` file and name it .env.
    Modify the `.env` file with your specific configurations.

3. Install Laravel Octane with RoadRunner
    Install Laravel Octane manually using the Artisan   command:

    ```bash
    php artisan octane:install
    ```

4. Database Migration (Optional):

    ```bash
    php artisan migrate
    ```

### Docker Installation 
1. Environment Configuration:

    Create a copy of the `.env.example` file and name it .env.
    Modify the `.env` file with your specific configurations.

2. Build Docker Image:

    Build the Docker image using the Dockerfile provided in the project. Replace my-laravel-api with a name of your choice for the Docker image:
    
    ```bash
    docker build -t my-laravel-api .
    ```
3. Run Docker Container:

    After the build completes, run a container from the image. Adjust the port numbers as necessary to match your configuration:

    ```bash
    docker run -d -p 8000:80 my-laravel-api
    ```

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues to improve the template.

## License

This project is open-sourced under the [MIT license](LICENSE).
