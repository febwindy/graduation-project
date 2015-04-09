package me.graduation.interfaces.board.web.command;

import java.io.Serializable;

/**
 * Created by ivan_ on 2015/4/8.
 */
public class ListCommand implements Serializable {
    private String title;
    private int page = 1;
    private int pageSize = 20;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
