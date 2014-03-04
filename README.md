Post-It
========

### Image posting site with live drawing

Beginning life as a simple image sharing and posting site, 'Post-it' became a good opportunity to experiment with WebSockets and the HTML5 canvas object. The result requires some optimization but fundamentally allows the rendering of live drawing (and drawing erasing) transmitted via Websockets.

There were many challenges in using technologies such as HTML5 Canvas and WebSockets in the way that I did. The amount of data I set-up the WebSockets to transmit causes sluggish rendering times after I deployed to Heroku, something I want to optimise through re-designing. Moving between initialising HTML 5 Canvas objects from Amazon S3 image sources- then re-saving and re-initializing- presented an interesting challenge to avoid a 'tainted' canvas object. Overcoming the challenges was part of the enjoyment of the project, providing a fun way to play around with the technologies I was learning at the time; JavaScript, jQuery and WebSockets.

The site specialises in image posted of Gary Oldman, but there is no validation on that so feel free to upload any image! The app is in beta mode while I improve the features, deployment in the near future. Until then... 

![alt text](https://raw.github.com/HannahKnights/Post-It/master/app/assets/images/Screen%20Shot%202014-03-04%20at%2011.55.57.png "Post-it")


Thoughts on 'live drawing' improvements (to be trialled):
 * Sending WebSocket message through only every X seconds
 * Calculating the area drawn and sending through localised data (challenging with erase function)


Created while studying at [Makers Academy](http://www.makersacademy.com)

#### How to Use

Run the test suite for a more comprehensive overview of the features:

~~~
$ rspec
~~~ 

You can also open the application in heroku:

~~~
$ heroku open
~~~ 

#### Technology

* Rails 4
* PostgreSQL
* ActiveRecord
* Devise
* Paperclip
* Amazon SW3
* Twitter Bootstrap
* WebSockets
* HTML5 Canvas Object
* JavaScript
* jQuery
* Deployment with Heroku
* RSpec and Capybara
* Warden and FactoryGirl
