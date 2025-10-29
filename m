Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D35CCF9F8
	for <ath11k@archiver.kernel.org>; Wed, 29 Oct 2025 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oDSljmkC3LrUzqFtxh+O5zh6SMcoISmHP/ZFwfm8IRE=; b=DZsmI+J21BnSLUsIf2FhWlcASf
	9TI0mQrujpR+PuB7Vk4CYrIf5Aj6umq0oEI/0hJ9T4ysfSdo+xi9tP7EjxqLdMXubsoomGnIeld6l
	1s9uZApHozseHlj6W83lEViSFqYkgGo4I07r0Kw9gV7t8ILX5pG6LKNP+1gGh2NOVw4pmbQkgMZQ5
	PrGCrnMkNZ6DMnoarC6WkX8T4hfcZCFmLZg1aVgL0cxSa6+mTpdt68K8HiafeB/tJ91rnYn9juyyM
	EZs9vM0amdWAbONusTXUrgQYquVqqC/gQ4Zd1AvLWMxPWks5Z/IVMbzuY+CpJRDhcWEkMGK/eTtJ6
	O5O80URg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE78Q-00000001Zg4-2OWT;
	Wed, 29 Oct 2025 14:26:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE78M-00000001Za2-1YbA
	for ath11k@lists.infradead.org;
	Wed, 29 Oct 2025 14:26:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 705CA418E5;
	Wed, 29 Oct 2025 14:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DF5CC4CEF7;
	Wed, 29 Oct 2025 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761748000;
	bh=UnCFoCnku8yVyQzP5inxRUrpnnVudgKfryjNsjn3tsQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dbkteA2npjGfu+w5HuiJXLoMYUfTRNaf+FWjgrA1iJEcVi6iMQCmTmRCqfQovAtve
	 xySL+4wak4rrc7eWsL2NpGHulZZALqryTtzZxxljCaLPXEbmWqib+SNDV+ZGAeYbyL
	 Qt6YIDFrnsJ9OWw8E5TeaJZ8kqMaB/bZ6UITaOVFV0hzq8q8Ge23QAor+bWbrWDw1W
	 f1jA7L90bAvZzve+CKs82f5yKSjbIklHsCRWF1SoWP5gedpGIgA3T9Non+XX4+YgGU
	 P3qYTmFGTy5H7biZnUL171gKeUqwqJpRWu7AwDA0ZXCZjq1imx1upvwPMYZPRP6LLg
	 c9VRIIE3TOFwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CB7CCF9EE;
	Wed, 29 Oct 2025 14:26:40 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH 0/6] wifi: ath11k: Add support for QCN6122
Date: Wed, 29 Oct 2025 18:26:21 +0400
Message-Id: <20251029-ath11k-qcn6122-v1-0-58ed68eba333@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA0kAmkC/x3MwQpAQBCA4VfRnG2ZWVa8ihwmBpNa7EpK3t3m+
 B3+/4EoQSVCmz0Q5NKom0/APINhYT+L0TEZqKAKC2oMnwviao7BOyQy9VhZy1yW7BykaA8y6f0
 Pu/59P6+nsdZgAAAA
X-Change-ID: 20251029-ath11k-qcn6122-7d533aa44a66
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761747997; l=2267;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=UnCFoCnku8yVyQzP5inxRUrpnnVudgKfryjNsjn3tsQ=;
 b=khlFtybL94Ksk1micyaAESgIiFeSykKJI1T1PK4DjQeDaaEqLTDeRC3rjlObASVjWDqqhcfxH
 oVwjXKuaOMuCDgLpEjM6jJAquDkPOrU1UXsfcE01gVcWSb/DXn88qda
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_072642_527381_3CA8AC9F 
X-CRM114-Status: GOOD (  11.60  )
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

QCN6122 is a PCIe based solution that is attached to and enumerated
by the WPSS (Wireless Processor SubSystem) Q6 processor.

Though it is a PCIe device, since it is not attached to APSS processor
(Application Processor SubSystem), APSS will be unaware of such a decice
so it is registered to the APSS processor as a platform device(AHB).
Because of this hybrid nature, it is called as a hybrid bus device as
introduced by WCN6750.

This chip is similar to WCN6750 and follows the same codepath as for
WCN6750 to bring up the radio and communicate with the firmware.

QCN6122 is an IPQ5018 SoC specific solution and uses shared
IPQ5018/QCN6122 firmware.

This patch series is a much simplified version of below vendor patch:
Download from https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/NHSS.QSDK.12.4.5.r2/mac80211/patches/232-ath11k-qcn6122-support.patch

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
George Moussalem (6):
      dt: bindings: net: add bindings for QCN6122
      wifi: ath11k: add hw params for QCN6122
      wifi: ath11k: add hw ring mask for QCN6122
      wifi: ath11k: update hif and pci ops for QCN6122
      wifi: ath11k: add multipd support for QCN6122
      wifi: ath11k: add QCN6122 device support

 .../bindings/net/wireless/qcom,ath11k.yaml         | 57 +++++++++++++++++-
 drivers/net/wireless/ath/ath11k/ahb.c              | 68 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.c             | 68 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h             |  5 ++
 drivers/net/wireless/ath/ath11k/hif.h              |  9 +++
 drivers/net/wireless/ath/ath11k/hw.c               | 37 ++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h               |  1 +
 drivers/net/wireless/ath/ath11k/pci.c              |  1 +
 drivers/net/wireless/ath/ath11k/pcic.c             |  9 +++
 drivers/net/wireless/ath/ath11k/qmi.c              |  2 +
 drivers/net/wireless/ath/ath11k/qmi.h              |  3 +-
 11 files changed, 258 insertions(+), 2 deletions(-)
---
base-commit: 88de08348af8ce15dc563e0ebb5553eddd821c06
change-id: 20251029-ath11k-qcn6122-7d533aa44a66

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



