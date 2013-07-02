# Rails Bootstrap App Theme #

This gem provides a Rails 3 engine which provides as basic application template
based on [Twitter Bootstrap][1]. It also provides helpers to simplify the creation
of components such as menus, lists, breadcrumbs etc.

The engine supports a few layouts that cover most requirements: namely a left sidebar fluid layout, a right sidebar fluid layout and a full width fluid layout.

The engine uses the [bootstrap-saas][2] gem to source Bootstrap. That means you can use the variables and mixins available in bootstrap-saas in your project. That's very useful to easily set things like the base font family and size for your project.

## Installing ##

To install Rails Bootstrap App Theme add the following line to your application's Gemfile:

```ruby
gem 'rails-bootstrap-app-theme'
```

`bundle install` and restart your server to make the files available.

### CSS ###

Import `rails-bootstrap-app-theme` in an SCSS file (e.g application.css.scss) to get all of Bootstrap's styles, mixins and variables. Don't use `//= require` directives since none of your other stylesheets will be able to use the awesome mixins that Bootstrap has defined.

```scss
@import 'rails-bootstrap-app-theme';
```

### Javascript ###

The engine requires `jquery` to already be sourced so make sure you source `rails-bootstrap-app-theme` after that.

```js
require 'jquery'
require 'jquery_ujs'
require 'rails-bootstrap-app-theme'
```

## Layouts ##

The following layouts are currently supported:

- `fluid_right_sidebar` a fluid layout with a right sidebar using a span9 | span3 split
- `fluid_left_sidebar`  a fluid layout with a left sidebar using a span3 | span9 split
- `fluid_full_width` a fluid layout with the content taking up the full width using a span12

If you only want to use a layout in some controllers, then you can set the layout in those
controllers, and the rest of the application will continue to use your default application layout (`application.html.erb`).

Layouts are chosen using the standard Rails `layout` helper:

```ruby
class ApplicationController < ActionController::Base
  layout 'fluid_right_sidebar'
end
```

## Customising the Layout ##

Once you have selected a layout you can start adding navbar and sidebar content. That's done by
providing some helpers within your application which if they exist are be called and used to
fill in the empty spaces.

### The Navbar ###

The left and right navbar areas at the top of the page are populated in the same way. The left
navbar is the links on the left hand side, while the right navbar is the links on the right.

To populate them create a helper called either `navbar_left` or `navbar_right`. The method
will be passed a NavigationBuilder instance which can be filled with items.

```ruby
module ApplicationHelper
  def navbar_left(menu)
    menu.item 'Home', root_path
    menu.item 'News', news_path, active: true
  end

  def navbar_right(menu)
    menu.item 'Profile', profile_path
    menu.item icon('icon-off'), destroy_user_session_path, method: :delete
  end
end
```

You can pass an image path as the first argument to a menu item to create an image based link. This is really easy using the `icon` helper, which gives access to all of the Font Awesome images.

You can also provide a `brand` helper that be called to setup your sites main brand text and link.

```ruby
module ApplicationHelper
  def brand(link)
    link.item 'Brand', root_path
  end
end
```

### The Sidebar ###

The sidebar is filled by a `sidebar` helper if one exists.

```ruby
module ApplicationHelper
  def sidebar
    content_tag("div", :class => "block") do
      content_tag("ul", :class => "navigation") do
        content_tag("li", link_to("News Item 3", news_path(3)))
      end
    end
  end
end
```

It's probably easier to render a partial here, especially if your sidebar is going to change frequently.

```ruby
module ApplicationHelper
  def sidebar
  render 'shared/sidebar'
  end
end
```

You can also use a `content_for` block to pass html for rendering on the sidebar.

```erb
<% content_for :sidebar do %>
  <%= sidebar_navigation do |nav| %>
    <% nav.header "Sidebar Header" %>
    <% nav.item "New Person", new_person_path, class: 'active' %>
  <% end %>
<% end %>
```

### Sidebar Navigation ###

There is also a  `sidebar_navigation` helper that allows you create a vertical navigation list with headers a links.

```erb
<%= sidebar_navigation do |nav| %>
  <% nav.header "Sidebar Header" %>
  <% nav.item "New Person", new_person_path, class: 'active' %>
<% end %>
```

## View Helpers ##

### The Content Box ###

Views revolve around the idea of a content box. A basic view, with a single content box, and a page title would look something like this.

```erb
<% provide :title, "Hello, world!" %>

<%= content_box :headline => 'Hello, World!' do %>
  <p>This is a basic Rails Bootstrap App Theme template.</p>
<% end %>
```

### Setting the Page Title ###

