Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22035C64EC4
	for <ath11k@archiver.kernel.org>; Wed,  8 Mar 2023 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0n/12v+VDaeZBeJESNqW/xZk/UXcVrmi90o6ctf2UJ8=; b=Nr7mRhM6KfC61V
	NHI3hZhXEh87tX/047OfuBT6EYbbxFYcG43hCeuRaw5Z+LEeJ8gOsGQJDqcfz44xAgp02wXaDApio
	UDzqvRiDPYEZObv0AKvcpYVl/Sbe+xKwRvutNRJejNMYbUA6pdawcjkD2yQ1w88btQBX+cgQisAYR
	oFUeNg+kwZthYrhKwjdM1olD2sIZXsMupEC5nUfSWKoASrkcawG002ml9vm1keVYkJsCToolJ6x70
	EptiVAmpYWrb9sBJoBHVjIQqylya/1mkcUEMW7K1OF7UgQwWh9dTMGf2yy5oDeHIAzkNDYMW++p/k
	sLDMNhsbaydh9BD1KrMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvfZ-005hE9-GV; Wed, 08 Mar 2023 15:25:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvfW-005hCP-JE
	for ath11k@lists.infradead.org; Wed, 08 Mar 2023 15:25:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 576E1B81D41
	for <ath11k@lists.infradead.org>; Wed,  8 Mar 2023 15:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5986CC4339B;
	Wed,  8 Mar 2023 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678289128;
	bh=yPbKVKAGApGaOsxSfqbfmPNFgWvzf0UqkFIDaNWkG9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WrYb1iI4/l6U8ChMdiGRhJnj6wxAOr6Elm7ZI6m8b9HWJ6vZdcbdjRoF1xniCXwQB
	 /M7VRvn/hkSD+a87xa45v2C4qlGd9yuNjBU52Ahsj224OSzPEuGar1e1lsV0P5AdLH
	 Eudbto2Y5Iaw9lpNUIBM2Jl5z10qel0zQzqBMOkq10oLePAQHkvvb26ZFPvcv8HSJP
	 lLZ0r5pIWFG7RHxF0BJWXsKv8AgoD9fPYC1GEu0MV7jgNPvDUuEZJtbHE6Cz6cVbBI
	 3+EJg2BIzsG12Dnzeo70wwq+Qdx9NcUiwPfta4euLShSCOirBD7ri9Q1pLOzDSc+v4
	 I14eB1a+8+JOA==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 2/3] wifi: ath11k: qmi: refactor ath11k_qmi_m3_load()
Date: Wed,  8 Mar 2023 17:25:21 +0200
Message-Id: <20230308152522.6728-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308152522.6728-1-kvalo@kernel.org>
References: <20230308152522.6728-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_072530_798192_A24FC162 
X-CRM114-Status: GOOD (  19.46  )
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
index ab923e24b0a9..5bc98180aed4 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2493,6 +2493,10 @@ static int ath11k_qmi_m3_load(struct ath11k_base *ab)
 	char path[100];
 	int ret;
 
+	if (m3_mem->vaddr)
+		/* m3 firmware buffer is already available in the DMA buffer */
+		return 0;
+
 	fw = ath11k_core_firmware_request(ab, ATH11K_M3_FILE);
 	if (IS_ERR(fw)) {
 		ret = PTR_ERR(fw);
@@ -2502,25 +2506,25 @@ static int ath11k_qmi_m3_load(struct ath11k_base *ab)
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
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
