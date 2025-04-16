class QuickMessage
  PRESETS = {
    leaving: "Mom left the house!",
    on_way: "On my way home!",
    custom: nil # for voice  recordings
  }

  def initialize(message_key, options = {})
    @message = PRESETS[message_key] || options[:custom_text]
    @mode = options[:mode] || :announce # :stealth, :vibrate, etc
  end

  def send!
    send_to_phone
    send_to_smart_home if @mode != :stealth
    puts "✅ Done! '#{@message}'"
  end

  private

  def send_to_phone
    # simulate phone notification
    puts "📱 Phone: '#{@message}' #{@mode == :vibrate ? ' (vibrating)' : ''}"
  end

  def send_to_smart_home
    
    puts "🔊 Alexa: '#{@message}'" if @mode == :announce

    # simulate changing a light
    puts "💡 Light: Set to blue" if @mode != :silent
  end 
end

# simulation
message1 = QuickMessage.new(:leaving)
puts message1.instance_variable_get(:@message)

message2 = QuickMessage.new(:custom, custom_text: "Buy milk!")
puts message2.instance_variable_get(:@message)
