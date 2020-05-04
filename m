Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Markus Theil <markus.theil@tu-ilmenau.de>
Subject: [PATCH 2/2] ath11k: use cumulative survey statistics
Date: Mon,  4 May 2020 17:41:22 +0200
Message-Id: <20200504154122.91862-2-markus.theil@tu-ilmenau.de>
In-Reply-To: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
References: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
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
To: linux-wireless@vger.kernel.org
Cc: Markus Theil <markus.theil@tu-ilmenau.de>, ath10k@lists.infradead.org, kvalo@codeaurora.org, ath11k@lists.infradead.org

ath11k currently reports survey results for the last interval between each
invocation of NL80211_CMD_GET_SURVEY. For concurrent invocations, this
can lead to unexpectedly small results, e.g. when hostapd uses survey
data and iw survey dump is invoked in parallel. Fix this by returning
cumulative results, that don't depend on the last invocation. Other
drivers, e.g. ath9k or mt76 also use this behavior.

Signed-off-by: Markus Theil <markus.theil@tu-ilmenau.de>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index c2a972377687..322ddfda5bfd 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5610,16 +5610,16 @@ ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 
 	survey = &ar->survey[idx];
 
-	survey->noise     = bss_ch_info_ev.noise_floor;
-	survey->time      = div_u64(total, cc_freq_hz);
-	survey->time_busy = div_u64(busy, cc_freq_hz);
-	survey->time_rx   = div_u64(rx_bss, cc_freq_hz);
-	survey->time_tx   = div_u64(tx, cc_freq_hz);
-	survey->filled   |= (SURVEY_INFO_NOISE_DBM |
-			     SURVEY_INFO_TIME |
-			     SURVEY_INFO_TIME_BUSY |
-			     SURVEY_INFO_TIME_RX |
-			     SURVEY_INFO_TIME_TX);
+	survey->noise      = bss_ch_info_ev.noise_floor;
+	survey->time      += div_u64(total, cc_freq_hz);
+	survey->time_busy += div_u64(busy, cc_freq_hz);
+	survey->time_rx   += div_u64(rx_bss, cc_freq_hz);
+	survey->time_tx   += div_u64(tx, cc_freq_hz);
+	survey->filled    |= (SURVEY_INFO_NOISE_DBM |
+			      SURVEY_INFO_TIME |
+			      SURVEY_INFO_TIME_BUSY |
+			      SURVEY_INFO_TIME_RX |
+			      SURVEY_INFO_TIME_TX);
 exit:
 	spin_unlock_bh(&ar->data_lock);
 	complete(&ar->bss_survey_done);
-- 
2.26.2


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
