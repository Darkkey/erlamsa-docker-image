# erlamsa Dockerfile
Docker image building recipe for erlamsa fuzzer (see http://github.com/Darkkey/erlamsa)

## Building

To build & run the container, go to the directory with Dockerfile and execute from docker shell:

```
docker build -t erlamsa-service .
docker run --name erlamsa_instance -t erlamsa-service
```

## Running

Erlamsa service exposes 17771 port, bind it to localhost. After it you could call it using normal client scripts (see http://github.com/Darkkey/erlamsa/clients):

Result:
```
$ python clients/erlamsa_python_client.py
Hello erlamsa! erlamsed to rlamsa!rlallo eHello e
```

