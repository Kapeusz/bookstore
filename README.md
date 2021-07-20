# Bookstore

Bookstore is a web application being under development for learning purposes.

## Use cases
Main goal I wanted to achieve was to create an easy to use application for bookstore owner.

Use cases covered:

* Customer can browse all books
* Customer can search for a book and order searching results
* Users can create an account
* To log in, the user must have confirmed account
* To confirm account user must click on the confirmation link sent to the given email address
* Customer can update personal information
* Administrator can add/edit/delete a book
* Administrator can upload an image for a book (images being uploaded to Amazon AWS S3)
* Customer can add multiple books to cart
* Customer can contact the administrator by sending a message using the contact form

Use cases to cover:

* Create checkout
* Create Admin Dashboard
* Let user add review/comment for a bought book
* Write appropriate tests
## Tech stack

* Elixir
* Phoenix Framework
* Ecto
* PostgreSql
* TailwindCSS
* AlpineJS

## App presentation

I will add app images/gifs when the app will be in the final stage of development.

## Running app

To run this app you have to download repository and run: 


```elixir
# install dependencies
mix deps.get

# create and migrate your database
mix ecto.setup

# install Node.js dependencies
cd assets && npm install

# start Phoenix endpoint
mix phx.server
```
Now you can visit localhost:4000 from your browser.

To use all currently developed features you should get API keys for Amazon AWS S3 and Sendgrid. 

Fill in config.exs

```
access_key_id: 
secret_access_key: 
```

and appropriate region details. 

Also:
```
api_key: 
```

## Authors

* Kacper Muryn


## License
[MIT](https://choosealicense.com/licenses/mit/)
