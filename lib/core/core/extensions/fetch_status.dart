enum FetchStatus{
  pure,
  fetchInProgress,
  fetchSuccess,
  fetchFailure,
  zeroData,
}


extension FetchStatusExtension on FetchStatus {


  bool get isPure => this == FetchStatus.pure;
  bool get isFetchInProgress => this == FetchStatus.fetchInProgress;
  bool get isFetchSuccess => this == FetchStatus.fetchSuccess;
  bool get isFetchFailure => this == FetchStatus.fetchFailure;
  bool get isZeroData => this == FetchStatus.zeroData;

}