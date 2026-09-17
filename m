Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2ACC88E72
	for <ath11k@archiver.kernel.org>; Thu, 17 Sep 2026 12:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8h60bV6qjMQM/Dv4OUBAA0XMQmLMymDBUiGEBIfCxZA=; b=SJ22AbkuN/rFpL86JLhEhH/OK3
	xJP4x5ucSRqplIz8RwmesGMTWWeGKj7c1j4dJCQfe1Ill/UpJP3xFnlzOUXMvOIB0sMBpz/d5GwEG
	lOrRkCuRKmAR5bjnficoueLi1sr7s5/UPm9bxxv+vrXb/5qLvDIQkUu5EXbO1Io3TJc74UbTme3RU
	KsquorSxl9GpnV6rr+Q5nMYrdnU/Jx5Aufb7bkeHIrDHHQgc/t0QjqfiaIzKhwNhjVF0fzybGMalQ
	fYoKim2dMrlcaGdkN3Z6MM/aC5jyAE2LLkYoII6jXzvFDMfLtDL9TKT7bsOGMy3LejGPDliBqHE+V
	ul2CBBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Aot-0000000BFLg-3Cnv;
	Thu, 17 Sep 2026 12:02:27 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Aoq-0000000BFLN-0epQ
	for ath11k@lists.infradead.org;
	Thu, 17 Sep 2026 12:02:25 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3oz3N1qtqLxqACA--.2315S2;
	Thu, 17 Sep 2026 20:02:21 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: ath11k@lists.infradead.org
Cc: govinds@codeaurora.org,
	jjohnson@kernel.org,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath11k: Fix rproc reference leak in ath11k_ahb_probe()
Date: Thu, 17 Sep 2026 12:02:21 +0000
Message-Id: <20260917120221.2150282-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3oz3N1qtqLxqACA--.2315S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWfGrWkZFWktry3tF43KFg_yoW8Kr4rpF
	srX3WDKFZ5Ca12gws7Xr4UA3W8uF13ta129rW7Kwn3uas3tFyDt3WrXFyjqryftFW8GFya
	vFW2y348CFyvyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBIb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq62Iq12xI8VA0II8E6IAqYI8I648v4I1l
	c7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8GF
	yrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_GcCE3sUvcSsGvfC2KfnxnUUI43ZEXa7IU5gZ2DUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQNA2qrrJqB0wAAsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_050224_587672_3915AE01 
X-CRM114-Status: UNSURE (   9.63  )
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

ath11k_core_get_rproc() gets the remoteproc with rproc_get_by_phandle(),
which takes a reference on the rproc device, and stores it in
ab_ahb->tgt_rproc. That reference is never released, neither when the
probe fails after the rproc was acquired nor when the driver is removed
or shut down, so the remoteproc can never go away. Drop the reference on
both paths.

Fixes: ba929d6fe31a ("ath11k: Remove rproc references from common core layer")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 08d3a0c8f105..0f7891a286ad 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1107,6 +1107,7 @@ static int ath11k_ahb_fw_resource_deinit(struct ath11k_base *ab)
 static int ath11k_ahb_probe(struct platform_device *pdev)
 {
 	struct ath11k_base *ab;
+	struct ath11k_ahb *ab_ahb;
 	const struct ath11k_hif_ops *hif_ops;
 	const struct ath11k_pci_ops *pci_ops;
 	enum ath11k_hw_rev hw_rev;
@@ -1147,6 +1148,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	ab->pdev = pdev;
 	ab->hw_rev = hw_rev;
 	ab->fw_mode = ATH11K_FIRMWARE_MODE_NORMAL;
+	ab_ahb = ath11k_ahb_priv(ab);
 	platform_set_drvdata(pdev, ab);
 
 	ret = ath11k_pcic_register_pci_ops(ab, pci_ops);
@@ -1223,6 +1225,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	ath11k_ahb_ce_unmap(ab);
 
 err_core_free:
+	if (ab_ahb->tgt_rproc)
+		rproc_put(ab_ahb->tgt_rproc);
 	ath11k_core_free(ab);
 	platform_set_drvdata(pdev, NULL);
 
@@ -1247,6 +1251,7 @@ static void ath11k_ahb_remove_prepare(struct ath11k_base *ab)
 
 static void ath11k_ahb_free_resources(struct ath11k_base *ab)
 {
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
 	struct platform_device *pdev = ab->pdev;
 
 	ath11k_ahb_free_irq(ab);
@@ -1256,6 +1261,8 @@ static void ath11k_ahb_free_resources(struct ath11k_base *ab)
 	ath11k_ce_free_pipes(ab);
 	ath11k_ahb_ce_unmap(ab);
 
+	rproc_put(ab_ahb->tgt_rproc);
+
 	ath11k_core_free(ab);
 	platform_set_drvdata(pdev, NULL);
 }
-- 
2.34.1


