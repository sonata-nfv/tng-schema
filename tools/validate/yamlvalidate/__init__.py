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
import argparse
import yaml
import sys
from jsonschema import validate


def parse_args():
    parser = argparse.ArgumentParser(
        description="yamlvalidate")
    parser.add_argument(
        "-s",
        "--schema",
        help="Schema file (JSON schema)",
        required=True,
        dest="schema_path")
    parser.add_argument(
        "-y",
        "--yaml",
        help="YAML file to be validate against the schema",
        required=True,
        dest="yaml_path")
    return parser.parse_args()


def read_yaml(path):
    try:
        with open(path, "r") as f:
            yaml_data = yaml.load(f)
    except:
        print("Couldn't open '{}'. Abort.".format(path))
        sys.exit(1)
    print("Loaded: {}".format(path))
    return yaml_data


def main():
    args = parse_args()
    # read schema and data
    schema = read_yaml(args.schema_path)
    data = read_yaml(args.yaml_path)
    # validate (will throw ValidationError)
    validate(data, schema)
    print("Vaild!")
