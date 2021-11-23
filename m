Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C455BC433F5
	for <ath11k@archiver.kernel.org>; Tue, 23 Nov 2021 18:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=garjG5JICpYZWogTC9zHBeVI9RY3s66vvFzDPIj8CDs=; b=uffpRUjGaVKFaT
	5klwF5EWEQtx1kw8POWPDgz+iMkIUudrKhvVybs44XRzuUYTeWK1AgKLtje3nRqTBc1hxAGXvOHqC
	KQ9P6Bd78b4mbRD5hyKoLHxu1NUguVx/wAy6I0/pe6tU/gKeRBzwCe0K6PYbk0/Xr6rDFWQf2mnUU
	E8kxIWjcWnrWA/n1xzu5MBgwYDDZvu+Rid+pNzG4le68iADznJLraBLqY7LIwQFcYPuwAsNbpD6gR
	y816wX4YiB5S2H4X/q7eCUMQ7t/TMIwl7m6HbVEySVPaDr0i+LynSxAnEGwWVh1gDVxepFu8H8X7b
	VONkN9TpU8CtQQqfU8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpat1-003FAr-6x; Tue, 23 Nov 2021 18:51:23 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpasy-003F9f-8g
 for ath11k@lists.infradead.org; Tue, 23 Nov 2021 18:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637693480; x=1669229480;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Aoj5xZMGGsq/OcrM79S2Dp1BTjBbNtteoCDCqtbWL1k=;
 b=eB33x2d1oxkBRYPGhf7/3IZlDtNxuv8cJHdSjgcUUh7i5gUeB0Z5yh8m
 IxFLbuOLkdBW/lO/7/xOEFjP1cVNHIg2yjRjQ/hx7yGYIDFUSMccT9Qm1
 KSJ/lGRzndOqtyiBV18rpuYrIPQsialFcT70C6fl5HhCyqdInnZBnZVlj s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 23 Nov 2021 10:51:17 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 10:51:17 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 10:51:16 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 10:51:14 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Subject: [PATCH 00/19] add support for WCN6750
Date: Wed, 24 Nov 2021 00:20:15 +0530
Message-ID: <1637693434-15462-1-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_105120_413857_D4D36762 
X-CRM114-Status: GOOD (  15.74  )
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

WCN6750 is non-DBS 2x2 11AX chipset. Unlike QCA6390/WCN6855 which
are DBS (dual band simultaneous) solutions (2 LMACs), WCN6750 has a
single LMAC supporting 2G, 5G and 6G bands. It can be operated only
on one band at any given point.

WCN6750 is a PCIe device. Unlike other supported ATH11K PCIe devices
which are directly attached to APSS (Application Processor SubSystem),
WCN6750 is not attached to APSS, it is attached to the WPSS
(Wireless Processor SubSystem) Q6 processor, the FW which runs on the
Q6 processor will enumerate the PCIe device. Since APSS is unaware of
such a device, it has to be registered as a platform device(AHB) to the
kernel for device probing. Like other AHB devices, remoteproc APIs are
used to boot up or shutdown of WCN6750.

WCN6750 uses both AHB and PCIe ATH11K APIs for it's operation.
It uses AHB APIs for device probe and booting of the remote processor.
Once device is booted up, it uses ATH11K PCIe APIs for initialization
and register access. Hence, it is referred as hybrid bus device in
the rest of this series.

Since the chip is enumerated by WPSS Q6, device information like
BAR and BAR size is not known to the APSS processor. A new QMI message
called device info QMI request will be sent to the target for fetching
these details.

STA and AP modes are supported; Basic connectivity and ping are
verified in both the modes.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Note:
*	Remoteproc driver changes for WCN6750 which takes care of
	downloading the FW and booting of Q6 processor are under
	upstream review.
	Link: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=582475

Manikanta Pubbisetty (19):
  ath11k: PCI changes to support WCN6750
  ath11k: Refactor PCI code to support hybrid bus devices
  ath11k: Choose MSI config based on HW revision
  ath11k: Refactor MSI logic
  ath11k: Remove core PCI references from PCI common code
  ath11k: Add HW params for WCN6750
  ath11k: Add bus params for WCN6750
  ath11k: Add register access logic for WCN6750
  ath11k: Fetch device information via QMI for WCN6750
  ath11k: Add QMI changes for WCN6750
  ath11k: HAL changes to support WCN6750
  ath11k: Datapath changes to support WCN6750
  ath11k: Fix RX de-fragmentation issue on WCN6750
  ath11k: Do not put HW in DBS mode for WCN6750
  ath11k: WMI changes to support WCN6750
  ath11k: Update WBM idle ring HP after FW mode on
  ath11k: Add support for WCN6750 device
  ath11k: Add support for targets without trustzone
  dt: bindings: net: add bindings of WCN6750 for ath11k

 .../bindings/net/wireless/qcom,ath11k.yaml         | 333 +++++---
 drivers/net/wireless/ath/ath11k/Makefile           |   4 +-
 drivers/net/wireless/ath/ath11k/ahb.c              | 331 +++++++-
 drivers/net/wireless/ath/ath11k/ahb.h              |  10 +
 drivers/net/wireless/ath/ath11k/ce.c               |   4 +-
 drivers/net/wireless/ath/ath11k/core.c             | 104 ++-
 drivers/net/wireless/ath/ath11k/core.h             |  35 +
 drivers/net/wireless/ath/ath11k/hal.c              |  15 +-
 drivers/net/wireless/ath/ath11k/hal.h              |  17 +-
 drivers/net/wireless/ath/ath11k/hw.c               | 175 +++-
 drivers/net/wireless/ath/ath11k/hw.h               |  13 +-
 drivers/net/wireless/ath/ath11k/mhi.c              |  16 +-
 drivers/net/wireless/ath/ath11k/pci.c              | 893 +++------------------
 drivers/net/wireless/ath/ath11k/pci.h              |  28 +-
 drivers/net/wireless/ath/ath11k/pci_cmn.c          | 720 +++++++++++++++++
 drivers/net/wireless/ath/ath11k/pci_cmn.h          |  47 ++
 drivers/net/wireless/ath/ath11k/qmi.c              | 215 ++++-
 drivers/net/wireless/ath/ath11k/qmi.h              |  26 +-
 drivers/net/wireless/ath/ath11k/wmi.c              |  13 +-
 19 files changed, 2007 insertions(+), 992 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/pci_cmn.c
 create mode 100644 drivers/net/wireless/ath/ath11k/pci_cmn.h

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
