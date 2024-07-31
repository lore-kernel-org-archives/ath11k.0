Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B136FC52D1D
	for <ath11k@archiver.kernel.org>; Thu,  1 Aug 2024 00:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYsMa57bXjDbZG+DXwaFafj+7RJsqWkjXEu0Sh4j/18=; b=LoaQCRs5N/eEXXoLurib7+qoQ+
	NehJ30+ZY/clpoZSphp0Hic/OCDrNTxgrQ+eUOI1m5ifXcNA/JJeWG8dqinXFAUsy4pwSkIzwMZYx
	+BeYoax9yiqOnYtxhOtfHeG9/cXWovubYp8qpOQ+7VcuFVO2ucsVfgI+qkuXNyfQNgfERoxDgFYQo
	y3+NlrUXfHEpN5lEoyUPSvLdjl2Xd7OkqnShwciA9hxcmsbv6rawVSIyFghw8bLkuG8SaOdRK9f0F
	HvJa6IMNLGKA5uApQFYXN/xVIWpDlDiT6YwGkmDDMFLkGrEZjF6rxS+vuSw3tTa//X1sEOx0P0flZ
	XJojyPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJR4-00000002ut3-220W;
	Thu, 01 Aug 2024 00:12:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJR1-00000002urT-44iS
	for ath11k@lists.infradead.org;
	Thu, 01 Aug 2024 00:12:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D721621DE;
	Thu,  1 Aug 2024 00:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C170C32786;
	Thu,  1 Aug 2024 00:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471167;
	bh=Svz7MM7FQ/i+557Tb0GazJirswKadLoLUEhQnxSQe+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NykxxJeYNzQ7XV9pcCNQ5voyhOsybEtr0JXupsvGeu1vSIgEwEZ7C2ProZnYkJ5mm
	 pSHUAjbINjeyz6AQDIMUGPTi+aCIU2Pxqqd73CIAkZtMSthFjhb7kOH+nx5OTNoUOb
	 MWox2EZm6HgUT8WpaIppVXGMSD3TTHMwepVM2AgHPLl9HHLaWEmxuQsSgC1LHpLFI8
	 FB2lGoaGmQNv+gP+lYI5yPJHlUevvakvqLIlzFKuwKbkxKih7KYF/O8WQJ+M6u05lj
	 ZHXN5PkMQt8G3265P8YVPdbLGPTUxfo/lkvWlCNgovBVlYpMlGLkh2z3fGdP581vkV
	 uy/3OIzjgy/ug==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 039/121] wifi: ath11k: initialize 'ret' in ath11k_qmi_load_file_target_mem()
Date: Wed, 31 Jul 2024 19:59:37 -0400
Message-ID: <20240801000834.3930818-39-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_171248_087842_E2712C5F 
X-CRM114-Status: GOOD (  11.20  )
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

From: Jeff Johnson <quic_jjohnson@quicinc.com>

[ Upstream commit 199f149e97dc7be80e5eed4b232529c1d1aa8055 ]

smatch flagged the following issue:

drivers/net/wireless/ath/ath11k/qmi.c:2401 ath11k_qmi_load_file_target_mem() error: uninitialized symbol 'ret'.

The reality is that 'ret' is initialized in every path through
ath11k_qmi_load_file_target_mem() except one, the case where the input
'len' is 0, and hence the "while (remaining)" loop is never entered.
But to make sure this case is also handled, add an initializer to the
declaration of 'ret'.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://msgid.link/20240504-qmi_load_file_target_mem-v1-2-069fc44c45eb@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index d4a243b64f6c3..aa160e6fe24f1 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2293,7 +2293,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 	struct qmi_txn txn;
 	const u8 *temp = data;
 	void __iomem *bdf_addr = NULL;
-	int ret;
+	int ret = 0;
 	u32 remaining = len;
 
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
-- 
2.43.0


