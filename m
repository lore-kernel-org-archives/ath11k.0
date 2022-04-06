Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B42C433EF
	for <ath11k@archiver.kernel.org>; Wed,  6 Apr 2022 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uHcYAzxt8EQ0jmWll/QdcmJide4/hdGVkZH/WSHp6ic=; b=VsXboSolol9WpO
	k5XAaT3ihHF63ipXCKdv5oKn/nwB4P4TLUUt6O5wUGRobhOxjdhdTv/6XpJA0E5Sa58x7FFeoKbzi
	2oaynKxAvEeQ3xJC8577leJAz6SciUskYOa4GwVNHtJJt2DRH9Yz4meMqvsRzpThaqnWT61a4sP7n
	2VrohmdDe+ezsym61i7eTT094eqh2jK6e51pKo1qisDeSN2+NAnI/91zun6kqRS/sPaP/d7sGWBrs
	BSJ4rS2Hg2OX5dIvlLBNxaenVH7F3Wy36+7DoQkdtrPyR+urnMElAhpeC6F0Ublu48E7eq/2wvEqt
	oE9Opnh0GFu1FmPY+czg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2AP-00532d-KS; Wed, 06 Apr 2022 09:41:33 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2AL-0052yY-Eq
 for ath11k@lists.infradead.org; Wed, 06 Apr 2022 09:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649238089; x=1680774089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DC9/dD5vE9ABuSr3zpKqd6KiCOzEC4l3tzPeOHBhjfc=;
 b=OmyZWo0kdvLvhib/hg8uXveTWF7If2JBg0FFO+xFVU4YEIkv1c68GeZh
 IQXKla6J7/mBYqMvVR9nzoKQSMwoyORM4olbHmyqeAJ31ShDDEQkfIUTL
 KMsLlF53TVSzQ/QzzMWyORUXdyScj6SZGCQT2yYoGcKWluoE4jbDLzWi7 A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 06 Apr 2022 02:41:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 02:41:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 02:41:25 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 02:41:23 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v4 00/12] add support for WCN6750
Date: Wed, 6 Apr 2022 15:10:54 +0530
Message-ID: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_024129_565992_AF1546C7 
X-CRM114-Status: GOOD (  15.95  )
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

An important point to note is that though WCN6750 is a PCIe device,
it cannot be attached to any other platform except on Qualcomm
Snapdragon SoCs due to the aforementioned reasons.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Manikanta Pubbisetty (12):
  dt: bindings: net: add bindings of WCN6750 for ath11k
  ath11k: Add HW params for WCN6750
  ath11k: Add bus params for WCN6750
  ath11k: Add register access logic for WCN6750
  ath11k: Fetch device information via QMI for WCN6750
  ath11k: Add QMI changes for WCN6750
  ath11k: HAL changes to support WCN6750
  ath11k: Datapath changes to support WCN6750
  ath11k: Do not put HW in DBS mode for WCN6750
  ath11k: WMI changes to support WCN6750
  ath11k: Update WBM idle ring HP after FW mode on
  ath11k: Add support for WCN6750 device
---
V4:
 - Addressed comments on DT binding (Matthias Kaehlcke <mka@chromium.org>)
 - Rebased on ToT SHAID: 607c3dc2750382befa0f3f20063943bd058a2bc1

V3:
 - Patch series with 19 patches is split in 2 patch series, this is the second one
 - Rebased on ToT SHAID: 7316a74e54318d0cd648242b18ea83cdef6dda96
 - Addessed DT binding concerns
 - PCI common code is moved to ath11k.ko
 - Added a new HW param for WCN6750 which uses fixed firmware memory, this is
   needed to differentiate WCN6750 from other ATH11K chipsets
 - Modified the logic in patch "ath11k: Add support for WCN6750 device" based on the latest DT binding

V2:
 - Rebased on ToT
 - Addressed comments on DT binding

 .../bindings/net/wireless/qcom,ath11k.yaml    | 361 ++++++++++++------
 drivers/net/wireless/ath/ath11k/Makefile      |   5 +-
 drivers/net/wireless/ath/ath11k/ahb.c         | 162 +++++++-
 drivers/net/wireless/ath/ath11k/ahb.h         |   1 +
 drivers/net/wireless/ath/ath11k/ce.c          |   4 +-
 drivers/net/wireless/ath/ath11k/core.c        | 118 +++++-
 drivers/net/wireless/ath/ath11k/core.h        |   5 +
 drivers/net/wireless/ath/ath11k/hal.c         |  15 +-
 drivers/net/wireless/ath/ath11k/hal.h         |  15 +-
 drivers/net/wireless/ath/ath11k/hw.c          | 166 ++++++++
 drivers/net/wireless/ath/ath11k/hw.h          |  11 +
 drivers/net/wireless/ath/ath11k/pci.c         |   4 +
 drivers/net/wireless/ath/ath11k/pcic.c        |  76 ++--
 drivers/net/wireless/ath/ath11k/qmi.c         | 220 +++++++++--
 drivers/net/wireless/ath/ath11k/qmi.h         |  26 +-
 drivers/net/wireless/ath/ath11k/wmi.c         |  13 +-
 16 files changed, 976 insertions(+), 226 deletions(-)

-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
