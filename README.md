# omniauth-campfire

The official OmniAuth strategy for CAMPFIRE.

NOTE: OAuth with [CAMPFIRE](https://camp-fire.jp) is not publicity available for now.

## Installation

```ruby
gem 'omniauth-campfire'
```

## Usage

```ruby
use use OmniAuth::Builder do
  provider :campfire, ENV["CAMPFIRE_CLIENT_ID"], ENV["CAMPFIRE_CLIENT_SECRET"]
end
```
