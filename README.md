Hello there! ✌️

Watspoppin is meant to show you what's going on and what is there to do in a certain place. This is
a group effort with which we satisfied the final project requirement for the Full Stack web
development bootcamp at Bitmaker.

Watspoppin allows you to see tweets in real time by listing them and plotting them on a map based on
a location of your choosing. Additionally, you can create your own story and post it on to Facebook
& Twitter if your accounts are linked.

Each person was in charge of testing their respective functionality.

Tasks:

* Denis S Dujota - Full Stack (Back end and Front end integration for Devise views). Implementation of the User Model. User authentication and autorization setup with Devise with password recovery, two step authentication, email validation, remember user feature and trackable user metrics. Integrated Twitter API, Facebook API and Oauth APIs for the User Model. Integrated the omniatuh callbacks controller with a Services model that is stand alone from the User model allowing scalability and integration of multiple services without the need to modify the existing user model structure. Implemented self refreshing tokens for Oauth that trigger on every new user login. User data is pulled from the Oauth JSON files that are generated upon authentication with the 3rd Party APIs. Integrated the aggregation of user posts with their social media accounts that were linked through OAuth alowing them to make posts directly to their 3rd party accounts from within our app once logged in. Created the like function controller and back end logic. Tested application back end with RSpec, Factory Bot and Faker. 

* Enderson Isai - Back end. In charge of stories model. Worked with Google places api for search
  functionality in order to create stories from within the app.

* Marian Serna - Full Stack. Project Manager. In charge of real time functionality using the Twitter
  api, action cable, and google places api. Used celluloid::io for async functionality in rails.
  Designed site, implemented react on rails setup, developed the front end, handled images. Tested
  front end with Jest + Enzyme + Sinon as well as back end using Rspec and Factory Bot. Deployed to
  Heroku and set up rake tasks for db reset every 24 hours.
