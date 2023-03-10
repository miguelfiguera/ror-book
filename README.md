# ROR-BOOK

Final project for Ruby on Rails curriculum of *The Odin Project*.
[check it here](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project) Check it if you want to see what I have to do and the criteria for this to work.


## Steps, Bugs & Problems...

## 1. Setting up devise:

This are the [instructions for devise setup](https://github.com/heartcombo/devise) Easy as reading it.

I try to make devise work with turbo, but I was unable with [this instructions](https://gorails.com/episodes/devise-hotwire-turbo), they did not work. And also... it F**** up mi work up to the moment...

Instead I choose to deactivate turbo on the devise views using ` html: {'data-turbo' => "false"} ` this also did not work... so I made a wrap of the forms with this:
`<div data-turbo="false">
</div>`

This was the selected option, and the one that works.

Also I try to add username as a parameter to sign up and sign in. using [this instructions:](https://dev.to/casseylottman/adding-a-field-to-your-sign-up-form-with-devise-10i1)

This also was a succes, later I may try to add the sign in method using the username.

## 2. Creating user Model with Devise.

Just run 

``rails generate devise User``

and thats all set and done.

## 3. Creating profile model
This was created to save the demographics of each user, an user only has a profile and viceversa.
 It has: FullName, City, Area, Age, School, and favorite dessert, even space for a picture link (so I may use gravatar later).

## 4. Post model.

`rails generate model Post user:references title:string body:text`

Thats all, everything else can be checked in the code.

## 5. comments as polymorphic

I made the comments polymorphic to use them in pictures also.
This was done using [this video](https://www.youtube.com/watch?v=fzz62HWGNNA) So I may be able to show comments on pictures also.

Because postgresql sometimes does not accept the change_column method of migrations without cast and because I did a wrong migration with comments, I just `rails db:migrate VERSION=0` modify the migrations to my needs and `rails db:migrate`

## 6. First Push...

This was my checkpoint, because before I screw it up twice, so I decide to push now to avoid more 'Restarts'.

At this point validations of the models are pending.

GitHub asked for this [personal token and else](https://dev.to/ibmdeveloper/can-t-push-to-your-github-repo-i-can-help-with-that-1fda) to be able to push my commits, it took me an hour to find how to do it... If everything goes smoothly, that is beacuse your problems are yet to come.

## 6.5 Validations and controllers
I also made the first validations and the first draft of this controllers, of course, I did also add the routes.

But later I kill the controllers.


## 7. Frienship_requests & friendships. 
I had to read all of this to decide how to do it: 
- [elizabeth pendergast](https://medium.com/@elizabethprendergast/using-custom-relation-queries-to-establish-friends-and-friendships-in-rails-and-activerecord-6c6e5825433a)

- [dankim.io instructions](https://dankim.io/mutual-friendship-rails) 
- [Customizing queries on active Record](https://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#module-ActiveRecord%3a%3aAssociations%3a%3aClassMethods-label-Customizing+the+query) This one is pretty good.
- [Self Referential Associations](https://riptutorial.com/ruby-on-rails/example/10240/self-referential-association) This one too.

On the end my 85% is from dankim.io and I took some other ideas from elizabeth. Awesome what you can do with rails if you put the effort on it. But as I am just a novice, sometimes reading code is the best practice to learn how deep can you go and how flexible can it be.


## 7.1 Update about friendships:

I did some more of google researchs for this matter because I find it alot more difficult than what it should be... to much code for the same functionality. So I learned about `status:` as a way to put the created frienship in a pending & requested status. I got this from this [reddit post](https://www.reddit.com/r/rails/comments/im32av/is_this_the_simplest_way_to_create_a/).

Good enough for my to try it, because it was really simple and thats what I like about it. So reset my commits to the place before the friendship part done, and keep the pushed one on github in case I screw things up. So just a fetch and everything was just fine.

Also, this is getting pushed to another branch called 
    `friendships_simple`
That way Im not loosing anything that I would like to save.


The main idea of this is just to create the friendship with a 'pending' status, a method on the model that update the status to accepted with a button or to destroy it with another button. To be shown on the notifications button of the nav bar.

## 7.5 Creating a table for the likes...
This was not on the plan, but to avoid an user duplicating his likes, this is the way. Even if this makes me write more code.

## 8. Building now the views

Im going to use turbo frames for this. I want to make an hybrid with this ror book, even if I havent done the deployment.

So, this is the link: [turbo.frames tutorial](https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams) it also have the turbostreams part.

Also, this goes with the construction of the controllers, cause the views work with the controllers. So the idea is to go together with them, at least parallel writing.


## 9. Arranging Scopes and debugging comments

Scopes (kind of method class) help to keep the code DRY and organized. Thats all.

Comments its giving me a hardtime I do not know why yet, maybe Im just proceeding the wrong way.

Yes, I was not building them as I should do with the associations methods.

## 10. Friendships bugs...
The way that I did the 'show friends', and profiles and comments and all of that makes a big mess... because it shows current_user and not the user that should be shown... debugging that now.

I did it with the same users#show, that way I find the posts directly on that controller.

Also for posts#index I did a concatenation of two arrays with different scopes so I may be able to put them all together (mine and other peoples posts).

## 11. Omniauth

This was truly straight forward just some problems with the configuration on google. It takes time for the adjust to be valid, so if you have a bug, it may be that the platform of google is not working.

After installing omniauth gem for google, I had to add the csrf secutiry gem of omniauth too. And later this snipped of code to devise.rb:
___

`OmniAuth.config.logger = Rails.logger if Rails.env.development?`
___
I find a 401 invalid_client and it was that my `ENV["GOOGLE_CLIENT_ID"]` was not passing because it did not have the correct sintaxis on initializers/devise.rb (double quotes needed).

Later I had to put on google the autorized redirect url, the /onmiauth/callback or something like that.

There is a method defined on the model. Remember this, future self.
___
         def self.from_omniauth(access_token)
          data = access_token.info
          user = User.where(email: data['email']).first
      
          # Uncomment the section below if you want users to be created if they don't exist
           unless user
               user = User.create(name: data['name'],
                  email: data['email'],
                  password: Devise.friendly_token[0,20]
               )
           end
          user
      end
___

when I was going to give up for the day, it just worked... so Im happy now.

## 12. Mailers

Sending a email after the sing up is possible while using devise. The problem is that devise creates the user for you, and you do not have access to those controllers, you can ask for those and all of that... but also without touching devise controllers you can do this:

1. Create the user_mailer.rb (rails generate mailer User).
2. define default and the method on user_mailer.
3. As application controller rules everything... create the method that send the UserMailer#welcome_email
___
        def send_welcome_email

        UserMailer.with(user: @user).welcome_mail.deliver_now
        
        end
___
4. add the next sniped to devise `"users/registrations_controller.rb"`:
___
        after_action :send_welcome_email, if: -> {@user.persisted?}
___

## 13. I created a messages page.

I did not wanted to do the likes, just because its tedious. So I did a nice messages kind of part for this ror book.

It has two parts: Rooms (to put the conversations in) and messages. A room can have many messages from the users inside, right now there are for two people only and you cannot invite anyone else. Later that will improve.
=======

I had the option of using mailboxer but I wanted to try and add the turbo_stream part for this idea.

Also I put the navbar in the layout and create another layout for devise controllers.

## 14. Turbo frames cancel

I have a turbo_frame_tag with id X1 and it is empty, when turbo frames replace it with another X1 but with content I can put a link inside the content to call the empty X1, and it will replace the X1 with content giving the sensation of closing the frame.

So it is possible without using stimulus yet.

[Learned this one here on hotrails.dev](https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams)

## 15. turbo streams + actionCable for live updates on messages:

This was also learned [here in hotrails.dev](https://www.hotrails.dev/turbo-rails/turbo-streams).

Also a lot of resources from [The Odin Project lesson on Turbo](https://www.theodinproject.com/lessons/ruby-on-rails-turbo#turbo-stream)

## 16. reseting a form with stimulus

got it from this [youtube video](https://www.youtube.com/watch?v=kNqPKN5vHC4) of Deanin. really good example.

Look carefully how he writes form-reset and not form_reset.

this are the turbo events for stimulus controllers part check them if you need your controller [to be triggered in an specific point](https://turbo.hotwired.dev/reference/events)

## 17. Deploy

This video [here](https://www.youtube.com/watch?v=QJ4BcTQlKC0) about how to deploy on render.com

Render asked for a credit card(even for free plan), I do not have one that they can accept (Venezuelan here), so deployment was not possible this time.

I'll try later another option, with real apps.

##  Installing Bootstrap/Bulma

This project does not require any kind of styling, so This did not happen.

## P.D:

I didn't do the likes part... because I did not want to, instead I focus on the chat part, because for me it was a good way of practicing and understanding all the other parts of turbo.

---
P.P.D: I do love markdown to write any kind of text.


P.P.P.D: Using turbo_frames: "_top" you may break out from the frame so the links work as expected. Fix that.


## Hope you liked my work.

# Miguel Q.