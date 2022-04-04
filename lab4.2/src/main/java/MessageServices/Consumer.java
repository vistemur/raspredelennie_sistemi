package MessageServices;

import javax.ejb.ActivationConfigProperty;
import javax.ejb.MessageDriven;
import javax.jms.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.util.LinkedList;


public class Consumer {

    private LinkedList<String> messages = new LinkedList<String>();

    public void obtainMessage() throws NamingException, JMSException {
        InitialContext initialContext = new InitialContext();
        ConnectionFactory connectionFactory = (ConnectionFactory) initialContext.lookup("jms/myConnectionFactory");
        Queue queue = (Queue) initialContext.lookup("jms/PTPQueue");
        JMSContext jmsContext = connectionFactory.createContext();
        TextMessage message = (TextMessage) jmsContext.createConsumer(queue).receive(100);
        messages.add(message.getText());
    }

    public String[] getMessages() {
        return messages.toArray(new String[0]);
    }
}

