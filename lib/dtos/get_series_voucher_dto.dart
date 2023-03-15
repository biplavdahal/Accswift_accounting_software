class GetSeriesVoucherDTO {
  String get endpoint => 'Series/VoucherNo';

  final int seriesId;

  GetSeriesVoucherDTO(this.seriesId);

  Map<String, dynamic> make() {
    return {
      'SeriesID': seriesId,
    };
  }
}
