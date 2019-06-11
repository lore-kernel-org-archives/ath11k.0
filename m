Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from durin.narfation.org ([79.140.41.39])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hal6l-0002No-LG
 for ath11k@lists.infradead.org; Tue, 11 Jun 2019 18:02:58 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [RFC PATCH v2 0/3] mac80211/ath11k: HE mesh support
Date: Tue, 11 Jun 2019 20:02:44 +0200
Message-Id: <20190611180247.19524-1-sven@narfation.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, Sven Eckelmann <sven@narfation.org>

Hi,

Some features of 802.11ax without central organizing (AP) STA can also be
used in mesh mode. The main goal is to get this working for ath11k. But
there are various problems at the moment with the firmware. I hangs
from time to time during assoc (especially when using HE) or just doesn't
enable HE rates when communicating with peers. Even when the peer was
successfully detected as HE capable by the upper layers:

    root@OpenWrt:/# cat /sys/kernel/debug/ieee80211/phy2/netdev:mesh2/stations/00:03:7f:12:bb:97/he_capa
    HE supported
    MAC-CAP: 0x09 0x0d 0x08 0x0a 0x40 0x00
                    HTC-HE
                    DYNAMIC-FRAG-LEVEL-1
                    MAX-NUM-FRAG-MSDU-1
                    MIN-FRAG-SIZE-128
                    TF-MAC-PAD-DUR-24US
                    MULTI-TID-AGG-RX-QOS-1
                    LINK-ADAPTATION-NO-FEEDBACK
                    BSR
                    OMI-CONTROL
                    MAX-AMPDU-LEN-EXP-VHT-1
                    AMSDU-IN-AMPDU
                    MULTI-TID-AGG-TX-QOS-0
    PHY CAP: 0x1c 0x70 0x0c 0x80 0x0d 0x43 0x81 0x1c 0x00 0x00 0x00
                    CHANNEL-WIDTH-SET-40MHZ-80MHZ-IN-5G
                    CHANNEL-WIDTH-SET-160MHZ-IN-5G
                    CHANNEL-WIDTH-SET-80PLUS80-MHZ-IN-5G
                    IEEE80211-HE-PHY-CAP1-DEVICE-CLASS-A
                    LDPC-CODING-IN-PAYLOAD
                    HY-CAP1-HE-LTF-AND-GI-FOR-HE-PPDUS-0-8US
                    MIDAMBLE-RX-MAX-NSTS-0
                    STBC-TX-UNDER-80MHZ
                    STBC-RX-UNDER-80MHZ
                    DCM-MAX-CONST-TX-NO-DCM
                    DCM-MAX-CONST-RX-NO-DCM
                    SU-BEAMFORMER
                    SU-BEAMFORMEE
                    BEAMFORMEE-MAX-STS-UNDER-7
                    BEAMFORMEE-MAX-STS-ABOVE-4
                    NUM-SND-DIM-UNDER-80MHZ-4
                    NUM-SND-DIM-ABOVE-80MHZ-1
                    NG16-SU-FEEDBACK
                    CODEBOOK-SIZE-42-SU
                    PPE-THRESHOLD-PRESENT
                    HE-SU-MU-PPDU-4XLTF-AND-08-US-GI
                    MAX-NC-4
                    DCM-MAX-RU-242
                    NOMINAL-PACKET-PADDING-0US
    RX-MCS-80: 0xffaa
                    RX-MCS-80-0-SUPPORT-0-11
                    RX-MCS-80-1-SUPPORT-0-11
                    RX-MCS-80-2-SUPPORT-0-11
                    RX-MCS-80-3-SUPPORT-0-11
    TX-MCS-80: 0xffaa
                    TX-MCS-80-0-SUPPORT-0-11
                    TX-MCS-80-1-SUPPORT-0-11
                    TX-MCS-80-2-SUPPORT-0-11
                    TX-MCS-80-3-SUPPORT-0-11
    RX-MCS-160: 0xfffa
                    RX-MCS-160-0-SUPPORT-0-11
                    RX-MCS-160-1-SUPPORT-0-11
                    RX-MCS-160-2-NOT-SUPPORTED
                    RX-MCS-160-3-NOT-SUPPORTED
    TX-MCS-160: 0xfffa
                    TX-MCS-160-0-SUPPORT-0-11
                    TX-MCS-160-1-SUPPORT-0-11
                    TX-MCS-160-2-NOT-SUPPORTED
                    TX-MCS-160-3-NOT-SUPPORTED
    RX-MCS-80P80: 0xfffa
                    RX-MCS-80P80-0-SUPPORT-0-11
                    RX-MCS-80P80-1-SUPPORT-0-11
                    RX-MCS-80P80-2-NOT-SUPPORTED
                    RX-MCS-80P80-3-NOT-SUPPORTED
    TX-MCS-80P80: 0xfffa
                    TX-MCS-80P80-0-SUPPORT-0-11
                    TX-MCS-80P80-1-SUPPORT-0-11
                    TX-MCS-80P80-2-NOT-SUPPORTED
                    TX-MCS-80P80-3-NOT-SUPPORTED
    PPE-THRESHOLDS: 0x3b 0x1c 0xc7 0x71 0x1c 0xc7 0x71 0x1c 0xc7 0x71
    root@OpenWrt:/# iw dev mesh2 station dump
    Station 00:03:7f:12:bb:97 (on mesh2)
            inactive time:  310 ms
            rx bytes:       161064
            rx packets:     1619
            tx bytes:       55454
            tx packets:     477
            tx retries:     405
            tx failed:      0
            rx drop misc:   6
            signal:         -95 dBm
            signal avg:     -67 dBm
            tx bitrate:     1733.3 MBit/s VHT-MCS 9 80MHz short GI VHT-NSS 4
            rx bitrate:     1733.3 MBit/s VHT-MCS 9 80MHz short GI VHT-NSS 4
            rx duration:    0 us
            mesh llid:      0
            mesh plid:      0
            mesh plink:     ESTAB
            mesh local PS mode:     ACTIVE
            mesh peer PS mode:      ACTIVE
            mesh non-peer PS mode:  ACTIVE
            authorized:     yes
            authenticated:  yes
            associated:     yes
            preamble:       long
            WMM/WME:        yes
            MFP:            no
            TDLS peer:      no
            DTIM period:    2
            beacon interval:1000
            connected time: 536 seconds

But there is currently no documentation what the firmware requires (next to
the already existing things for AP/managed) to enable HE for mesh.

hwsim can be used in the meantime as basis for initial development of these
features without having access to HW.

Kind regards,
	Sven

Sven Eckelmann (3):
  mac80211_hwsim: Register support for HE meshpoint
  mac80211: implement HE support for mesh
  ath11k: register HE mesh capabilities

 drivers/net/wireless/ath/ath11k/mac.c |  56 +++++
 drivers/net/wireless/mac80211_hwsim.c | 283 +++++++++++++++++---------
 include/net/cfg80211.h                |  19 ++
 net/mac80211/ieee80211_i.h            |   2 +
 net/mac80211/mesh.c                   |  61 ++++++
 net/mac80211/mesh.h                   |   4 +
 net/mac80211/mesh_plink.c             |  11 +-
 net/mac80211/util.c                   |  52 +++++
 8 files changed, 393 insertions(+), 95 deletions(-)

-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
