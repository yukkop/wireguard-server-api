#!/bin/sh

#tail -f /dev/null

wg-quick up wg0
wgrest --static-auth-token 'capybara' --listen '0.0.0.0:8383'