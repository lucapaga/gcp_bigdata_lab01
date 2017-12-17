import argparse
import time
import os

from google.cloud import pubsub_v1

def create_subscription(project, topic_name, subscription_name):
    """Create a new pull subscription on the given topic."""
    subscriber = pubsub_v1.SubscriberClient()
    topic_path = subscriber.topic_path(project, topic_name)
    subscription_path = subscriber.subscription_path(
        project, subscription_name)

    subscription = subscriber.create_subscription(
        subscription_path, topic_path)

    print('Subscription created: {}'.format(subscription))


def delete_subscription(project, subscription_name):
    """Deletes an existing Pub/Sub topic."""
    subscriber = pubsub_v1.SubscriberClient()
    subscription_path = subscriber.subscription_path(
        project, subscription_name)

    subscriber.delete_subscription(subscription_path)

    print('Subscription deleted: {}'.format(subscription_path))


def receive_messages(project, subscription_name):
    """Receives messages from a pull subscription."""
    subscriber = pubsub_v1.SubscriberClient()
    subscription_path = subscriber.subscription_path(
        project, subscription_name)

    def callback(message):
        print('Received message: {}'.format(message))
        message.ack()

    subscriber.subscribe(subscription_path, callback=callback)

    # The subscriber is non-blocking, so we must keep the main thread from
    # exiting to allow it to process messages in the background.
    print('Listening for messages on {}'.format(subscription_path))
    while True:
        time.sleep(60)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=(
            'Sample chat with PUB/SUB'))
    parser.add_argument(
            '--project_id',
            default=os.environ.get('GOOGLE_CLOUD_PROJECT'),
            help='GCP cloud project name')
    parser.add_argument(
            '--subscription_name',
            required=True,
            help='PUB/SUB Subscription to leverage')
    parser.add_argument(
            '--mode',
            choices=('consume', 'produce'),
            required=True,
            help='Which encryption algorithm to use to generate the JWT.')

    args = parser.parse_args()
    
    if args.mode == 'consume':
        receive_messages(args.project_id, args.subscription_name)
    else:
        print("Not implemented yet, sorry")
