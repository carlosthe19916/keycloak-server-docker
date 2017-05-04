# Openfact MySQL

Extends the Openfact docker image to use MySQL

## Usage

### Start a MySQL instance

First start a MySQL instance using the MySQL docker image:

    docker run --name mysql -e MYSQL_DATABASE=openfact -e MYSQL_USER=openfact -e MYSQL_PASSWORD=password -e MYSQL_ROOT_PASSWORD=root_password -d mysql

### Start a Openfact instance

Start a Openfact instance and connect to the MySQL instance:

    docker run --name openfact --link mysql:mysql jboss/openfact-mysql

### Environment variables

When starting the Openfact instance you can pass a number of environment variables to configure how it connects to MySQL. For example:

    docker run --name openfact --link mysql:mysql -e MYSQL_DATABASE=openfact -e MYSQL_USER=openfact -e MYSQL_PASSWORD=password jboss/openfact-mysql

#### MYSQL_DATABASE

Specify name of MySQL database (optional, default is `openfact`).

#### MYSQL_USER

Specify user for MySQL database (optional, default is `openfact`).

#### MYSQL_PASSWORD

Specify password for MySQL database (optional, default is `openfact`).