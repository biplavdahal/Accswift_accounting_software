class FetchJournalMasterDTO {
  String get endpoint => 'JournalMaster/navigate';

  final int _pageNumber;
  int get pageNumber => _pageNumber;
  final String _direction;
  final int _row;

  FetchJournalMasterDTO(this._pageNumber, this._direction, this._row);

  Map<String, dynamic> make() {
    return {
      'Direction': _direction,
      'PageNo': _pageNumber,
      'DisplayRow': _row,
    };
  }

  @override
  String toString() {
    return 'FetchJournalMasterDTO{_pageNumber: $_pageNumber, _direction:$_direction , _row:$_row}';
  }
}
