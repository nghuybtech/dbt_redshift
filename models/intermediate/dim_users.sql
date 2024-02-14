select anonymous_user_id, min(converted_timestamp) as min_action
from {{ ref("staging_events") }}
group by anonymous_user_id
