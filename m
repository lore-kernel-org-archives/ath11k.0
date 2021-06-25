Return-Path: <SRS0=ORoY=LT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A19EC2B9F4
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:34:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F22E61883
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F22E61883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HQYEB+nYz9woVOCK1EIKI/gc3Nz/Xbix3h8dOkrFmCc=; b=rK+603fjTy721C
	2tAF6S1UHiTQ8A+I+tFTIWqCVbtEIxTwZij5vYQNZcqbaJyy85v43PKE8Lzao52DpumnaPXW/dRRs
	hbz2ks5M+WyMTyAeAGjxH56eel2ERZijHy0dTecJ9l4ciA33o6Ji/DGRwY664Sr6sfdpnPDy9BZRs
	Vv2mV4a4VXxQktAZrnMksbhMMcrrzSR0RZrae9p+gFqsBx4l1LxuT3DxM/mb0Q3EEOiX+R7tX4cKE
	C1Oo7oB3cHJwh0KXR9WwTA6RbcT1x00R40UmcYB81YV7FmTsdLc9sw48VHDM37eejKw6c4w9d9A+F
	StffEBch1Vc62pau1BRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwl2H-001T1d-Hh; Fri, 25 Jun 2021 12:34:17 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwl2C-001T05-Lq
 for ath11k@lists.infradead.org; Fri, 25 Jun 2021 12:34:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id c15so4631322pls.13
 for <ath11k@lists.infradead.org>; Fri, 25 Jun 2021 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yqbRAsIckLoW6b0dakH7bBbGKt7Cg1eluPqhcnN57gw=;
 b=dhVlsc/ljuoucKFQObIMvGi4N9BRypj7rd1h270vPPAsjKdaiEyd8CKk8YfONdCo5/
 ta1VsI7c3apQblocoZVo65P+H/IOi4qSYUOepqsvSsqS0MTdr46ICANapmtnLtfmJcLA
 yDriRu6c6tkrcLIfjj+qiWprpTC5fTnR/kB3yxpFBT29pwtyZ9eQZuZRVHfgz/4veg2K
 mX4oXr9ASyfS0CgztLWeT3QCm8Jkp684KHQxoCEIjDOavyE0dxa+DMxa8RjdB8qt575+
 JGPUI71OEyzz9igMk6xNL1iS73ynRAb8NPsYM3X1+5I68zDFoBT+r25+8JJqs8U8EYZg
 u3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yqbRAsIckLoW6b0dakH7bBbGKt7Cg1eluPqhcnN57gw=;
 b=XMUEjBXmFx10CVkU/u+YT5CN6csHDSC7L8rbn2nnAficMd90DpwqfZClJAhCfUQAgG
 MGCtb30j9+ADCxPNUBm9+CaPnCPxi/e7ZbXNuTKHsCYmfCTcy5wk/q4Tnv7h8RmffBmZ
 3Miq5vLqh5Dzel6FeEavI6akaftpf6sQFUtXAjgiRC1vObOCNHIplQZ1XFCiamN/9q7Y
 Skdan6ajo5pAhdXeIc6uLoTcgjLX4hMFJx7wjJVEYkCPWh3U83vBP1JSwLsAQrt6KDqP
 NBZb1X/K+l7IZuRHzlqz+08SALlHrkgJnS/JyzEwLUaH9c2iu50l+VeCXTnw+uOmZFat
 QeXg==
X-Gm-Message-State: AOAM532JAp1V5YWSHsNdalzRU/tvzhQX60RjHhD9JNSVrAXdHicHvtfV
 7ZQDNN483oBTTW9EC5axX2/wPecdirVR
X-Google-Smtp-Source: ABdhPJw+l8JSNeta/sJi33j+3wIJXKfqmlNJoPARSzZG5wE2/iYdIu5ndavbgjRwIEDjBM/T85YTLw==
X-Received: by 2002:a17:90a:16cf:: with SMTP id
 y15mr3106911pje.219.1624624450861; 
 Fri, 25 Jun 2021 05:34:10 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
 by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 05:34:09 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/10] MHI patches for v5.14 - Take 2
Date: Fri, 25 Jun 2021 18:03:45 +0530
Message-Id: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_053412_786425_D257DB24 
X-CRM114-Status: GOOD (  13.92  )
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

Hi Greg,

Please find the remaining MHI patches for v5.14. This series has the left over
patches from the previous patchset and one new series that was reviewed a
while ago and put on hold for Ack from Kalle Valo for ath11k.

Summary:

1. Added validation for the channel ID read from event ring. If we get events
from an invalid channel, we throw an error message and skip the event.

2. Fixed the MHI wake routines used for the newer modems such as SDX55 and
SDX65 by using no-op routines only for the older modems and then relying on
the default routines provided by MHI stack for newer ones.

3. Added support for processing the events based on the priorities. Earlier
a fixed priority was used for all events.

4. Added a dedicated flag to the MHI client transfer APIs for inbound
buffer allocation by the MHI stack. Since this patch modifies the MHI
client drivers under "net/", Ack has been collected from the netdev
maintainer.

5. Added support for Cinterion MV31-W modem in pci_generic controller:
https://www.thalesgroup.com/en/markets/digital-identity-and-security/iot/iot-connectivity/products/iot-products/mv31-w-ultra-high

6. Rearranged the setting of BHI/BHIe offsets for better validation of the
register values read from MMIO

7. Cleanup of the BHI/BHIe pointers by setting them to NULL to prevent access
after power down.

8. Added support for getting the MMIO register length from the controller
drivers. This helps in validation of the read offsets from MMIO registers.
Since this patch touches ath11k, Ack has been collected from Kalle Valo.

9. With the help of above register length, added check for BHI/BHIe offsets.

Thanks,
Mani

Bhaumik Bhatt (8):
  bus: mhi: pci_generic: Apply no-op for wake using sideband wake
    boolean
  bus: mhi: core: Validate channel ID when processing command
    completions
  bus: mhi: core: Set BHI/BHIe offsets on power up preparation
  bus: mhi: core: Set BHI and BHIe pointers to NULL in clean-up
  bus: mhi: Add MMIO region length to controller structure
  ath11k: set register access length for MHI driver
  bus: mhi: pci_generic: Set register access length for MHI driver
  bus: mhi: core: Add range checks for BHI and BHIe

Loic Poulain (1):
  bus: mhi: Add inbound buffers allocation flag

ULRICH Thomas (1):
  bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI

 drivers/bus/mhi/core/init.c           | 61 +++++++++++++++++--------
 drivers/bus/mhi/core/internal.h       |  2 +-
 drivers/bus/mhi/core/main.c           | 26 +++++++----
 drivers/bus/mhi/core/pm.c             | 28 ++----------
 drivers/bus/mhi/pci_generic.c         | 65 +++++++++++++++++++++++----
 drivers/net/mhi/net.c                 |  2 +-
 drivers/net/wireless/ath/ath11k/mhi.c |  1 +
 drivers/net/wwan/mhi_wwan_ctrl.c      |  2 +-
 include/linux/mhi.h                   |  9 +++-
 net/qrtr/mhi.c                        |  2 +-
 10 files changed, 134 insertions(+), 64 deletions(-)

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
