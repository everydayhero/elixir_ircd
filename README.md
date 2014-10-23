# ElixirIrcd

This is an irc daemon written in elixir.

Currently it binds to a port.  Clients will receive a hard coded
message.  Otherwise it just writes what the client sends to stdout.

TODO:

- disconnect when the client doesn't write anything
- handle 'PASS serverpassword\r\n'
- handle 'NICK nickname\r\n'
- handle 'USER login 0 * realname\r\n'

## Build

    mix escript.build

## Test

    mix test

## Run

    ./elixir_ircd

For reference, here are some links that specify the irc protocol:

* [RFC1459](http://tools.ietf.org/html/rfc1459) - original specification
* [RFC2810](http://tools.ietf.org/html/rfc2810) - architecture
* [RFC2811](http://tools.ietf.org/html/rfc2811) - channel management
* [RFC2812](http://tools.ietf.org/html/rfc2812) - client protocol
* [RFC2813](http://tools.ietf.org/html/rfc2813) - server protocol

## Future plans

* actually implement something - anything at all
