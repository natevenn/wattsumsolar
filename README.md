# WattSumSolar

![home_out](https://cloud.githubusercontent.com/assets/8459012/15270163/bce90a9e-19d2-11e6-8ffd-c4d4d8726e30.gif)
![calculator_out](https://cloud.githubusercontent.com/assets/8459012/15270168/fe9acc52-19d2-11e6-9a4c-e1941d03117b.gif)

WattSumSolar is a rails app that uses solar data from the National Renewable Energy Laboratory, to calculate the upfront cost of a solar system, total electricity output of the system, the percentage of the systems offset based on the homeowners current electricity usage, and a graph that shows monthly electricity output. The app is mostly build on the client side, utilizing JavaScript, and a D3 library.

Production is hosted [here](http://wattsumsolar.herokuapp.com).
### Testing
All testing in Wattsumsolar was done via [RSpec-rails](https://github.com/rspec/rspec-rails). The coverage was tested using [simplecov](https://github.com/colszowka/simplecov).

##### Running tests
Once you have the repo cloned, make sure to reset the database on your local machine and run bundle install.

In order to run the tests, enter `rspec` in the command line.

If you would like to run a specific test enter, the whole path of that test, preceeded by the rspec command: ie. 

```
rspec spec/models/pv_watt_spec.rb
```

In order to see coverage for the testing suite simply type the command `open coverage/index.html` and it will show the index page for our simple cov code coverage. 



