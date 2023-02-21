# ROR-BOOK

Final project for Ruby on Rails curriculum of *The Odin Project*.
[check it here](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project)


## Steps/Bugs

### 1. Setting up devise:

This are the [instructions for devise setup](https://github.com/heartcombo/devise) Easy as reading it.

I try to make devise work with turbo, but I was unable with [this instructions](https://gorails.com/episodes/devise-hotwire-turbo), they did not work.

Instead I choose to deactivate turbo on the devise views using ` html: {'data-turbo' => "false"} `
This was the selected option.

Also I try to add username as a parameter to sign up and sign in. using [this instructions:](https://dev.to/casseylottman/adding-a-field-to-your-sign-up-form-with-devise-10i1)

### 2. Creating user Model with Devise.

### 3. Creating profile model
This was created to save the demographics of each user, an user only has a profile and viceversa.
 It has: FullName, City, Area, Age, School, and favorite dessert, even space for a Quote.

 ### 4. Post model.

### 5. comments as polymorphic

This was done using [this video](https://www.youtube.com/watch?v=fzz62HWGNNA) So I may be able to show comments on pictures also.