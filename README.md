# Real Co-op Stories <!-- omit in toc -->

A podcast where cooperative practitioners tell their stories.

- [Environment setup](#environment-setup)
- [Adding a new episode and testing locally](#adding-a-new-episode-and-testing-locally)
- [Configure build + deploy workflow](#configure-build--deploy-workflow)
- [Utility scripts](#utility-scripts)
- [Automatically upload to Internet Archive](#automatically-upload-to-internet-archive)
- [Podcast feed requirements references](#podcast-feed-requirements-references)
  - [Feed validators](#feed-validators)

## Environment setup

1. Install Hugo: `brew install hugo`
2. To run the `optimize-image.sh` script, install `imageoptim`: `brew install imageoptim imageoptim-cli`

## Adding a new episode and testing locally

Run local Hugo server:
```bash
$ make serve
```

Create new episode:
```bash
$ hugo new episode/your-episode-name.md
```

Add at least the following fields to the episode frontmatter:
* `description`: short description of the episode (~ a couple of sentences)
* `episode_image`: cover image for episode, should have square aspect ratio
* `podcast_file`: full URL to MP3 with episode audio
* `podcast_bytes`: byte size of audio file
* `podcast_duration`: duration of audio file, in HH:MM:SS format

## Configure build + deploy workflow

Copy public key to remote server:
```bash
$ ssh-copy-id -i ~/.ssh/id_rsa.pub anaulin@realcoopstories.org
```

Set GitHub repo secrets:
* `SSH_KEY`: contents of private key in `~/.ssh/id_rsa`. Make sure to use PEM version of key, as detailed in https://github.com/marketplace/actions/install-ssh-key
* `KNOWN_HOSTS`: output of `ssh-keyscan realcoopstories.org`

## Utility scripts

Resize and optimize image:
```bash
$ ./optimize-image.sh path/to/image
```

Enclose timestamps in timestamp shortcode:
```bash
$ ./timestamp-shortcode.sh path/to/file.md
```

## Automatically upload to Internet Archive

Using Python internetarchive CLI:

```bash
$ python3 -m venv .venv
$ source .direnv
$ pip3 install internetarchive
```

Login with:
```bash
$ ia configure
```

Upload file:
```bash
$ ia upload <params>
```

## Podcast feed requirements references

* Apple: https://itunespartner.apple.com/podcasts/articles/podcast-requirements-3058
  * Apple artwork requirements: https://itunespartner.apple.com/podcasts/articles/design-your-artwork-3059
* Google: https://support.google.com/podcast-publishers/answer/9476656?visit_id=637447866313324769-2035917675&hl=en&rd=1
  * Google feed verification: https://support.google.com/podcast-publishers/answer/9747492?hl=en&ref_topic=9476973

###  Feed validators
* https://validator.w3.org/feed/
* https://castfeedvalidator.com/
* https://podba.se/validate/
