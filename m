Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B85C4450A
	for <ath11k@archiver.kernel.org>; Thu, 16 Jul 2026 11:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NN0q1y7jvX+daEGtJDKP6u8tjRl+GaaEclB75kV/8/Y=; b=BU2NMpLYuSsHefxVPbNrtks1tr
	8GmQ/Xfov3bdiGNOqFszZIrRvQ6Q/3KOG/IzpRkpbuLLoyrhFZqWq5XumKgXGQbePHnk4v+4ttYdc
	FZYdHfb4FkMWonAK2zj8j+VqzBEdDUgDnBFu6rs88rdA7eoFCizY1ZWIDkz72XABpkFDsUKn+C83v
	zrAgRiMx81z0NuIveC0ymLJGDaHg/4H1lY8IqlMBSJ5B6IjQjHEG4sqnAbVBN0IzvZGG2tsS5KEgT
	6LtLiHrdr2koLWewArRbIlSk5IcHBwxaNY6lIyt2F3VCViiqsHbwEW6sxFY4+uBUO7Dl47qHkFfRj
	fqEyPDYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKYM-0000000HAnY-0GNy;
	Thu, 16 Jul 2026 11:46:58 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKYG-0000000HAlO-1Ctq
	for ath11k@lists.infradead.org;
	Thu, 16 Jul 2026 11:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1784202389;
	bh=NN0q1y7jvX+daEGtJDKP6u8tjRl+GaaEclB75kV/8/Y=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=EuwK7v2w7CIBiJ5LAY4eyw014YYR6D5o3rEoXSslCSLNp46PbAwEFP/tKy2mCyw8i
	 HiUYJz8MVUoRXpA6/n0yxWWFzqmElDTLoubH8w+6THMPVXpOSjkXZ5u+6QU69UUQKM
	 RVLO4jNdRELyHZNqzAXfv+uzAN9n6cCs6mN1PGnQ=
X-QQ-mid: zesmtpsz4t1784202384t40c0c8b3
X-QQ-Originating-IP: itgsBpzxa97UjJmf2Zmt4EqhqcfVvXgl5YGkywe1LRs=
Received: from localhost.localdomain ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 16 Jul 2026 19:46:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1510934494698138757
EX-QQ-RecipientCnt: 6
From: ZhaoJinming <zhaojinming@uniontech.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZhaoJinming <zhaojinming@uniontech.com>
Subject: [PATCH v3] wifi: ath11k: fix resource leak on error in ext IRQ setup
Date: Thu, 16 Jul 2026 19:46:11 +0800
Message-Id: <20260716114611.2042584-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <3c67115f-5aea-402a-987b-c3092e0c3386@oss.qualcomm.com>
References: <3c67115f-5aea-402a-987b-c3092e0c3386@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MiFKngPgK6qHl1YMJDAYzyVfWUd5sHp1mA2fz02y1KVh/CNlfvdXSjiE
	71Q7hKDEsD08ieb+rY2O4dR8ObfE6+d1LZRdUlzpuVpw055036ZvYAs/whbTAiGsbuUGOTe
	/edEbroHpgfY4iCq4TkzjoEiTX/dRswLws0o1IHs4LYGnpwuSFQGy1LQcZf9e+XQvXGTsmX
	loRY6RBa62hAG4oSWqD53Ft7NH5c1u+7zc9KZW2d+F1vFOCypmHIJYAbGvUTxKW8zJUBd5p
	VBmq5BtupKiW9osJ3hoE9t1ndn7IPnrSN7JOBtpLso4tJwepLAqJWsq7wgIzsiUh7m9sjH3
	i+oaOTEBlIlfCKknYerAPNkjd8RfG4dRxRT4IDqY+dQeNHfztnYGfT4xipKqDuiM8T2AQap
	qN1V3T3glFEGbNkJ82rque7iRo8e6AotZXy0OqeLyT8OYErwTgYzPWITXXf1kL5SKBg3sXQ
	VQq7pX0t7pvrPKJ/TLg4VbbYOLT8UzVArW/yew0+6s0ZkY15jI1IdqXS4+XRsH1UobMUf6b
	sW+7OKK/X387jw3S+4McMo4shQOlZvR3cx4Vqpqwsp0oh3Q2vzC3LMSqYhdmYnocY4yiOuk
	BkyRbw0tLmAWMAq/duDlaxP2jQfRkgSe5DQYNdZ+Jk6UXCnhbgH7dlZEnOOGzQl/SSynJ0S
	XS8HzDYQ1bPt95MElemS+zr9unty1Sbq+l/xSrQcKybEOxVXxVrcxC37DHLBV6PfaOfFRcE
	7BK8OZbRug/qxq9ntn54VXjlA9nsErbJ4Lnru+/TqGKX5m+srR68TDTGHkyggJR04oMHO5U
	bfo029TEDDZDQ80+lQxhSI004nqfVl/tYxYwr53CRgKBUr4S5ZIrF9I2xWlfb24nsdx688r
	tt/LaA2kKTqo7PtyM46VkLiy1Fy2oK0oQexJ7v4JQdT9ciixwATQVVH4FaY3foQYM/Fqx5x
	QHIXD6pD+00xlAEndq0Fy3I30YbGheI+n4yae3JATDdthTI7d3dWej6V561IxoMsSglXbjo
	3dC+N9RS2drGQ7OlZtWGzXy+/tfZR0jTYiCNcDBw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_044652_851631_A8EBBA85 
