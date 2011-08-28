#Nivo Slider Rails


What am I
=====

Rails engine that supplies administration of slides and view helpers for the [nivo slider jQuery plugin](http://nivo.dev7studios.com/).

#####My Dependancies

paperclip  
rails 3  
haml

Install Me
=====

Add this to your Gemfile

    gem 'nivo', :git => "git://github.com/hificreative/nivo.git"
  
run
  
    bundle

then

    rails g nivo:install
    
This will create the necessary migrations and copy the `nivo_config.yml` to the config directory.

Use Me
=====

The following view helpers are shown in haml.

After you run `rake db:migrate` add this to your application layout

    = show_slider?

and insert

    = yield(:js)

after your jquery inclusion

On each view you would like the slider to be visible insert 

    - slider

if the variable `slider` is set, `show_slider?` will render the slideshow partial and include the stylesheets and javascripts required by Nivo Slider.

My Extras
=====

We hate engines that you can't customize. With that in mind the are 4 more gnerators available.

    nivo:views
    nivo:controller
    nivo:model
    nivo:stylesheet
    
Do I need to explain what these do?

ToDo
=====

* Drag and drop sorting of slides
* js include tag view helper
