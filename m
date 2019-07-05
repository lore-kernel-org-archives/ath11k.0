Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjLW2-0003EZ-RC
 for ath11k@lists.infradead.org; Fri, 05 Jul 2019 10:32:32 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH 0/3] ath11k: add support for mgmt and mcast rate control
Date: Fri,  5 Jul 2019 12:31:05 +0200
Message-Id: <20190705103109.3731-1-sven@narfation.org>
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
To: ath11k@lists.infradead.org
Cc: Sven Eckelmann <sven@narfation.org>

Hi,

The management frames and multicast frames have to be sent at a basic
rate. But the ath11k firmware is always doing them on 1 Mbit/s for
2.4GHz and 6 Mbit/s for 5GHz. These might not be the basic rates which
the AP advertised. Clients which don't support these rates will
therefore not be able to receive them correctly.

Also some mesh protocols try to estimate the probability of a successful
submission of broadcast/multicast frames. In such setups, the multicast
rate is usually manually set to an higher value to better simulate the
rates which are used for unicast transmission.

mac80211 already provides a list of rates for the driver. ath11k has to
pick the lowest one (or only provided one) and send it to the firmware
rate control.


Unfortunately, the firmware WLAN.HK.2.1.0.1-00629-QCAHKSWPL_SILICONZ-1
seems to be buggy [1] and ignores the CCK preamble. So setting the CCK
rates 1M, 2M, 5.5M and 11M will then result in OFDM rates 6M, 12M, 24M,
48M.

Kind regards,
	Sven

[1] at least this is my best guess

Sven Eckelmann (3):
  ath11k: support for multicast rate control
  ath11k: support for mgmt rate control
  ath11k: apply mgmt rate for beacons

 drivers/net/wireless/ath/ath11k/mac.c | 119 ++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
