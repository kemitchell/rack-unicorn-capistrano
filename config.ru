RESPONSE = "Served by Unicorn"

application = lambda do |env|
  [
    200,
    {
      'Content-Type' => 'text/plain',
      'Content-Length' => RESPONSE.length.to_s
    },
    [RESPONSE]
  ]
end

run application
