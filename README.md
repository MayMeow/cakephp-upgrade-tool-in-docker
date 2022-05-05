## Dockerized CakePHP Upgrade tool

This is for us who use docker for php development.

## Build and run script

```bash
docker build -t cake-upgrade-tool .
cd /path/to/your/application
docker run --rm --volume $(pwd):/app cake-upgrade-tool sh -c "bin/cake upgrade rector --rules cakephp43 /app/src"
```

Script above will upgrade version of your application for using `CakePHP 4.3.x`

## Issues

When you getting something like this

```bash
0%Fatal error: Class PHPStan\PhpDocParser\Ast\PhpDoc\PhpDocTextNode contains 3 abstract methods and must therefore be declared abstract or implement the remaining methods (PHPStan\PhpDocParser\Ast\Node::setAttribute, PHPStan\PhpDocParser\Ast\Node::hasAttribute, PHPStan\PhpDocParser\Ast\Node::getAttribute) in /app/vendor/phpstan/phpdoc-parser/src/Ast/PhpDoc/PhpDocTextNode.php on line 5
```
 
 Prior to this issue `https://github.com/cakephp/upgrade/issues/173` you have to remove `vendor/phpstan` directory to make this successfull.