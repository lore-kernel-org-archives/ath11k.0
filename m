Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT1Dy-0003G7-IB
 for ath11k@lists.infradead.org; Mon, 27 Apr 2020 10:42:55 +0000
From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH net-next] ath11k: remove redundant dev_err call in
 ath11k_ahb_probe()
Date: Mon, 27 Apr 2020 10:44:03 +0000
Message-ID: <20200427104403.14598-1-weiyongjun1@huawei.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, ath11k@lists.infradead.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index e7e3e64c07aa..7d3d1cc6f39f 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -897,10 +897,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	}
 
 	mem = devm_ioremap_resource(&pdev->dev, mem_res);
-	if (IS_ERR(mem)) {
-		dev_err(&pdev->dev, "ioremap error\n");
+	if (IS_ERR(mem))
 		return PTR_ERR(mem);
-	}
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {




_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
