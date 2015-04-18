# MotionPanel
A native [RubyMotion](http://www.rubymotion.com/) wrapper around the [Mixpanel](https://mixpanel.com/) API.

For updates, find me [here](http://www.tombroomfield.com) or [follow me on twitter](https://twitter.com/tom_broomfield)

##Installation
Currently MotionPanel requires the [BubbleWrap](https://github.com/rubymotion/BubbleWrap) and the [AFMotion](https://github.com/clayallsopp/afmotion) RubyMotion libraries, please ensure these are installed.

Gemfile
```ruby
gem 'motion_panel'
```

Rakefile
``` ruby
require 'motion_panel'
```

then run bundle install and you should be good to go.


##Tracking an event
Before you start tracking events, you must initialize it with your project token.

```ruby
Mixpanel.shared_instance_with_token(YOUR_MIXPANEL_TOKEN)
```
From then on, you can simple access the client without the token:

```ruby
Mixpanel.shared_instance
```

You can then use the shared instance to track events:

```ruby
Mixpanel.shared_instance.track('Example event', attribute: 'Value', second_attribute: 'Second value')
```
The extra parameters are optional.


##TODO
- People management.
- Better exceptions.
- Specs.
- Alternate interface for a better Ruby experience.
- Better dependancy management.


Feel free to shoot through a PR or open an issue.

Thankyou to the incredible people at [Mixpanel](https://mixpanel.com/) and [RubyMotion](http://www.rubymotion.com/) for the great services they provide to developers.
