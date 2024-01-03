package com.example.flutterchat.Service;

import com.example.flutterchat.Repository.RoomRepository;
import com.example.flutterchat.Dto.RoomResponse;
import com.example.flutterchat.Entity.Room;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class RoomService {
    final RoomRepository roomRepository;

    public List<RoomResponse> getRoomList() {
        List<Room> rooms = roomRepository.findAll();
        List<RoomResponse> collect = rooms.stream()
                .map(m -> new RoomResponse(m.getId(),m.getName()))
                .collect(Collectors.toList());
        if(collect != null)
            return collect;
        else
            return null;
    }

    public void saveRoom(Room room) {
        roomRepository.save(room);
    }


}
