# realcoopstories

Run local Hugo server:
```bash
$ make serve
```

Create new episode:
```bash
$ hugo new episode/your-episode-name.md
```

Feed validators:
* https://validator.w3.org/feed/
* https://castfeedvalidator.com/
* https://podba.se/validate/

## Podcasts requirements references

* Apple: https://itunespartner.apple.com/podcasts/articles/podcast-requirements-3058
  * Apple artwork requirements: https://itunespartner.apple.com/podcasts/articles/design-your-artwork-3059
* Google: https://support.google.com/podcast-publishers/answer/9476656?visit_id=637447866313324769-2035917675&hl=en&rd=1
  * Google feed verification: https://support.google.com/podcast-publishers/answer/9747492?hl=en&ref_topic=9476973


## Deploy workflow setup

Copy public key to remote server:
```bash
$ ssh-copy-id -i ~/.ssh/id_rsa.pub anaulin@realcoopstories.org
```

Set GitHub repo secrets:
* `SSH_KEY`: contents of private key in `~/.ssh/id_rsa`. Make sure to use PEM version of key, as detailed in https://github.com/marketplace/actions/install-ssh-key
* `KNOWN_HOSTS`: output of `ssh-keyscan realcoopstories.org`
