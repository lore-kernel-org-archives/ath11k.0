Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxY6C-0001Q2-GX
 for ath11k@lists.infradead.org; Tue, 13 Aug 2019 14:48:33 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 569E5609EF
 for <ath11k@lists.infradead.org>; Tue, 13 Aug 2019 14:48:30 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath11k: move device tree bindings document to Documentation
Date: Tue, 13 Aug 2019 17:48:27 +0300
Message-Id: <1565707707-1080-1-git-send-email-kvalo@codeaurora.org>
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

This is the final place for the doc, move it there to make it easier to create
patches for public review.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 .../devicetree/bindings/net/wireless}/qcom,ath11k.txt                     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {drivers/net/wireless/ath/ath11k => Documentation/devicetree/bindings/net/wireless}/qcom,ath11k.txt (100%)

diff --git a/drivers/net/wireless/ath/ath11k/qcom,ath11k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.txt
similarity index 100%
rename from drivers/net/wireless/ath/ath11k/qcom,ath11k.txt
rename to Documentation/devicetree/bindings/net/wireless/qcom,ath11k.txt
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
