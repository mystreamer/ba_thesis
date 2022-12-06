import logging

logger = logging.getLogger('nodes.data_clean')


def update(client, params):
    """
    Want a per-sentence dev-test split. Meaning that S1 cannot occur in test set if it occurs in dev / train set."""
    pass

def done(client, params):
    pass