# awesant

Include the awesant class into your hiera or manifests:

    include awesant


define outputs and inputs via hiera:

    awesant::output::rabbitmq:
      'rabbit_localhost':
        type: 'foobar'
        host: 'localhost'
        user: 'guest'
        password: 'guest'
        queue: 'graylog'
        exchange: 'graylog'
        queue_exclusive: false
        queue_durable: true
        queue_auto_delete: false
        exchange_type: 'direct'
        exchange_durable: true
        exchange_auto_delete: true
      
    # input that reads gelf from file
    awesant::input::file:
      'foobar':
        type: 'foobar'
        path: '/var/log/foobar.log'
        format: 'json'
      'bar':
        type: 'foobar'
        path: '/var/log/bar.log'
        format: 'json'



