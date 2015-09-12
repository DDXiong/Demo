#coding:utf-8

from twisted.internet.protocol import Factory, Protocol
from twisted.internet import reactor

class IphoneChat(Protocol):
    def connectionMade(self):
        self.factory.clients.append(self)
        print "当前连线的客户端有", self.factory.clients

    def connectionLost(self, reason):
        self.factory.clients.remove(self)

    def dataReceived(self, data):
        a = data.split(':')
        if len(a) > 1:
            command = a[0].strip()
            content = a[1].strip()

            msg = ""
            if command == "iam":
                self.name = content
                msg = self.name + " 加入了聊天室"

            elif command == "msg":
                msg = self.name + ": " + content

            print msg

            for c in self.factory.clients:
                c.message(msg)

    def message(self, message):
        self.transport.write(message + '\n')


factory = Factory()
factory.clients = []
factory.protocol = IphoneChat
reactor.listenTCP(1025, factory)
print "Iphone Chat server started"
reactor.run()
