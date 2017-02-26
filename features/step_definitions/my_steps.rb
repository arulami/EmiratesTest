
#verify on Home screen
Given(/^the user is on the home screen$/) do
  wait_for_elements_exist("* text:'selendroid-test-app'", :timeout => 40, :retry_frequency => 1, :post_timeout => 0.5, :screenshot_on_error => false)
  fail("app not launched") if query("*").empty?
end


#taps on Chrome icon
And(/^user taps on Chrome icon$/) do
  if element_exists("* id:'buttonStartWebview'")
    touch("* id:'buttonStartWebview'")
  else
    fail("chrome icon is not displayed")
  end
end


#enters the name and clear
When(/^user enters their own name$/) do
  wait_for_elements_exist("webview css:'#name_input'", :timeout => 40, :retry_frequency => 1, :post_timeout => 0.5, :screenshot_on_error => false)

  touch("webview css:'#name_input'")

  clear_text_in("webview css:'#name_input'")

  #clear can be done thriugh shell cmds also
  #21.times do
    #system("adb shell input keyevent KEYCODE_DEL")
   # sleep 1
  #end

  keyboard_enter_text("arul")
  sleep 2
  hide_soft_keyboard()
end

#pending app UI - pending
And(/^selects their favourite car$/) do
  puts "pending"
end

#tap on send button
And(/^tap on send me your name$/) do
  wait_for_elements_exist("webview css:'*' nodeName:'BR'", :timeout => 40, :retry_frequency => 1, :post_timeout => 0.5, :screenshot_on_error => false)

  touch("webView css:'*' nodeName:'BR' index:3")
end

#verify car and name
Then(/^your name and car is displayed$/) do
  fail("your name is not displayed") unless element_exists("webview css:'*' textContent:'Your name is:'")
  sleep 1
  touch("* id:'goBack'")
end

#trigger pop up
When(/^the user taps on display a popup window$/) do
  wait_for_elements_exist("* id:'buttonTest'", :timeout => 30, :retry_frequency => 1, :post_timeout => 0.5, :screenshot_on_error => false)

  touch("* id:'buttonTest'")
end

#verify
Then(/^verify the text on the popup window$/) do
  textContent = query("* id:'button1'").first['text']
  fail("I agree is not displayed") unless textContent.include? "I agree"
end

And(/^click dismiss$/) do
  wait_for_elements_exist("* id:'button2'", :timeout => 10, :retry_frequency => 1, :post_timeout => 0.5, :screenshot_on_error => false)
  touch("* id:'button2'")
end

When(/^click on throw unhandled exception$/) do
  pending
end


Then(/^verify the app crashes and capture the logs$/) do
  pending
end