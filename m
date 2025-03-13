Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE973C282DE
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gl7dBfMIRvY0UvTHq74D2ML1Fou8p6qnw6IkR/ArEuY=; b=bkKyiQnIeXy4Tu
	p+BxqkT/nctprHntkfT/3n/xMcX6YJsdCRZfGQTPGZhzjf0RpBcgVj3hgXZx0HFF2lSa/C+lqULD9
	0lfqk5Ry9yrGiSZmYtwWw7F9f6znIKd7f97yPooF4IeS7FH//2jJKGwkH0bozPQOM246MWBftR3en
	rReax/CXlU4C7xwS0HOU2ycbsHibga74UZ2Ck0Eg4tGNEOC2FimuEPcfSNkd7h7zTPIasLJiZa9dM
	suQ7JHeWG9vatcqO7X6jnXZFR+t+D6Mav8T8RLEiNXkfAE0lIWBQWvvC62BFa6l0W3p85GYZ46Cz5
	hU3UQhFHu8MYpiZTPyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgvj-0000000B4PF-1cZi;
	Thu, 13 Mar 2025 11:40:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgvg-0000000B4OX-0ITK
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 11:40:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DASbvF008916
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Gl7dBfMIRvY0UvTHq74D2M
	L1Fou8p6qnw6IkR/ArEuY=; b=XE13bQZEuvxtwFZeeT52hwgPvfrobB8/JWTcUb
	xbZRZFD8w+2wVHkwZe0RF2DCB0S+AV2+6cJAtTNf+XmWw0lX0IbarbYdgcRKmVFi
	LgUJCUWVsOSlWQkQNC6CfEN2Z3MucrlmTIvZIoLmXljRdNxw60wO2jTp5wsKZ16t
	6NYlmiCwyM6gbtz1FN2VOa3+VfTEmIA6BWhMKB8udm6S2hdrbd5RC3p+QC9WhUQn
	w8DVt74Ard51HLVlODHvsvpcae3USubpGMtaGxbPSlN/6SSRNFKeLImQQjpM3Ld2
	cxPiYPM2slhfxBDTqdd0lkx3UIgDP6l7wJoJVCPJjHpOph4w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2rdp4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:40:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff78bd3026so1588683a91.1
        for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 04:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866045; x=1742470845;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl7dBfMIRvY0UvTHq74D2ML1Fou8p6qnw6IkR/ArEuY=;
        b=mRZsOHHGSzs1Z0hlXGmgcP6+9KjHK7V4bQDs7MHVLMN2UML/XzmXr5jwJC81jJAh6G
         dO1/GNWGBsiUuJIUyaZihS8On9CPpU2qa82jsUV+jM8e0mJEjLfComRhidi8WHb1q76P
         jkZJJD4i833GzXnMxh6Eb9mdWq3BgGTl68hSdu6yjp5URr/A+KoQp2Zp7sfzjUyO0u0G
         56M8DTpyw6HoRxeo2vmN2lU7hkSs6qjEMEAppHiYeY2DXKMg0k6H1LKteqv69uEUhHAj
         d/OTR0/p0nK3ySPDoo9bHKIs0WfuwQk9Yfn0M5FkG4YIiwe47Ybjm167fXDW1K08Ne4q
         /pkA==
X-Forwarded-Encrypted: i=1; AJvYcCUoxg6VrD1iTSZ+jaAUhDTaGURnOHJSAdLxdhM/yycXdHwimJT2SEhL5UeZsiK2K8j2FbC4w8w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzly4HkDsDbRw69ZdE00lkmZAghZkzbG50/59xpg16aghSJQq6v
	iRwiYbBKB4iHSRjBU9byLZJuhxfTZBXrYxrBIF7GNWyvowWyseUqWWHsRgN/UWWQaE7S+2ZydmN
	TyG236ZuXKwRhomWkGjVTpEDm3joycr2xpLfnVDrBgWb3WlidxK05bdIOxr8W
X-Gm-Gg: ASbGnct1r4jXY5VQc5ku+cKVixcUjVs8nlExNakHxTRuYgR+I8csAoBY2ScHXT1wXss
	tQrG0iQrzMRub7NvKbPaCu/iMjRYnq4hgN2yYXfsG6zrh1V0wC4qCLkxfp+eTaqXpHitDoDIp2A
	vahbQGbHCEhM6zj4DFAz+QjgCCQSvGHZ2Ur3s+MMatQRNjqfWbPEsScIGudx1duW+ldKH/fe65b
	MXfQPlGpj/Gm9OmjLtT35Kn4BBsSJRMcDfZMAI/4XWeJ7B0m81RnVW8rg0zZGPuaBXhQ8v92P0t
	WqcD9Mc99TzhGj2ubH+amx5EBjS38PV10P9PeEK295EfxnQSgm0=
