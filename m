Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A195C433EF
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RJczsAPyoXyHHAdmG7uxi0LHDLGspPwRuXzTmp4WPYI=; b=y+PdrztIHFr3bg
	tcBm9f22yuiN7df4BVwmdjj7eKZheLRpAt5zj+NwhV+rQFp3+6AwqhleCJbbTVAkbjy2g/xTulVj9
	YKQVUvYsXfgHsHVJN2AbPvug0AMpSFHYHGTU6jguJPKF6+fSx97J6EX06DB3qp/mOaE+HI5OnwJAg
	Rz30Juyon/XTDMXawtZeg4y4po41GsTyEh8Uqn0BMFy/HikVWya+/GvDsthtYUXR/oALMnvwh3BlV
	/1ZnQDNph8WwlhXaMZxb4gnNs5l4GrpwcePzkAQet+5UaCZ+03BBci0rRZPrUuMKa3wlXgTfa6ia2
	VyBC3KxFcjmqXRoTUgFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naDhS-0053y8-Bc; Fri, 01 Apr 2022 09:36:10 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naDhM-0053uk-Os
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 09:36:09 +0000
Received: by mail-ed1-x531.google.com with SMTP id g20so2262239edw.6
 for <ath11k@lists.infradead.org>; Fri, 01 Apr 2022 02:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ChGEZUwxXxDaxj8jm+DIh6cj4fnGyQfICbK1J0+U1A=;
 b=A79tAmggU6JmNIp++HoBgOXDsNrdEeRfooo06Q9jn6t8L6yNWZnqfVu1PaCIjTQoBp
 DzwmeugkPVJRZB3qJkgXPzXTo3xHlzOKRIrBAugCtPH2OeMgiRwm5TjKvUeaoTdQ3/fW
 SKsd6bEkme+qYIloK5jD6YrUvRkB0Znzh6P9jikVjiVPl0IC2dXD8oYs51Kdj/HOVA3l
 WUXJYypZaYU+TL5i7lZSRGSjOjxdwARAyXfM1iOqUoNLuQFNCyHUjt8TAQAgU7z0Tn8a
 OjZ0UwHV8RpxjHpeCh8gp7G1VNzAH8cFa5PhJJuXStogSZ5v5BBzL2PVWFyXJTNECFHr
 W1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ChGEZUwxXxDaxj8jm+DIh6cj4fnGyQfICbK1J0+U1A=;
 b=u6W0JVKdWfZjm4Rb7a/H+9p33YNFKPfuXO6eTqEQj6U1fTIQF1JEOnORaBsS+9H9WO
 bCNBIsgyE/DUs78KiW7F5qzPZNvqQzPBJ66MKKWNibvZwd4XBzAACiYNMx+CzCahelf2
 CVSaaVb2gWpWx13YqctnHvrUqXhFqNkNAZZCTT8eiqsktGYzwRMsHo+688vCFkGIWToV
 6zq6VxFfb5hHVEE0ouhv1ZawqN3fqoijUYZSpGS3VL6oPnvWUXUDK2GHUfwFBhVrIk8M
 rp1652wQBG3tFtIO0glcqONCq9q04Tk801hv6X00yL4DbkgLqWgy/LKzhV4PfEeEKH3a
 pJdw==
X-Gm-Message-State: AOAM530XNwGz8WtioPvh3hJo223weEdlFsEeDgqt8pXwUfHxmo3jbIsV
 qU6uUQcAmo5Hxr6IOzW3KP8=
X-Google-Smtp-Source: ABdhPJzm8mxDWrntuztPp6BZheOhHfWdwWCsOOS/sgETBckm+VbxonZQWm4VIVX0DmXmctv3+WAfhg==
X-Received: by 2002:a05:6402:2805:b0:41b:630b:de68 with SMTP id
 h5-20020a056402280500b0041b630bde68mr12946845ede.143.1648805760217; 
 Fri, 01 Apr 2022 02:36:00 -0700 (PDT)
Received: from fedora.robimarko.hr ([88.207.4.27])
 by smtp.googlemail.com with ESMTPSA id
 v17-20020a17090651d100b006dfa26428bcsm831460ejk.108.2022.04.01.02.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 02:35:59 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: kvalo@kernel.org, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH] ath11k: select QRTR for AHB as well
Date: Fri,  1 Apr 2022 11:35:54 +0200
Message-Id: <20220401093554.360211-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_023604_860425_328553BE 
X-CRM114-Status: UNSURE (   9.37  )
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

Currently, ath11k only selects QRTR if ath11k PCI is selected, however
AHB support requires QRTR, more precisely QRTR_SMD because it is using
QMI as well which in turn uses QRTR.

Without QRTR_SMD AHB does not work, so select QRTR in ATH11K and then
select QRTR_SMD for ATH11K_AHB and QRTR_MHI for ATH11K_PCI.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/net/wireless/ath/ath11k/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index ad5cc6cac05b..b45baad184f6 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -5,6 +5,7 @@ config ATH11K
 	depends on CRYPTO_MICHAEL_MIC
 	select ATH_COMMON
 	select QCOM_QMI_HELPERS
+	select QRTR
 	help
 	  This module adds support for Qualcomm Technologies 802.11ax family of
 	  chipsets.
@@ -15,6 +16,7 @@ config ATH11K_AHB
 	tristate "Atheros ath11k AHB support"
 	depends on ATH11K
 	depends on REMOTEPROC
+	select QRTR_SMD
 	help
 	  This module adds support for AHB bus
 
@@ -22,7 +24,6 @@ config ATH11K_PCI
 	tristate "Atheros ath11k PCI support"
 	depends on ATH11K && PCI
 	select MHI_BUS
-	select QRTR
 	select QRTR_MHI
 	help
 	  This module adds support for PCIE bus
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
