Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B72D3B7D4
	for <ath11k@archiver.kernel.org>; Mon, 25 Nov 2024 03:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8jowrm2f6+rXzGx+aJ/CLtSzURp+TZshn6vz3PBbn0=; b=mQHv79UsqqqxgshdELRKfAEf9t
	ivv5zwzTIN8KtpKGjOUMJGsCZ7WJpkWoj8qswbLLaCuXbXRZXzupGpDyg6gRWwNRf5kWmJfrZ38sI
	Q33mVOGxL0S7QcmCYlH7mld3SI5c9n4MWnDTMfX5M8Qwde4to9SrRRKrkjaI9pJpKsJRhZROFtPKh
	VznoFF8AI5orKMW6jxz844Qy2dUDm7QuH1yMl9Y4oJSTiK/0LOrTao5dxSbAAn8ZH2qeEhmvxhjGa
	ntonCuj2SHTU68bRFZnl1062oVcL5lkl46g2bF1IgY8UIHgEpSSMpjKTIVImVOCoUbJDyK83SJVbs
	NA2hhP4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8p-00000006zIa-0UmD;
	Mon, 25 Nov 2024 03:52:03 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8h-00000006z83-3CGP;
	Mon, 25 Nov 2024 03:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732506709; bh=HdvvnX3oBwORMiG9uXHBr/WQrekrk+ivf29v/3cUx50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aIAVrJjGD8zUzNnhL67os6yVqTq+SDbezurYDgZOJ4/jl0mszLwnop60k83ZVOyM1
	 QFCKKkEaXMGVmYz/GIJBsY6ehvFjDjBJdVokc7BqQPrGWEvVzi8KPy7McOPpv1d3vI
	 RnsLC/UK959s2w9nNIi6GltV8Lpoj6tPFuLAhqEA=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 7798F148870D;
	Mon, 25 Nov 2024 04:51:49 +0100 (CET)
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
Subject: [RFC] [PATCH v2 08/13] wifi: ath11k: stub QRTR endpoint ID fetching for AHB
Date: Mon, 25 Nov 2024 04:50:23 +0100
Message-ID: <1213282db93cb9aa126440bf46212f47dd015e69.1732506261.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1732506261.git.ionic@ionic.de>
References: <cover.1732506261.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_195155_957535_598C032D 
X-CRM114-Status: UNSURE (   8.87  )
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

QRTR endpoint ID fetching will currently not be available for AHB.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index f2fc04596d48..acb12d6d647f 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -773,6 +773,7 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_ops_ipq8074 = {
 	.map_service_to_pipe = ath11k_ahb_map_service_to_pipe,
 	.power_down = ath11k_ahb_power_down,
 	.power_up = ath11k_ahb_power_up,
+	.set_qrtr_endpoint_id = ath11k_ahb_set_qrtr_endpoint_id,
 };
 
 static const struct ath11k_hif_ops ath11k_ahb_hif_ops_wcn6750 = {
@@ -792,6 +793,7 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_ops_wcn6750 = {
 	.resume = ath11k_ahb_hif_resume,
 	.ce_irq_enable = ath11k_pci_enable_ce_irqs_except_wake_irq,
 	.ce_irq_disable = ath11k_pci_disable_ce_irqs_except_wake_irq,
+	.set_qrtr_endpoint_id = ath11k_ahb_set_qrtr_endpoint_id,
 };
 
 static int ath11k_core_get_rproc(struct ath11k_base *ab)
@@ -1312,6 +1314,11 @@ static void ath11k_ahb_shutdown(struct platform_device *pdev)
 	ath11k_ahb_free_resources(ab);
 }
 
+static ath11k_ahb_set_qrtr_endpoint_id(struct ath11k_base *ab)
+{
+	return -EOPNOTSUPP;
+}
+
 static struct platform_driver ath11k_ahb_driver = {
 	.driver = {
 		.name = "ath11k",
-- 
2.45.2


