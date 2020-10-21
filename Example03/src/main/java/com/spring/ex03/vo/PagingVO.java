package com.spring.ex03.vo;

public class PagingVO {
	private static final int page_size = 10;
	private static final int block_size = 10;
	
	private int total_page;
	private int total_block;	
	private int start_page;
	private int end_page;	
	private int cur_page;
	private int cur_block;
	private int start_board;
	private int last_board;
	private boolean prev;
	private boolean next;
	
	public PagingVO(int list_cnt, int cur_page) {
	
		//ex) 페이지당 10개씩, 10블럭 일때, 121개의 게시글 -> 2블럭, 13페이지
	
		this.total_page = (int) Math.ceil(list_cnt/(double)page_size);
		this.total_block = (int) Math.ceil(this.total_page/(double)block_size);
		
		this.cur_block = (int) Math.ceil(cur_page/(double)block_size);
	
		this.start_page = (this.cur_block-1)* block_size + 1;
		this.end_page = this.cur_block* block_size; 
		
		this.prev = this.cur_block == 1?false:true;
		this.next = this.end_page >= this.total_page ?false:true;	
		
		if(this.end_page > this.total_page) {
			this.end_page = this.total_page; 
			this.next = false;
		}
		
		this.start_board = (cur_page-1)* page_size + 1;
		this.last_board = cur_page * page_size;
	}

	public int getStart_board() {
		return start_board;
	}
	public int getLast_board() {
		return last_board;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getStart_page() {
		return start_page;
	}

	public int getEnd_page() {
		return end_page;
	}

}
