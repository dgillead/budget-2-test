#!/bin/bash

echo 'rake db:drop'
rake db:drop
echo 'rake db:create'
rake db:create
echo 'rake db:migrate APP_ENV=test'
rake db:migrate APP_ENV=test
echo 'rake db:migrate APP_ENV=development'
rake db:migrate APP_ENV=development
echo 'rake db:seed APP_ENV=test'
rake db:seed APP_ENV=test
echo 'rake db:seed APP_ENV=development'
