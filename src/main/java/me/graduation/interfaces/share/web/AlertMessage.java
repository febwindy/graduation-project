package me.graduation.interfaces.share.web;

/**
 * Author: EthanTu <ethan.l.tu@gmail.com>
 * Date: 1/23/15
 * Time: 4:14 PM
 */
public class AlertMessage {

    public static final String MODEL_ATTRIBUTE_KEY = "alertMessage";

    private MessageType type;

    private String message;

    public AlertMessage() {
        super();
    }

    public AlertMessage(String message) {
        this.type = MessageType.SUCCESS;
        this.message = message;
    }

    public AlertMessage(MessageType type, String message) {
        this.type = type;
        this.message = message;
    }

    public MessageType getType() {
        return type;
    }

    public String getMessage() {
        return message;
    }

    public enum MessageType {
         SUCCESS("成功", 0),
         INFO("信息", 1),
         WARNING("警告", 2),
         DANGER("错误", 3);

         private MessageType(String name, int value) {
             this.name = name;
             this.value = value;
         }

         private String name;
         private int value;

         public String getName() {
             return name;
         }

         public int getValue() {
             return value;
         }
     }
}
