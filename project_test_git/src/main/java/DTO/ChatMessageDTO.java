/*
 * eGovFrame Web Messager
 * Copyright The eGovFrame Open Community (http://open.egovframe.go.kr)).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * @author 이영지(슈퍼개발자K3)
 */
package DTO;

/**
* @Class Name : ChatMessage.java
* @Description : 대화정보를 담는 VO
* @Modification Information
*
*    수정일       수정자         수정내용
*    -------        -------     -------------------
*    2014. 11. 27.    이영지
*
*/
public class ChatMessageDTO implements CMessage{

	/**
	 * 사용자명
	 */
	private String id;

	/**
	 * room Id
	 */
	private String room;

	/**
	 * 전달 메시지
	 */
	private String message;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
}
