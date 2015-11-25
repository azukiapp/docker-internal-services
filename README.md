[azukiapp/internal-services](http://images.azk.io/#/internal-services)
==================

Docker image for run base [azk][azk] internals services, with DNS service ([dnsmasq][dnsmasq]) and redirect load balancing service (via [socat][socat]).

More information [here][azk_agent_doc]

###### Versions:

<versions>
- [`latest`, `0.4.0`](https://github.com/azukiapp/docker-internal-services/blob/master/Dockerfile)
</versions>

### Usage with `azk`

Example of using this image with [azk][azk]:

```js
  'internal-services': {
    image   : { docker: "azukiapp/internal-services:0.1.0" },
    shell   : '/bin/bash',
    wait    : false,
    scalable: false,
  },

  dns: {
    extends: 'internal-services',
    command: "dnsmasq -p $DNS_PORT --no-daemon --address=/#{azk.default_domain}/#{azk.balancer_ip}",
    ports: {
      dns: "53:53/udp",
      80: disable,
    }
  },

  'balancer-redirect': {
    extends: 'internal-services',
    command: "env; socat TCP4-LISTEN:$HTTP_PORT,fork TCP:$BALANCER_IP:$BALANCER_PORT",
    wait: 10,
    ports: {
      http: "#{azk.balancer_port}:#{azk.balancer_port}/tcp",
      53: disable,
    }
  },
```

###### Image content:

  - [bash][bash]
  - [socat][socat]
  - [dnsmasq][dnsmasq]

## License

"Azuki", "azk" and the Azuki logo are copyright (c) 2013-2015 Azuki Serviços de Internet LTDA.

**azk** source code is released under Apache 2 License.

[azk]: https://github.com/azukiapp/azk
[azk_agent_doc]: http://docs.azk.io/en/agent/
[bash]: https://www.gnu.org/software/bash/
[dnsmasq]: http://www.thekelleys.org.uk/dnsmasq/doc.html
[socat]: http://www.dest-unreach.org/socat/
