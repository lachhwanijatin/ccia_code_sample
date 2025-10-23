#!/bin/bash

# Loop through the numbers 1, 2, 3... 11
for i in {1..11}; do
  echo "Moving listing_${i}* to ch${i}/"
  mv "listing_${i}."* "ch${i}/"
done

echo "All files moved."
