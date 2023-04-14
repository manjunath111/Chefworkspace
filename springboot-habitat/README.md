# myworkspace Deploy spring boot app using chef habitat

# Steps to run java application using habitat

hab studio enter
build .
source results/last_build.env
hab pkg export tar ${pkg_origin}/${pkg_name}:${pkg_version}

# The above commands  will create a tar archive that can be copied to the  instance and extracted to run the Spring Boot application using Chef Habitat. Note that you will need to have the Habitat Supervisor running on the instance to run the packaged application

# Steps to install chef habitat & supervisor on linux

curl <https://raw.githubusercontent.com/habitat-sh/habitat/main/components/hab/install.sh> | sudo bash

# Initialize the Habitat Supervisor by running the following command

sudo hab sup run

# Create a Habitat package for your Spring Boot application by running the following command from the root directory of your application

hab pkg build .

# The Above command will create a Habitat package (in .hart format) in the results

# Upload the Habitat package to a Depot (which is a centralized repository for Habitat packages) by running the following command

hab pkg upload results/<myapp-hart-file>

# Replace <myapp-hart-file> with the name of your Habitat package file

# Install the Habitat package on the  instance by running the following command

sudo hab svc load <origin>/<package>/<version>

# Replace <origin>/<package>/<version> with the fully-qualified name of your Habitat package (e.g. myorigin/myapp/1.0.0)

# Check the status of the Habitat service by running the following command

sudo hab svc status

# Access your Spring Boot application by using the public IP or DNS name of your instance and the configured port (e.g. <http://<ec2-instance-ip>:8080>)
