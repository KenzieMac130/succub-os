[group('Apps')]
install-audio-suite ACTION="":
    rpm-ostree install 
    rpm-ostree install calf-plugins
    # todo: hide plugins https://www.reddit.com/r/linux4noobs/comments/g40e3a/unwanted_lsp_plugins_showing_up/
    
    #todo... build ardour inside of a container