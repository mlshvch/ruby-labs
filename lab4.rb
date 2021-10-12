message = <<END_OF_MESSAGE
From: mlshvchdev <malashevichdev@gmail.com>
To: A M <alexblr01@mail.ru>
Subject: test message

This is a test message from Ruby SMTP lab 4.
END_OF_MESSAGE


require 'net/smtp'
require 'tlsmail' 
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)

Net::SMTP.start('smtp.gmail.com', 587, 'localhost', 'malashevichdev@gmail.com', 'f1trc1td', :login) do |smtp|
  smtp.send_message message,
                    'malashevichdev@gmail.com',
                    'alexblr01@mail.ru'
end

pp "done"

