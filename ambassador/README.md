We're using [Ambassador][] as an ingress control on [k3s][]. The install
generally follows the article "[Deploy an Ingress Controller on K3s][]",
with a few local changes necessary for our environment.

We're using Ambassador rather than the default Ingress controller (Traefik)
because we need to expose non-HTTP services (such as the IRC-over-SSL port
serviced by ZNC).

[k3s]: https://k3s.io/
[deploy an ingress controller on k3s]: https://rancher.com/blog/2020/deploy-an-ingress-controllers
[ambassador]: https://rancher.com/blog/2020/deploy-an-ingress-controllers
