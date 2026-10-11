/// Clean Up Event: free resources
 
if (net_room != 0) {
    colyseus_room_leave(net_room);
    colyseus_room_free(net_room);  // also frees associated callbacks
}
if (client != 0) {
    colyseus_client_free(client);
}