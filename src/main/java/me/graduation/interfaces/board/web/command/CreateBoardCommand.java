package me.graduation.interfaces.board.web.command;

import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;

/**
 * Created by ivan_ on 2015/4/8.
 */
public class CreateBoardCommand implements Serializable {

    @NotEmpty(message = "{CreateBoardCommand.title.NotEmpty}")
    private String title;

    @NotEmpty(message = "{CreateBoardCommand.content.NotEmpty}")
    private String content;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
