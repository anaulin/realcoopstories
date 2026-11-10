# Real Co-op Stories <!-- omit in toc -->

A podcast where cooperative practitioners tell their stories.

> **Archived.** The show ran from 2020 to 2021 and is no longer updated. The realcoopstories.org domain is no longer maintained. Episodes and transcripts now live at https://anaulin.org/projects/realcoopstories/.

- [Environment setup](#environment-setup)
- [Adding a new episode and testing locally](#adding-a-new-episode-and-testing-locally)
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
