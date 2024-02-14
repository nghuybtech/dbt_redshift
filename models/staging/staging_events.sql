select
    substring(
        url,
        position('//' in url)
        + length('//')
        + position('/' in substring(url, position('//' in url) + length('//')))
    ) as path,
    regexp_substr(url, '.*[\?&;]utm_source=([^&|;]+).*') as utm_source,
    timestamp 'epoch' + time * interval '1 second' as converted_timestamp,
    *
from cultureamp.events