X-Received: by 2002:a05:6a21:700d:b0:1ee:d8c8:4b82 with SMTP id adf61e73a8af0-1f58cbb5ba7mr19226990637.31.1741866045013;
        Thu, 13 Mar 2025 04:40:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6s3QZNBzun6qfGJI2O3KJt450CQvYZp8l0pZDZwjkBQ5mu3SdVVl6RYCh7FCs50haBcj3Xg==
X-Received: by 2002:a05:6a21:700d:b0:1ee:d8c8:4b82 with SMTP id adf61e73a8af0-1f58cbb5ba7mr19226954637.31.1741866044659;
        Thu, 13 Mar 2025 04:40:44 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:40:44 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 00/10] bus: mhi: host: Add support for mhi bus bw
Date: Thu, 13 Mar 2025 17:10:07 +0530
Message-Id: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABfE0mcC/22MwQ6CMBAFf4Xs2ZJuEYye+A9DSEuL3cRSbAU1p
 P9u5ezlJfMymQ2iCWQiXIoNglkpkp8yiEMBg5XTzTDSmUFwUXOBJ+Ys9erVLzMbK6x4I+umQgX
 Zn4MZ6b23rl1mS/Hpw2dPr/h7/1VWZJydldRojkJpha2PsXws8j5458o80KWUvnVrbjypAAAA
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
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=4760;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=2SgNcjekpgSmNx2cAg4AHpHq4cD2vlM+XcdUmTLUki8=;
 b=o6VzA2SG9Rsit2fb3dOpREA44zKodJ0C7U3EpcGdhR9B+kmwOrlQ2SUNIvaPshB3JMcA1fTox
 mE+KPCyc0/9DlNoQ0QB2sx0shVKdtmCDzeSdUAfQlG0XzLHugIAJWKO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=D6NHKuRj c=1 sm=1 tr=0 ts=67d2c43e cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Vq2kaiCTda8s_ErnlBgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: UpB-EsZIbQRo2oLuZo962CnKngKMHVj_
X-Proofpoint-ORIG-GUID: UpB-EsZIbQRo2oLuZo962CnKngKMHVj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044048_263763_23F7F9BD 
X-CRM114-Status: GOOD (  20.88  )
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
the link re-train. There is no explicit locking mechanisms as these are
called by a single client endpoint driver

In case of PCIe switch, if there is a request to change target speed for a
downstream port then no need to call these function ops as these are
outside the scope of the controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Update the comments.
- Split the icc bw patch as sepertate one (Bjorn)
- update the aspm disablement comment (Bjorn)
- Use FIELD_GET & FIELD_PREP instead of hard macros and couple of nits
  suggested by (Ilpo Järvinen)
- Create a new function to change lnkcntrl2speed to enum pci_bus_speed (Jeff)
- Link to v1: https://lore.kernel.org/r/20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com

---
Krishna Chaitanya Chundru (8):
      PCI: update current bus speed as part of pci_bus_add_devices()
      PCI/bwctrl: Add support to scale bandwidth before & after link re-training
      PCI: dwc: Implement .pre_scale_bus_bw() & .post_scale_bus_bw hook
      PCI: qcom: Extract core logic from qcom_pcie_icc_opp_update()
      PCI: qcom: Add support for PCIe bus bw scaling
      bus: mhi: host: Add support for Bandwidth scale
      PCI: Export pci_set_target_speed()
      PCI: Add function to convert lnkctl2speed to pci_bus_speed

Miaoqing Pan (1):
      wifi: ath11k: add support for MHI bandwidth scaling

Vivek Pernamitta (1):
      bus: mhi: host: Add support to read MHI capabilities

 drivers/bus/mhi/common.h                          |  20 ++++
 drivers/bus/mhi/host/init.c                       |  93 +++++++++++++++++-
 drivers/bus/mhi/host/internal.h                   |   7 +-
 drivers/bus/mhi/host/main.c                       | 101 +++++++++++++++++++-
 drivers/bus/mhi/host/pm.c                         |  10 +-
 drivers/net/wireless/ath/ath11k/mhi.c             |  41 ++++++++
 drivers/pci/bus.c                                 |   3 +
 drivers/pci/controller/dwc/pcie-designware-host.c |  21 +++++
 drivers/pci/controller/dwc/pcie-designware.h      |   2 +
 drivers/pci/controller/dwc/pcie-qcom.c            | 110 +++++++++++++++++-----
 drivers/pci/pci.c                                 |  12 +++
 drivers/pci/pcie/bwctrl.c                         |  16 ++++
 include/linux/mhi.h                               |  13 +++
 include/linux/pci.h                               |  14 +++
 14 files changed, 431 insertions(+), 32 deletions(-)
---
base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
change-id: 20250217-mhi_bw_up-f31306a5631b

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


