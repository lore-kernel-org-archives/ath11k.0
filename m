Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1162CC021A0
	for <ath11k@archiver.kernel.org>; Mon, 17 Feb 2025 06:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iQXoj8H5b3looSrGKhddD/8Lrybt4a5ABYSR1D4Re5s=; b=g1JvnFV6gArXFV
	5IaqTFY/uQRO2USUo4vnIB1dB1kWtZ7T4/S+suioXz0JeEX1qmO9ClKeRVi2VjCep7MlZcMHg9HVO
	7xCPrrhr02M1xeYfHTH/h53DNCVBPTwudGJGN89Y/f3i1DZ7cTHXrjB+nQZY3BFP5B91R+keR7x8B
	xQJ2p/9U9m7xV7lh19knIBiVDGlCWugEYj9gLLtOvQQ0iuT6flk+SfgbY4o/NtmwVhdyXlfcFVqx1
	miueOVxDVE4SpspGTeHj5/e6tXp0AXTYGDQD294csrno6llOrBR3b5jp7+xejdvmfjV4/Cg/t4POp
	PK/4vJk5cYrMlEqOBjlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuhx-00000003Ua0-1GdF;
	Mon, 17 Feb 2025 06:34:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuhu-00000003UYP-3DJn
	for ath11k@lists.infradead.org;
	Mon, 17 Feb 2025 06:34:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H04nbb024167
	for <ath11k@lists.infradead.org>; Mon, 17 Feb 2025 06:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iQXoj8H5b3looSrGKhddD/
	8Lrybt4a5ABYSR1D4Re5s=; b=FwzWUHRI6EyRImOKj+nGoAp8kj49VXCHa604rW
	Gh9LJ7xKrLtbgz+R/mgxm+uC54lbriqnET3Z7DEwMvlc61KJiEXwYKv4pM7XvsKd
	OapR+Wx2ya2te819xvoAkK9/yN1vrSbCZftLCiwu5elm3S321vVv6yibjzUk0+dd
	/vLhSZPtN3+U/ZOnyT0RcGJM9DR1DBv7oIha91ILQd4BiEHaxt0TaGWNSGX/cEqK
	9NrtYHhIgusfPrhfp4eYJFfqSqi8dU6fsGiddPlWbbwd2e1MrhVGpEWGic6kcyNA
	nUwIkDxdynDiXkQAYuWzs+bj209rBi8bqBojNjJz13IMt0Jg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7u8ppd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Feb 2025 06:34:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220c86e46ebso59096775ad.0
        for <ath11k@lists.infradead.org>; Sun, 16 Feb 2025 22:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774057; x=1740378857;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQXoj8H5b3looSrGKhddD/8Lrybt4a5ABYSR1D4Re5s=;
        b=vQitfXNa9IQcoifGx571fEcKianoQOhLdN4lrnlML9F3HWWHtWPRW5skw91M7R/QRM
         7xMth8TX7FxGNKgpIwC52aPOnocpc83jBCw6X1aDYqhXnQ3+K0Aran9qMUHD8En/4ave
         84uJUFvJcL+Qf/T6ghTeTz7liCfqC8jmaUt8mqmeLeLAcORihVMxdfqpVslkdPBpCr5e
         /+iUe6MtnjtSw9y8Q3OsL87nb/CYgWL15euYCsdS93EC9fGa9g1/olF+Q1qq0gkoI3XG
         y+VqefCVQYuIgTmtnFsEIWcmDbzJa/6B9EOj43wZbQIMYPWQfy3gei1n9euRAKhq9UXS
         Wuiw==
X-Forwarded-Encrypted: i=1; AJvYcCWWBlfwg411K9unIQpqodXRGInwNPMjAkBDOnsN6P39Tw/gf7WVY9fU7KOPOnwpdFe5dz7PyiM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx92m1bFibQcyevEm7nPTQLZH0T4f0pMGA778QkGt9234YfNP37
	Tq6Gyn8hRs4GYsnp3JOdVAfnGkvAN0/b3P4DZUcfjS5D5tLoU3GK22O6T+MukR7KBvsEkx1eGti
	ZLnpv0bvaFntdLltKB8vUTKIQfeotXL+8P1gukbN50Uh46my8RfdGqPdKJ/mV
X-Gm-Gg: ASbGnctEQ+drNoV2Hglip3yVKtzLs8mk50JtdisEhnpfOjunzCvpcliedHaW0uObyee
	7eZ/VwtwSu6Z+b+jN7UMaDheDOZwEliYZyLRZxAEnYx7uui5bnoDCoXC7MrT+zINBqrVBACSloo
	T3OnUxqtaN98enmcXT86DkcbypIyBH2XbEsXnvvEedBCbEAo+4w97/LhZMPrP8wcIJD1HZ6Y0py
	DB4MBtZBCm7BWnFfWUg2sR5SW2hxK97LOQSQDvp3TO3ejw2yL9xMrexJ9EfQSFTPX17Lr2o9LQ4
	e2ZWqFTTtQodrOiAT0O9nZ0OEKCZBWU9WcBcGSO4
X-Received: by 2002:a05:6a20:734c:b0:1ee:7ea6:8e0c with SMTP id adf61e73a8af0-1ee8cac55c9mr18266087637.8.1739774056609;
        Sun, 16 Feb 2025 22:34:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1648r3e9k3f7j/0JUKAhKP4VZHlpB+D2ION+yxkiLqbGo7Uymf7YvEB+nmMyv3aO5xRKwhA==
