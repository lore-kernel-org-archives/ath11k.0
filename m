Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXsDd-0002sc-Jc
 for ath11k@lists.infradead.org; Mon, 03 Jun 2019 19:02:07 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V7 1/8] mac80211: propagate HE operation info into bss_conf
Date: Mon,  3 Jun 2019 21:01:50 +0200
Message-Id: <20190603190157.25165-2-john@phrozen.org>
In-Reply-To: <20190603190157.25165-1-john@phrozen.org>
References: <20190603190157.25165-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Upon a successful assoc a station shall store the content of the HE
operation element inside bss_conf so that the driver can setup the
hardware accordingly.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 include/net/mac80211.h     |  2 ++
 net/mac80211/he.c          | 14 ++++++++++++++
 net/mac80211/ieee80211_i.h |  4 ++++
 net/mac80211/mlme.c        |  1 +
 4 files changed, 21 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 112dc18c658f..bebb3ef4efa1 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -599,6 +599,7 @@ struct ieee80211_ftm_responder_params {
  *	nontransmitted BSSIDs
  * @profile_periodicity: the least number of beacon frames need to be received
  *	in order to discover all the nontransmitted BSSIDs in the set.
+ * @he_operation: HE operation information of the AP we are connected to
  */
 struct ieee80211_bss_conf {
 	const u8 *bssid;
@@ -659,6 +660,7 @@ struct ieee80211_bss_conf {
 	u8 bssid_indicator;
 	bool ema_ap;
 	u8 profile_periodicity;
+	struct ieee80211_he_operation he_operation;
 };
 
 /**
diff --git a/net/mac80211/he.c b/net/mac80211/he.c
index 769078ed5a12..2d7a885bd531 100644
--- a/net/mac80211/he.c
+++ b/net/mac80211/he.c
@@ -53,3 +53,17 @@ ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
 
 	he_cap->has_he = true;
 }
+
+void
+ieee80211_he_op_ie_to_bss_conf(struct ieee80211_vif *vif,
+			const struct ieee80211_he_operation *he_op_ie_elem)
+{
+	struct ieee80211_he_operation *he_operation =
+					&vif->bss_conf.he_operation;
+
+	if (!he_op_ie_elem) {
+		memset(he_operation, 0, sizeof(*he_operation));
+		return;
+	}
+	memcpy(he_operation, he_op_ie_elem, sizeof(*he_operation));
+}
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index e170f986d226..159eb9506bdc 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1870,6 +1870,10 @@ ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
 				  const u8 *he_cap_ie, u8 he_cap_len,
 				  struct sta_info *sta);
 
+void
+ieee80211_he_op_ie_to_bss_conf(struct ieee80211_vif *vif,
+			const struct ieee80211_he_operation *he_op_ie_elem);
+
 /* Spectrum management */
 void ieee80211_process_measurement_req(struct ieee80211_sub_if_data *sdata,
 				       struct ieee80211_mgmt *mgmt,
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index dcd682fc832d..0684d1250d8a 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -3364,6 +3364,7 @@ static bool ieee80211_assoc_success(struct ieee80211_sub_if_data *sdata,
 		if (elems.uora_element)
 			bss_conf->uora_ocw_range = elems.uora_element[0];
 
+		ieee80211_he_op_ie_to_bss_conf(&sdata->vif, elems.he_operation);
 		/* TODO: OPEN: what happens if BSS color disable is set? */
 	}
 
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
