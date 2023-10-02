WITH q1_data AS (
  SELECT *
  FROM {{ ref('MJ.Q1') }}
)
SELECT *
FROM q1_data;
