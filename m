Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5919CAC598
	for <ath11k@archiver.kernel.org>; Wed, 17 Sep 2025 19:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P6p6r29lD45A+/uq5js84nAQQ/c7J4cIgLWM44tq/Q4=; b=2tyxm7keTyY0dY8Dav2YDIFLUg
	+al0GINN146RLNenJl1nFlyGQGrF9bOJDyIeGrFdQOVV47QPIFTjx1j9B0nfTVl+qUQEfjOKqTYrO
	F7wblI1LXX0kCncO75PD7dZatkavSNaoU2hSNt1bY9HvlZYoBXsmHK6f95B2QoVpCRM2O9mPwg0Qm
	IwJ4dCDzKSuW5HflajqFZO144eHAcXr5utkLdcq3qlvmrmixPaKYh2tYn7KhwOPwSPLnzI/rXjgXN
	KWYrslDS7xD2rAazdaTL8dR0chlinTxwmoCPJguP6SegOCpt7F8zdzjYWyRLBVUmj/ZA8QqidROGA
	5muiKnjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxjs-0000000EFFP-1IdW;
	Wed, 17 Sep 2025 19:22:48 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxjo-0000000EF8w-3wSZ
	for ath11k@lists.infradead.org;
	Wed, 17 Sep 2025 19:22:46 +0000
Received: from localhost.localdomain (unknown [178.69.115.167])
	by mail.ispras.ru (Postfix) with ESMTPSA id 6C10F40762F6;
	Wed, 17 Sep 2025 19:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 6C10F40762F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1758136957;
	bh=P6p6r29lD45A+/uq5js84nAQQ/c7J4cIgLWM44tq/Q4=;
	h=From:To:Cc:Subject:Date:From;
	b=nk20iw8P8nmSk6+19NBk99b8ul2al2ffH15RS/sUpQ4YPiZANEQnSUBvSGBrPWfwU
	 xNNoiUn8w+MuublYB1h5z3S0KRfAM/8EiiSXF2k26KGulmd+Bk1SHnzaycLfSwQh7l
	 KyRmWARaiOJh9+JpS3Q7FsZ4hUgRK7s+KHl6gZqI=
From: Matvey Kovalev <matvey.kovalev@ispras.ru>
To: matvey.kovalev@ispras.ru,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath11k: fix NULL derefence in ath11k_qmi_m3_load()
Date: Wed, 17 Sep 2025 22:20:01 +0300
Message-ID: <20250917192020.1340-1-matvey.kovalev@ispras.ru>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_122245_141447_2EBDAA0F 
X-CRM114-Status: GOOD (  10.39  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

If ab->fw.m3_data points to data, then fw pointer remains null.
Further, if m3_mem is not allocated, then fw is dereferenced to be
passed to ath11k_err function.

Replace fw->size by m3_len.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 7db88b962f06 ("wifi: ath11k: add firmware-2.bin support")
Cc: stable@vger.kernel.org
Signed-off-by: Matvey Kovalev <matvey.kovalev@ispras.ru>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 378ac96b861b7..1a42b4abe7168 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2557,7 +2557,7 @@ static int ath11k_qmi_m3_load(struct ath11k_base *ab)
 					   GFP_KERNEL);
 	if (!m3_mem->vaddr) {
 		ath11k_err(ab, "failed to allocate memory for M3 with size %zu\n",
-			   fw->size);
+			   m3_len);
 		ret = -ENOMEM;
 		goto out;
 	}
-- 
2.43.0.windows.1


