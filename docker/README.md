# Docker Label inspector

[![](https://images.microbadger.com/badges/image/nimmis/label-inspector.svg)](https://microbadger.com/images/nimmis/label-inspector "Get your own image badge on microbadger.com")

Docker Label Inspector is a tool to help ensure you're providing your
Docker images with the metadata they will need and that it has the correct syntax.

It provides two useful tools; a **label linter** and a **label validator**.


## Usage

This container is for those who not what to install python/pip on their computers.

### running linter

The linter checks your labels against the [official LABEL
guidelines](http://docs.docker.com/engine/userguide/labels-custom-metadata/).

To run linter use the following command 

	docker --rm -i nimmis/label-inspector lint < Dockerfile

The output if all goes well look like this

```
docker --rm -i nimmis/label-inspector lint < Dockerfile
========> Check all labels have namespaces
========> Check labels don't use reserved namespaces
========> Check labels only use valid characters
========> Check labels start and end with alpanumeric characters
========> Check labels for double dots and dashes
```

### running validate

The linter checks your labels against the [Label Schema RC1](http://label-schema.org/rc1/).

To run validate use the following command

	docker --rm -i nimmis/label-inspector validate < Dockerfile

The output if all goes well look like this

```
docker --rm -i nimmis/label-inspector validate < Dockerfile
========> Check labels based on schema in '/dli/schema.json'
```

``

## mapping other schema files

The schema file is only used when running validate, to use another schema stored on the disk, map

	docker --rm -i -v /path/to/file/schena.json:/dli/schema.json nimmis/label-inspector validate < Dockerfile


## Using alias to make lint and validate commands

Adding the following alias

	alias lint='docker run -i --rm nimmis/label-inspector lint < Dockerfile'
	alias validate='docker run -i --rm nimmis/label-inspector validate < Dockerfile'
	
makes it possible to use the container as a command, just run

	lint

or

	validate
	
on the command line to check the Dockerfile in the current directory

The alias with a local schema file replace the above alias with

	alias validate='docker run -i --rm -v /path/to/file/schena.json:/dli/schema.json nimmis/label-inspector validate < Dockerfile'
