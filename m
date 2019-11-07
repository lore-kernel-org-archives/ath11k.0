Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSkCi-0005HS-Ve
 for ath11k@lists.infradead.org; Thu, 07 Nov 2019 16:00:14 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D0C90602F0
 for <ath11k@lists.infradead.org>; Thu,  7 Nov 2019 16:00:11 +0000 (UTC)
Subject: [PATCH 1/4] ath11k: fix ATH11K_TRACING kconfig help text
From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 07 Nov 2019 18:00:09 +0200
Message-ID: <157314240904.18668.4904613381977271570.stgit@potku.adurom.net>
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
To: ath11k@lists.infradead.org

The grammar was not right.

Link: https://lkml.kernel.org/r/6ffc215251b54d562496d978bdbbcead@codeaurora.org
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 1a73a1bf08f0..cfab4fb86aef 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -32,4 +32,4 @@ config ATH11K_TRACING
 	bool "ath11k tracing support"
 	depends on ATH11K && EVENT_TRACING
 	---help---
-	  Select this to ath11k use tracing infrastructure.
+	  Select this to use ath11k tracing infrastructure.


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
