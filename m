Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaF3f-00016A-6W
 for ath11k@lists.infradead.org; Thu, 28 Nov 2019 08:21:52 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 3/9] ath11k: fix memory leak in monitor mode
Date: Thu, 28 Nov 2019 08:21:48 +0000
Message-ID: <0101016eb11a1b8d-63b9e4ac-451a-474c-bc76-8193ac8044bb-000000@us-west-2.amazonses.com>
In-Reply-To: <1574929300-31782-1-git-send-email-kvalo@codeaurora.org>
References: <1574929300-31782-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Miles Hu <milehu@codeaurora.org>

remove tail check to avoid last amsdu leak.
recycle skb in ppdu id wrap around case

Signed-off-by: Miles Hu <milehu@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 8c21925a522a..85e999c7a238 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3735,8 +3735,15 @@ ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar,
 
 				if (ath11k_dp_rx_mon_comp_ppduid(msdu_ppdu_id,
 								 ppdu_id,
-								 &rx_bufs_used))
+								 &rx_bufs_used)) {
+					if (rx_bufs_used) {
+						drop_mpdu = true;
+						dev_kfree_skb_any(msdu);
+						msdu = NULL;
+						goto next_msdu;
+					}
 					return rx_bufs_used;
+				}
 				pmon->mon_last_linkdesc_paddr = paddr;
 				is_first_msdu = false;
 			}
@@ -3938,7 +3945,7 @@ static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 
 		ath11k_dp_rx_deliver_msdu(ar, napi, mon_skb);
 		mon_skb = skb_next;
-	} while (mon_skb && (mon_skb != tail_msdu));
+	} while (mon_skb);
 	rxs->flag = 0;
 
 	return 0;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
