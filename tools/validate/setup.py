"""
Copyright (c) 2017 5GTANGO and Paderborn University
ALL RIGHTS RESERVED.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Neither the name of the 5GTANGO, Paderborn University
nor the names of its contributors may be used to endorse or promote
products derived from this software without specific prior written
permission.

This work has been performed in the framework of the 5GTANGO project,
funded by the European Commission under Grant number H2020-ICT-2016-2 761493
through the Horizon 2020 and 5G-PPP programmes. The authors would like to
acknowledge the contributions of their colleagues of the 5GTANGO
partner consortium (www.5gtango.eu).
"""
from setuptools import setup, find_packages

setup(name='yamlvalidate',
      version='5.0',
      license='Apache 2.0',
      description='Simple JSON-schema validator for YAML files.',
      url='https://github.com/5gtango/tango-schema',
      author_email='manuel@peuster.de',
      package_dir={'': '.'},
      packages=find_packages('.'),
      data_files=[('yamlvalidate/schemas', ["yamlvalidate/schemas/draft4.json"])],
      install_requires=[
          'pyaml',
          'jsonschema',
          'argparse'
      ],
      zip_safe=False,
      entry_points={
          'console_scripts': [
              'yamlvalidate=yamlvalidate:main',
          ],
      },
      )
