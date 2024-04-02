package com.kh.app.chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat/{userid}")
public class ChatSocket {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private static Map<Session, String> client_id = Collections.synchronizedMap(new HashMap<Session, String>());
	@OnMessage
	public void onMessage(String message, Session session) throws IOException{
		synchronized (clients) {
			for(Session client : clients) {
				if(!client.equals(session)) {
					System.out.println("Send '"+message+"' To "+client_id.get(client));
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	@OnOpen
	public void onOpen(Session session, @PathParam(value="userid")String userid) {
		System.out.println("접속 : "+session+" / 아이디 : "+userid);
		clients.add(session);
		client_id.put(session, userid);
	}
	@OnClose
	public void onClose(Session session) {
		System.out.println("종료 : "+session+" / 아이디 : "+client_id.get(session));
		clients.remove(session);
		client_id.remove(session);
	}
}





