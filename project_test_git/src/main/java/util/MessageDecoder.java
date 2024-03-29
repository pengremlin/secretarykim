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
package util;

import java.io.StringReader;

import javax.json.Json;
import javax.json.JsonObject;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

import DTO.ChatMessageDTO;
import DTO.CMessage;


/**
* @Class Name : MessageDecoder.java
* @Description : 클라이언트에서 서버로 전달되는 메시지를 decoding하는 클래스
* @Modification Information
*
*    수정일       수정자         수정내용
*    -------        -------     -------------------
*    2014. 11. 27.    이영지
*
*/
public class MessageDecoder implements Decoder.Text<CMessage> {

	@Override
	public void destroy() {}

	@Override
	public void init(EndpointConfig arg0) {}

	/**
	 * 화면에서 넘어오는 데이터를 decoding하는 함수
	 */
	@Override
	public CMessage decode(String message) throws DecodeException {
		ChatMessageDTO chatMessage = new ChatMessageDTO();

		JsonObject jsonObject = Json
				.createReader(new StringReader(message)).readObject();
		chatMessage.setMessage(jsonObject.getString("message"));
		chatMessage.setRoom(jsonObject.getString("room"));
		return chatMessage;
	}

	@Override
	public boolean willDecode(String message) {
		boolean flag = true;

		try {
			Json.createReader(new StringReader(message)).readObject();
		} catch (Exception ex) {
			flag = false;
		}
		return flag;
	}

}