To set the page title from a view use the `provide` helper:

```erb
<% provide :title, "My Awesome Page" %>
```

By default if no title has been set then it will be "Untitled Page", but you can set an alternative
by setting `@title` in your application controller:

```ruby
class ApplicationController < ActionController::Base
  before_filter :set_default_title
  def set_default_title
    @title = "My Site"
  end
end
```

### Icons ###

To display icons use the `icon` helper. Rails Bootstrap App Theme includes the Fatcow icons from www.fatcow.com/free-icons,
which are licensed under the Creative Commons Attribution 3.0 license. It's up to you to either
comply with that license, or replace them with something else.

    <%= icon "delete", :large, :alt => "Delete Item" %>

The first argument is the filename of the icon, without extension.

The second is the size. :small gives a 16x16 icon, :large gives 32x32.

Finally, a hash of options. Currently the only valid option is :alt which sets the alt text to be
included in the image tag. Further options will probably be supported in the future.

### Navigation Tabs ####

The `navigation` helper is used to add some tabs to the top of a content box.

<% page_title "About Us" %>

<%= content_box :headline => 'About Us' do |box| %>
  <%= box.navigation do |n|
    n.item "The Company", about_path("company"), :active => true
    n.item "Our Offices", about_path("offices")
    n.item "Jobs", about_path("jobs"), :class => "highlighted"
  end %>
  <p>We're an amazing company! We do things!</p>
  <p>To find out more, click the tabs above.</p>
<% end %>

Each item can be passed a hash of options. Valid options are:

  active (boolean): If set to true, the tab will be highlighted as the current tab.
  class (string): Additional classes to apply to the tab.
  link\_options (hash): A hash of options to pass to link\_to.

### Breadcrumbs ###

These are much like tabs, but appear at the bottom of a block as a trail of pages.
They're added using the `breadcrumbs` helper.

<% page_title "News Item 3" %>

<%= content_box :headline => 'News Item 3' do |box| %>
  <%= box.breadcrumbs do |b|
    b.item "Home", root_path
    b.item "News", news_path
    b.item "News Item 3", news_path(3), :active => true
  end %>

  <p>We've got some new news here. Read all about it!</p>
<% end %>

Valid options are the same as for tabs.

### Controls ###

To add a set of buttons to the top of a content_box_, use the `controls` helper.

<% page_title "News Item 3 (Admin Mode)" %>

<%= content_box :headline => 'New Item 3' do |box| %>
  <%= box.controls do |c|
    c.item "Delete", news_path(3), :link_options => { :method => :delete, :confirm => "Really delete News Item 3?" }, :icon => "delete"
    c.item "Edit", edit_news_path(3), :icon => "edit"
  end %>
  <p>We've got some new news here. Read all about it!</p>
<% end %>

Valid options are the same as for tabs, with an additional `icon` option, which will be passed
to the `icon` helper.

## Adding to the header ##

To add content to the header, you have two choices, depending on how often you need to do so.

### yield :head ###

If you just need to add something on a single page, provide some content for the head block:

<% content_for :head do %>
  <script>
    console.log('This is in the header now.')
  </script>
<% end %>

### def head ###

If you're going to want the content more regularly, you can create a helper called head, which
will be called at the appropriate place:

def head
  content_tag("script", "console.log('This is in the header now.')")
end



## Contributing ##

Any contributions should come with accompanying tests, examples of which can be found in the spec/ directory.

To test that the right content is being generated make modifications to the application in spec/dummy/ and then
add a new integration test for it in spec/integration/. I know not everything is covered by integration tests yet.
That's no excuse not to write them for new features ;)

The test suite can be run by using `rake spec`.

## Credits ##

For the original (and beautiful) Rails Bootstrap App Theme web app theme: David Francisco (http://github.com/dmfrancisco/Rails Bootstrap App Theme)
Icons: FatCow (http://www.fatcow.com/free-icons)

Fixing jQuery UI image paths: Mike Park (http://github.com/mikepinde/)

Fixing link options, and breadcrumbs: Nirmit Patel (http://github.com/NeMO84/)

And thanks to the people brave enough to use this before it was released, or even had a readme, for provoking me into
actually releasing the damn thing.

## License ##

All original components of Rails Bootstrap App Theme-rails are licensed under the MIT license:

Copyright (c) 2011, Blank Pad Development

That doesn't cover the Rails Bootstrap App Theme theme itself, the FatCow icon set, or jQuery, which remain under their original licenses
and the property of their original authors.


  [1]: http://twitter.github.io/bootstrap/
  [2]: https://github.com/thomas-mcdonald/bootstrap-sass
