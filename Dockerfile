FROM rabbitmq:3.8.27-management

RUN apt-get update \
  && apt-get install -y curl \
  && rm -rf /var/lib/apt

RUN curl -L 'https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.8.17/rabbitmq_delayed_message_exchange-3.8.17.8f537ac.ez' --output $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.8.17.8f537ac.ez

RUN chown rabbitmq:rabbitmq $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.8.17.8f537ac.ez

RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange \
  && rabbitmq-plugins enable --offline rabbitmq_consistent_hash_exchange