package cn.domain;

import java.util.HashMap;
import java.util.Map;

/**
 * @author hwbstart
 * @create 2022-05-14 0:11
 * json通用类
 */
public class Msg {
    public int code;
    public String msg;
    Map<String,Object> extend=new HashMap<String, Object>();
    public static Msg success(){
        Msg result=new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;
    }
    public  static  Msg fail(){
        Msg result=new Msg();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;
    }
    public  Msg add(String s,Object o){
        Msg result=new Msg();
        result.extend.put(s,o);
        return result;
    }

    public Msg() {
    }

    public Msg(int code, String msg, Map<String, Object> extend) {
        this.code = code;
        this.msg = msg;
        this.extend = extend;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }
}
