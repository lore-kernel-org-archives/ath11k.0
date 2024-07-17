Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCAFC3DA4B
	for <ath11k@archiver.kernel.org>; Wed, 17 Jul 2024 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dQK8yMvfNSGnf1p8xmBjaXGXDPSD2BgTqAqf2SxlXE0=; b=xTCB55XxDP9y+QbRLi1NdHMyee
	3mo132nOH0RdGyjssunfh5w5r9EwEgbasSKFeU0wiG0vXkwqIIb47D7//KExM4CMY2NLBomiWNaI6
	l/ZfKTzaZ+6vOQCRxPrrr+35EnU72dNPQ3xMoaEhXhqgRhBvjNxEYS9djIV6gag6sSq+QfWLkUJys
	0dPD0WjLv1VaMNEbQaotA4T/TS0dKodcrYu/B1ZL1aJwe33CATTZVa4p9eUBux+N3jvbCJFYls8T0
	4F9LDvNlACiEiGsbEZKGK2TCV5XhOq5sX/srHualGTAuqQUDBm3gSM9NV3rNst9+6p103rfngvSPd
	2olhXLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU5ds-0000000E2HQ-2fMr;
	Wed, 17 Jul 2024 14:28:28 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU5do-0000000E2G5-0LMq
	for ath11k@lists.infradead.org;
	Wed, 17 Jul 2024 14:28:26 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-59f9f59b88cso2292513a12.3
        for <ath11k@lists.infradead.org>; Wed, 17 Jul 2024 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721226502; x=1721831302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQK8yMvfNSGnf1p8xmBjaXGXDPSD2BgTqAqf2SxlXE0=;
        b=A+Ci+fsxDK2nTLewouy4O+0TH8Fr8CQbmo3vQokaw2NtrndRviNh9gak9vD2XPf+HC
         CiBGOdN6GSX4zukToQX9oij3t9Y5T7cji5W0fVtIbBY8kSBubQsvyu/bNKVfdFtTtj3A
         sIq8mY5wWWrUR8sXqQTfMTx1GgU9l5aZvPH2lt7/01yibFxdteD56SxreQFrndM3mf9d
         Na3V96O9Es+R38TBt1rCINXntXfJRmqNHAp37ngUu6xwuDziSTI26oC2ml1FK8pQ8do2
         3tAnyrOsfOnusAsNGOITpgvlkQorbxrfkM+GcPaHkaQ6xnzCIUoq3w9ifn7jtSQNCboR
         PeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721226502; x=1721831302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQK8yMvfNSGnf1p8xmBjaXGXDPSD2BgTqAqf2SxlXE0=;
        b=U6bZTOCRvgIek2780KnCFxs1wtjj+GS82ZMhndemPa6pYe/n6jR1pIiVWEiIsV6hSY
         Yv5//hrwHEefljxOF1ZC5G0SJfOE6hrBh08ZeNEv4EePg8cE5KBn0UNuy6TY2hk9n+PJ
         9KGNkOG/t+M2CmbySA8sb0M+FyCsmJQJ+eKM0Q/ZcxdHY/SVUIgca7SibR17NVDNgeaa
         AUgd9nq68Q0VSccDgl/HW5a89vYXEUKemLgNCozQ4k2bxIb4tinUJ9E6sDElFVwSS+WL
         g0DKBeI+91QrlrAL2lMrY9Nx1H//rkjLTdoWCw1E7xxt1SO+y9g4LIhRslFG48ouFeRJ
         QeBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxpVhbvZhH7bsnm21MnxqdKPsyUhFKeYoa51yD7PqaAi1EKRQexvwUfwZFc+Dsi/5P/P7v0L5fgkZ6EUZCcsupBoRaZSAqQvZYeA==
X-Gm-Message-State: AOJu0YzGjUMBzBa0N82rgGPjG8NIccOpfiTwGvX1RYKUgKzi+5/fLtQC
	lkAD8fYEgTAhf8N0S/2JqGcyX2BHYDPxBydQWUunYyFPmdcQniEp4nhKwTR48u4=
