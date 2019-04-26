Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJwRf-0006ZY-Gl
 for ath11k@lists.infradead.org; Fri, 26 Apr 2019 08:43:01 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 0/3] mac80211: notify the driver when it should enable TWT
Date: Fri, 26 Apr 2019 10:42:41 +0200
Message-Id: <20190426084244.28098-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, John Crispin <john@phrozen.org>, Srini Kode <skode@qti.qualcomm.com>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath11k@lists.infradead.org

The ath11k FW has a dedicated call for setting the TWT state. trigger this
changes to the BSS config.

In a later step we need to also add calls for manually stating TWT dialogs.

John Crispin (3):
  mac80211: allow turning TWT responder support on and off via netlink
  mac80211: dynamically turn TWT requester support on and off
  ath11k: add TWT support

 drivers/net/wireless/ath/ath11k/mac.c |  7 +++
 drivers/net/wireless/ath/ath11k/wmi.c | 91 +++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 71 +++++++++++++++++++++++++++
 include/net/cfg80211.h                |  2 +
 include/net/mac80211.h                |  5 ++
 include/uapi/linux/nl80211.h          |  4 ++
 net/mac80211/cfg.c                    |  6 +++
 net/mac80211/mlme.c                   | 20 +++++++-
 net/wireless/nl80211.c                |  5 ++
 9 files changed, 209 insertions(+), 2 deletions(-)

-- 
2.11.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
