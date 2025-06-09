Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E5AC677C4
	for <ath11k@archiver.kernel.org>; Mon,  9 Jun 2025 11:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VhUteTfXsocNRs+IopB/b3CazovW+anusy46N1ig4I4=; b=L5Nnz9OvEGq8bY
	cL92SU8OxA8a7o08PgoTKXQ1YjuUIxhsyIuWWtqL4WWhc40Vst16Oxpvz9PE5ZidjWVt2fHh0vyN2
	X9NTLdm7pWInLCDNfD2/BB+Na1ekNw2I6mkMABFX2BgD+2EqLEi05PKhtStw3Zfnr48OR/55/XOTI
	UcuflDUJTSaih+rsSSdGeftttmtSlYFhw7tFIb94bbTW/slxwkqEWIFiUzkEEHpINX3dLH0e4/TiF
	orTTKUcsfVcmpkDj0w7fb2AXRlQzg/VsjRr9v4oclPjg2lLuTtltysC0PuGhv+c7QWLCfHfZFkXIj
	mh3s8Zo69zNLwRdkE1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaSq-0000000403j-0mIJ;
	Mon, 09 Jun 2025 11:14:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa6P-00000003wwN-3u4n
	for ath11k@lists.infradead.org;
	Mon, 09 Jun 2025 10:51:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599UUAD032491
	for <ath11k@lists.infradead.org>; Mon, 9 Jun 2025 10:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VhUteTfXsocNRs+IopB/b3
	CazovW+anusy46N1ig4I4=; b=MmNM79F5vXiV9wy2/idzS3EvXZ/ms76SWlloWk
	d5oHC2717UXQ4r1VoNqeyI3VlbOjRYwM69M/rJMZPbDObF8aLZYEUg5FjD1dwCFi
	/4awyr/9NNbeYa29X7m9rDMiBuAOVOA2indGk0volUd0AS01alO56AMKs5IIa7Ch
	ooqNooSAvi9dD5QFunYF4AG4ECAgBm0hawS3vpRoeqXW/ZNNx8N2JjOHKUani7yw
	I/lqHHnK9e88PsOpymltgbVASLKyyvqRMbpXCqEKzsK//Gajw/aGXrgIW1ofFobQ
	jzmeRmgfJ5nd+v759tv3b34ke6yp2IZLmLoGIdBrNihCqp6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75t1b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 10:51:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234906c5e29so49364275ad.0
        for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 03:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466298; x=1750071098;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhUteTfXsocNRs+IopB/b3CazovW+anusy46N1ig4I4=;
        b=YhrBiOgeOsjSlPOzMJP+oVr1kBO3Am5rMzFQNjWkteRFX/sDNcEfwgGbB7Kl+9t5u5
         QMqpVTNr28YPttWhaR5dNarZrZzFSED5Rak4AqxY6Sjhe+jI0Cazjx6OyCbE1t5NQQcF
         Lwg1PD8R3rTKoCiJaYKJ4JluvB7F49P9JHa4wuEhrgbSR1D9F9PBB5ktx9DOIYnT8bZR
         K6zO/t5DAdMzjiceCVpcS2+ydx4MqaDyubUgi9XCqPMam3uTQ0Be4HyHmtEY/8sBsXre
         biRh9KnLY98F5m6ENTX+FaZU6I39dZll2G2dsW07E8dOMoOPoWqdfmFA0AivHEfBihDZ
         248w==
X-Forwarded-Encrypted: i=1; AJvYcCUoR7cHBQBCvWiqQ/m1kbJgWf1nNYUZMoi6SU/17C8DLIacovukWr/oiddR5OB72GZHnmEtoQc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGPzhM5yzZEqevVWlr8OpYBYJfK+MZKzdK642DP6YpQWwfBbKB
	Dvs4/HVlAb3I/OubjYze4orRG5iuQVFZoLaIUSgTM4CG4B5u4SX9jjyWRDPsZx7m4K8qc68nJO9
	gN9K/Lg8EkWCwuIXwCtguMkE9OP6P4O8C9+0hTu63ZKUg84hZhWAurY0a6xPkS+qp
