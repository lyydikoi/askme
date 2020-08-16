
# This is a Rails application within a study course of Good Programmer 

## Below is some setup and trouble shooting info

### 1. Ruby version: 2.7.1

### 2. Rails version: 6.0.3

### 3. Database
We use Posgres DB
Install PG:
~~~~
sudo apt-get install postgresql-10
bundle install
~~~~

Command, which may be useful:
~~~~
rails db:create
rails db:migrate
rails db:seed
~~~~

### 4. For UML diagrams generation we use  gem 'railroady'
It requeres "graphviz". So, before taking it in use, run this:
~~~~
sudo apt-get install graphviz
~~~~

### 5. For annotations we use 'annotate' gem
Useful commands for annotation of models etc. and routes:
~~~~
annotata
annotate --routes
~~~~

