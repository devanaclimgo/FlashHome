# ✨ FlashHome: Instant Home Notifications (Ruby Prototype)
![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) 
**A tiny Ruby prototype for sending quick messages to your phone & smart home—like a widget-triggered Alexa announcement or light alert!**

## 💡 The Idea
I wanted a way to send **super-fast notifications** from a phone widget (e.g., "Mom left the house!") that could also:
- **Play on Alexa/Google** Home as a voice announcement.
- **Change smart lights** (e.g., flash blue as a visual cue).
- **Stay subtle** (vibrate-only or silent modes).

Think of it like **quick voicemails for your smart home**!

## 🛠️ How I Built the Prototype
### 1. Core Tech Choices
- **Ruby**: Simple, readable, and fast for prototyping logic.
- **CLI Simulation**: Mimics a mobile widget tap (real app would use APIs).
- **Fake "APIs"**: Uses `puts` for demo purposes (real version would use Twilio, Alexa Skills, Philips Hue, etc.).

### 2. Key Components
#### 📝 Preset Messages
```ruby
PRESETS = {
  leaving: "Mom left the house!",
  on_way: "On my way home!",
  custom: nil # For voice recordings
}
```

- Predefined messages for common scenarios (expandable!).

#### 🚀 Initialize Logic
```ruby
def initialize(message_key, options = {})
  @message = PRESETS[message_key] || options[:custom_text] # Use preset or custom text
  @mode = options[:mode] || :announce # Default to voice announcement
end
```

- **Flexible input:** Accepts preset keys (`:leaving`) or custom text.
- **Modes:** `:announce` (Alexa speaks), `:vibrate`, `:stealth` (lights only).

#### 📲 Simulated Notifications
```ruby
def send!
  send_to_phone
  send_to_smart_home if @mode != :stealth
  puts "✅ Done! '#{@message}'"
end
```

- **Phone:** Prints message + vibrate hint.
- **Smart Home:** "Alexa" speaks or lights change (demoed with `puts`).

## 🚧 Next Steps (If This Were Real)
1. **Real APIs**:
- **Alexa/Google Home**: Use their TTS (text-to-speech) APIs.
- **Smart Lights**: Philips Hue or HomeKit integration.
- **Mobile Widget**: iOS/Android app with HTTP calls to a Sinatra/Rails backend.

2. **Voice Notes**: Record + send audio snippets.
3. **Automations**: Auto-send "Left work" when phone disconnects from WiFi.

## 👩‍💻 Try It Yourself!
1. Save the code as `quick_message.rb`.
2. Run:
```bash
ruby quick_message.rb
```
3. Modify the simulation:
```ruby
# Example: Custom message + vibrate mode
message = QuickMessage.new(:custom, custom_text: "Dinner’s ready!", mode: :vibrate)
message.send!
```

# 🌟 Why I Love This Project
It’s **simple but powerful**—a few lines of Ruby model a real-world need for seamless home communication. Perfect for parents, roommates, or anyone who wants to **"ping" their house instantly**!

##### Made with Ruby & daydreams about smarter homes. 💙
###### Built with ❤️ by Ana - 2025
