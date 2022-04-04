package MessageServices;

import javax.jms.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class Producer {

    public void produceMessage(String text) throws JMSException, NamingException {
        InitialContext initialContext = new InitialContext();
        ConnectionFactory connectionFactory = (ConnectionFactory) initialContext.lookup("jms/myConnectionFactory");
        Queue queue = (Queue) initialContext.lookup("jms/PTPQueue");
        Connection connection = connectionFactory.createConnection();
        Session session = connection.createSession();
        MessageProducer messageProducer = session.createProducer(queue);
        TextMessage message = session.createTextMessage(text);

        messageProducer.send(message);
        session.close();
        connection.close();
    }
}