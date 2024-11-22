class DietsUtil {
  static String getStringByType(int type) {
    switch (type) {
      case 1:
        return 'Desayuno';
      case 2:
        return 'Almuerzo';
      case 3:
        return 'Cena';
    }
    return '';
  }
}
