# mars-explorer

A simple robot controlled by a REST API made with Ruby and Sinatra.

# Requirements

* Ruby 2.2 or later
* Bundler latest

# How to run it

* clone the repo
```shell
$ git clone git@github.com:Juraci/mars-explorer.git
```

* cd into the directory
```shell
$ cd mars-explorer
```

* Run bundle install command
```shell
$ bundle install 
```

* Run the app
```shell
$  bundle exec rackup config.ru -p 8080 
```

Test if it's working by submiting a simple command:
```shell
$  curl -X POST http://localhost:8080/rest/mars/MMRMMRMM -d '' 
```

Note that it's important to use the **-d ''** parameter on curl to explicitly send no data in the request body.

# Running the tests

```shell
$  bundle exec rspec 
```

