        DEF_APP apidocs "API Docs" fa-book-journal-whills bg-indigo-500 core
            ON_LAUNCH
                VAR $isNew = SYS_IS_NEW_INSTANCE ""
                IF $isNew == false
                    SYS_RETURN ""
                END_IF


                UI_HEADER "MScript Mastery Guide"
                UI_CONTENT_START
               
                UI_HTML "<p class='mb-4 text-sm text-gray-600 dark:text-gray-300'>Welcome! MScript is the OS's native language. Every app is built with it. Here are all the commands you can use:</p>"


                // 1. APP LIFECYCLE
                UI_HTML "<div class='mos-card border-l-4 border-l-purple-500'><h3 class='font-bold text-lg mb-2'>1. App Lifecycle</h3>"
                UI_HTML "<p class='text-xs mb-2 text-gray-500'>Define your app and its events.</p>"
                UI_HTML "<code class='block bg-gray-100 dark:bg-gray-800 p-2 rounded text-xs text-purple-600 dark:text-purple-300 font-mono leading-relaxed'>"
                UI_HTML "DEF_APP id \"Name\" fa-icon bg-color<br>"
                UI_HTML "&nbsp;&nbsp;ON_LAUNCH<br>"
                UI_HTML "&nbsp;&nbsp;&nbsp;&nbsp;VAR $isNew = SYS_IS_NEW_INSTANCE \"\"<br>"
                UI_HTML "&nbsp;&nbsp;&nbsp;&nbsp;VAR $src = SYS_GET_LAUNCH_SOURCE \"\"<br>"
                UI_HTML "&nbsp;&nbsp;&nbsp;&nbsp;IF $isNew == false<br>"
                UI_HTML "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SYS_RETURN \"\" // Don't redraw!<br>"
                UI_HTML "&nbsp;&nbsp;&nbsp;&nbsp;END_IF<br>"
                UI_HTML "&nbsp;&nbsp;END_LAUNCH<br><br>"
                UI_HTML "&nbsp;&nbsp;ON_EVENT event_type element_id<br>"
                UI_HTML "&nbsp;&nbsp;END_EVENT<br><br>"
                UI_HTML "&nbsp;&nbsp;ON_CUSTOM_EVENT event_name<br>"
                UI_HTML "&nbsp;&nbsp;&nbsp;&nbsp;VAR $data = $EVENT_DATA<br>"
                UI_HTML "&nbsp;&nbsp;END_CUSTOM_EVENT<br>"
                UI_HTML "END_APP"
                UI_HTML "</code></div>"


                // 2. UI BUILDER
                UI_HTML "<div class='mos-card border-l-4 border-l-blue-500'><h3 class='font-bold text-lg mb-2'>2. UI Builder</h3>"
                UI_HTML "<p class='text-xs mb-2 text-gray-500'>Commands to draw on the screen. Must call UI_RENDER at the end.</p>"
                UI_HTML "<code class='block bg-gray-100 dark:bg-gray-800 p-2 rounded text-xs text-blue-600 dark:text-blue-300 font-mono leading-relaxed'>"
                UI_HTML "UI_HEADER \"Title\"<br>"
                UI_HTML "UI_CONTENT_START<br>"
                UI_HTML "UI_HTML \"&lt;b&gt;Raw HTML&lt;/b&gt;\"<br>"
                UI_HTML "UI_BUTTON \"btn1\" \"Text\" \"primary|danger\"<br>"
                UI_HTML "UI_INPUT \"inp1\" \"Placeholder\" \"value\"<br>"
                UI_HTML "UI_TEXTAREA \"txt1\" \"Hint\" \"value\" \"css_classes\"<br>"
                UI_HTML "UI_CHECKBOX \"chk1\" \"Label\" $bool<br>"
                UI_HTML "UI_CONTENT_END<br>"
                UI_HTML "UI_RENDER \"\""
                UI_HTML "</code></div>"


                // 3. VARIABLES & DATA
                UI_HTML "<div class='mos-card border-l-4 border-l-green-500'><h3 class='font-bold text-lg mb-2'>3. Variables & Data</h3>"
                UI_HTML "<p class='text-xs mb-2 text-gray-500'>Store data using VAR. Access it with $. Read UI inputs.</p>"
                UI_HTML "<code class='block bg-gray-100 dark:bg-gray-800 p-2 rounded text-xs text-green-600 dark:text-green-300 font-mono leading-relaxed'>"
                UI_HTML "VAR $age = 18<br>"
                UI_HTML "VAR $word = \"Hello\"<br>"
                UI_HTML "VAR $input = READ_INPUT \"inp1\"<br>"
                UI_HTML "VAR $msg = CONCAT $word \" World\"<br>"
                UI_HTML "VAR $user = CREATE_OBJ \"name\" \"Bob\" \"age\" 22<br>"
                UI_HTML "</code></div>"


                // 4. MATH & LOGIC
                UI_HTML "<div class='mos-card border-l-4 border-l-yellow-500'><h3 class='font-bold text-lg mb-2'>4. Math & Logic</h3>"
                UI_HTML "<code class='block bg-gray-100 dark:bg-gray-800 p-2 rounded text-xs text-yellow-600 dark:text-yellow-300 font-mono leading-relaxed'>"
                UI_HTML "MATH $sum = 5 + 5<br>"
                UI_HTML "MATH $sub = 10 - 2<br>"
                UI_HTML "IF $sum == 10<br>"
                UI_HTML "&nbsp;&nbsp;// do stuff<br>"
                UI_HTML "END_IF<br>"
                UI_HTML "// Operators: ==, !=, >, <"
                UI_HTML "</code></div>"


                // 5. ARRAYS
                UI_HTML "<div class='mos-card border-l-4 border-l-orange-500'><h3 class='font-bold text-lg mb-2'>5. Lists (Arrays)</h3>"
                UI_HTML "<code class='block bg-gray-100 dark:bg-gray-800 p-2 rounded text-xs text-orange-600 dark:text-orange-300 font-mono leading-relaxed'>"
                UI_HTML "VAR $list = GET_STORAGE \"my_list\" \"[]\"<br>"
                UI_HTML "ARRAY_PUSH $list \"Apple\"<br>"
                UI_HTML "ARRAY_UPDATE $list 0 \"Banana\"<br>"
                UI_HTML "ARRAY_SPLICE $list 0 1 // Remove 1 item at idx 0<br>"
                UI_HTML "VAR $fruit = ARRAY_GET $list 0<br><br>"
                UI_HTML "MAP_ARRAY $list $item<br>"
                UI_HTML "&nbsp;&nbsp;// Access index with $INDEX<br>"
                UI_HTML "&nbsp;&nbsp;UI_HTML \"${$item}\"<br>"
                UI_HTML "END_MAP"
                UI_HTML "</code></div>"


                // 6. STORAGE & SYSTEM
                UI_HTML "<div class='mos-card border-l-4 border-l-red-500'><h3 class='font-bold text-lg mb-2'>6. Storage & System</h3>"
                UI_HTML "<p class='text-xs mb-2 text-gray-500'>Permanent memory and OS commands.</p>"
                UI_HTML "<code class='block bg-gray-100 dark:bg-gray-800 p-2 rounded text-xs text-red-600 dark:text-red-300 font-mono leading-relaxed'>"
                UI_HTML "SET_STORAGE \"key\" $value<br>"
                UI_HTML "VAR $val = GET_STORAGE \"key\" \"fallback\"<br><br>"
                UI_HTML "SYS_NOTIFY \"Title\" \"Msg\" \"fa-icon\"<br>"
                UI_HTML "SYS_LAUNCH \"app_id\" \"app\"<br>"
                UI_HTML "SYS_CLOSE_APP \"app_id\"<br>"
                UI_HTML "SYS_GO_HOME \"\"<br>"
                UI_HTML "SYS_KILL_ALL \"\"<br><br>"
                UI_HTML "VAR $mode = SYS_GET_SETTING \"darkMode\"<br>"
                UI_HTML "SYS_SET_SETTING \"darkMode\" true<br><br>"
                UI_HTML "VAR $apps = SYS_GET_APPS \"\"<br>"
                UI_HTML "VAR $procs = SYS_GET_PROCESSES \"\"<br><br>"
                UI_HTML "VAR $src = SYS_GET_LAUNCH_SOURCE \"\"<br><br>"
                UI_HTML "SYS_INSTALL_APP $codeString<br>"
                UI_HTML "SYS_UNINSTALL_APP \"app_id\"<br>"
                UI_HTML "SYS_ERASE_DATA \"\""
                UI_HTML "</code></div>"


                // 7. NETWORK
                UI_HTML "<div class='mos-card border-l-4 border-l-cyan-500'><h3 class='font-bold text-lg mb-2'>7. Network (GitHub)</h3>"
                UI_HTML "<p class='text-xs mb-2 text-gray-500'>Download APIs or Raw code files.</p>"
                UI_HTML "<code class='block bg-gray-100 dark:bg-gray-800 p-2 rounded text-xs text-cyan-600 dark:text-cyan-300 font-mono leading-relaxed'>"
                UI_HTML "SYS_FETCH_JSON $data \"https://raw.github...\"<br>"
                UI_HTML "SYS_FETCH_TEXT $code \"https://raw.github...\"<br>"
                UI_HTML "</code></div>"


                UI_CONTENT_END
                UI_RENDER ""
            END_LAUNCH
        END_APP

