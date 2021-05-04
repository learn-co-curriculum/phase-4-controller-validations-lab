# Controller Validations Lab

## Learning Goals

- Check the validity of a model in a controller
- Render a response with the error messages
- Use HTTP status codes to provide additional context

## Introduction

Time to apply these new tools!

The goal of this lab is to allow users of this blog-style application to create
and edit authors and posts without worrying about typos or other mistakes
leading to error-prone form submissions.

For example, if someone creates a blog post with less than 100 characters of
content, it's likely that they accidentally pasted the wrong text, or
misunderstood which information goes into which field. We can improve the user's
experience and the stability of our codebase by notifying users about these
kinds of mistakes _before_ bad data gets into the database.

To get started, run:

```sh
bundle install
rails db:migrate db:seed
```

This is a barebones app with two models, `Author` and `Post`. Right now, you
can...

- `GET /authors/1`: **View an author**
- `POST /authors`: **Create an author**
- `GET /posts/1`: **View a post**
- `PATCH /posts/1`: **Update a post**

## Deliverables

### Author Validations

Add validations to `Author` such that...

1. The name cannot be blank
1. The e-mail is unique

### Post Validations

Add validations to `Post` such that...

1. The title cannot be blank
1. The category is either `"Fiction"` or `"Non-Fiction"`
1. The content is at least 100 characters long

### Controller Actions

1. Change `AuthorsController#create` to send back the error messages if the new
   author is invalid
1. Change `PostsController#update` to send back the error messages if the
   updated post is invalid
