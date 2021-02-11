#!/bin/bash
  gencount=1
  obscount=0
  PODS_COUNT=3
  echo "Polling status of deployment"
  while [ $obscount -lt $gencount ]; do
    generation=`kubectl get deployment/random-solution-deployment -o yaml | grep '[Gg]eneration'`
    gencount=$(echo -e "$generation" | head  -n1 | awk -F': ' '{print $2}')
    obscount=$(echo -e "$generation" | tail  -n1 | awk -F': ' '{print $2}')
    echo "Found generation: $gencount"
    echo "Found observedGeneration: $obscount"
    sleep 5
  done

  uptodate_count=$(kubectl get deployments | grep random-solution-deployment | awk '{print $4}')
  if [ $uptodate_count -ge $PODS_COUNT ]; then
         exit 0
  fi
  exit 1