X-Received: by 2002:a05:6a20:734c:b0:1ee:7ea6:8e0c with SMTP id adf61e73a8af0-1ee8cac55c9mr18266034637.8.1739774056186;
        Sun, 16 Feb 2025 22:34:16 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73263b79287sm3771800b3a.29.2025.02.16.22.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:34:15 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/8] bus: mhi: host: Add support for mhi bus bw
Date: Mon, 17 Feb 2025 12:04:07 +0530
Message-Id: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF/YsmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Nz3dyMzPik8vjSAt00Y0NjA7NEUzNjwyQloPqCotS0zAqwWdGxtbU
 AtPwk3FsAAAA=
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        quic_jjohnson@quicinc.com, quic_pyarlaga@quicinc.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739774050; l=4167;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=30TEJAABnUpwa1kh8H5tuBGWqBc57PSEMyTn4o46Oe8=;
 b=vG+PKK75gdfNitdrSzZxvdfDkylUvvuDHb5LhND5dvYUjy4b7le09Q4AB1LGAes3zdqMUKfKk
 TVbD5AtySEcDUbKMf/G6dkUnLGx09o2ZlvM5F6/WQFsMiBJXAPG03rI
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: E_iTeia9LAxXcuiLt5SRzeFlgQrkSYrA
X-Proofpoint-ORIG-GUID: E_iTeia9LAxXcuiLt5SRzeFlgQrkSYrA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_223418_822491_8E7ADC82 
X-CRM114-Status: GOOD (  20.51  )
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

As per MHI spec sec 14, MHI supports bandwidth scaling to reduce power
consumption. MHI bandwidth scaling is advertised in devices that contain
the bandwidth scaling capability registers. If enabled, the device
aggregates bandwidth requirements and sends them to the host in the form
of an event. After the host performs the bandwidth switch, it sends an
acknowledgment by ringing a doorbell.

if the host supports bandwidth scaling events, then it must set
BW_CFG.ENABLED bit, set BW_CFG.DB_CHAN_ID to the channel ID to the
doorbell that will be used by the host to communicate the bandwidth
scaling status and BW_CFG.ER_INDEX to the index for the event ring
to which the device should send bandwidth scaling request in the
bandwidth scaling capability register.

As part of mmio init check if the bw scale capability is present or not,
if present advertise host supports bw scale by setting all the required
fields.

MHI layer will only forward the bw scaling request to the controller
driver, it is responsibility of the controller driver to do actual bw
scaling and then pass status to the MHI. MHI will response back to the
device based up on the status of the bw scale received.

Add a new get_misc_doorbell() to get doorbell for misc capabilities to
use the doorbell with mhi events like MHI BW scale etc.

Use workqueue & mutex for the bw scale events as the pci_set_target_speed()
which will called by the mhi controller driver can sleep.

If the driver want to move higher data rate/speed then the current data
rate/speed then the controller driver may need to change certain votes
so that link may come up in requested data rate/speed like QCOM PCIe
controllers need to change their RPMh (Resource Power Manager-hardened)
state. And also once link retraining is done controller drivers needs
to adjust their votes based on the final data rate/speed.

Some controllers also may need to update their bandwidth voting like
ICC bw votings etc.

So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
the link re-train.

In case of PCIe switch, if there is a request to change target speed for a
downstream port then no need to call these function ops as these are
outside the scope of the controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (6):
      PCI: update current bus speed as part of pci_bus_add_devices()
      PCI/bwctrl: Add support to scale bandwidth before & after link re-training
      PCI: dwc: Implement .pre_scale_bus_bw() & .post_scale_bus_bw hook
      PCI: dwc: qcom: Update ICC & OPP votes based upon the requested speed
      bus: mhi: host: Add support for Bandwidth scale
      PCI: Make pcie_link_speed variable public & export pci_set_target_speed()

Miaoqing Pan (1):
      wifi: ath11k: add support for MHI bandwidth scaling

Vivek Pernamitta (1):
      bus: mhi: host: Add support to read MHI capabilities

 drivers/bus/mhi/common.h                          |  18 ++++
 drivers/bus/mhi/host/init.c                       |  93 ++++++++++++++++++-
 drivers/bus/mhi/host/internal.h                   |   7 +-
 drivers/bus/mhi/host/main.c                       | 102 ++++++++++++++++++++-
 drivers/bus/mhi/host/pm.c                         |  10 ++-
 drivers/net/wireless/ath/ath11k/mhi.c             |  41 +++++++++
 drivers/pci/bus.c                                 |   3 +
 drivers/pci/controller/dwc/pcie-designware-host.c |  21 +++++
 drivers/pci/controller/dwc/pcie-designware.h      |   2 +
 drivers/pci/controller/dwc/pcie-qcom.c            | 105 ++++++++++++++++------
 drivers/pci/pci.h                                 |   1 -
 drivers/pci/pcie/bwctrl.c                         |  16 ++++
 include/linux/mhi.h                               |  13 +++
 include/linux/pci.h                               |   3 +
 14 files changed, 402 insertions(+), 33 deletions(-)
---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20250217-mhi_bw_up-f31306a5631b

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


