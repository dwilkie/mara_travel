function getCookie(name) {
  var cookie = " " + document.cookie;
  var search = " " + name + "=";
  var setStr = null;
  var offset = 0;
  var end = 0;
  if (cookie.length > 0) {
    offset = cookie.indexOf(search);
    if (offset != -1) {
      offset += search.length;
      end = cookie.indexOf(";", offset)
      if (end == -1) {
        end = cookie.length;
      }
      setStr = unescape(cookie.substring(offset, end));
    }
  }
  return(setStr);
}


jQuery(window).load(function() {
  jQuery('head').append('<link href="/stylesheets/tfuse-top-panel.css" rel="stylesheet" type="text/css" />');
  var tfusehostname = location.hostname;
  jQuery.get("http://"+tfusehostname+"/demo/tfuse-top-panel/tfuse-top-panel.php",
      function(datahtml){
        jQuery("body").prepend($(datahtml));

        var speed = 400;

        var tfusetoppanelshow = getCookie('tfusetoppanelshow');
        var tfuse_top_panel = jQuery("#tfuse-top-sliding-panel-container");

        // slideup on page load
        if(tfusetoppanelshow == 'yes') {
          jQuery("#tfuse-top-sliding-panel-container").css({top:"-96px"});
          jQuery(this).removeClass("ajax-close-tfuse-top-slide").addClass("ajax-open-tfuse-top-slide");
        } else {
          jQuery(this).removeClass("ajax-open-tfuse-top-slide").addClass("ajax-close-tfuse-top-slide");
          jQuery("#tfuse-top-sliding-panel-container").animate({top:"-1px"}, 900);
          jQuery("#tfuse-top-sliding-panel-container").animate({top:"-1px"}, 2000);
          jQuery("#tfuse-top-sliding-panel-container").animate({top:"-96px"}, 900);
          jQuery(this).removeClass("ajax-close-tfuse-top-slide").addClass("ajax-open-tfuse-top-slide");
          document.cookie = "tfusetoppanelshow=yes; path=/";
        }
        jQuery(this).removeClass("ajax-close-tfuse-top-slide").addClass("ajax-open-tfuse-top-slide");

        //slid up/down top panel
        jQuery("#tfuse-top-sliding-panel-container #tfuse-top-sliding-panel-btn-slide").click(function(){
          document.cookie = "tfusetoppanelshow=yes; path=/";
          if( jQuery(this).hasClass("ajax-open-tfuse-top-slide") ) {
            jQuery("#tfuse-top-sliding-panel-container").animate({top:"-1px"}, speed);
            jQuery(this).removeClass("ajax-open-tfuse-top-slide").addClass("ajax-close-tfuse-top-slide");
          } else if( jQuery(this).hasClass("ajax-close-tfuse-top-slide") ) {
            jQuery("#tfuse-top-sliding-panel-container").animate({top:"-96px"}, speed);
            jQuery(this).removeClass("ajax-close-tfuse-top-slide").addClass("ajax-open-tfuse-top-slide");
          }
        });

        //slide up when click outside
        jQuery("#tfuse-top-sliding-panel-container").hover(
            function() {
              jQuery('body').unbind('click');
            },
            function() {
              if( jQuery("#tfuse-top-sliding-panel-container #tfuse-top-sliding-panel-btn-slide").hasClass("ajax-close-tfuse-top-slide") ) {
                jQuery('body').one('click',function() {
                  jQuery(this).unbind('click');
                  jQuery("#tfuse-top-sliding-panel-container").animate({top:"-96px"}, speed);
                  jQuery("#tfuse-top-sliding-panel-container #tfuse-top-sliding-panel-btn-slide").removeClass("ajax-close-tfuse-top-slide").addClass("ajax-open-tfuse-top-slide");
                });
              }
            }
        );

        // slide up/down themes/styles list
        jQuery(".tfuse-top-sliding-panel-dropdown dt a").click(function() {
          var dropID = $(this).closest("dl").attr("id");
          jQuery("#"+dropID+" dd ul").slideToggle(200);
          jQuery("#"+dropID).mouseleave(function() {
            jQuery("#"+dropID+" dd ul").slideUp(200);
          });
        });

        // show thumbinals
        jQuery(".tfuse-top-sliding-panel-tooltips").hover(
            function() { jQuery(this).contents(".tfuse-top-sliding-panel-tip").css({ display: "block" }); },
            function() { jQuery(this).contents(".tfuse-top-sliding-panel-tip").css({ display: "none" }); }
        );

        jQuery(".tfuse-top-sliding-panel-tooltips").mousemove(function(c) {
          var offset = jQuery(".tfuse-top-sliding-panel-tooltips").offset();
          var mouseX = c.pageX - offset.left + 20;
          var mouseY = c.pageY - offset.top + 20;
          jQuery(this).contents(".tfuse-top-sliding-panel-tip").css({ top: mouseY, left: mouseX });
        });

        //get selected theme and color
        var url = location.pathname;
        url = url.replace('/demo/html/','');
        url = url.split("/");

        var tfusetoppanelshowtheme = url[0];

        // set default value
        if(tfusetoppanelshowtheme !== '') {
          var fisrt_element = jQuery("#tfuse-top-sliding-panel-themelist ul li a[rel='"+tfusetoppanelshowtheme+"']");
        }
        if(!fisrt_element) var fisrt_element = jQuery("#tfuse-top-sliding-panel-themelist ul li:first-child a");
        var default_value = fisrt_element.html();
        jQuery("#tfuse-top-sliding-panel-themelist dt a span").html(default_value);

        var selected_theme = fisrt_element.attr("rel");
        if(jQuery("#tfuse-top-sliding-panel-stylelist #"+selected_theme).length) {
          jQuery("#tfuse-top-sliding-panel-stylelist #"+selected_theme).show();
          //var selectedcolor = url[1]+"/"+url[2];
          var default_value2 = jQuery("#tfuse-top-sliding-panel-stylelist #"+selected_theme+" ul li a[href*='/demo/html/"+selected_theme+"/"+url[1]+"/"+url[2]+"']").html();
          if(!default_value2) var default_value2 = jQuery("#tfuse-top-sliding-panel-stylelist #"+selected_theme+" ul li a[href*='/demo/html/"+selected_theme+"/"+url[1]+"']").html();
          if(!default_value2) var default_value2 = jQuery("#tfuse-top-sliding-panel-stylelist #"+selected_theme+" ul li:first-child a").html();
          jQuery("#tfuse-top-sliding-panel-stylelist dt a span").html(default_value2);
        } else {
          jQuery(".tfuse-top-sliding-panel-select-style").hide();
        }


        //set forum link
        switch(selected_theme)
        {
          case 'ArtGallery': buylink= "art-gallery-html";
          break;
          case 'BonApetit': buylink = "bon-apetit-html";
          break;
          case 'CreativeJuice': buylink = "creative-juice-html";
          break;
          case 'Exquisite': buylink= "exquisite-html";
          break;
          case 'SiliconApp': buylink= "siliconapp-html";
          break;
          case 'C3': buylink= "clean-classy-corporate-html";
          break;
          case 'WebStudio': buylink= "web-studio-html";
          break;
          case 'Envision': buylink= "envision-html";
          break;
          case 'FreshFolio': buylink= "freshfolio-html";
          break;
                    case 'WelcomeInn': buylink= "welcomeinn-html";
          break;
        }
        jQuery(".tfuse-top-sliding-panel-link-buy").attr("href","http://themefuse.com/forum/"+buylink+"/");


        // select theme
        jQuery(".tfuse-top-sliding-panel-dropdown dd ul li a").click(function() {
          var dropID = jQuery(this).closest("dl").attr("id");
          var html = jQuery(this).html();
          //var rel = jQuery(this).attr("rel");
          //if(rel) document.cookie = "tfusetoppanelshowtheme="+rel+"; path=/"; //store in coockie selected theme name
          jQuery("#"+dropID+" dt a span").html(html);
          jQuery("#"+dropID+" dd ul").hide();
          jQuery("#"+dropID+" dd ul li a").removeClass("active");
          jQuery(this).addClass("active");
          //return false;
        });

  });

});

