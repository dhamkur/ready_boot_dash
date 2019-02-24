# ReadyBootDash

ReadyBootDash is NEEAD (Nice Easy Elegant Admin Dashboard) based on [Bootstrap 4 Framework](https://getbootstrap.com/). This gem included:

* JQuery 3.2.1
* JQuery UI 1.12.1
* JQuery Validate
* Jquery Scrollbar
* JQuery Mapael
* JQuery Mapael/World Countries
* Ready CSS Admin Style
* Bootstrap 4
* Bootstrap 4/Bootstrap Notify
* Bootstrap 4/Bootstrap Toggle
* Popper
* Chartist
* Chartist Plugin Tooltip
* Moment JS

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ready_boot_dash'
gem 'jquery-validation-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ready_boot_dash

## Usage

All assets included in this gem. You just need to require css and javascript inside application.css and application.js.

Inside application.css:

```css
*= require ready_boot_dash
```

And inside application.js:

```javascript
//= require ready_boot_dash
```

Initializing Datepicker and Validate Form.

```javascript
$(document).ready(function() {
  // Initialize datepicker for bootstrap 4
  $('#idDate').datepicker({
    showOtherMonths: true,
    format: 'dd/mm/yyyy',
    uiLibrary: 'bootstrap4'
  });

  // Validation Room Form
  $('#idForm').validate();
});
```

Setup inside application.html.slim

```
.wrapper
  .main-header
    = render 'shared/external-admin/header'
  = render 'shared/external-admin/sidenav'

  .main-panel
    .content
      .container-fluid
        .row
          .col-lg-12.col-md-12
            = yield

= javascript_include_tag 'application'
script src="https://unpkg.com/default-passive-events@1.0.10/dist/index.js"
script src="https://buttons.github.io/buttons.js"
script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"
```

or if you prefer use the ```= javascript_include_tag 'application'``` on header tag you can move it there as well.

Inside shared/external-admin/_header.html.slim

```
.logo-header
  a.logo href=admin_root_url
    | Your Company Name
  button.navbar-toggler.sidenav-toggler.ml-auto aria-controls="sidebar" aria-expanded="false" aria-label=("Toggle navigation") data-target="collapse" data-toggle="collapse" type="button"
    span.navbar-toggler-icon
  button.topbar-toggler.more
    i.la.la-ellipsis-v
nav.navbar.navbar-header.navbar-expand-lg
  .container-fluid
    ul.navbar-nav.topbar-nav.ml-md-auto.align-items-center
      li.nav-item.dropdown
        a.dropdown-toggle.profile-pic aria-expanded="false" data-toggle="dropdown" href="#"
          = image_tag("profile.jpg", class: 'img-circle', width: 36)
          - if current_user.name.present?
            span= current_user.name
          - else
            span Admin Your Company Name
        ul.dropdown-menu.dropdown-user
          li
            .user-box
              .u-img
                = image_tag("profile.jpg")
              .u-text
                - if current_user.name.present?
                  h4= current_user.name
                - else
                  h4 Your Company Name
                p.text-muted= current_user.email
                a.btn.btn-rounded.btn-danger.btn-sm href="#"
                  | Change Profile
          .dropdown-divider
          = link_to destroy_user_session_url, method: :delete, class: 'dropdown-item' do
            | Logout
```

Inside shared/external-admin/_menu.html.erb

```html
<li class="nav-item <%= active_for(controller: "dashboards") %>">
  <%= link_to admin_root_url, class: "nav-link" do %>
    <i class="material-icons">dashboard</i>
    <p>Dashboard</p>
  <% end %>
</li>
```

Inside shared/external-admin/sidenav.html.slim
```
.sidebar
  .scrollbar-inner.sidebar-wrapper
    .user
      .photo
        = image_tag("profile.jpg")
      .info
        a aria-expanded="true" data-toggle="collapse" href="#collapseExample"
          - if current_user.name.present?
            span
              = current_user.name
              span.user-level.text-capitalize= "Role: #{current_user.role}"
          - else
            span
              | Admin Your Company Name
              span.user-level.text-capitalize= "Role: #{current_user.role}"
    ul.nav
      = render 'shared/external-admin/menu'
```

For helper active_for added this code into application_helper.rb

```ruby
def active_for(options = {})
  name_of_controller = options[:controller] || nil
  name_of_action     = options[:action]     || nil
  request_path       = options[:path]       || nil

  if request_path.nil?
    if (name_of_action.nil? || name_of_action == action_name) && name_of_controller == controller_name
      'active'
    else
      ''
    end
  else
    request_path == request.path ? 'active' : ''
  end
end
```

And for example generated views by controller you just need to adding some card class admin/payments/index.html.slim

```
.card
  .card-header.bg-danger
    .float-left.text-white Payments
    .float-right
      = link_to 'New Payment', new_admin_payment_url, class: 'text-white badge badge-primary'
  .card-body
    // Your table here
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [ReadyBootDash](https://github.com/adhamkurniawan29/ready_boot_dash/issues).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
