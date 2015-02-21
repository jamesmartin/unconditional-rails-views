# Unconditional Rails Views

This is a simple Rails app with one controller, one view template and a couple
of partials. The app demonstrates an experiment to move existential conditional
logic out of view templates and partials, leaving behind declarative method
calls to indicate the dependencies of that view.


Here's a before and after:

```haml
%h1 Greetings
= render partial: 'shared/greeting', locals: { name: 'Bill Evans' }
```

```haml
  - if defined?(name)
    %p Hello, #{name}.
  - else
    %p Hello, there.

  - if defined?(name)
    Listen, #{name}, it's been fun, but I have to get going.

  - if @foo.present?
    %p Here's something from the controller: #{foo}
```

```haml
  - depend_on(local_assigns)
    - with_local(:name) do |name|
      %p Hello, #{name}.
    - without_local(:name) do
      %p Hello, there.

    - with_local(:name) do |name|
      %p Listen, #{name}, it's been fun, but I have to get going.

    - with_global(:foo) do |foo|
      %p Here's something from the controller: #{foo}
```

This might not look like much, syntactically, but it represents a large shift in
*responsibility* from the perspective of the template or partial.

There are more [interesting
examples](https://github.com/jamesmartin/unconditional-rails-views/blob/master/app/views/application/index.html.haml), using a special interface to allow the
calling template control the visibility of the local based on some runtime
behaviour.
