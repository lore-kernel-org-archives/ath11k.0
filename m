Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929F6CCF9EB
	for <ath11k@archiver.kernel.org>; Wed, 29 Oct 2025 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogSj3BDALyo6prrT9KaTIothDniaGBw/nuNFZjpZDnY=; b=NKPhhIU1L1SFi/yWKsPrrVAdRV
	YH+2XRUfeeG4ep3P6j6Cp2X+RgwWRPQAUhby/2La0y1Tz/mS3yJoNGqCa7qatw3VCHrwqJjQu7VDh
	ehRb1uakIUTMcBm54px2BEFDvk103tRgDN1kjccl4/pTNE4n+aMYapoYzmVU0g/fZ8DHJeLPyS20r
	ntMIowywUvof8LQgeBI3w04I0g3yP3AxvdauznOUG1q5ePHFtW6iuwtewAqRCCwxOUZOhKCvEHXfu
	t1owIwwfjf34/sBIHdNYGx5Zu4TtefI1E76yLRfJL1kCWCJw1vfrfO+uqOblwgI4PDx5XtoD3KWiN
	NEjoecHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE78Q-00000001Zgb-3bWD;
	Wed, 29 Oct 2025 14:26:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE78N-00000001Zbt-0yBn
	for ath11k@lists.infradead.org;
	Wed, 29 Oct 2025 14:26:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C530B49CA7;
	Wed, 29 Oct 2025 14:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5F2BC116C6;
	Wed, 29 Oct 2025 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761748000;
	bh=VZqF9VrAmlHotZC3esggL8Hr1cnKxgb531ArBlobfaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p4kvwU8PXGIa7diweVJjDvIyEOAl2NEL2Yg6t1WtZBlb975WYqMYBMUOFLw1ps+HP
	 jYZqyxfUSTeYEbUf/14hLDl+ceNvugPIDDeXSohWTJ33JMSPvxZOxScW1IEWJkoJh9
	 y/JcjTBDdWPyxZmUWsCn4xSo2gJXGamyucg+OgxSKwScN4uG8C2Lm7+sm4VvexwMsI
	 uM3DTTohKBVzTSuBjMqS5aa7PQEMhvjuDtT8ixSYS3J6mn+gkfwhBHC9vOxAQBViDX
	 nvi8SXfyDoJD+c+y37S3cqMyEHynugZ9ZK04ImiOJH6PAplRVmNvxqrSWYAuB7rps7
	 gMD4uZxfry7UQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADC4CCF9F6;
	Wed, 29 Oct 2025 14:26:40 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 29 Oct 2025 18:26:27 +0400
Subject: [PATCH 6/6] wifi: ath11k: add QCN6122 device support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-ath11k-qcn6122-v1-6-58ed68eba333@outlook.com>
References: <20251029-ath11k-qcn6122-v1-0-58ed68eba333@outlook.com>
In-Reply-To: <20251029-ath11k-qcn6122-v1-0-58ed68eba333@outlook.com>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761747997; l=1944;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=MO7KsMfpzKHk3Kbh2D8damE6MIZVTsMgz25SICdrEDs=;
 b=K3qK5c3f0lBX0CW0vl5IFl9pODMBfTzS0f2OsZsmCjYeksCdtIJiyhhes4SZWzKIzw18NU6EC
 egExsLPJIhlDMg0OgQbszxEu05a3cT04hTUgeQbovPISaaGNStZjFGi
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_072643_364219_D81F4E10 
X-CRM114-Status: GOOD (  10.11  )
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

Add support for QCN6122 wifi.
STA, AP, and MESH modes are supported.

Tested on: Linksys MX2000, Linksys MX6200, and GLiNET B3000 access
points for prolonged duration tests spanning multiple days with multiple
clients connected with firmware:
WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Although QCN6122 is a PCIe device, it is an IPQ5018 SoC specific
solution and uses shared IPQ5018/QCN6122 firmware.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 3 +++
 drivers/net/wireless/ath/ath11k/pcic.c | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 820a383e88caf125892176e421b0121fed7e7055..6747fcdbf9a777d4214b9ef751dac2774a80c0ff 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -37,6 +37,9 @@ static const struct of_device_id ath11k_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5018-wifi",
 	  .data = (void *)ATH11K_HW_IPQ5018_HW10,
 	},
+	{ .compatible = "qcom,qcn6122-wifi",
+	  .data = (void *)ATH11K_HW_QCN6122_HW10,
+	},
 	{ }
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index fc6e7da05c6028e30facf10d38a55f614067e44b..ac1e156ab3e0f0c47de1eb1ac5afea21addfd739 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -139,6 +139,15 @@ static const struct ath11k_msi_config ath11k_msi_config[] = {
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
2.51.1



