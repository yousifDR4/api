#!/bin/bash

# Check if the controller name is passed as an argument
if [ -z "$1" ]; then
  echo "Please provide the controller name."
  exit 1
fi

# Controller name passed as an argument
CONTROLLER_NAME=$1

# Define the path where the controller will be saved (adjusted to your desired directory)
CONTROLLER_DIR="C:\Users\ASUS\Desktop\Admin\api\Controllers"
CONTROLLER_PATH="${CONTROLLER_DIR}/${CONTROLLER_NAME}Controller.cs"

# Check if the controllers directory exists, if not, create it

# Check if the controller file already exists
if [ -f "$CONTROLLER_PATH" ]; then
  echo "Controller $CONTROLLER_NAME already exists."
  exit 1
fi

# Create the controller file
cat > $CONTROLLER_PATH <<EOL
using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
namespace api.Controllers;
    [ApiController]
    [Route("[controller]")]
public class ${CONTROLLER_NAME}Controller : ControllerBase
{
   DapperContext _dapperContext;

    public ${CONTROLLER_NAME}Controller (DapperContext dapperContext)
    {
    _dapperContext=dapperContext;
    }
}
    
EOL

# Inform the user
echo "$CONTROLLER_NAME Controller created at $CONTROLLER_PATH"
