package model;

import java.util.List;

public class Message {
    public enum Type { Error, Warn, Info, Success }
    public static class MessageBuilder {
        private Type type;
        private StringBuilder message;
        
        public MessageBuilder(Type type) {
            this.type = type;
            this.message = new StringBuilder();
        }

        public MessageBuilder addLineBreak() {
            message.append("<br>");
            return this;
        }

        public MessageBuilder addText(String text) {
            message.append(text);
            return this;
        }

        public MessageBuilder addBoldText(String text) {
            message.append("<b>").append(text).append("</b>");
            return this;
        }

        public MessageBuilder addItalicText(String text) {
            message.append("<i>").append(text).append("</i>");
            return this;
        }

        public MessageBuilder addList(List<String> items) {
            message.append("<ul>");
            for (String item : items) {
                message.append("<li>").append(item).append("</li>");
            }
            message.append("</ul>");
            return this;
        }

        public Message build() {
            return new Message(type, message.toString());
        }
    }
    private Type type;
    private String message;
    
    public Message(Type type, String message) {
        this.type = type;
        this.message = message;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
