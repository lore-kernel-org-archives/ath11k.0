Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABEEC433EF
	for <ath11k@archiver.kernel.org>; Mon, 28 Mar 2022 05:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q9zm9/H0+xtXdqEvxDHyr5Qwi2Tix5sfdwlPZeFOjTA=; b=n2eP7uJ4UQewpz
	7IVAXvCtO+SuUzgVlfwX3MMPUDooHVzzoF0VFkk5TlZZpZPLkzyyD8axkPnMcK4FLZ/TXxIcz3jp8
	ZgHvdcRez0oIBEsbXQ3P7MxUlHxhOOurKeZDxGVvFLxHFWrRYna1/RHN/nGeAVhr5QQMA1uGcEAMh
	U3NT0o2QBTxbIonYy4ykZ7WbgdVo7Zzg93G7cooi8OaoU/4VpbcKZHylK05hH/jiVB+8San8Fdk2Y
	S/w4h+KUFvPzBrJ58oBlom1AxSCkgHi8AnPoNgGm9Aw7Okeane/Y9RMDDzqPVXr6btHQaYUArkb/r
	Kbh4c2xJsmGzeDCjwHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYiNt-007MvG-Gm; Mon, 28 Mar 2022 05:57:45 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYiNq-007Mu0-DX
 for ath11k@lists.infradead.org; Mon, 28 Mar 2022 05:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648447062; x=1679983062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RVYlVHjwfF7ezNm1v6K6Oq6FySdDFVnygc9rKgQEDsc=;
 b=Hk5hSpt+I+5ulfLWd1Rz7L0ki/oGurv0krUWtXjh/26P3PmlSdAhcPwB
 0ym3ZE9vGfwE/HotZqQFEBBpgxfFdCqJOa61QjCEkmQ1FowI+t4dvu8Na
 H2dfBQl2VhepgujbvnB6DoL9Ue8q/yEbnmsn5fZNd+NqRWNlkrCqEiS1j U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Mar 2022 22:57:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2022 22:57:39 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 27 Mar 2022 22:57:38 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 27 Mar 2022 22:57:37 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v3 0/5] Refactor PCI code to support WCN6750
Date: Mon, 28 Mar 2022 11:27:09 +0530
Message-ID: <20220328055714.6449-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_225742_534344_22C140FA 
X-CRM114-Status: GOOD (  12.44  )
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

Unlike other ATH11K PCIe devices which are enumerated by APSS
processor (Application Processor SubSystem), WCN6750 gets
enumerated by the WPSS Q6 processor (Wireless Processor SubSystem);
In simple terms, though WCN6750 is PCIe device, it is not attached
to the APSS processor, APSS will not know of such a device being
present in the system and therefore WCN6750 will be registered as
a platform device to the kernel core like other supported AHB
devices.

WCN6750 needs both AHB and PCI APIs for it's operation, it uses
AHB APIs for device probe/boot and PCI APIs for device setup and
register accesses. Because of this nature, it is referred as a
hybrid bus device.

Refactor PCI code to support hybrid bus devices like WCN6750.

Manikanta Pubbisetty (5):
  ath11k: PCI changes to support WCN6750
  ath11k: Refactor PCI code to support WCN6750
  ath11k: Choose MSI config based on HW revision
  ath11k: Refactor MSI logic to support WCN6750
  ath11k: Remove core PCI references from PCI common code
---
V3:
 - Patch series with 19 patches is split in 2 patch series, this is the first one
 - Rebased on ToT SHAID: 7316a74e54318d0cd648242b18ea83cdef6dda96
 - Changed the PCI common code file name from pci_cmn.* to pcic.*
 - Added ath11k_pcic_* prefix to all APIs in PCI common code
 - Added pci_ops instead of having the chip specific PCI ops in bus_params

V2:
 - Rebased on ToT

 drivers/net/wireless/ath/ath11k/Makefile |   2 +-
 drivers/net/wireless/ath/ath11k/core.c   |   6 -
 drivers/net/wireless/ath/ath11k/core.h   |  34 +
 drivers/net/wireless/ath/ath11k/hw.h     |   2 +-
 drivers/net/wireless/ath/ath11k/mhi.c    |  30 +-
 drivers/net/wireless/ath/ath11k/pci.c    | 978 ++++-------------------
 drivers/net/wireless/ath/ath11k/pci.h    |  28 +-
 drivers/net/wireless/ath/ath11k/pcic.c   | 741 +++++++++++++++++
 drivers/net/wireless/ath/ath11k/pcic.h   |  46 ++
 9 files changed, 1013 insertions(+), 854 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/pcic.c
 create mode 100644 drivers/net/wireless/ath/ath11k/pcic.h

-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
