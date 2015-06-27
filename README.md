# Docker Redmine HTTP Repository

## Introduction

Dockerfile to build Redmine HTTP Repository container image.

## Version

Current Version: **2.3.4**
This is same version as Redmine test environment.

## Contributing

If you find this image useful here's how you can help:

- Send a Pull Request with your awesome new features and bug fixes
- Help new users with [Issues](https://github.com/k-muramatsu/docker-redmine-http-repos) they may encounter

## Quick Start

```bash
cd path/to/docker-redmine-http-repos
docker build -t redmine-http-repos:2.3.4 .
docker run --name=redmine-http-repos -d -p 10080:80 -e "DB_NAME=db_redmine" -e "DB_USER=user_redmine" -e "DB_PASS=pass_redmine" -e "DB_HOST=server" -v /var/repos/svn:/var/repos/svn -v /var/repos/git docker-http-repos:2.3.4
```

## Available Configuration Parameters

- **DB_NAME**: The database name.
- **DB_USER**: The database user.
- **DB_PASS**: The database password. Defaults to no password.
- **DB_HOST**: The database server hostname.
- **DB_TYPE**: The database type. Possible values: `mysql`, `postgres`(Feature). Defaults to `mysql`.
- **SVN_RELATIVE_URL_ROOT**: The relative URL root of SVN. Default to `/svn`.
- **GIT_RELATIVE_URL_ROOT**: The relative URL root of SVN. Default to `/svn`.
- **HTTPD_USER_ID**: User ID of HTTPD exec user. Default to `1000`.
- **HTTPD_GROUP_ID**: Group ID of HTTPD exec group. Default to `1000`.