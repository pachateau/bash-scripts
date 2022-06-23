#!/usr/bin/env python3

import wikipedia as wkp


def colorprint(string, color='white', style='normal'):
    mycol = {'black':'30m', 'red':'31m', 'green':'32m', 'yellow':'33m', 'blue':'34m', 'magenta':'35m', 'cyan':'36m', 'light_gray':'37m', 'dark_gray':'90m', 'light_red':'91m', 'light_green':'92m', 'light_yellow':'93m', 'light_blue':'94m', 'light_magenta':'95m', 'light_cyan':'96m', 'white':'97m'}
    mystl = {'normal': '0', 'bold': '1', 'faint': '2', 'italic': '3', 'underline': '4', 'blinking': '5', 'fast blinking': '6', 'reverse': '7', 'hide': '8', 'strikethrough': '9'}
    print('\033['+mystl[style]+';'+mycol[color]+'%s' % string+'\033[0m')


def get_summary():
    title = wkp.random()
    try:
        summary = wkp.page(title).summary
        link = wkp.page(title).url
        result = [summary, title, link]
    except wkp.DisambiguationError:
        result = get_summary()
    return result


try:
    result = get_summary()
    print('*'.center(80, '*'))
    colorprint(result[1]+':', 'white', 'bold')
    colorprint('\t'+result[0], 'white', 'normal')
    colorprint('see '+result[2], 'white', 'italic')
    print('*'.center(80, '*'))
except KeyboardInterrupt:
    exit()
