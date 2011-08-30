#Nivo Slider Rails


What am I
=====

Rails engine that supplies administration of slides and view helpers for the [nivo slider jQuery plugin](http://nivo.dev7studios.com/).

#####My Dependancies

paperclip
haml
jquery-rails

Install Me
=====

Add this to your Gemfile

    gem 'nivo', :git => "git://github.com/hificreative/nivo.git"

run

    bundle

then

    rails g nivo:install

This will create the necessary migrations and copy the `nivo_config.yml` to the config directory.

If jquery is not installed run

    rails g jquery:install

Use Me
=====

The following view helpers are shown in haml.

Edit the `nivo_config.yml` to your liking.
Then after you run `rake db:migrate` add this to your application layout

    = show_slider?

and insert

    = yield(:js)

after the closing body tag

On each view you would like the slider to be visible insert 

    - slider

if the variable `slider` is set, `show_slider?` will render the slideshow partial and include the stylesheets and javascripts required by Nivo Slider.

#####To add slides

  navigate to `nivo/slides`

My Extras
=====

We hate engines that you can't customize. With that in mind, there are 3 more generators available.

    nivo:views
    nivo:controller
    nivo:stylesheet

Do I need to explain what these do?

ToDo
=====

* js include tag view helper