X-CRM114-Status: GOOD (  18.28  )
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

In ath11k_ahb_config_irq(), when a CE request_irq() fails, the function
returns the error immediately without freeing the CE IRQs that were
successfully registered in previous loop iterations. The probe error
path does not call ath11k_ahb_free_irq() either, so the previously
registered CE IRQ handlers remain attached to the interrupt lines and
are never released.

In ath11k_ahb_config_ext_irq(), when an external request_irq() fails,
the error is only logged and the loop continues. The function then
returns 0 indicating success, leaving the device in a partially
configured state where some external IRQs are not registered. This
causes enable_irq()/disable_irq()/free_irq() to be called on
unregistered IRQs during runtime and remove/shutdown, triggering
WARN_ON(!desc->action), and missing interrupt handlers lead to data
loss.

Additionally, if alloc_netdev_dummy() fails for a later IRQ group, the
function returns -ENOMEM without freeing the ext IRQs and napi_ndev
that were successfully set up for earlier groups.

Fix all three issues: propagate the error up to the caller and unwind
all successfully registered IRQs and allocated resources on failure.

Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---

Changes in v3:
- Extract ath11k_ahb_free_ext_irq_grp() to handle per-group ext IRQ
  cleanup and refactor ath11k_ahb_free_ext_irq() to use it. Add a NULL
  check for napi_ndev to avoid potential NULL pointer dereference since
  free_netdev() does not guard against NULL input.
- On request_irq() failure in ath11k_ahb_config_ext_irq(), immediately
  clean up the current group via ath11k_ahb_free_ext_irq_grp() before
  jumping to the error label to unwind earlier groups.
- Move u32 num_irq declaration before the irq_grp assignment to follow
  declaration-before-statement ordering.
- Extract ath11k_ahb_free_ce_irqs() to handle partial/full CE IRQ cleanup
  and refactor ath11k_ahb_free_irq() to use it, replacing the duplicated
  err_ce_irq cleanup loop in ath11k_ahb_config_irq().

Changes in v2:
- Move `irq_grp` declaration from for-loop body to function scope to fix
  compile error in err_request_irq error path.
- Set ret = -ENOMEM before goto err_request_irq on alloc_netdev_dummy()
  failure to avoid returning uninitialized value.
- When ath11k_ahb_config_ext_irq() fails, unwind the already-registered
  CE IRQs via a shared err_ce_irq cleanup path to avoid leaking them.

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index f566d699d074..1a9408138d81 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -431,36 +431,47 @@ static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)
 	ab->qmi.service_ins_id = ab->hw_params.qmi_service_ins_id;
 }
 
-static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
+static void ath11k_ahb_free_ext_irq_grp(struct ath11k_base *ab,
+				      struct ath11k_ext_irq_grp *irq_grp)
 {
-	int i, j;
+	int j;
 
-	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
-		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
+	for (j = 0; j < irq_grp->num_irq; j++)
+		free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
 
-		for (j = 0; j < irq_grp->num_irq; j++)
-			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
+	if (!irq_grp->napi_ndev)
+		return;
 
-		netif_napi_del(&irq_grp->napi);
-		free_netdev(irq_grp->napi_ndev);
-	}
+	netif_napi_del(&irq_grp->napi);
+	free_netdev(irq_grp->napi_ndev);
 }
 
