# id3-pharo

An ID3 tags reader written in Pharo

## Installation

```st
Metacello new
    githubUser: 'pharo-media-center' project: 'id3-pharo' commitish: 'master' path: 'repository';
    baseline: #ID3;
    load

```

## Example

```st
id := ID3Parser on: (File named: '/path/to/file.mp3') readStream
id id3v2Tag title
```
