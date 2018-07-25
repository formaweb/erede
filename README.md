# Rede Acquirer

Ruby Webservice Integration

## Installation

```
gem install erede
```

## Creating a transaction

```ruby
require "acquirer"

acquirer = Rede::Acquirer.new("1250191", "password213123", Rede::EnvironmentType::DEVELOP)

authorize_credit_request = Rede::GetAuthorizedCreditRequest.new()
authorize_credit_request.card_number = "54482800000007"
authorize_credit_request.expiration_month = "12"
authorize_credit_request.expiration_year = "2023"
authorize_credit_request.amount = "14.20"
authorize_credit_request.card_holder_name = "Card Holder Name"
authorize_credit_request.capture = true
authorize_credit_request.installments = 5
authorize_credit_request.order_id = "oderid1"

getauthorizedcredit_response = acquirer.authorize_credit(authorize_credit_request)

```


## Creating an authorization

```ruby
require "acquirer"

acquirer = Rede::Acquirer.new("1250191", "password213123", Rede::EnvironmentType::DEVELOP)

authorize_credit_request = Rede::GetAuthorizedCreditRequest.new()
authorize_credit_request.card_number = "54482800000007"
authorize_credit_request.expiration_month = "12"
authorize_credit_request.expiration_year = "2023"
authorize_credit_request.amount = "14.20"
authorize_credit_request.card_holder_name = "Card Holder Name"
authorize_credit_request.capture = true
authorize_credit_request.installments = 5
authorize_credit_request.order_id = "oderid1"
authorize_credit_request.capture = false

getauthorizedcredit_response = acquirer.authorize_credit(authorize_credit_request)

```

## Capturing an authorization

```ruby
require "acquirer"

acquirer = Rede::Acquirer.new("1250191", "password213123", Rede::EnvironmentType::DEVELOP)

capture_request = Rede::CaptureRequest.new()
capture_request.tid = "12345"
capture_request.amount = "14.20"
capture_response = acquirer.capture(capture_request)

```

## Refund a transaction

```ruby
require "acquirer"

acquirer = Rede::Acquirer.new("1250191", "password213123", Rede::EnvironmentType::DEVELOP)

cancel_request = Rede::CancelRequest.new()
cancel_request.tid = "123456"
cancel_request.authorization_number =  "78910"
cancel_request.nsu =  "123456789"
cancel_request.date =  "20160122"

cancel_response = acquirer.cancel(cancel_request)

```

## Find a transaction

```ruby
require "acquirer"

acquirer = Rede::Acquirer.new("1250191", "password213123", Rede::EnvironmentType::DEVELOP)

find_request = Rede::FindRequest.new()
find_request.tid = "123456"
find_response = acquirer.find(find_request)

```