-static void ath11k_ahb_free_irq(struct ath11k_base *ab)
+static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
 {
-	int irq_idx;
 	int i;
 
-	if (ab->hw_params.hybrid_bus_type)
-		return ath11k_pcic_free_irq(ab);
+	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++)
+		ath11k_ahb_free_ext_irq_grp(ab, &ab->ext_irq_grp[i]);
+}
 
-	for (i = 0; i < ab->hw_params.ce_count; i++) {
+static void ath11k_ahb_free_ce_irqs(struct ath11k_base *ab, int max_idx)
+{
+	int irq_idx, i;
+
+	for (i = 0; i < max_idx; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
 		irq_idx = ATH11K_IRQ_CE0_OFFSET + i;
 		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
 	}
+}
+
+static void ath11k_ahb_free_irq(struct ath11k_base *ab)
+{
+	if (ab->hw_params.hybrid_bus_type)
+		return ath11k_pcic_free_irq(ab);
 
+	ath11k_ahb_free_ce_irqs(ab, ab->hw_params.ce_count);
 	ath11k_ahb_free_ext_irq(ab);
 }
 
@@ -524,20 +535,25 @@ static irqreturn_t ath11k_ahb_ext_interrupt_handler(int irq, void *arg)
 static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
 {
 	struct ath11k_hw_params *hw = &ab->hw_params;
+	struct ath11k_ext_irq_grp *irq_grp;
 	int i, j;
 	int irq;
 	int ret;
 
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
-		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 		u32 num_irq = 0;
 
+		irq_grp = &ab->ext_irq_grp[i];
+
 		irq_grp->ab = ab;
 		irq_grp->grp_id = i;
 
 		irq_grp->napi_ndev = alloc_netdev_dummy(0);
-		if (!irq_grp->napi_ndev)
-			return -ENOMEM;
+		if (!irq_grp->napi_ndev) {
+			ret = -ENOMEM;
+			irq_grp->num_irq = 0;
+			goto err_request_irq;
+		}
 
 		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
 			       ath11k_ahb_ext_grp_napi_poll);
@@ -585,9 +601,7 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
 				}
 			}
 		}
-		irq_grp->num_irq = num_irq;
-
-		for (j = 0; j < irq_grp->num_irq; j++) {
+		for (j = 0; j < num_irq; j++) {
 			int irq_idx = irq_grp->irqs[j];
 
 			irq = platform_get_irq_byname(ab->pdev,
@@ -600,11 +614,23 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
 			if (ret) {
 				ath11k_err(ab, "failed request_irq for %d\n",
 					   irq);
+				irq_grp->num_irq = j;
+				ath11k_ahb_free_ext_irq_grp(ab, irq_grp);
+				goto err_request_irq;
 			}
 		}
+
+		irq_grp->num_irq = num_irq;
 	}
 
 	return 0;
+
+err_request_irq:
+	for (i--; i >= 0; i--) {
+		irq_grp = &ab->ext_irq_grp[i];
+		ath11k_ahb_free_ext_irq_grp(ab, irq_grp);
+	}
+	return ret;
 }
 
 static int ath11k_ahb_config_irq(struct ath11k_base *ab)
@@ -629,16 +655,24 @@ static int ath11k_ahb_config_irq(struct ath11k_base *ab)
 		ret = request_irq(irq, ath11k_ahb_ce_interrupt_handler,
 				  IRQF_TRIGGER_RISING, irq_name[irq_idx],
 				  ce_pipe);
-		if (ret)
+		if (ret) {
+			ath11k_err(ab, "failed request_irq for %d\n", irq);
+			ath11k_ahb_free_ce_irqs(ab, i);
 			return ret;
+		}
 
 		ab->irq_num[irq_idx] = irq;
 	}
 
 	/* Configure external interrupts */
 	ret = ath11k_ahb_config_ext_irq(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to configure ext irq: %d\n", ret);
+		ath11k_ahb_free_ce_irqs(ab, ab->hw_params.ce_count);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int ath11k_ahb_map_service_to_pipe(struct ath11k_base *ab, u16 service_id,

