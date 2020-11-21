function faq_show_dialog takes nothing returns nothing
    call DialogDisplay(GetEnumPlayer(), udg_faq_dialog, true)
endfunction

function faq_hide_dialog takes nothing returns nothing
    call DialogDisplay(GetEnumPlayer(), udg_faq_dialog, false)
endfunction