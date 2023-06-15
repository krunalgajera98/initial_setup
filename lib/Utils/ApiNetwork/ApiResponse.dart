class ApiResponse<T> {
  Status? status;
  T? res;
  String? message;

  ApiResponse({this.status, this.res, this.message});

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(this.res) : status = Status.COMPLETED;

  ApiResponse.failed(this.res) : status = Status.FAILED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $res ";
  }
}

enum Status { LOADING, COMPLETED, ERROR, FAILED }
