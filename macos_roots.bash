#!/bin/bash

for dir in roots/*; do
	darwinup install "${dir}"
done
