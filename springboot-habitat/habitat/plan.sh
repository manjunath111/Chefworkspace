pkg_name=spring-boot-hello-world-example
pkg_origin=spring-boot-habitat
pkg_version="1.0.1"
pkg_maintainer="manjunath.reddy@progress.com"
pkg_license=('Apache-2.0')
pkg_deps=(core/jdk9)
pkg_build_deps=(
  core/maven
)

do_build() {
   cd $PLAN_CONTEXT/../

  # Build the Spring Boot application
#   mvn clean install -U
  mvn clean package

}

do_install() {
  # Install the JRE
  hab pkg install core/jre9

  # Create directory for installation

  # Copy the built JAR to the installation directory
  cd $PLAN_CONTEXT/../target/
  cp spring-boot-hello-world-example.jar $pkg_prefix/$pkg_name

  # Start the Spring Boot application using the JRE
#   java -jar spring-boot-hello-world-example.jar
}
