Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYxJt-0000MJ-2K
 for ath11k@lists.infradead.org; Wed, 13 May 2020 19:45:38 +0000
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: [PATCH v3 05/11] mac80211: fix memory overlap due to variable length
 param
Date: Wed, 13 May 2020 12:44:59 -0700
Message-Id: <1589399105-25472-5-git-send-email-rmanohar@codeaurora.org>
In-Reply-To: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
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
To: johannes@sipsolutions.net, kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Rajkumar Manoharan <rmanohar@codeaurora.org>

As of now HE operation element in bss_conf includes variable length
optional field followed by other HE variable. Though the optional
field never be used, actually it is referring to next member of the
bss_conf structure which is not correct. Fix it by declaring needed
HE operation fields within bss_conf itself.

Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c |  3 +--
 include/net/mac80211.h                |  7 +++++--
 net/mac80211/he.c                     | 13 +++++--------
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 9f8bc19cc5ae..06d063274eea 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1168,8 +1168,7 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 	       sizeof(arg->peer_he_cap_macinfo));
 	memcpy(&arg->peer_he_cap_phyinfo, he_cap->he_cap_elem.phy_cap_info,
 	       sizeof(arg->peer_he_cap_phyinfo));
-	memcpy(&arg->peer_he_ops, &vif->bss_conf.he_operation,
-	       sizeof(arg->peer_he_ops));
+	arg->peer_he_ops = vif->bss_conf.he_oper.params;
 
 	/* the top most byte is used to indicate BSS color info */
 	arg->peer_he_ops &= 0xffffff;
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 97fec4d310ac..2af956bdf80c 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -603,7 +603,7 @@ struct ieee80211_ftm_responder_params {
  *	nontransmitted BSSIDs
  * @profile_periodicity: the least number of beacon frames need to be received
  *	in order to discover all the nontransmitted BSSIDs in the set.
- * @he_operation: HE operation information of the AP we are connected to
+ * @he_oper: HE operation information of the AP we are connected to
  * @he_obss_pd: OBSS Packet Detection parameters.
  * @he_bss_color: BSS coloring settings, if BSS supports HE
  */
@@ -666,7 +666,10 @@ struct ieee80211_bss_conf {
 	u8 bssid_indicator;
 	bool ema_ap;
 	u8 profile_periodicity;
-	struct ieee80211_he_operation he_operation;
+	struct {
+		u32 params;
+		u16 nss_set;
+	} he_oper;
 	struct ieee80211_he_obss_pd he_obss_pd;
 	struct cfg80211_he_bss_color he_bss_color;
 };
diff --git a/net/mac80211/he.c b/net/mac80211/he.c
index 1087f715338b..f520552b22be 100644
--- a/net/mac80211/he.c
+++ b/net/mac80211/he.c
@@ -57,17 +57,14 @@ ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
 
 void
 ieee80211_he_op_ie_to_bss_conf(struct ieee80211_vif *vif,
-			const struct ieee80211_he_operation *he_op_ie_elem)
+			const struct ieee80211_he_operation *he_op_ie)
 {
-	struct ieee80211_he_operation *he_operation =
-					&vif->bss_conf.he_operation;
-
-	if (!he_op_ie_elem) {
-		memset(he_operation, 0, sizeof(*he_operation));
+	memset(&vif->bss_conf.he_oper, 0, sizeof(vif->bss_conf.he_oper));
+	if (!he_op_ie)
 		return;
-	}
 
-	vif->bss_conf.he_operation = *he_op_ie_elem;
+	vif->bss_conf.he_oper.params = __le32_to_cpu(he_op_ie->he_oper_params);
+	vif->bss_conf.he_oper.nss_set = __le16_to_cpu(he_op_ie->he_mcs_nss_set);
 }
 
 void
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
