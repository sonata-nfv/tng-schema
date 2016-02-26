# son-schema
The schema files for the various descriptors used by SONATA

## Development

To contribute to the development of the SONATA schema files, you may use the very same development workflow as for any other SONATA Github project. That is, you have to fork the repository and create pull requests. Moreover, all discussions regarding the SONATA schemas take place on Github, and NOT on the wiki.

#### Integration with Jenkins

The repository is integrated with Jenkins. Thus, every pull request is checked automatically. The Jenkins job validates all the JSON and YAML files in the repository to be a valid JSON/YAML format. Moreover, Jenkins executes all files named 'test_*.sh' that reside in */test/ directories automatically. Thus, it is quite easy to add new tests. Just write a corresponding bash script. Tests are considered successful when they return with exit code 0, and to be a failure otherwise.
