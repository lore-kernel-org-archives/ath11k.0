Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMG1m-0007LO-P6
 for ath11k@lists.infradead.org; Wed, 08 Apr 2020 19:06:24 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] ath11k: fix ath11k_thermal_unregister() prototype
Date: Wed,  8 Apr 2020 21:05:58 +0200
Message-Id: <20200408190606.870098-2-arnd@arndb.de>
In-Reply-To: <20200408190606.870098-1-arnd@arndb.de>
References: <20200408190606.870098-1-arnd@arndb.de>
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

The stub function has the wrong prototype, causing a warning:

drivers/net/wireless/ath/ath11k/core.c: In function 'ath11k_core_pdev_destroy':
drivers/net/wireless/ath/ath11k/core.c:416:28: error: passing argument 1 of 'ath11k_thermal_unregister' from incompatible pointer type [-Werror=incompatible-pointer-types]

Change it to take the same arguments as the normal implementation.

Fixes: 2a63bbca06b2 ("ath11k: add thermal cooling device support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath11k/thermal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/thermal.h b/drivers/net/wireless/ath/ath11k/thermal.h
index f1395a14748c..ea9a58bf6a93 100644
--- a/drivers/net/wireless/ath/ath11k/thermal.h
+++ b/drivers/net/wireless/ath/ath11k/thermal.h
@@ -36,7 +36,7 @@ static inline int ath11k_thermal_register(struct ath11k_base *sc)
 	return 0;
 }
 
-static inline void ath11k_thermal_unregister(struct ath11k *ar)
+static inline void ath11k_thermal_unregister(struct ath11k_base *ar)
 {
 }
 
-- 
2.26.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
