"""Convert Cantonese to Jyutping representation"""

import re
from jyutping.jyutping import get_jyutping


def clean_line(line):
    line = re.sub("""([0-9A-Za-z 。，：“”！？.\s（）、——；‘]+)""", "", line)
    return line


def clean_name(name):
    name = re.sub("[.]+", "", name)
    return name


def generate():
    lines = open("data/1000_transcripts.txt", "r", encoding='utf8').readlines()
    lines = [line.strip() for line in lines if line.strip()]

    for index, line in enumerate(lines):
        name, line = line.split("\t")
        line = clean_line(line)
        name = clean_name(name)
        line = get_jyutping(line)
        txt = open("data/txt/{}.txt".format(name), "w", encoding='utf8')
        txt.write(line)
        txt.close()


if __name__ == "__main__":
    generate()
