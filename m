Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdiHQ-0006I2-FD
 for ath11k@lists.infradead.org; Tue, 26 May 2020 22:42:44 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH v3 6/9] ath11k: set psc channel flag when sending channel list
 to firmware.
Date: Tue, 26 May 2020 15:42:14 -0700
Message-Id: <20200526224217.11119-7-pradeepc@codeaurora.org>
In-Reply-To: <20200526224217.11119-1-pradeepc@codeaurora.org>
References: <20200526224217.11119-1-pradeepc@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

If 6 ghz channel is a Preferred Scanning Channel(PSC), mark
the channel flag accordingly when updating channel list to firmware.
This will be used when making scanning decision in 6GHz channels.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
v3:
 - use helper function ieee80211_is_channel_psc() instead of
   channel flag for identifying 6GHz PSC channels.

 drivers/net/wireless/ath/ath11k/reg.c | 4 ++++
 drivers/net/wireless/ath/ath11k/wmi.h | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 453aa9c06969..cb08c73fd215 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -161,6 +161,10 @@ int ath11k_reg_update_chan_list(struct ath11k *ar)
 			else
 				ch->phy_mode = MODE_11A;
 
+			if (channel->band == NL80211_BAND_6GHZ &&
+			    ieee80211_is_channel_psc(channel))
+				ch->psc_channel = true;
+
 			ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 				   "mac channel [%d/%d] freq %d maxpower %d regpower %d antenna %d mode %d\n",
 				   i, params->nallchans,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index fd82cff7537b..76c2da2c5db7 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2520,7 +2520,8 @@ struct channel_param {
 	    allow_ht:1,
 	    allow_vht:1,
 	    allow_he:1,
-	    set_agile:1;
+	    set_agile:1,
+	    psc_channel:1;
 	u32 phy_mode;
 	u32 cfreq1;
 	u32 cfreq2;
-- 
2.17.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
