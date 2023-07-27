Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8AAC04FE0
	for <ath11k@archiver.kernel.org>; Thu, 27 Jul 2023 10:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Vnx1ZUUqhuxitZF42e3Cyx03ftCe2lSa1u0mH+/rkY=; b=aCIarCkEQ/66sC
	0hF3MPKlluQJPfUzMOews2cFbHfM/lZQvdokjwCyS0W6ShMQnlsR5aS9uk4rM9f2DSjRGnxUGwqO2
	9lvk14s3YaWdGkyQ97ID/TO6GfaQBzuzUIGm4wnAjIPijIb82bFkvZKQUBgHw/IpbV9rM8K5cB7bI
	lIs2VM4plD708v3wptq4oD+G6vKDW6YqQnk7NTU1MXI5Yol7TYv/yBRTut3ithB4ZLC7HXSi24yx+
	Z57TtaDMoVZKb+bugVSOv306gXCGWcxJNB4fcUInt7XzGGrYbEbCh/oeH91N6u3GEbKlwwiwOgn4t
	u9MXHLmGkNB+bLIipYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxrL-00CvR8-2y;
	Thu, 27 Jul 2023 10:04:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxrI-00CvQA-2g
	for ath11k@lists.infradead.org;
	Thu, 27 Jul 2023 10:04:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 487DC61DF6
	for <ath11k@lists.infradead.org>; Thu, 27 Jul 2023 10:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CAAC433C8;
	Thu, 27 Jul 2023 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690452275;
	bh=V9vzfxXb+UtRFxuUbKVHaWIUnGx1taxwRPcjnyO1bsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ilna5U5AbNt4wvOthrNmi0RaUVcwQ2tILEGsDEAUc0Z5yzNRqNE3C0l2/N6ED/o8H
	 O9n12rdTC9J3cnWDwq4cBPe21t1Ix6OKalUu+lwxp2ZkGzGeBBkMByyZ7xseqERUut
	 0MRjIvZm4Ov7Mimqqm+lBT/iRfRmzu9UigXdeaUJD+sarFZ428yYW74TVMz+mLXUPp
	 HNtDcUL8nhBka/MIeubTYVABVWy2RZcnOjIToZRpAJwR5j5Sqon3ePB5dMWrq7hbAv
	 Yy+ofRRsZGCQROqg+xZ9WXFd5fWVrsyuZE7+Vsq9mNHpFGy3rEiCHgIXI1sUUoOBmi
	 tI6W8nHGumcgA==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v4 2/3] wifi: ath11k: qmi: refactor ath11k_qmi_m3_load()
Date: Thu, 27 Jul 2023 13:04:29 +0300
Message-Id: <20230727100430.3603551-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727100430.3603551-1-kvalo@kernel.org>
References: <20230727100430.3603551-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_030436_972796_7D54CD1A 
X-CRM114-Status: GOOD (  18.39  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

Simple refactoring to make it easier to add firmware-2.bin support in the
following patch.

Earlier ath11k_qmi_m3_load() supported changing m3.bin contents while ath11k is
running. But that's not going to actually work, m3.bin is supposed to the be
same during the lifetime of ath11k, for example we don't support changing the
firmware capabilities on the fly. Due to this ath11k requests m3.bin firmware
file first and only then checks m3_mem->vaddr, so we are basically requesting
the firmware file even if it's not needed. Reverse the code so that m3_mem
buffer is checked first, and only if it doesn't exist, then m3.bin is requested
from user space.

Checking for m3_mem->size is redundant when m3_mem->vaddr is NULL, we would
not be able to use the buffer in that case. So remove the check for size.

Simplify the exit handling and use 'goto out'.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index d4eaf7d2ba84..9b13628fa3c7 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2506,6 +2506,10 @@ static int ath11k_qmi_m3_load(struct ath11k_base *ab)
 	char path[100];
 	int ret;
 
+	if (m3_mem->vaddr)
+		/* m3 firmware buffer is already available in the DMA buffer */
+		return 0;
+
 	fw = ath11k_core_firmware_request(ab, ATH11K_M3_FILE);
 	if (IS_ERR(fw)) {
 		ret = PTR_ERR(fw);
@@ -2515,25 +2519,25 @@ static int ath11k_qmi_m3_load(struct ath11k_base *ab)
 		return ret;
 	}
 
-	if (m3_mem->vaddr || m3_mem->size)
-		goto skip_m3_alloc;
-
 	m3_mem->vaddr = dma_alloc_coherent(ab->dev,
 					   fw->size, &m3_mem->paddr,
 					   GFP_KERNEL);
 	if (!m3_mem->vaddr) {
 		ath11k_err(ab, "failed to allocate memory for M3 with size %zu\n",
 			   fw->size);
-		release_firmware(fw);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out;
 	}
 
-skip_m3_alloc:
 	memcpy(m3_mem->vaddr, fw->data, fw->size);
 	m3_mem->size = fw->size;
+
+	ret = 0;
+
+out:
 	release_firmware(fw);
 
-	return 0;
+	return ret;
 }
 
 static void ath11k_qmi_m3_free(struct ath11k_base *ab)
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
