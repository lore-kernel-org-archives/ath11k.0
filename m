Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMG1i-0007KA-2B
 for ath11k@lists.infradead.org; Wed, 08 Apr 2020 19:06:19 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] ath11k: fix missing return in
 ath11k_thermal_set_throttling
Date: Wed,  8 Apr 2020 21:05:57 +0200
Message-Id: <20200408190606.870098-1-arnd@arndb.de>
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

The empty stub version of this function causes a compile-time
warning:

In file included from drivers/net/wireless/ath/ath11k/core.h:23,
                 from drivers/net/wireless/ath/ath11k/dp_rx.h:8,
                 from drivers/net/wireless/ath/ath11k/ce.c:6:
drivers/net/wireless/ath/ath11k/thermal.h: In function 'ath11k_thermal_set_throttling':
drivers/net/wireless/ath/ath11k/thermal.h:45:1: error: no return statement in function returning non-void [-Werror=return-type]

Just return success here.

Fixes: a41d10348b01 ("ath11k: add thermal sensor device support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath11k/thermal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/thermal.h b/drivers/net/wireless/ath/ath11k/thermal.h
index 459b8d49c184..f1395a14748c 100644
--- a/drivers/net/wireless/ath/ath11k/thermal.h
+++ b/drivers/net/wireless/ath/ath11k/thermal.h
@@ -42,6 +42,7 @@ static inline void ath11k_thermal_unregister(struct ath11k *ar)
 
 static inline int ath11k_thermal_set_throttling(struct ath11k *ar, u32 throttle_state)
 {
+	return 0;
 }
 
 static inline void ath11k_thermal_event_temperature(struct ath11k *ar,
-- 
2.26.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
