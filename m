Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idEgM-0006uV-CS
 for ath11k@lists.infradead.org; Fri, 06 Dec 2019 14:34:13 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 5/7] mac80211: drop now unused bss_color element
Date: Fri,  6 Dec 2019 15:33:59 +0100
Message-Id: <20191206143401.4080-5-john@phrozen.org>
In-Reply-To: <20191206143401.4080-1-john@phrozen.org>
References: <20191206143401.4080-1-john@phrozen.org>
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

With all users of bss_color converted we can drop the old element. Driver
code should now use the new he_bss_color struct.

Signed-off-by: John Crispin <john@phrozen.org>
---
 include/net/mac80211.h | 2 --
 net/mac80211/mlme.c    | 1 -
 2 files changed, 3 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 994686443553..9a67fd2cfe4b 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -496,7 +496,6 @@ struct ieee80211_ftm_responder_params {
  * This structure keeps information about a BSS (and an association
  * to that BSS) that can change during the lifetime of the BSS.
  *
- * @bss_color: 6-bit value to mark inter-BSS frame, if BSS supports HE
  * @htc_trig_based_pkt_ext: default PE in 4us units, if BSS supports HE
  * @multi_sta_back_32bit: supports BA bitmap of 32-bits in Multi-STA BACK
  * @uora_exists: is the UORA element advertised by AP
@@ -610,7 +609,6 @@ struct ieee80211_ftm_responder_params {
  */
 struct ieee80211_bss_conf {
 	const u8 *bssid;
-	u8 bss_color;
 	u8 htc_trig_based_pkt_ext;
 	bool multi_sta_back_32bit;
 	bool uora_exists;
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 319d43f4082b..bc602d460b73 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -3371,7 +3371,6 @@ static bool ieee80211_assoc_success(struct ieee80211_sub_if_data *sdata,
 	}
 
 	if (bss_conf->he_support) {
-		bss_conf->bss_color =
 		bss_conf->he_bss_color.color =
 			le32_get_bits(elems.he_operation->he_oper_params,
 				      IEEE80211_HE_OPERATION_BSS_COLOR_MASK);
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
