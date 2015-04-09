package me.graduation.interfaces.board.web.command;

import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;

/**
 * Created by ivan_ on 2015/4/9.
 */
public class EditBoardCommand implements Serializable {

    private String id;

    @NotEmpty(message = "{EditBoardCommand.title.NotEmpty}")
    private String title;

    @NotEmpty(message = "{EditBoardCommand.content.NotEmpty}")
    private String content;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

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
