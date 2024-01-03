package com.example.flutterchat.Controller;

import com.example.flutterchat.Dto.RoomResponse;
import com.example.flutterchat.Entity.Room;
import com.example.flutterchat.Service.RoomService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class RoomController {

    private final RoomService roomService;

    @GetMapping("/room")
    @CrossOrigin(origins = "http://localhost:58162/")
    public List<RoomResponse> getRoomList() {
        return roomService.getRoomList();
    }

    @PostMapping("/room")
    public void createRoom(@RequestBody() String roomName) {

        Room room = new Room(roomName);
        roomService.saveRoom(room);
    }

}
