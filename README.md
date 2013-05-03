# Choshi(銚子) [![Build Status](https://travis-ci.org/rosylilly/choshi.png?branch=master)](https://travis-ci.org/rosylilly/choshi) [![Code Climate](https://codeclimate.com/github/rosylilly/choshi.png)](https://codeclimate.com/github/rosylilly/choshi)

Simple Decorator gem for Rails 3 and 4.

## Installation

Add this line to your rails application's Gemfile:

    gem 'choshi'

## Usage

1. bundle 'choshi' gem to your application.
2. write a decorator for each your models. decorator names are restricted from model names(ex: `User`'s decorator name is `UserDecorator` / `Scoped::Model`'s decorator name is `Scoped::ModelDecorator`).
3. write code!

## Examples

read specs code: <https://github.com/rosylilly/choshi/tree/master/spec/dummy>

### Use in actions

```ruby
class UsersController < ApplicationController
  def index
    @users = decorate(User.all)
  end
end
```

### Delegate

```ruby
class UserDecorator < Choshi::Decorator
  def name
    "#{first_name} #{last_name}" # => "#{user.first_name} #{user.last_name}"
  end
end
```

### Source Object

```ruby
class UserDecorator < Choshi::Decorator
  def id
    'id'
  end

  def hash
    Digest::SHA1.hexdigest(source.id)
  end
end
```

### View Context

```ruby
class UsersHelper
  def link_to_user(user)
    link_to user.first_name, user
  end
end

class UserDecorator < Choshi::Decorator
  def link
    view_context.link_to_user(source)
    # or `helper.link_to_user(source)`
  end
end
```

### Auto Decorate

```ruby
class BookDecorator < Choshi::Decorator
  def title
    %Q{"#{source.title}"}
  end
end

class UserDecorator < Choshi::Decorator
  auto_decorate :books

  def book_titles
    books.map { |book| book.title } # => ['"book title"', '"book title"' ... ]
  end
end
```

### Decorate in Decorator

```ruby
class UserDecorator < Choshi::Decorator
  def following_users
    decorate source.following_users # Inherit a view context
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
