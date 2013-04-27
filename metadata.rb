name              "pypi-mirror"
maintainer        "Steve Marshall"
maintainer_email  "steve@nascentguruism.com"
license           "Apache 2.0"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1"
depends           "python"

recipe "pypi-mirror", "Configures the machine as a mirror of https://pypi.python.org"
