import 'package:scoreboard_app/shared/data/index.dart';

class Constants {
  static const String appBarTitle =
      'IND won the toss and\nelected to bat first';
  static const String australiaFlagPath =
      'https://s3-alpha-sig.figma.com/img/7af1/2bbb/30e278ed88b632ea1318ca22108c0301?Expires=1712534400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cLKJ5~A9EXwGptYcDBNVwGydKbbWNy40-HZ5FTVxkM~HsuIw65u8vjqghTLGaGafjrivU7mkFcZ5GsazH0cGWDTyY8pbwKktjItoP2TSGmFDbdWRN5giJ8MZUYXXppTbiajk-LX-5K4H3Q1kONyAfXUz8PqLXFBj01diwFRjf1TmFvjYZQLJjiW9pOswKN0llnvDY2-co~5fWuTOC3qZDFxc1tIF~NY5jcBH6S9FVsS~20TdzMkv3eLSjnq67JS4M2sx5dT3AHDfBlTMacf8H9RL2NoXaXV-uLwDengFpUC7dXlPurNTBzpStd9Nz2LnAguigSLbn7~NErHL-eVt5g';
  static const String indiaFlagPath =
      'https://s3-alpha-sig.figma.com/img/4525/1d92/60b1abe47f0dec3441f905d2e3f771a9?Expires=1712534400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hIG6zBvz9jss8YeyAbFZDgVl0c2OiCsSR6AN7kdaWTiS0Epx-1YTpDkENi5wSiGRmjmqoRLBj1WdH7-S4vbmcqR9VwmjUEOVlVDp-CWWqJJq7ClEQj2C0Sdsumm2~VpAmTsntMGNsXe9fMp49KLZm--b-boybgr4Wk~UatnnxtuvhiP5N7DvqYaCi5twGqYXNcd9s7GUTcpUJ8oKvhvgNXeX70BUN-tbeTBtKELqCGoWJeMMQhheY0dgvSkBUplFv0ks6Zm19kL5-bbDpz1KbudPlGUr2tBVmIQrjY0zomvnAF~vuVhlh-DJm2Dp2X2XOeAyzhp8LQ-lQEHSAB2wJg__';
  static const String ausText = 'AUS';
  static const String indiaText = 'IND';
  static const String runText = 'RUNS';
  static const String indVsAusText = 'Ind VS Aus';
  static const String wicketsText = 'WICKETS';
  static const String extrasText = 'EXTRAS';
  static const String usernameText = 'Username';
  static const String pointsText = '2000 Pts';
  static const String positionText = '16 Position';
  static const String s1Text = 'S1';
  static const String predictionScoreText = 'Prediction/Socre';
  static const String point = 'Points';
  static const String rank = 'Rank';
  static const String selectionText = 'Selections';
  static const int maxAttributeLength = 12;

  static List<ScoreboardOptions> runsListData = List.of([
    ScoreboardOptions(
        title: 'Mandatory',
        canShowToolTip: false,
        optionsData: {
          'Total RUNS': OptionsData(
            value: 0,
          ),
          'H.I.S': OptionsData(
            value: 0,
          ),
        },
        maxSelectionLimit: 2),
    ScoreboardOptions(
        title: 'Add Any 1',
        canShowToolTip: true,
        optionsData: {
          'Dots': OptionsData(
            value: 0,
          ),
          '1\'s': OptionsData(
            value: 0,
          )
        },
        maxSelectionLimit: 1),
    ScoreboardOptions(
        title: 'Add Any 2',
        canShowToolTip: true,
        optionsData: {
          '2\'s': OptionsData(
            value: 0,
          ),
          '4\'s': OptionsData(
            value: 0,
          ),
          '6\'s': OptionsData(
            value: 0,
          )
        },
        maxSelectionLimit: 2),
  ]);

  static List<ScoreboardOptions> wicketsListData = List.of([
    ScoreboardOptions(
        title: 'Mandatory',
        canShowToolTip: false,
        optionsData: {
          'Total Wickets': OptionsData(
            value: 0,
          ),
        },
        maxSelectionLimit: 1),
    ScoreboardOptions(
        title: 'Add Any 3',
        canShowToolTip: true,
        optionsData: {
          'Caught': OptionsData(
            value: 0,
          ),
          'Bowled': OptionsData(
            value: 0,
          ),
          'LBW': OptionsData(
            value: 0,
          ),
          'Run Out': OptionsData(
            value: 0,
          ),
          'Stumped': OptionsData(
            value: 0,
          ),
        },
        maxSelectionLimit: 3),
  ]);

  static List<ScoreboardOptions> extrasListData = List.of([
    ScoreboardOptions(
        title: 'Mandatory',
        canShowToolTip: false,
        optionsData: {
          'Total Extras': OptionsData(
            value: 0,
          ),
        },
        maxSelectionLimit: 2),
    ScoreboardOptions(
        title: 'Add Any 2',
        canShowToolTip: true,
        optionsData: {
          'Wide': OptionsData(
            value: 0,
          ),
          'No Ball': OptionsData(
            value: 0,
          ),
          'Leg Bye': OptionsData(
            value: 0,
          ),
        },
        maxSelectionLimit: 2),
  ]);
}
