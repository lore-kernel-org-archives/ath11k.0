Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43882C98319
	for <ath11k@archiver.kernel.org>; Wed, 23 Sep 2026 12:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjWjpcnzWp5Ah9PLdwX7YgqYc0F0of7flRJV+jBheDw=; b=akPV2Y2NJOMcMJaLwcQYB8N7X4
	p97yMLxKHPuqEcntLpovzORdn7udV5P2U7cNHiqB4rKDRTL4D9J6FSXrl9HARNU69MbygPgDs2YYC
	CWfFbw+wrAy1/5C22xbd8zTA4H/QEwNHTxxuw36ESaLvT6AIsZAhcELCSuDRwxZkgtIHoDJGLCuiS
	0Zz5VuXjWNhRXd4VLI6xp4eAv1Wn6Qdg40kE5fIPWaYbkClfNU/4RmlHEo4wVoarfPFIsPl6w20R8
	C9yGAqLnxGPLlU5X6RTkbpoHwWb6xq+Z4bRgkvZJURrLhJUXh8qZavLq8y7xhuiRZ/o7DnDLAL5KP
	q3OsoBuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lj3-00000008BEn-3iAK;
	Wed, 23 Sep 2026 12:05:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Liz-00000008B8Z-42Bf
	for ath11k@lists.infradead.org;
	Wed, 23 Sep 2026 12:05:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEBCC44790;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1923C4AF0B;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790165121;
	bh=cL5+YFpsqpZKGpz68YOUSSKCHE8atf18HiZnV4MKXmo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vAK5zYOtijl1haOI9gXqsv8ACUPMutJwUPLC6WTnT1AZh3Y6sZE3xXDrp6OiFM7JK
	 UVObtbnF9HeL0DjifTgJ56SIYL5et9/OfuUH4g97Q1mLDfQJ2Kzxm5yvyumOCH9puM
	 oaAVBiUpFVCTibcsfJCs9Am84DrNXPNf43UtmpLXD6+bnPe05S6CkClPLU+QZXuPhB
	 YRa1xpIo76ugmj3f1v8SWVG272xJjlV3vYBBS/hxxBdNEYh4qVoCku9K6f2BZECF97
	 33lByZA+6YX4xc+SyIuf+wyT3RfRlX9Z5LNHF3qk7wEV4T6lGh9QrygnHV9gbXEHoP
	 MV3vRJo6IOqgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9AEC982FA;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 23 Sep 2026 16:05:22 +0400
Subject: [PATCH ath-next 16/16] wifi: ath11k: add QCN6122 device support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-ipq5018-qcn6122-mpd-v1-16-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790165117; l=2721;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=N0lWRlkViy66JiabYe3wnlNpM0tjJSjRzUVdOXoZ9Gs=;
 b=ToSFrdMAsPUqm34M8ORvBROXcmsCcULlAR9RBecaTVXwiXWOjpr9vkoHJZdK+tfkF0OdSXTgR
 8mBh+8gPFSZDoPSuVKzWN20Nk8CGHwe/JuaZ7Nci5MMz30OhGbHNugr
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
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
Reply-To: george.moussalem@outlook.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: George Moussalem <george.moussalem@outlook.com>

QCN6122 is a 2x2 11AX PCIe based chipset, but it is attached to the WPSS
(Wireless Processor SubSystem) Q6 processor, hence it is enumerated
by the Q6 processor. It is registered to the APSS processor as a
platform device (AHB).

Q6 firmware segments for QCN6122 are contained within the multi-PD
version of the shared firmware package for IPQ5018. Each (up to 2)
QCN6122 radio present runs in its own user PD which the ath11k driver
manages to power it up or down.

Also, device information like BAR and its size is not known to the APSS
processor as the chip is enumerated by WPSS Q6. These details are
fetched over QMI.

The QCN6122 chip supports STA, AP, and MESH modes.

Tested on: Linksys MX2000 and GLiNET B3000 wireless access points for
prolonged duration tests spanning multiple days with multiple clients
connected with firmware WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 7 +++++++
 drivers/net/wireless/ath/ath11k/pcic.c | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 26110c927577..51908e779b7c 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -46,6 +46,9 @@ static const struct of_device_id ath11k_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5018-wifi",
 	  .data = (void *)ATH11K_HW_IPQ5018_HW10,
 	},
+	{ .compatible = "qcom,qcn6122-wifi",
+	  .data = (void *)ATH11K_HW_QCN6122_HW10,
+	},
 	{ }
 };
 
@@ -1395,6 +1398,10 @@ static int ath11k_ahb_setup_msi_resources(struct ath11k_base *ab)
 	ab->pci.msi.addr_hi = upper_32_bits(msi_addr_iova);
 
 	ret = of_property_read_u32_index(ab->dev->of_node, "interrupts", 1, &int_prop);
+	if (ret == -EINVAL)
+		ret = of_property_read_u32_index(ab->dev->of_node,
+						 "interrupts-extended", 2,
+						 &int_prop);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 2259adc3bbdc..cdcf3df26438 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -138,6 +138,15 @@ static const struct ath11k_msi_config ath11k_msi_config[] = {
 		},
 		.hw_rev = ATH11K_HW_QCA6698AQ_HW21,
 	},
+	{
+		.total_vectors = 13,
+		.total_users = 2,
+		.users = (struct ath11k_msi_user[]) {
+			{ .name = "CE", .num_vectors = 5, .base_vector = 0 },
+			{ .name = "DP", .num_vectors = 8, .base_vector = 5 },
+		},
+		.hw_rev = ATH11K_HW_QCN6122_HW10,
+	},
 };
 
 int ath11k_pcic_init_msi_config(struct ath11k_base *ab)

-- 
2.53.0



