Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmI1u-0005bf-5B
 for ath11k@lists.infradead.org; Fri, 19 Jun 2020 14:30:07 +0000
MIME-Version: 1.0
Message-ID: <20200619142922.GA267142@mwanda>
Date: Fri, 19 Jun 2020 14:29:22 +0000 (UTC)
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH net-next] ath11k: fix uninitialized return in
 ath11k_spectral_process_data()
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
To: Kalle Valo <kvalo@codeaurora.org>, Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: Jakub Kicinski <kuba@kernel.org>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

There is a success path where "ret" isn't initialized where we never
have a ATH11K_SPECTRAL_TAG_SCAN_SEARCH and then ret isn't initialized.

Fixes: 9d11b7bff950 ("ath11k: add support for spectral scan")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/spectral.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 1c5d65bb411f..bfbf905f7507 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -677,7 +677,7 @@ static int ath11k_spectral_process_data(struct ath11k *ar,
 	u32 data_len, i;
 	u8 sign, tag;
 	int tlv_len, sample_sz;
-	int ret;
+	int ret = 0;
 	bool quit = false;
 
 	spin_lock_bh(&ar->spectral.lock);
-- 
2.27.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
