Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJiwP-0008PL-Nz
 for ath11k@lists.infradead.org; Thu, 25 Apr 2019 18:17:51 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V2 0/4] ath11k: add HE support
Date: Thu, 25 Apr 2019 20:17:36 +0200
Message-Id: <20190425181740.1994-1-john@phrozen.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org
Cc: Srini Kode <skode@qti.qualcomm.com>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, John Crispin <john@phrozen.org>

This series adds initial support for HE mode to the ath11k driver.

Things that still need to implemented
* ppe_threshold support
* propagate the he_oper field from userland to wmi_peer_add
* 80p80 support - mac80211 cosniders 160/80p80 to be the same
* he_mcs bitrate_mask support once implemented inside mac80211

Changes in V2:
* generate sband_iftype data from FW provided capabilities
* properly handle rx_status for HE frames
* fix regression in basic VHF phymode
* various minor cleanups

John Crispin (4):
  ath11k: add HE handling to the debug code
  ath11k: extend reading of FW capabilities
  ath11k: handle rx status for HE frames
  ath11k: add HE support

 drivers/net/wireless/ath/ath11k/core.h        |   6 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |  24 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c       |  14 +-
 drivers/net/wireless/ath/ath11k/mac.c         | 348 ++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/wmi.c         |   7 +-
 drivers/net/wireless/ath/ath11k/wmi.h         |   5 +-
 6 files changed, 341 insertions(+), 63 deletions(-)

-- 
2.11.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
