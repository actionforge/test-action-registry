#!/bin/bash

echo "Working directory: $(pwd)"
echo "Home directory: $HOME"
echo "Environment:"
printenv

# check if env CUSTOM_ENV is "lorem" or ipsum or dolor
if [[ "$CUSTOM_ENV" != "lorem" && "$CUSTOM_ENV" != "ipsum" && "$CUSTOM_ENV" != "dolor" ]]; then
    echo "Invalid CUSTOM_ENV value: $CUSTOM_ENV"
    exit 1
fi

# Validate input1
if ! [[ "$INPUT_INPUT1" =~ ^(lorem|ipsum|dolor)$ ]]; then
    echo "Invalid input1 value: $INPUT_INPUT1"
    exit 1
fi

# Validate input2
if ! [[ "$INPUT_INPUT2" =~ ^(lorem|ipsum|dolor)$ ]]; then
    echo "Invalid input2 value: $INPUT_INPUT2"
    exit 1
fi

# Set outputs
echo "output1=this output1 is set by test-action-registry" >> $GITHUB_OUTPUT
echo "output2=this output2 is set by test-action-registry" >> $GITHUB_OUTPUT

# Add to PATH
echo "/foo/bar/test-action-registry" >> $GITHUB_PATH

# Export variable
echo "MY_ENV=this env modified by test-action-registry and input1 value is '${INPUT_INPUT1}'" >> $GITHUB_ENV
