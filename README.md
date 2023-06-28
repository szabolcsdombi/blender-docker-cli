# blender-docker-cli

This projects allows you to run the Blender Python console within Docker.

This enables:

- exporting from Blender files as a build step.
- programatically creating and saving meshes as Blender files.
- using extensions otherwise hard to install in Blender.
- rendering without the UI.

## Why?

Building assets as a build step ensures that the Blender files become the sole source of data.

## Why there is no UI?

Well, for that you should simply install Blender.
This project aims to support headless Blender operations as build steps.

## Why would I trust this container?

You don't have to. This project does not provide a built version of the [Dockerfile](Dockerfile).
Instead it encourages the deveoper to take the code and use it.

## Why the system Python?

Forcing Blender to use the system Python enables us to install any other Python library and use it within Blender.

You can add extra build steps like `pip install ...` and the import will work within Blender.

Blender has a builtin Python.
The base docker image matches the Python version of Blender.
This enables removing the embedded Python and forcing Blender to use the system Python.

## How to build it?

```
docker build . -t blender-cli
```

## Example Usage

```
$ docker run --rm -it blender-cli
Blender 3.6.0 (hash c7fc78b81ecb built 2023-06-27 08:23:50)
Python 3.10.12 (main, Jun 22 2023, 06:36:47) [GCC 11.2.1 20220127 (Red Hat 11.2.1-9)] on linux
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>>
```

```
$ docker run --rm -it blender-cli blender --python export.py scene.blend
```

## Links

- [Blender command line arguments](https://docs.blender.org/manual/en/latest/advanced/command_line/arguments.html).
