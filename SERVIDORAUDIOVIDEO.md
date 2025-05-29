# Servidor d'audio i video amb comprovació d'amplada de banda

Per tal d’oferir serveis de transmissió d’àudio i vídeo en temps real (streaming), hem implementat una infraestructura basada en dues eines principals: Icecast i Darkice per a l’àudio, i FFmpeg per al vídeo. 

Un cop configurats els serveis, hem pogut comprovar el correcte funcionament del sistema a través de la interfície web que ofereix Icecast. Aquesta interfície mostra informació en temps real sobre els fluxos (streams) actius, la seva qualitat, usuaris connectats, etc. D’aquesta manera, podem monitorar fàcilment l’estat del servidor i la transmissió d’àudio.  
Aquí ho podem veure:

![Captura interfície Icecast](./images/icecast.png)

---

![Captura interfície Icecast](./images/icecast2.png)

Per poder fer streaming de vídeo hem instal·lat el programari FFmpeg, que llavors mitjançant la comanda:

```bash
sudo ffmpeg -re -i test.mp4 -c:v libvpx -b:v 800k   -c:a libvorbis -b:a 128k  -f webm -content_type video/webm icecast://source:1234@54.81.9.179:8000/stream.webm
```

Hem llançat iperf3 en mode servidor a la màquina que allotja el servidor de streaming, i hem executat la comanda corresponent en una màquina client de proves. Això ens ha permès verificar que l’amplada de banda disponible era suficient per suportar el flux d’àudio i vídeo simultanis, assegurant una experiència de reproducció fluida per als usuaris finals.

Aquí les captures de demostració:

![Captura demostració 1](./images/ampladadebanda.png)

I això és el que hem posat en la màquina client:

![Captura demostració 2](./images/ampladadebanda2.png)

Finalment, veiem la reproducció en stream desde el navegador:

![Captura stream](./images/reporucciostream.png)
