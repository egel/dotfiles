import re


def slugMe(a):
    try:
        lower = a.lower()
        lower = re.sub('[_\ ,!@#$%^&*\(\)]', '-', lower)  # remove special char
        lower = re.sub('[-]+', '-', lower)  # remove multiple '-'
        lower = lower.strip('[\ -]')  # remove from begin/end of string
        return lower
    except (ValueError):
        return "ERR"
