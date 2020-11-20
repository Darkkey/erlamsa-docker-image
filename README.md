# erlamsa Dockerfile
Docker image building recipe for erlamsa fuzzer (see http://github.com/Darkkey/erlamsa)

## Building

To build & run the container, go to the directory with Dockerfile and execute from docker shell:

```
docker build -t erlamsa-service .
docker run --name erlamsa_instance -t erlamsa-service
```

## Running

Erlamsa service exposes 17771 port, bind it to localhost. After it you could call it using normal client scripts (see https://github.com/Darkkey/erlamsa/tree/master/clients) or e.g. pyerlamsa (check https://github.com/Darkkey/pyerlamsa/ for more info) module:
```
$ pip3 install pyerlamsa
$ python3
...
>>> import pyerlamsa
>>> e = pyerlamsa.Erlamsa('http://127.0.0.1:17771')
>>> e.call('Hello erlamsa!');
(True, 'Hell4amsa15i685\x81\x91')
```

Result:
```
$ python clients/erlamsa_python_client.py
Hello erlamsa! erlamsed to rlamsa!rlallo eHello e
```

