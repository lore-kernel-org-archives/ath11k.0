Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifnKZ-0007EA-NH
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 15:58:18 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH v2 4/7] iwlwifi: use new bss_color struct
Date: Fri, 13 Dec 2019 16:57:59 +0100
Message-Id: <20191213155802.25491-4-john@phrozen.org>
In-Reply-To: <20191213155802.25491-1-john@phrozen.org>
References: <20191213155802.25491-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

We will be removing the bss_color element. Lets use the new he_bss_color
struct instead.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c b/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c
index b74bd58f3f45..f0bf42f91af1 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c
@@ -2225,7 +2225,7 @@ static void iwl_mvm_cfg_he_sta(struct iwl_mvm *mvm,
 	struct iwl_he_sta_context_cmd sta_ctxt_cmd = {
 		.sta_id = sta_id,
 		.tid_limit = IWL_MAX_TID_COUNT,
-		.bss_color = vif->bss_conf.bss_color,
+		.bss_color = vif->bss_conf.he_bss_color.color,
 		.htc_trig_based_pkt_ext = vif->bss_conf.htc_trig_based_pkt_ext,
 		.frame_time_rts_th =
 			cpu_to_le16(vif->bss_conf.frame_time_rts_th),
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