X-Gm-Gg: ASbGncuhfKW8J9BAuKb4eOnzghvS4Uru8W38sj8/z6p53wjwXYNamY2idOZrkdKAgPo
	fLc4paPZVboeSUxBX4h7nLpowBOPVJ8Jz9DLFYZOl9s6lSITuqGP3K/jagHtj4FTD7iZ06Cdpms
	DlJ2uyMs2qKRmS8QnozfUyJNZl34AVzhiBjIqinuzUctGVREsjBKyhCNktTNQWx6SFs1n7ld3si
	LKBhH/qZFjP1u5e1JDAPqQ0EL3urw921RysWESINI7JpyUWHXjBNgzCyF95xojiYjpNMVbS83GK
	xVqWyJFCADeQahOpDyHvLL8MZifvXamp88kWQlomVgXKr3LDM78K02e8sQ==
X-Received: by 2002:a17:902:dac6:b0:235:eefe:68f4 with SMTP id d9443c01a7336-23601d136femr181529465ad.29.1749466297817;
        Mon, 09 Jun 2025 03:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm+FtLDaA6kNuRa0Yr3ML7VmNAJgTPlNgcbPHQTB/P+a/aBP+VmVd3vj1/TEZYxUdP0IgxXQ==
X-Received: by 2002:a17:902:dac6:b0:235:eefe:68f4 with SMTP id d9443c01a7336-23601d136femr181529045ad.29.1749466297386;
        Mon, 09 Jun 2025 03:51:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:51:36 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v4 00/11] bus: mhi: host: Add support for mhi bus bw
Date: Mon, 09 Jun 2025 16:21:21 +0530
Message-Id: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKm8RmgC/3XNzQ6CMAzA8VcxOzuybnyIJ9/DGLLCkCXCkAlqC
 O9u4QIHvDT5N82vI/Oms8az82FknRmst66hCI8Hlle6uRtuC2omhYyEhITXlc3wnfUtLxUoEes
 oVoCM7tvOlPazWNcbdWX9y3XfhR5g3u4pA3DBU9QFmFBigXBx3gfPXj9yV9cBDTZjg1wB+rsFJ
 AGnOM21Illg+QdQKxBBugUUAUrnRaghQcRoB5im6QeSLrsXKwEAAA==
X-Change-ID: 20250217-mhi_bw_up-f31306a5631b
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=5603;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rFIAQDFx/eu1NmFhsrsbLmcPgKmZywYDhyHzqhNfrLQ=;
 b=r6QucqB8z7wv1BaaOVcAgK2+rQjPvMf+dR+w28WUfwzwB3Ew05qNSBB9OLHe1B8m45MVCPquB
 mbkAZCL2tzMBx0A2yJgzpJ3FI/gSh5s5lUnSWXmF/m76ANL4hPWpKFK
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 1M4-FxUpESLeZSmfR92rY1_yrL34kJOk
X-Proofpoint-ORIG-GUID: 1M4-FxUpESLeZSmfR92rY1_yrL34kJOk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX89rvfRKVjhGY
 kPwTH74yL8sGzpoFR75MY85XPxxYjg3tRqz53bkvA2uWNr0iOaGGMdiZP4KaHwuJnx+rhSNfXaG
 DrLRIu7neyMfShHOIU0n4vnbpWFUfDWUrWjf9kc+4mhDZ2KaBwjqA2G7ua7QbDBq41zWFBuuruY
 2wJ28BQDnAdW0AxUAKwKeTavUpcCmmUOiT9Esn/IyF8lh2QvbW8eanZE7zRlPd0qPoveosYrsWe
 7xcQ4c8bw1kGVS6avW5eKKX/Fs0PUMR9Nyp6xCBCOLJPLQ/mOqB/kB9BbtqM3L3QlycEyUINuO8
 ggQWN2uR0Ams7dzIUCwH+Mixs2JOrvjPgSJXLSOOcGcUHQBFFcwYycdhD58Ebr/Kmy8SDwpUWA7
 PSWmctYRnxiz4S4QFZcZu2r6GA8zpcNl/d0LYF94e5tfnwyAD25/XewiYx1s58/mVSNCzivW
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=6846bcbb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=a1UGM4vktcZ-V-6vu5QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_035142_111229_20CCCA56 
X-CRM114-Status: GOOD (  22.44  )
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

