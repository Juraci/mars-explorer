# mars-explorer

A simple robot controlled by a REST API made with Ruby and Sinatra.

### Requirements

* Ruby 2.2 or later
* latest Bundler

### How to run it

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

Note that it's important to use the `-d ''` parameter on curl to explicitly send no data in the request body.

### Tests
```
 spec
    ├── integration
    │   └── mars_explorer_spec.rb
    ├── mars_explorer
        └── robot_spec.rb
```

The integration directory holds end to end tests to verify the application behavior as a whole, totally integrated.
The mars_explorer directory holds more granular tests to verify the Robot, and Axis classes decoupled from Sinatra.

To run all the tests just run the following command from the project root:

```shell
$  bundle exec rspec 
```

To run an specific test just pass the file path as an argument:

```shell
$  bundle exec rspec spec/mars_explorer/robot_spec.rb 
```
