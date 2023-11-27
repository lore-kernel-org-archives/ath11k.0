Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228E7C07E98
	for <ath11k@archiver.kernel.org>; Mon, 27 Nov 2023 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlUdOGdsShmik1ckUYmQhx4AYfBZxGHwXviqpdO1EXk=; b=EKTNlj+kZhu8rU
	ofT6Xzz7uf+/1Ush7ilABmYGbPVsNml8GkZV10hRn8Jli2LoC4FmwNXwilA2Tc7kwNQdui2zk4ufM
	PjkD71KqNOgXsMQF3X8PYHJKJh8pGUr995w/JiyyCkUIeKzRYdNn6yzoxUQzw/uPyVaTBULnjvSgV
	43/SlIEVOP9JPxKCDII9AcqCLFLINqt8J9jfGuFqWMcIqbHMZ1gbkLxEUgKy/dhxakg/+yWiHDN0W
	U7UgR0YUiW/CPzBDgMfeTBe6EJEzi+DTZooUFwUAu17kWlxcyeWrXsLNd7arMWGrkgDvAqn2CXncK
	dLc5ZXyEA02G4IzeTqJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eLv-002xV9-23;
	Mon, 27 Nov 2023 16:20:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eLW-002xG4-34
	for ath11k@lists.infradead.org;
	Mon, 27 Nov 2023 16:20:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75CD961323
	for <ath11k@lists.infradead.org>; Mon, 27 Nov 2023 16:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79054C433C7;
	Mon, 27 Nov 2023 16:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701102030;
	bh=LNEksZLotht/ms11Nv+Tw98dnLkWdicrZoVyJ2Dx/0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l0EimS7oGDxQWJBltBhatbLHrfsbHD+KmyfHfwtkkfOyesv7086QCNLtlnnV2wULK
	 iH5QcnaKzpFmXZ5T3Dv5rHy1cUiwKT6WgOddOIghiKinRxEPko1gBb24PQ9coBnQw2
	 yt3dTn0dLEUPfa1sD8nNjdwGBuOcPl427TcQL6jJylDi9DleRDHhqurO7upKLcKLSW
	 DzBjHgxVd5VftVEM74g1LdGPo4+188waPWlsqVRmKn8OEMnq4l4OFfGZ198tEF/rZI
	 nux5FH/xlYvoiT2ojmiEcgG5VnF2QWlh0f++Bdv6pF6Y9i00qn5ORs8884HNXpumct
	 6KvzwLM71hHLg==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC v2 4/8] wifi: ath11k: remove MHI LOOPBACK channels
Date: Mon, 27 Nov 2023 18:20:18 +0200
Message-Id: <20231127162022.518834-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127162022.518834-1-kvalo@kernel.org>
References: <20231127162022.518834-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_082031_076776_35964D6C 
X-CRM114-Status: UNSURE (   9.50  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

There is no driver to match these two channels, so
remove them. This fixes warnings from MHI subsystem during suspend:

mhi mhi0_LOOPBACK: 1: Failed to reset channel, still resetting
mhi mhi0_LOOPBACK: 0: Failed to reset channel, still resetting

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 56 ---------------------------
 1 file changed, 56 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index afeabd6ecc67..579af57f7377 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -21,34 +21,6 @@
 #define RDDM_DUMP_SIZE	0x420000
 
 static struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
-	{
-		.num = 0,
-		.name = "LOOPBACK",
-		.num_elements = 32,
-		.event_ring = 0,
-		.dir = DMA_TO_DEVICE,
-		.ee_mask = 0x4,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = false,
-	},
-	{
-		.num = 1,
-		.name = "LOOPBACK",
-		.num_elements = 32,
-		.event_ring = 0,
-		.dir = DMA_FROM_DEVICE,
-		.ee_mask = 0x4,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = false,
-	},
 	{
 		.num = 20,
 		.name = "IPCR",
@@ -114,34 +86,6 @@ static struct mhi_controller_config ath11k_mhi_config_qca6390 = {
 };
 
 static struct mhi_channel_config ath11k_mhi_channels_qcn9074[] = {
-	{
-		.num = 0,
-		.name = "LOOPBACK",
-		.num_elements = 32,
-		.event_ring = 1,
-		.dir = DMA_TO_DEVICE,
-		.ee_mask = 0x14,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = false,
-	},
-	{
-		.num = 1,
-		.name = "LOOPBACK",
-		.num_elements = 32,
-		.event_ring = 1,
-		.dir = DMA_FROM_DEVICE,
-		.ee_mask = 0x14,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = false,
-	},
 	{
 		.num = 20,
 		.name = "IPCR",
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
