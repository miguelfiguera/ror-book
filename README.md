# ROR-BOOK

Final project for Ruby on Rails curriculum of *The Odin Project*.
[check it here](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project)


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

The only thing that I did update was my README. Im not going to loose all this nonsense that I wrote.




---
P.D: I do love markdown to write any kind of text.