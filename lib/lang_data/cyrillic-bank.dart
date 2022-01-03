import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/state/cyrillic/cyrillic-exercises.dart';

List<CyrillicBankItem> cyrillicWordBank = [
  CyrillicBankItem(
      latinString: 'Pada kiša danas',
      cyrillicString: 'Пада киша Данас',
      getTranslation: (BuildContext context) =>
          AppLocalizations.of(context)!.trans_pada_kisa),
  CyrillicBankItem(
      latinString: 'Ovo je najbolji čevapi',
      cyrillicString: 'Ово је најбољи чевапи',
      getTranslation: (BuildContext context) =>
          AppLocalizations.of(context)!.trans_najbolji_cevapi),
  CyrillicBankItem(
      latinString: 'Srbija je balkanska zemlja',
      cyrillicString: 'Србија је балканска земља',
      getTranslation: (BuildContext context) =>
          AppLocalizations.of(context)!.trans_srbija_je),
  CyrillicBankItem(
      latinString: 'Više mi se sviđa plaža nego grad',
      cyrillicString: 'Више ми се свиђа плажа него град',
      getTranslation: (BuildContext context) =>
          AppLocalizations.of(context)!.trans_plaza_nego_grad),
  CyrillicBankItem(
      latinString: 'Može li se sutra otići na ručak?',
      cyrillicString: 'Може ли се сутра отићи на ручак?',
      getTranslation: (BuildContext context) =>
          AppLocalizations.of(context)!.trans_otici_na_rucak),
  CyrillicBankItem(
      latinString: 'U Hrvatskoj se ćirilica ne koristi mnogo',
      cyrillicString: 'У Хрватској се ћирилица не користи много',
      getTranslation: (BuildContext context) =>
          AppLocalizations.of(context)!.trans_ne_koristi_mnogo),
];
