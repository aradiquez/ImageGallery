# README

## Boring Gallery app :-]

This holds a pretty good idea of what I did to install bootstrap on RoR using webpack :]
[https://dev.to/vvo/a-rails-6-setup-guide-for-2019-and-2020-hf5](https://dev.to/vvo/a-rails-6-setup-guide-for-2019-and-2020-hf5)

Now, to be really clear with the ActionView talk let's summarize the key points for the talk.

## Instalation

First of all, let's install everything to be able to use the project, we will need nothing fancy, regular rails commands.

run `$ rvm list` to make sure your in vesion `ruby-2.7.2`

then `$ nvm list` to make sure the selected NodeJS version is `v15.2.0`

if none of this are your current versions please, install the correct versions 🙌

if you need help drop a question in the bootcamp slack

Let's install dependencies `$ bundle install`

Let's run `$ rails db:migrate` to create the db

and now!! let's find some pics to fill some galleries 🎉 !!!

and let's create a couple of galleries, will need the app running for that 😅

let's run `$ rails s` and fill some cool galleries 😎 use the app a bit, the navigation will help you understand how it works

## Templates

the main folder to store the templates is [app/views](https://github.com/aradiquez/ImageGallery/tree/master/app/views) this is where rails engine looks for our view.

### ERB

Layouts: [app/views/layouts](https://github.com/aradiquez/ImageGallery/tree/master/app/views/layouts) the main file is `application.html/erb` this is the layout by default, this is the frame for the all the application, and provides the flexibility to inject templates for our actions.

contents: [yield](https://github.com/aradiquez/ImageGallery/blob/master/app/views/layouts/application.html.erb#L15) this is a section is defined to inyect our templates using that space in the main page of the app.

how can the app injects a template there?[content_for](https://github.com/aradiquez/ImageGallery/blob/master/app/views/galleries/index.html.erb#L1) this is the block method that help us inyect a template we define in any action view into the layout.

We have a common CRUD structure, generated by scaffold, the interesting part is inside each file.

- galleries: [app/views/galleries](https://github.com/aradiquez/ImageGallery/tree/master/app/views/galleries)
- pictures: [app/views/pictures](https://github.com/aradiquez/ImageGallery/tree/master/app/views/pictures)

this one is a bit more interesting **shared:** [app/views/shared](https://github.com/aradiquez/ImageGallery/tree/master/app/views/shared) we have 3 files in the directory, we can see 3 partials.

- `_jumbotron.html.erb` is the header, where the buttons helper to create `Add New (XXXX)` and the Home buton. [link_to](https://github.com/aradiquez/ImageGallery/blob/master/app/views/shared/_jumbotron.html.erb#L9-L10)- this is the default link helper from rails code helper, and also where we use some `locals` variables sent as a param to this partial! [title and subtitle](https://github.com/aradiquez/ImageGallery/blob/master/app/views/shared/_jumbotron.html.erb#L4-L6)
- `_modal.html.erb` the modal we use to show the picture in full size. 🤔 I done't a lot of ruby code embeded... that is because the template is getting popualted with data using javascript 😎

**Let me show you**

Request: we use this [image_detail_modal_link](https://github.com/aradiquez/ImageGallery/blob/master/app/views/pictures/show.html.erb#L4) to controle how we want to display our image, by doing this allow the posibility to alter this is a simple way if the change apply for all clickable images.
we can see the helper method here: [Helper](https://github.com/aradiquez/ImageGallery/blob/master/app/helpers/pictures_helper.rb#L2) notice the `remote: true` in the link tag, that will tell the engine: "I want a javascript response".

Response: this is the action that will respond the controller with: [show](https://github.com/aradiquez/ImageGallery/blob/master/app/controllers/pictures_controller.rb#L12) that means is going to respond with: [showJS](https://github.com/aradiquez/ImageGallery/blob/master/app/views/pictures/show.js.erb), replace the title [title](https://github.com/aradiquez/ImageGallery/blob/master/app/views/pictures/show.js.erb#L2) and fill the body with an image [show image](https://github.com/aradiquez/ImageGallery/blob/master/app/views/pictures/show.js.erb#L4) and last tell the modal to unhide itself [show](https://github.com/aradiquez/ImageGallery/blob/master/app/views/pictures/show.js.erb#L5).

## Helpers

the main helper folder is on: [helpers](https://github.com/aradiquez/ImageGallery/tree/master/app/helpers)

- `application_helper.rb` to define helpers that all application can use, let's implement some of our shared methods here: [application helper](https://github.com/aradiquez/ImageGallery/blob/master/app/helpers/application_helper.rb) these are the helper methods that our share elements in the views use.
- `galleries_helper.rb` where nothing is defined, we don't have spesific gallery helpers.
- `pictures_helper.rb` this is wher we define the `image_detail_modal_link` we saw in the request section above.

## Forms

In our application we have two forms one to add galleries and the other to add pictures.

- `galleries/_form.html.erb` to create a new gallery or edit an existing one, this form should work for both cases
- `pictures/_form.html.erb` in the same way the example above this form is used to create a new picture or modify an existing one.

## Whant to change the layout? let's do it

What to see the layout change with a single line change, let's jump into our local app to see this working, let's go to the main `localhost:3000` page to make sure our gallery works, then let's pick one of them, see the picture list? AWESOME, let's jump into our editor and let's uncomment this line in the [application_controller.rb](https://github.com/aradiquez/ImageGallery/blob/master/app/controllers/application_controller.rb#L2) save the change and let's refresh our app in the browser 🎉 the app should now use a different layout to allow the page to look different.

basically we told the app to use a different layout for the all application, since we did this in the main controller, to allow this change to be done in a single place but to allow all the app to inherit the new layout definition.

if you have any question, throw it in slack!!
