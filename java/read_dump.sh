#!/bin/sh

awk '{ 
    if ($2~/TIMESTEP$/ ) { 
        getline; 
        printf "%s ", $1 } else {
            if ($1~/^100$/) {
                printf "%s\n", $5 
            }
        } 
    }' dump.nh3.lammpstrj >> output.data
