# docker-env

Set the docker environment variables the come from running docker-machine env

## Usage

Call the function docker-env with the name of your docker machine.



Add the following to your .emacs

```elisp 
(docker-env "Machine Name")
```

or run it by hand to be prompted to pass in your docker machine's name

``` M-x docker-env ```


## Installation
1. Clone this repo ```git clone https://github.com/wrrn/docker-env.git```
2. In emacs run ```M-x package-install-file``` and give it the path to where you cloned docker-env.
3. If you always use the same docker machine add the following to your .emacs:

	```elisp
	(docker-env "Machine Name")
	``` 
