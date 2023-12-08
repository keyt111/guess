/// 语言设置 中文繁体，英语，泰语，西班牙语
extension Trans on String {
  String get tr {
    return Language.text(this);
  }
}

class Language {
  static String language = "en";

  static String text(String msg) {
    try {
      return json[language][msg];
    } catch(e) {
      return msg;
    }
  }

  static dynamic json = {
    "zh" : {
      "网络请求失败": "网络请求失败",
      "网络超时": "网络超时",
      "服务器异常": "服务器异常",
      "无效请求": "无效请求",
      "请求资源不存在": "请求资源不存在",
      "请求方法被禁止": "请求方法被禁止",
      "服务器拒绝执行": "服务器拒绝执行",
      "请求参数无效": "请求参数无效",
      "网络繁忙，请重试": "网络繁忙，请重试",
      "操作频繁，请稍后再试": "操作频繁，请稍后再试",
      "请重新登录": "请重新登录",
      "版本更新": "版本更新",
      "加载中": "加载中",
      "暂未开放": "暂未开放",
    },
    "en" : {
      "网络请求失败": "Network request failed",
      "网络超时": "Network Timeout",
      "服务器异常": "Server exception",
      "无效请求": "Invalid request",
      "请求资源不存在": "The requested resource does not exist",
      "请求方法被禁止": "Request method is prohibited",
      "服务器拒绝执行": "Server refused to execute",
      "请求参数无效": "Invalid request parameter",
      "网络繁忙，请重试": "The network is busy, please try again",
      "操作频繁，请稍后再试": "Frequent operation, please try again later",
      "请重新登录": "Please log in again",
      "版本更新": "Version Update",
      "加载中": "loading",
      "暂未开放": "Not yet open",
    },
    "th" : {
      "网络请求失败": "คำขอเครือข่ายล้มเหลว",
      "网络超时": "หมดเวลาการเชื่อมต่อกับเครือข่าย",
      "服务器异常": "ข้อยกเว้นของเซิร์ฟเวอร์",
      "无效请求": "คำขอไม่ถูกต้อง",
      "请求资源不存在": "ไม่มีทรัพยากรที่ร้องขอ",
      "请求方法被禁止": "วิธีการร้องขอเป็นสิ่งต้องห้าม",
      "服务器拒绝执行": "เซิร์ฟเวอร์ปฏิเสธที่จะดำเนินการ",
      "请求参数无效": "พารามิเตอร์คำขอไม่ถูกต้อง",
      "网络繁忙，请重试": "เครือข่ายไม่ว่าง โปรดลองอีกครั้ง",
      "操作频繁，请稍后再试": "การดำเนินการบ่อยครั้ง โปรดลองอีกครั้งในภายหลัง",
      "请重新登录": "กรุณาเข้าสู่ระบบอีกครั้ง",
      "版本更新": "อัพเดทเวอร์ชั่นใหม่",
      "加载中": "กำลังโหลด",
      "暂未开放": "ยังไม่เปิด",
    },
    "es" : {
      "网络请求失败": "la solicitud de red falló",
      "网络超时": "tiempo de espera de la red",
      "服务器异常": "excepción del servidor",
      "无效请求": "Solicitud no válida",
      "请求资源不存在": "El recurso solicitado no existe",
      "请求方法被禁止": "el método de solicitud está prohibido",
      "服务器拒绝执行": "El servidor se niega a ejecutar",
      "请求参数无效": "Parámetro de solicitud no válido",
      "网络繁忙，请重试": "La red está ocupada, intente nuevamente",
      "操作频繁，请稍后再试": "Operación frecuente, intente nuevamente más tarde",
      "请重新登录": "por favor inicia sesión de nuevo",
      "版本更新": "nueva versión",
      "加载中": "Cargando",
      "暂未开放": "aún no abierto",
    },
  };
}
