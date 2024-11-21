#!/bin/bash
square() { echo $(( $1 * $1 )); }
cube() { echo $(( $1 * $1 * $1 )); }

echo "Square: $(square 5)"
echo "Cube: $(cube 5)"