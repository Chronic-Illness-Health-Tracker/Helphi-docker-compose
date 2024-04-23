CREATE KEYSPACE IF NOT EXISTS questions
WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 3 };

USE questions;

CREATE TYPE answer (
  answer_text text,
  answer_score int,
);

CREATE TABLE condition_check_in (
  condition_id text,
  subclinical_score int,
  unwell_score int,
  PRIMARY KEY (condition_id)
);

CREATE TABLE questions_by_condition (
  question_id bigint,
  condition_id text,
  question_text text,
  question_type text,
  possible_answers list<frozen<answer>>,
  answer_score_range set<int>,
  PRIMARY KEY (condition_id, question_id)
) WITH CLUSTERING ORDER BY (question_id DESC);

CREATE TABLE user_responses_by_condition_user (
  response_id bigint,
  question_id bigint,
  condition_id text,
  user_id text,
  answer list<frozen<answer>>,
  timestamp timestamp,
  PRIMARY KEY ((user_id, condition_id), response_id)
) WITH CLUSTERING ORDER BY (response_id DESC);