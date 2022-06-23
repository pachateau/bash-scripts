#!/usr/bin/env python3
# wkq in ~/.bashrc

import random as rdm
import wikiquote as wkq


def colorprint(string, color='white', style='normal'):
    mycol = {'black':'30m', 'red':'31m', 'green':'32m', 'yellow':'33m', 'blue':'34m', 'magenta':'35m', 'cyan':'36m', 'light_gray':'37m', 'dark_gray':'90m', 'light_red':'91m', 'light_green':'92m', 'light_yellow':'93m', 'light_blue':'94m', 'light_magenta':'95m', 'light_cyan':'96m', 'white':'97m'}
    mystl = {'normal': '0', 'bold': '1', 'faint': '2', 'italic': '3', 'underline': '4', 'blinking': '5', 'fast blinking': '6', 'reverse': '7', 'hide': '8', 'strikethrough': '9'}
    print('\033['+mystl[style]+';'+mycol[color]+string+'\033[0m')


def get_quote():
    title = wkq.random_titles(max_titles=1)[0]
    try:
        quote = rdm.choice(wkq.quotes(title))
        result = [quote, title]
    except (IndexError, wkq.utils.DisambiguationPageException):
        result = get_quote()
    return result


try:
    result = get_quote()
    print('*'.center(80, '*'))
    colorprint('"'+result[0]+'"', 'white', 'italic')
    colorprint(result[1], 'white', 'bold')
    print('*'.center(80, '*'))
except KeyboardInterrupt:
    exit()
