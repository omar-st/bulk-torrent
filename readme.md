# Bulk Torrent Downloader

This program takes as inputs a search term and a category, then bulk downloads the matching torrents from thepiratebay. It is written in bash shell.
* Note: If the working mirror for tpb ever changes, you'll need to put in the new url. Assuming the search function continues to use the same format, it will work with any mirror.

In the file, the bottom execution function takes two string arguments. "SearchFor" "Category". The first term unfortunately may not contain spaces, as tpb replaces spaces in two different ways during the processing. The category is based on the categories tpb uses. In the example "audio" is selected.

The shell script requires you have lynx and transmission-cli installed. It also uses the grep tool for string parsing, and operates inside the terminal. With lynx, it opens the relevant search page on tpb, and outputs all the hyperlinks on the page. With grep, all urls that contain the search term are listed in urls.txt. Then, lynx returns all hyperlinks on all the results pages, and if any are magnet links then those will be downloaded with transmission. With a single search, you can download 10 torrents or over 1000, depending on the search.

## Functions

The script is divided into two main functions: `_scrape` and `_search`. Here's a brief overview of how they work:

### scrape

* Takes a URL as input, navigates to the webpage using `lynx`, and extracts magnet links from the page.
* Filters out non-magnet links using `grep`.
* Downloads the magnet links using `transmission-remote`.

### search

* Takes two inputs: a search query and a category (e.g. "audio").
* Constructs a URL to The Pirate Bay website with the given search query and category.
* Calls `_scrape` with the constructed URL.

## Usage

To use this script, simply run it from your terminal:
```
$ ./run.sh
Enter search term:   Drake
Enter category:    audio
```
This will download all magnet links found on tpb for Drake's music in the audio category.

* Steps:
1. cd into bulk-torrent and run the following command: `./run.sh`
2. Enter a search term when prompted (e.g., "ubuntu").
3. Enter a category when prompted (e.g., "apps").
4. The script will display the URL it's using to search tpb, then proceed to download and add torrents to your Transmission client.