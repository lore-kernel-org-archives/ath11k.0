Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B265C4167B
	for <ath11k@archiver.kernel.org>; Sun, 18 Dec 2022 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oee2JM+R18yysDRqqnMSu4CAlNwY/HgiUgBhdMpQu0Y=; b=RxM5r6DFI/tasx
	yaeUkGEap2q+bzdi/BRdN/vBrYJk3UZZFXe+U1Dy9oqwWii8ifwOHpTsLupnvdlA5PC9KchV0kr9U
	PWWVy0gb/pt18NGdddsjkpgeUZrsPnFxdFEPX0Rn/mdgZgzWTtTdf3SBe7E5zalhT3Nn60oJmXN3b
	3/NRTGdgnw3sSoLoZIKv5hsRu33tWfc6ZpnEe7UbwPZBj39zgHTVsB5iNGlr8Z4mVwtJcgY6E1JD4
	1Ialrit9MiuyrDoYQQTvV7MEwUenLM73kWCnElSFZbhiMJqyFSuniHzTf8q7NRapUjSBzO/sAGI6z
	g7LREchl3Dhrn5UM0raA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6wEB-002qrL-5G; Sun, 18 Dec 2022 16:09:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6wDa-002qI2-Mg
	for ath11k@lists.infradead.org; Sun, 18 Dec 2022 16:08:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 349BE60DD5;
	Sun, 18 Dec 2022 16:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8692C433F2;
	Sun, 18 Dec 2022 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671379730;
	bh=IXzeQCXm8BAgFsTlT7kee4OYsEwHI8bN5Jhh+0BXAQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tevoYLUF2nTeC3q+adZPKNofwI42kS01BT/dcA+MI0XwtfOHIPCrVDZ8qtcaUpdBR
	 +EcI/nKB2nZJT338e9X2ictdrDfspIbUHFYMooFfzZU5fQ9b6WV71200bEmjFq7t9+
	 vF5gJFMeOw1pwqqYMf6ZPtMY408moAR3T7AaolEO1W5tfp4Rg9u4s6dSvg/x7ZErHX
	 Ay/2hIcGTe3/LWGg6WM4oOyaVkJ3zUbI4KqujWK0z6i/hDhR1T1xIRtcdOFmToqpr1
	 te+gJFDJubKVZsXQpLu7+RM6I9vF6AhF2nJXKnQZVXtHlpVAY2EovIXsGQE5p1SfUB
	 /3bAeLG5sLPcQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 17/73] wifi: ath11k: Fix qmi_msg_handler data structure initialization
Date: Sun, 18 Dec 2022 11:06:45 -0500
Message-Id: <20221218160741.927862-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160741.927862-1-sashal@kernel.org>
References: <20221218160741.927862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_080850_829302_CDE1E65B 
X-CRM114-Status: GOOD (  10.29  )
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

From: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>

[ Upstream commit ed3725e15a154ebebf44e0c34806c57525483f92 ]

qmi_msg_handler is required to be null terminated by QMI module.
There might be a case where a handler for a msg id is not present in the
handlers array which can lead to infinite loop while searching the handler
and therefore out of bound access in qmi_invoke_handler().
Hence update the initialization in qmi_msg_handler data structure.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20221021090126.28626-1-quic_rbhattac@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index e6ced8597e1d..539134a6e9d9 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3083,6 +3083,9 @@ static const struct qmi_msg_handler ath11k_qmi_msg_handlers[] = {
 			sizeof(struct qmi_wlfw_fw_init_done_ind_msg_v01),
 		.fn = ath11k_qmi_msg_fw_init_done_cb,
 	},
+
+	/* end of list */
+	{},
 };
 
 static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
