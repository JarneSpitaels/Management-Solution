/*
 * Copyright (c) 2019 gomgom. https://www.gomgom.net
 *
 * Source code has been modified by FlutterFlow, Inc. and the below license 
 * applies only to this file. Adapted from "language_picker" pub.dev package.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:emoji_flag_converter/emoji_flag_converter.dart';
import 'package:flutter/material.dart';

class FlutterFlowLanguageSelector extends StatelessWidget {
  const FlutterFlowLanguageSelector({
    Key key,
    @required this.currentLanguage,
    @required this.languages,
    @required this.onChanged,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderColor = const Color(0xFF262D34),
    this.borderRadius = 8.0,
    this.textStyle,
    this.hideFlags = false,
    this.flagSize = 24.0,
    this.flagTextGap = 8.0,
    this.dropdownColor,
    this.dropdownIconColor = const Color(0xFF14181B),
    this.dropdownIcon,
  }) : super(key: key);

  final double width;
  final double height;
  final String currentLanguage;
  final List<String> languages;
  final Function(String) onChanged;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final TextStyle textStyle;
  final bool hideFlags;
  final double flagSize;
  final double flagTextGap;
  final Color dropdownColor;
  final Color dropdownIconColor;
  final IconData dropdownIcon;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        child: _LanguagePickerDropdown(
          currentLanguage: currentLanguage,
          languages: _languageMap(languages.toSet()),
          onChanged: onChanged,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          borderRadius: borderRadius,
          dropdownColor: dropdownColor,
          dropdownIconColor: dropdownIconColor,
          dropdownIcon: dropdownIcon,
          itemBuilder: (language) => _LanguagePickerItem(
            language: language.isoCode,
            languages: languages,
            textStyle: textStyle,
            hideFlags: hideFlags,
            flagSize: flagSize,
            flagTextGap: flagTextGap,
          ),
        ),
      );
}

class _LanguagePickerItem extends StatelessWidget {
  const _LanguagePickerItem({
    Key key,
    @required this.language,
    @required this.languages,
    this.textStyle,
    this.hideFlags = false,
    this.flagSize = 24.0,
    this.flagTextGap = 8.0,
  }) : super(key: key);

  final String language;
  final List<String> languages;
  final TextStyle textStyle;
  final bool hideFlags;
  final double flagSize;
  final double flagTextGap;

  @override
  Widget build(BuildContext context) {
    final flagInfo = langaugeToCountryInfo[language];
    Widget flagWidget = Container();
    if (flagInfo is String) {
      final flagEmoji = EmojiConverter.fromAlpha2CountryCode(flagInfo);
      flagWidget = Text(
        flagEmoji,
        style: const TextStyle(
          fontSize: 20.0,
          height: 1.5,
        ),
      );
    } else if (flagInfo is Map) {
      final flagUrl = flagInfo['flag'] as String;
      flagWidget = Image.network(
        flagUrl,
        width: 24,
        height: 20,
      );
    }
    flagWidget = Transform.scale(
      scale: flagSize / 24.0,
      child: Container(
        width: 24,
        child: flagWidget,
      ),
    );
    return Row(
      children: [
        if (!hideFlags) ...[
          flagWidget,
          SizedBox(width: flagTextGap),
        ],
        Text(
          _languageMap(languages.toSet())[language]?.name ?? '',
          style: textStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
        ),
      ],
    );
  }
}

/// Provides a customizable [DropdownButton] for all languages
class _LanguagePickerDropdown extends StatelessWidget {
  const _LanguagePickerDropdown({
    @required this.itemBuilder,
    @required this.currentLanguage,
    @required this.onChanged,
    this.languages,
    this.backgroundColor,
    this.borderColor = const Color(0xFF262D34),
    this.borderRadius = 8.0,
    this.dropdownColor,
    this.dropdownIconColor = const Color(0xFF14181B),
    this.dropdownIcon,
  });

  /// This function will be called to build the child of DropdownMenuItem.
  final Widget Function(Language) itemBuilder;

  /// The current ISO ALPHA-2 code.
  final String currentLanguage;

  /// This function will be called whenever a Language item is selected.
  final ValueChanged<String> onChanged;

  /// List of languages available in this picker.
  final Map<String, Language> languages;

  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final Color dropdownColor;
  final Color dropdownIconColor;
  final IconData dropdownIcon;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = languages.values
        .map(
          (language) => DropdownMenuItem<String>(
            value: language.isoCode,
            child: itemBuilder(language),
          ),
        )
        .toList();
    return Container(
      height: 44.0,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: DropdownButton<String>(
            isExpanded: true,
            underline: Container(),
            dropdownColor: dropdownColor ?? backgroundColor,
            focusColor: Colors.transparent,
            iconEnabledColor: dropdownIconColor,
            iconDisabledColor: dropdownIconColor,
            icon: dropdownIcon != null
                ? Icon(
                    dropdownIcon,
                    size: 18.0,
                    color: dropdownIconColor,
                  )
                : null,
            hint: const Text(
              'Unset',
              style: TextStyle(
                color: Colors.red,
                fontFamily: 'Product Sans',
                fontStyle: FontStyle.italic,
                fontSize: 15,
              ),
            ),
            onChanged: (val) {
              if (val != null) {
                onChanged(val);
              }
            },
            items: items,
            value: currentLanguage.isNotEmpty ? currentLanguage : null,
          ),
        ),
      ),
    );
  }
}

class Language {
  Language(this.isoCode, this.name);

  Language.fromMap(Map<String, String> map)
      : name = map['name'],
        isoCode = map['isoCode'];

  final String name;
  final String isoCode;
}

Map<String, Language> _languageMap(Set<String> languages) => Map.fromEntries(
      _defaultLanguagesList
          .where((element) => languages.contains(element['isoCode']))
          .map((e) => MapEntry(e['isoCode'], Language.fromMap(e))),
    );

final List<Map<String, String>> _defaultLanguagesList = [
  {"isoCode": "aa", "name": "Afar"},
  {"isoCode": "af", "name": "Afrikaans"},
  {"isoCode": "ak", "name": "Akan"},
  {"isoCode": "sq", "name": "Albanian"},
  {"isoCode": "am", "name": "Amharic"},
  {"isoCode": "ar", "name": "Arabic"},
  {"isoCode": "hy", "name": "Armenian"},
  {"isoCode": "as", "name": "Assamese"},
  {"isoCode": "ay", "name": "Aymara"},
  {"isoCode": "az", "name": "Azerbaijani"},
  {"isoCode": "bm", "name": "Bambara"},
  {"isoCode": "ba", "name": "Bashkir"},
  {"isoCode": "eu", "name": "Basque"},
  {"isoCode": "be", "name": "Belarusian"},
  {"isoCode": "bn", "name": "Bengali"},
  {"isoCode": "bh", "name": "Bihari Languages"},
  {"isoCode": "bi", "name": "Bislama"},
  {"isoCode": "nb", "name": "Norwegian"},
  {"isoCode": "bs", "name": "Bosnian"},
  {"isoCode": "br", "name": "Breton"},
  {"isoCode": "bg", "name": "Bulgarian"},
  {"isoCode": "my", "name": "Burmese"},
  {"isoCode": "ca", "name": "Catalan"},
  {"isoCode": "km", "name": "Central Khmer"},
  {"isoCode": "ch", "name": "Chamorro"},
  {"isoCode": "ce", "name": "Chechen"},
  {"isoCode": "ny", "name": "Chewa (Nyanja)"},
  {"isoCode": "zh_Hans", "name": "Chinese (Simplified)"},
  {"isoCode": "zh_Hant", "name": "Chinese (Traditional)"},
  {"isoCode": "cv", "name": "Chuvash"},
  {"isoCode": "cr", "name": "Cree"},
  {"isoCode": "hr", "name": "Croatian"},
  {"isoCode": "cs", "name": "Czech"},
  {"isoCode": "da", "name": "Danish"},
  {"isoCode": "dv", "name": "Dhivehi"},
  {"isoCode": "nl", "name": "Dutch"},
  {"isoCode": "dz", "name": "Dzongkha"},
  {"isoCode": "en", "name": "English"},
  {"isoCode": "eo", "name": "Esperanto"},
  {"isoCode": "et", "name": "Estonian"},
  {"isoCode": "ee", "name": "Ewe"},
  {"isoCode": "fo", "name": "Faroese"},
  {"isoCode": "fj", "name": "Fijian"},
  {"isoCode": "fi", "name": "Finnish"},
  {"isoCode": "fr", "name": "French"},
  {"isoCode": "ff", "name": "Fulah"},
  {"isoCode": "gd", "name": "Gaelic"},
  {"isoCode": "gl", "name": "Galician"},
  {"isoCode": "lg", "name": "Ganda"},
  {"isoCode": "ka", "name": "Georgian"},
  {"isoCode": "de", "name": "German"},
  {"isoCode": "el", "name": "Greek"},
  {"isoCode": "gn", "name": "Guarani"},
  {"isoCode": "gu", "name": "Gujarati"},
  {"isoCode": "ht", "name": "Haitian"},
  {"isoCode": "ha", "name": "Hausa"},
  {"isoCode": "he", "name": "Hebrew"},
  {"isoCode": "hz", "name": "Herero"},
  {"isoCode": "hi", "name": "Hindi"},
  {"isoCode": "ho", "name": "Hiri Motu"},
  {"isoCode": "hu", "name": "Hungarian"},
  {"isoCode": "is", "name": "Icelandic"},
  {"isoCode": "io", "name": "Ido"},
  {"isoCode": "ig", "name": "Igbo"},
  {"isoCode": "id", "name": "Indonesian"},
  {"isoCode": "ia", "name": "Interlingua"},
  {"isoCode": "ie", "name": "Interlingue"},
  {"isoCode": "iu", "name": "Inuktitut"},
  {"isoCode": "ik", "name": "Inupiaq"},
  {"isoCode": "ga", "name": "Irish"},
  {"isoCode": "it", "name": "Italian"},
  {"isoCode": "ja", "name": "Japanese"},
  {"isoCode": "jv", "name": "Javanese"},
  {"isoCode": "kl", "name": "Kalaallisut"},
  {"isoCode": "kn", "name": "Kannada"},
  {"isoCode": "kr", "name": "Kanuri"},
  {"isoCode": "ks", "name": "Kashmiri"},
  {"isoCode": "kk", "name": "Kazakh"},
  {"isoCode": "ki", "name": "Kikuyu"},
  {"isoCode": "rw", "name": "Kinyarwanda"},
  {"isoCode": "ky", "name": "Kirghiz"},
  {"isoCode": "kv", "name": "Komi"},
  {"isoCode": "kg", "name": "Kongo"},
  {"isoCode": "ko", "name": "Korean"},
  {"isoCode": "kj", "name": "Kuanyama"},
  {"isoCode": "ku", "name": "Kurdish"},
  {"isoCode": "lo", "name": "Lao"},
  {"isoCode": "la", "name": "Latin"},
  {"isoCode": "lv", "name": "Latvian"},
  {"isoCode": "li", "name": "Limburgan"},
  {"isoCode": "ln", "name": "Lingala"},
  {"isoCode": "lt", "name": "Lithuanian"},
  {"isoCode": "lu", "name": "Luba-Katanga"},
  {"isoCode": "lb", "name": "Luxembourgish"},
  {"isoCode": "mk", "name": "Macedonian"},
  {"isoCode": "mg", "name": "Malagasy"},
  {"isoCode": "ms", "name": "Malay"},
  {"isoCode": "ml", "name": "Malayalam"},
  {"isoCode": "mt", "name": "Maltese"},
  {"isoCode": "gv", "name": "Manx"},
  {"isoCode": "mi", "name": "Maori"},
  {"isoCode": "mr", "name": "Marathi"},
  {"isoCode": "mh", "name": "Marshallese"},
  {"isoCode": "mn", "name": "Mongolian"},
  {"isoCode": "na", "name": "Nauru"},
  {"isoCode": "nv", "name": "Navajo"},
  {"isoCode": "nd", "name": "Ndebele, North"},
  {"isoCode": "nr", "name": "Ndebele, South"},
  {"isoCode": "ng", "name": "Ndonga"},
  {"isoCode": "ne", "name": "Nepali"},
  {"isoCode": "se", "name": "Northern Sami"},
  {"isoCode": "no", "name": "Norwegian"},
  {"isoCode": "nn", "name": "Norwegian Nynorsk"},
  {"isoCode": "oc", "name": "Occitan"},
  {"isoCode": "oj", "name": "Ojibwa"},
  {"isoCode": "or", "name": "Oriya"},
  {"isoCode": "om", "name": "Oromo"},
  {"isoCode": "os", "name": "Ossetian"},
  {"isoCode": "pi", "name": "Pali"},
  {"isoCode": "pa", "name": "Panjabi"},
  {"isoCode": "fa", "name": "Persian"},
  {"isoCode": "pl", "name": "Polish"},
  {"isoCode": "pt", "name": "Portuguese"},
  {"isoCode": "ps", "name": "Pushto"},
  {"isoCode": "qu", "name": "Quechua"},
  {"isoCode": "ro", "name": "Romanian"},
  {"isoCode": "rm", "name": "Romansh"},
  {"isoCode": "rn", "name": "Rundi"},
  {"isoCode": "ru", "name": "Russian"},
  {"isoCode": "sm", "name": "Samoan"},
  {"isoCode": "sg", "name": "Sango"},
  {"isoCode": "sa", "name": "Sanskrit"},
  {"isoCode": "sc", "name": "Sardinian"},
  {"isoCode": "sr", "name": "Serbian"},
  {"isoCode": "sn", "name": "Shona"},
  {"isoCode": "ii", "name": "Sichuan Yi"},
  {"isoCode": "sd", "name": "Sindhi"},
  {"isoCode": "si", "name": "Sinhala"},
  {"isoCode": "sk", "name": "Slovak"},
  {"isoCode": "sl", "name": "Slovenian"},
  {"isoCode": "so", "name": "Somali"},
  {"isoCode": "st", "name": "Sotho, Southern"},
  {"isoCode": "es", "name": "Spanish"},
  {"isoCode": "su", "name": "Sundanese"},
  {"isoCode": "sw", "name": "Swahili"},
  {"isoCode": "ss", "name": "Swati"},
  {"isoCode": "sv", "name": "Swedish"},
  {"isoCode": "tl", "name": "Tagalog"},
  {"isoCode": "ty", "name": "Tahitian"},
  {"isoCode": "tg", "name": "Tajik"},
  {"isoCode": "ta", "name": "Tamil"},
  {"isoCode": "tt", "name": "Tatar"},
  {"isoCode": "te", "name": "Telugu"},
  {"isoCode": "th", "name": "Thai"},
  {"isoCode": "bo", "name": "Tibetan"},
  {"isoCode": "ti", "name": "Tigrinya"},
  {"isoCode": "to", "name": "Tonga (Tonga Islands)"},
  {"isoCode": "ts", "name": "Tsonga"},
  {"isoCode": "tn", "name": "Tswana"},
  {"isoCode": "tr", "name": "Turkish"},
  {"isoCode": "tk", "name": "Turkmen"},
  {"isoCode": "tw", "name": "Twi"},
  {"isoCode": "ug", "name": "Uighur"},
  {"isoCode": "uk", "name": "Ukrainian"},
  {"isoCode": "ur", "name": "Urdu"},
  {"isoCode": "uz", "name": "Uzbek"},
  {"isoCode": "ve", "name": "Venda"},
  {"isoCode": "vi", "name": "Vietnamese"},
  {"isoCode": "vo", "name": "Volapük"},
  {"isoCode": "wa", "name": "Walloon"},
  {"isoCode": "cy", "name": "Welsh"},
  {"isoCode": "fy", "name": "Western Frisian"},
  {"isoCode": "wo", "name": "Wolof"},
  {"isoCode": "xh", "name": "Xhosa"},
  {"isoCode": "yi", "name": "Yiddish"},
  {"isoCode": "yo", "name": "Yoruba"},
  {"isoCode": "za", "name": "Zhuang"},
  {"isoCode": "zu", "name": "Zulu"}
];

final Map<String, dynamic> langaugeToCountryInfo = {
  "aa": "dj",
  "af": "za",
  "ak": "gh",
  "sq": "al",
  "am": "et",
  "ar": {
    "proposed_iso_3166": "aa",
    "flag":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Flag_of_the_Arab_League.svg/400px-Flag_of_the_Arab_League.svg.png",
    "name": "Arab League"
  },
  "hy": "am",
  "ay": {
    "proposed_iso_3166": "wh",
    "flag":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Banner_of_the_Qulla_Suyu.svg/1920px-Banner_of_the_Qulla_Suyu.svg.png",
    "name": "Wiphala"
  },
  "az": "az",
  "bm": "ml",
  "be": "by",
  "bn": "bd",
  "bi": "vu",
  "bs": "ba",
  "bg": "bg",
  "my": "mm",
  "ca": "ad",
  "zh": "cn",
  "hr": "hr",
  "cs": "cz",
  "da": "dk",
  "dv": "mv",
  "nl": "nl",
  "dz": "bt",
  "en": "gb",
  "et": "ee",
  "ee": {
    "proposed_iso_3166": "ew",
    "flag":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Flag_of_the_Ewe_people.svg/2880px-Flag_of_the_Ewe_people.svg.png",
    "name": "Ewe"
  },
  "fj": "fj",
  "fil": "ph",
  "fi": "fi",
  "fr": "fr",
  "gaa": "gh",
  "ka": "ge",
  "de": "de",
  "el": "gr",
  "gu": "in",
  "ht": "ht",
  "he": "il",
  "hi": "in",
  "ho": "pg",
  "hu": "hu",
  "is": "is",
  "ig": "ng",
  "id": "id",
  "ga": "ie",
  "it": "it",
  "ja": "jp",
  "kr": "ne",
  "kk": "kz",
  "km": "kh",
  "kmb": "ao",
  "rw": "rw",
  "kg": "cg",
  "ko": "kr",
  "kj": "ao",
  "ku": "iq",
  "ky": "kg",
  "lo": "la",
  "la": "va",
  "lv": "lv",
  "ln": "cg",
  "lt": "lt",
  "lu": "cd",
  "lb": "lu",
  "mk": "mk",
  "mg": "mg",
  "ms": "my",
  "mt": "mt",
  "mi": "nz",
  "mh": "mh",
  "mn": "mn",
  "mos": "bf",
  "ne": "np",
  "nd": "zw",
  "nso": "za",
  "no": "no",
  "nb": "no",
  "nn": "no",
  "ny": "mw",
  "pap": "aw",
  "ps": "af",
  "fa": "ir",
  "pl": "pl",
  "pt": "pt",
  "pa": "in",
  "qu": "wh",
  "ro": "ro",
  "rm": "ch",
  "rn": "bi",
  "ru": "ru",
  "sg": "cf",
  "sr": "rs",
  "srr": "sn",
  "sn": "zw",
  "si": "lk",
  "sk": "sk",
  "sl": "si",
  "so": "so",
  "snk": "sn",
  "nr": "za",
  "st": "ls",
  "es": "es",
  "sw": {
    "proposed_iso_3166": "sw",
    "flag":
        "https://upload.wikimedia.org/wikipedia/commons/d/de/Flag_of_Swahili.gif",
    "name": "Swahili"
  },
  "ss": "sz",
  "sv": "se",
  "tl": "ph",
  "tg": "tj",
  "ta": "lk",
  "te": "in",
  "tet": "tl",
  "th": "th",
  "ti": "er",
  "tpi": "pg",
  "ts": "za",
  "tn": "bw",
  "tr": "tr",
  "tk": "tm",
  "uk": "ua",
  "umb": "ao",
  "ur": "pk",
  "uz": "uz",
  "ve": "za",
  "vi": "vn",
  "cy": "gb",
  "wo": "sn",
  "xh": "za",
  "yo": {
    "proposed_iso_3166": "yo",
    "flag":
        "https://upload.wikimedia.org/wikipedia/commons/0/04/Flag_of_the_Yoruba_people.svg",
    "name": "Yoruba"
  },
  "zu": "za",
  // Custom
  "zh_Hans": "cn",
  "zh_Hant": "cn",
  "fo": "fo",
  "bo": "bo",
  "to": "to",
};
