#!/bin/sh

function test_or_and() {
  if [ -n "$(pgrep -f 'test1.sh')" ] && [ -n "$(pgrep -f test2.sh)" ]; then
    echo "a and b is running"
  fi

  if [ -n "$(pgrep -f test1.sh)" ] || [ -n "$(pgrep -f test2.sh)" ]; then
    echo "either a or b is running"
  fi
}

test_or_and