X-Google-Smtp-Source: AGHT+IEK/bN6IEN43Wu/w+EWQWY6ZbHG9Yf5L4yiFAlZ6pQdzhejiqRLZguK2GdSYUetyx0LtYORFA==
X-Received: by 2002:a50:aad2:0:b0:57d:3791:e8e4 with SMTP id 4fb4d7f45d1cf-5a05ce11c1emr1053460a12.32.1721226501700;
        Wed, 17 Jul 2024 07:28:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6724:3f6f:5a36:d95d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b268a276bsm7011640a12.62.2024.07.17.07.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 07:28:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2] Kconfig: reduce the amount of power sequencing noise
Date: Wed, 17 Jul 2024 16:28:03 +0200
Message-ID: <20240717142803.53248-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_072824_418324_EC7DDE4C 
X-CRM114-Status: GOOD (  13.76  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Kconfig will ask the user twice about power sequencing: once for the QCom
WCN power sequencing driver and then again for the PCI power control
driver using it.

Let's automate the selection of PCI_PWRCTL by introducing a new hidden
symbol: HAVE_PWRCTL which should be selected by all platforms that have
the need to include PCI power control code (right now: only ARCH_QCOM).

The pwrseq-based PCI pwrctl driver itself will then be selected by the
drivers binding to devices that may require external handling of the
power-up sequence (currently: ath11k and ath12k) based on the value
of HAVE_PWRCTL.

Make all PCI pwrctl Kconfig symbols hidden so that no questions are
asked during configuration.

Fixes: 4565d2652a37 ("PCI/pwrctl: Add PCI power control core code")
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/lkml/CAHk-=wjWc5dzcj2O1tEgNHY1rnQW63JwtuZi_vAZPqy6wqpoUQ@mail.gmail.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
I'm sending it as a single patch for more clarity as it most likely will
end up being picked up by Linus directly.

Changes in v2:
- introduce new HAVE_PWRCTL symbol and select it from ARCH_QCOM
- select PCI_PWRCTL from the relevant drivers

 arch/arm64/Kconfig.platforms            |  1 +
 drivers/net/wireless/ath/ath11k/Kconfig |  1 +
 drivers/net/wireless/ath/ath12k/Kconfig |  1 +
 drivers/pci/pwrctl/Kconfig              | 11 +++--------
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d1461335e78f..53d9f4bfd6fe 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -266,6 +266,7 @@ config ARCH_QCOM
 	bool "Qualcomm Platforms"
 	select GPIOLIB
 	select PINCTRL
+	select HAVE_PWRCTL
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 
diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 27f0523bf967..2e935d381b6b 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -24,6 +24,7 @@ config ATH11K_PCI
 	select MHI_BUS
 	select QRTR
 	select QRTR_MHI
+	select PCI_PWRCTL_PWRSEQ if HAVE_PWRCTL
 	help
 	  This module adds support for PCIE bus
 
diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index eceab9153e98..f64e7c322216 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -7,6 +7,7 @@ config ATH12K
 	select MHI_BUS
 	select QRTR
 	select QRTR_MHI
+	select PCI_PWRCTL_PWRSEQ if HAVE_PWRCTL
 	help
 	  Enable support for Qualcomm Technologies Wi-Fi 7 (IEEE
 	  802.11be) family of chipsets, for example WCN7850 and
diff --git a/drivers/pci/pwrctl/Kconfig b/drivers/pci/pwrctl/Kconfig
index f1b824955d4b..54589bb2403b 100644
--- a/drivers/pci/pwrctl/Kconfig
+++ b/drivers/pci/pwrctl/Kconfig
@@ -1,17 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-menu "PCI Power control drivers"
+config HAVE_PWRCTL
+	bool
 
 config PCI_PWRCTL
 	tristate
 
 config PCI_PWRCTL_PWRSEQ
-	tristate "PCI Power Control driver using the Power Sequencing subsystem"
+	tristate
 	select POWER_SEQUENCING
 	select PCI_PWRCTL
-	default m if ((ATH11K_PCI || ATH12K) && ARCH_QCOM)
-	help
-	  Enable support for the PCI power control driver for device
-	  drivers using the Power Sequencing subsystem.
-
-endmenu
-- 
2.43.0


