package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.Members;

public interface MembersService {
	public Members getMembersItem(Members input) throws Exception;
	public Members getMembersItemPoint(Members input) throws Exception;
	
	public List<Members> getMembersList(Members input) throws Exception;
	
	public int getMembersCount(Members input) throws Exception;
	public int getMembersCountTal(Members input) throws Exception;
	
	public int addMembers(Members input) throws Exception;
	
	public int editMembers(Members input) throws Exception;
	public int editMembersTal(Members input) throws Exception;
	public int editMembersSujung(Members input) throws Exception;
	public int editMembersBibun(Members input) throws Exception;
	public int editMembersPoint(Members input) throws Exception;

	public int deleteMembers(Members input) throws Exception;

	public int loginCount(Members input) throws Exception;
	public Members idItem(Members input) throws Exception;

	public Members getMembersCartpage(Members input) throws Exception;
	
	public List<Members> getMembersListPoint(Members input) throws Exception;
	public int passwordCountA(Members input) throws Exception;
}
