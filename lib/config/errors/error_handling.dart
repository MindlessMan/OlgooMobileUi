String errorHandling(int statusCode) {
  switch (statusCode) {
    case 404:
      return "کاربر مورد نظر یافت نشد";
    case 403:
      return "شما دسترسی به این سرویس را ندارید";
    case 401:
     return "این کد منقضی شده و دیگر معتبر نیست";
    case 422:
     return  "کد وارد شده معتبر نیست";
    default:
      return "مشکلی در سرویس پیش آمده";
  }
}
