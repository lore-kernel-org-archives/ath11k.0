Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGgIj-0004nU-Vr
 for ath11k@lists.infradead.org; Fri, 11 Sep 2020 10:29:07 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] mac80211: do not set IEEE80211_STA_DISABLE_HE for
 NL80211_BAND_2GHZ
Date: Fri, 11 Sep 2020 10:29:02 +0000
Message-ID: <010101747cb61799-649743ce-b0b2-4a88-a6d9-940b129a7702-000000@us-west-2.amazonses.com>
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
To: ath11k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

VHT is not support for NL80211_BAND_2GHZ, but HE is support for it, so
it should not set IEEE80211_STA_DISABLE_HE for NL80211_BAND_2GHZ if it
does not support VHT.

When connec to AP with NL80211_BAND_2GHZ, it does not support VHT, then
it failed for HE and connected with HT mode. After this patch, it connected
with HE mode for NL80211_BAND_2GHZ with a HE mode 11AX AP.

Fixes: 57fa5e85d53ce51 ("mac80211: determine chandef from HE 6 GHz operation")

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/mac80211/mlme.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index b2a9d47cf86d..c85186799d05 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -4853,6 +4853,7 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 	struct ieee80211_supported_band *sband;
 	struct cfg80211_chan_def chandef;
 	bool is_6ghz = cbss->channel->band == NL80211_BAND_6GHZ;
+	bool is_5ghz = cbss->channel->band == NL80211_BAND_5GHZ;
 	struct ieee80211_bss *bss = (void *)cbss->priv;
 	int ret;
 	u32 i;
@@ -4871,7 +4872,7 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
 	}
 
-	if (!sband->vht_cap.vht_supported && !is_6ghz) {
+	if (!sband->vht_cap.vht_supported && is_5ghz) {
 		ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
 		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
 	}
-- 
2.23.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