So, add pre_link_speed_change() & post_link_speed_change() op to call before & after
the link re-train. There is no explicit locking mechanisms as these are
called by a single client endpoint driver

In case of PCIe switch, if there is a request to change target speed for a
downstream port then no need to call these function ops as these are
outside the scope of the controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v4:
- Remove leftover type case, change the function names to pre/post_link_speed_change(Ilpo Järvinen)
- Add check's for capability read and convert le32 to cpu (Jeffrey Hugo)
- Add macros for GENMASK & BIT() (Ilpo Järvinen)
- Link to v3: https://lore.kernel.org/r/20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com

Changes in v3:
- Move update speed logic to pwrctrl driver (Mani)
- Move pre_bus_bw & post_bus_bw to bridge as these are bridge driver specific ops,
it feels to me we need to add these in the host bridge driver similar to recently
added one reset_slot.
- Remove dwc level wrapper (Mani)
- Enable ASPM only if they are enabled already (Mani)
- Change the name of mhi_get_capability_offset to mhi_find_capability() (Bjorn)
- Fix comments in the code, subjects etc (Mani & Bjorn)
- Link to v2: https://lore.kernel.org/r/20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com

Changes in v2:
- Update the comments.
- Split the icc bw patch as sepertate one (Bjorn)
- update the aspm disablement comment (Bjorn)
- Use FIELD_GET & FIELD_PREP instead of hard macros and couple of nits
  suggested by (Ilpo Järvinen)
- Create a new function to change lnkcntrl2speed to enum pci_bus_speed (Jeff)
- Link to v1: https://lore.kernel.org/r/20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com

---
Krishna Chaitanya Chundru (9):
      PCI: Update current bus speed as part of pci_pwrctrl_notify()
      PCI/bwctrl: Add support to scale bandwidth before & after link re-training
      bus: mhi: host: Add support for Bandwidth scale
      PCI/ASPM: Return enabled ASPM states as part of pcie_aspm_enabled()
      PCI/ASPM: Clear aspm_disable as part of __pci_enable_link_state()
      PCI: qcom: Extract core logic from qcom_pcie_icc_opp_update()
      PCI: qcom: Add support for PCIe pre/post_link_speed_change()
      PCI: Export pci_set_target_speed()
      PCI: Add function to convert lnkctl2speed to pci_bus_speed

Miaoqing Pan (1):
      wifi: ath11k: Add support for MHI bandwidth scaling

Vivek Pernamitta (1):
      bus: mhi: host: Add support to read MHI capabilities

 drivers/bus/mhi/common.h               |  26 +++++++
 drivers/bus/mhi/host/init.c            |  97 +++++++++++++++++++++++++-
 drivers/bus/mhi/host/internal.h        |   7 +-
 drivers/bus/mhi/host/main.c            |  98 +++++++++++++++++++++++++-
 drivers/bus/mhi/host/pm.c              |  10 ++-
 drivers/net/wireless/ath/ath11k/mhi.c  |  41 +++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c | 124 ++++++++++++++++++++++++++-------
 drivers/pci/pci.c                      |  12 ++++
 drivers/pci/pcie/aspm.c                |   5 +-
 drivers/pci/pcie/bwctrl.c              |  16 +++++
 drivers/pci/pwrctrl/core.c             |   5 ++
 include/linux/mhi.h                    |  13 ++++
 include/linux/pci.h                    |  23 +++++-
 13 files changed, 442 insertions(+), 35 deletions(-)
---
base-commit: d178209b7c211256ee736ec7c920acb81ddcea48
change-id: 20250217-mhi_bw_up-f31306a5631b

Best regards,
-- 
krishnachaitanya-linux <krichai@qti.qualcomm.com>


