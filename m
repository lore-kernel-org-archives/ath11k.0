Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPqys-00073j-QE
 for ath11k@lists.infradead.org; Tue, 06 Oct 2020 17:42:34 +0000
From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] ath11k: fix memory leak of 'combinations'
Date: Tue,  6 Oct 2020 18:42:25 +0100
Message-Id: <20201006174225.545919-1-colin.king@canonical.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the error return path when 'limits' fails to allocate
does not free the memory allocated for 'combinations'. Fix this
by adding a kfree before returning.

Addresses-Coverity: ("Resource leak")
Fixes: 2626c269702e ("ath11k: add interface_modes to hw_params")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3f63a7bd6b59..7f8dd47d2333 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6041,8 +6041,10 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 	n_limits = 2;
 
 	limits = kcalloc(n_limits, sizeof(*limits), GFP_KERNEL);
-	if (!limits)
+	if (!limits) {
+		kfree(combinations);
 		return -ENOMEM;
+	}
 
 	limits[0].max = 1;
 	limits[0].types |= BIT(NL80211_IFTYPE_STATION);
-- 
2.27.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
