# $Id: fccfd4d99a3aa609e87259bccc8f6760ca04d947 $

/etc/profile.d/Z99-shn.sh:
    file.managed:
        - mode:     755
        - source:   salt://bashrc/shn.profile
{% if grains.get('environment') in ['govcloud'] %}
/etc/profile.d/20-inactivity_timeout.sh:
    file.managed:
        - mode:     755
        - source:   salt://bashrc/shn.inactivity_timeout


{% elif grains.get('environment') in ['usprod'] %}
/etc/profile.d/20-inactivity_timeout.sh:
    file.managed:
        - mode:     755
        - source:   salt://bashrc/shn.inactivity_timeout


{% elif grains.get('environment') in ['euprod'] %}
/etc/profile.d/20-inactivity_timeout.sh:
    file.managed:
        - mode:     755
        - source:   salt://bashrc/shn.inactivity_timeout

{% endif %}
