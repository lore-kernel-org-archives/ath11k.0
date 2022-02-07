Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3E8C433EF
	for <ath11k@archiver.kernel.org>; Mon,  7 Feb 2022 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dnJaGispYju6yUPDy48l3CTyd9q9FJdsydtaAdq8e/c=; b=HM7J0OVob7MtkS
	/KHG5RTPpVICiKk24yPeKNamE4gM6Y1X0zRM3L/rQ9JOlQBtuqDdUrWtOTqn7ye8nPLLqEfJhH0L/
	3H8FVm4RAixGdu4HI5ikEE+HGo50Q3xtt9gFFTuaWk9xIM0XPa+1IS35s9G8gyGyr0aD/b3u/ChX0
	guzpc3gsw/86zyt08sONZhCo/ew2NsGLxhPc5OIvXdNJf9lr1TD4QokIIYoCDhXZtzEatzK0yukXH
	ybFf2ula9UO/e9j5zqOlzIRtg/SY0xbELuM8EvLnbHJ9ybBBl0nnKRbaDekDHebtSn/FgnK4fBS0C
	H2GAhfZabsvquFMG9gSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH0MM-009ZEI-Iz; Mon, 07 Feb 2022 09:30:58 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH0MK-009ZDd-F3
 for ath11k@lists.infradead.org; Mon, 07 Feb 2022 09:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644226256; x=1675762256;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CVsIC3nRQpnetqgkbgk0WdGG0QucCEAw8y8k+WeSLHQ=;
 b=RVhA3byZt6QxWD3IjFyM3ZefY/vWlVw2chCt3r/ILU3qFRXcjL2Nm7om
 LS1KnOSJVnEqdH8TSJHafMKpim7VxVg/+pwIkKYyhlPhyBhKaGl7szQSO
 AVFGMoA7auKJUUseXjeKm2qqoTl0CVS22RmNWm0q1AA1H1oUzdLqMJ5PS 4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 07 Feb 2022 01:30:55 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:30:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 7 Feb 2022 01:30:54 -0800
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 7 Feb 2022 01:30:53 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] ath11k: Reset PCIE_GPIO_CFG_REG register when power on
Date: Mon, 7 Feb 2022 17:30:23 +0800
Message-ID: <20220207093023.10605-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_013056_579476_352878CF 
X-CRM114-Status: UNSURE (   8.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On some modules, PCIE_GPIO_CFG_REG is not initialized to right value,
this will cause WCN6855 hardware fails to be enumerated.

Fix it by force writing the correct value to this register when power
on.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 11 +++++++++++
 drivers/net/wireless/ath/ath11k/pci.h |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index d73b522a0081..06968ad488b0 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -445,6 +445,16 @@ static void ath11k_pci_force_wake(struct ath11k_base *ab)
 	mdelay(5);
 }
 
+static void ath11k_pci_gpio_reset(struct ath11k_base *ab)
+{
+	int val;
+
+	ath11k_pci_write32(ab, PCIE_GPIO_CFG_REG, PCIE_GPIO_RESET_VAL);
+	mdelay(10);
+	val = ath11k_pci_read32(ab, PCIE_GPIO_CFG_REG);
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "gpio cfg: 0x%x\n", val);
+}
+
 static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 {
 	mdelay(100);
@@ -461,6 +471,7 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 	ath11k_pci_clear_dbg_registers(ab);
 	ath11k_pci_soc_global_reset(ab);
 	ath11k_mhi_set_mhictrl_reset(ab);
+	ath11k_pci_gpio_reset(ab);
 }
 
 int ath11k_pci_get_msi_irq(struct device *dev, unsigned int vector)
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index 61d67b20a0eb..2716fc7745d6 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -52,6 +52,9 @@
 #define WLAON_QFPROM_PWR_CTRL_REG		0x01f8031c
 #define QFPROM_PWR_CTRL_VDD4BLOW_MASK		0x4
 
+#define PCIE_GPIO_CFG_REG			0x0180e000
+#define PCIE_GPIO_RESET_VAL			0xc5
+
 struct ath11k_msi_user {
 	char *name;
 	int num_vectors;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
