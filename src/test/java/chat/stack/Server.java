package chat.stack;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Server extends Thread {
    private ServerSocket server;
    protected List<ClientHandler> clients;

    public Server(int port) {
        try {
            this.server = new ServerSocket(port);
            System.out.println("New server initialized!");
            clients = Collections
                    .synchronizedList(new ArrayList<ClientHandler>());
            this.start();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void run() {
        while (true) {
            try {
                Socket client = server.accept();

                BufferedReader in = new BufferedReader(new InputStreamReader(client.getInputStream()));
                String inputLine;
                while ((inputLine = in.readLine()) != null){
                    System.out.println("Server: " + inputLine);
                    if (inputLine.equals("Bye."))
                        break;
                }

                System.out.println(client.getInetAddress().getHostName()
                        + " connected");
                ClientHandler newClient = new ClientHandler(client);
                clients.add(newClient);
                new SendMessage(clients,inputLine);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        new Server(1200);
    }
}