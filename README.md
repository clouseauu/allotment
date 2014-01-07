# Allotment

Command line tool to check Internet caps. Currently supports just one provider: Fuzeconnect.

## Installation

Add this line to your application's Gemfile:

    gem 'allotment'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install allotment

## Usage

    $ allotment -h

CLI options are as follows

    Options:
          --name, -n <s>:   Provider (default: fuzeconnect)
       --logfile, -l <s>:   Log File (default: /Users/daniel/allotment.log)
      --username, -u <s>:   Username
      --password, -p <s>:   Password
         --puser, -t <s>:   Pushover User Token
          --papp, -a <s>:   Pushover App Token
              --help, -h:   Show this message


### Example

    $ allotment -n fuzeconnect -u <username> -p <password>

Allotment supports pushover notifications as well:

    $ allotment -n fuzeconnect -u <username> -p <password> -t <user_token> -a <app_token>

This is still pretty much a work in progress

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
