#!/usr/bin/python
import re, subprocess, argparse, os, json
dir_path = os.path.dirname(os.path.realpath(__file__))

parser = argparse.ArgumentParser(description='Expecting a --list argument')
parser.add_argument('--list', help='Return json with dynamicaly requested hosts addresses', action="store_true")
args = parser.parse_args()
if args.list:
    os.chdir(os.path.join(dir_path, '../..', 'terraform'))
    output = subprocess.check_output(['terraform', 'show'])
    docker_hosts_raw = re.search("external_ip_address_app = \[\n([ \",0-9.\n]+)\n\]", output).group(1)
    docker_hosts = json.dumps(re.findall("[0-9.]+", docker_hosts_raw))

    inventory_template = str()
    with open(os.path.join(dir_path, 'inventory.json')) as file:
        inventory_template = file.read()

    inventory = inventory_template.replace("${monolith_hosts}", docker_hosts)

    print inventory
    exit(0)
else:
    print 'No --list argument was provided'
    exit(-1)
