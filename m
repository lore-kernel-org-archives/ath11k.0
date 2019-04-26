Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJxMn-0004oV-DX
 for ath11k@lists.infradead.org; Fri, 26 Apr 2019 09:42:02 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V2 0/3] mac80211: notify the driver when it should enable TWT
Date: Fri, 26 Apr 2019 11:41:47 +0200
Message-Id: <20190426094150.18078-1-john@phrozen.org>
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

The ath11k FW has dedicated calls for setting the TWT state. Trigger these
via the BSS config changes.

In a later step we need to also add calls for manually starting TWT dialogs.

Changes in V2
* add NLA_POLICY_RANGE for NL80211_ATTR_TWT_RESPONDER

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
 net/wireless/nl80211.c                |  6 +++
 9 files changed, 210 insertions(+), 2 deletions(-)

-- 
2.11.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
