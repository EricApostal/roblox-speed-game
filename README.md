# RobloxSpeedGame
A simple, open sourced, progressive Roblox game 

## What is this?
This is a game designed for expandability and utilization of modern Roblox libraries. I use rojo for vscode support, wally for crate-like package management, roact for uis, and of course knit for an awesome networking system.

## Why is this?
I was working on my own, simple game, but I found that it was always super sloppy to code in. I used default RemoteEvents and systems like that, but no level of abstraction could save me from the horrors of Roblox Studio. Not that Roblox Studio is inherently *bad*, but it lacks in a lot of ways. It's just so messy, making a RemoteEvent for InvokeServer or BindableEvent or whatever each time I wanted to call an event in a different manner. 

## Something to keep in mind...
I don't usually look at other games / code segments, and this is my first time trying to properly utilize libraries in Roblox. I am actively trying to become better at these frameworks, but bear with me if I disregard common convention.

## Getting Started
To build the place from scratch, use:

```bash
rojo build -o "RobloxSpeedGame.rbxlx"
```

Next, open `RobloxSpeedGame.rbxlx` in Roblox Studio and start the Rojo server:

```bash
rojo serve
```
