Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iz9Or-0006DI-GI
 for ath11k@lists.infradead.org; Wed, 05 Feb 2020 01:22:42 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: fix rcu lock protect in peer assoc confirmation
Date: Wed,  5 Feb 2020 06:52:28 +0530
Message-Id: <1580865748-31286-1-git-send-email-periyasa@codeaurora.org>
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
To: ath11k@lists.infradead.org
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>, linux-wireless@vger.kernel.org

ath11k_mac_get_ar_by_vdev_id() get protected under rcu lock
and unlock. peer association confirmation event get used this API
without rcu protection, so corrected it.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index a9b301c..9cbe038d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5345,15 +5345,18 @@ static void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, struct sk_buff
 		   "peer assoc conf ev vdev id %d macaddr %pM\n",
 		   peer_assoc_conf.vdev_id, peer_assoc_conf.macaddr);
 
+	rcu_read_lock();
 	ar = ath11k_mac_get_ar_by_vdev_id(ab, peer_assoc_conf.vdev_id);
 
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in peer assoc conf ev %d",
 			    peer_assoc_conf.vdev_id);
+		rcu_read_unlock();
 		return;
 	}
 
 	complete(&ar->peer_assoc_done);
+	rcu_read_unlock();
 }
 
 static void ath11k_update_stats_event(struct ath11k_base *ab, struct sk_buff *skb)
-- 
1.9.1

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
