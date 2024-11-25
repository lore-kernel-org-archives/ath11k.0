Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F65D3B7D0
	for <ath11k@archiver.kernel.org>; Mon, 25 Nov 2024 03:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZBFpfMAxEc3iDN83dDGcQrDlarlTxPLO/VIWYe/840=; b=Nf2tkF77WriIkV+AJenKCMILT4
	zx9kEnH93A4x1iCDeSEAMtF/6P7AyGml6cS/0+jHEuW+CaIZQvlSW3Gq+bxmrL5hmruHsN1gkBsmn
	nFmEDm0k1OBhKmfiFBCFUB+MkME4GOfdd4lj7eSsG8XM3cJ+lQSYKO0u5ZKPiFn7ZquwkQeZotTvm
	AfAbNMrqDltswd+gsIOcKXCD0lqxPQJl0/8JwF7Zdi/YnXaXSh5V0i9UKVbDNzad5Dk8JCwzwBMbg
	gpIVpU3nM+YTcxvv2wfiO3aCJV40OU9TN+Tf6BoIw9AhjAxh/MF5O97jHCvBZKIZHmFLfwSEhnCcl
	hwvFiQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8g-00000006z82-3IHl;
	Mon, 25 Nov 2024 03:51:54 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8e-00000006z6L-1HxQ;
	Mon, 25 Nov 2024 03:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732506708; bh=3yCjE5tdSxEAWWiNtIYYOrdwsDaWqbpFW99BaTLk7HE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f4lEPPq6yN01kQf4+fKAw0YTENFTPo/MlDnzIcFrF0d4czSDRBLx96AgcpwMaMMGc
	 gMSQcKXSNZ3Eed7ETl5vXX+GcQZMcRS/wO2L/JONzHyrqwQVUBB9HpzAfmwY6VT6Qh
	 zhACAhvk/LrEBF6BN/quVmICVol2t4OytK1VT/hk=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id DD3981487FB2;
	Mon, 25 Nov 2024 04:51:47 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFC] [PATCH v2 02/13] net: qrtr: mhi: register mhi_controller as endpoint-specific data
Date: Mon, 25 Nov 2024 04:50:17 +0100
Message-ID: <90e0394bfd97d28853d17e9c62b6e372b236b760.1732506261.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1732506261.git.ionic@ionic.de>
References: <cover.1732506261.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_195152_804907_F29A891A 
X-CRM114-Status: UNSURE (   6.74  )
X-CRM114-Notice: Please train this message.
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

For the MHI backend, we will use the mhi_controller pointer as the
endpoint-specific data.

This means that we can only have one endpoint ID per MHI controller, but
since the MHI controller is the bus master in charge of the physical
link, this is probably okay.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 net/qrtr/mhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 9a23c888e234..fc6869c3a7ec 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -95,6 +95,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	qdev->mhi_dev = mhi_dev;
 	qdev->dev = &mhi_dev->dev;
 	qdev->ep.xmit = qcom_mhi_qrtr_send;
+	qdev->ep.endpoint_data = mhi_dev->mhi_cntrl;
 
 	dev_set_drvdata(&mhi_dev->dev, qdev);
 	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
-- 
2.45.2


