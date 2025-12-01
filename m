Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFADD116F9
	for <ath11k@archiver.kernel.org>; Mon,  1 Dec 2025 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OpaVvLRzwNyUQHnkwzspQdlBGKDEqFvfhusWSTkPKsI=; b=lpoJ807oo2qhk4
	1fwGdfx3jxa9tcr7sIyWzzpXWa0vKVMHCqACID7KXZoAoo/oXRkCH1SENf/hvwyfJdFLmAg2ZmBkB
	uxJ0vSNo6ban5bu+VQirFfxbV5MLFl5yfsEKj6j1BhWTsCdAgdOr+B6lxkJKFLxmwa9Q2EDVyTTJj
	7GzrYtFfBlat4y5pyPTbU3DS6uMHbCZBo7yz5893yeKnAl13hRvs3zIMbeAuiauOstRsaHQiyRDMJ
	yhnrw1EfuB2t11bGdbE98SyjyHyw8AI12pbMsMY4GZyUIrYTFQJTNp6WOjvOrkmZDk34sQuuwjaPu
	PdnqxRAlT15FXeahaeqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3Fc-00000003ZrZ-4Ap8;
	Mon, 01 Dec 2025 12:43:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3FZ-00000003ZqP-49LO
	for ath11k@lists.infradead.org;
	Mon, 01 Dec 2025 12:43:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1B5c5g396689
	for <ath11k@lists.infradead.org>; Mon, 1 Dec 2025 12:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OpaVvLRzwNyUQHnkwzspQd
	lBGKDEqFvfhusWSTkPKsI=; b=aIRYQvItIVN6H7Rm22Diks4D2bBagGteD4OY9M
	87t0BN05Tv8FwocgB6YkjPfCpa/WCGXBJkMpxNeBw+DAS/AHehA52463Q+zb2B+b
	nULQi+MiWKQsyjmb6jaFoYTyzVJ/KNUyZrjBkupvAwoyoNv+Cj7qzUyrfnO3VhAJ
	RnpDvsMNhyUNgniGK8tbR28JbeWpaWObLySCDgFAPsp26mSByJSnbuxDbXVJ1jl8
	YylXM8wkXvP/wM0BHaZlwXn+KY1Ytgi8ebTfJYQanaSOdjtsO1OImbkHT4hyAmd6
	xS78+yNi1iaZELj4eZBEl5bUaAmhkuE8RFo3i2x+Z8Ehc+Ag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9ug08fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Dec 2025 12:43:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34188ba5990so10595683a91.0
        for <ath11k@lists.infradead.org>; Mon, 01 Dec 2025 04:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593007; x=1765197807; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OpaVvLRzwNyUQHnkwzspQdlBGKDEqFvfhusWSTkPKsI=;
        b=PXEE6Zwhog/04gJ+g9VCG64aqnkwCQo5MPIgYeDe/29N4wwHAZ5B+jJ1Yyq5noN6wA
         pwgZT4BKwt3wtaB/vpD2Iy4e6vQTJht9GBMo0U0xhcItkJkfHRyYDciPsoOX/G+Iu0rA
         TAp+4EXyNCPOA7w9gciCFQ9xdsvGabLOmUinAi4cjfkMqIKcMctF3TJHoKm6ZxmBg0Mx
         qBAQPKjYMKKq1OPdZzCn2sw/zeAFaYiwiPlHjnIDvMKZl2vqfkTncSF83rCy2zld47Tp
         hgwuaO/h1bwQe2+cR9PzuHXAjjK7xjWjiV/7UQBjQ90dGDDTrC0h0ZQG54OTrzgjiQgb
         l8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593007; x=1765197807;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpaVvLRzwNyUQHnkwzspQdlBGKDEqFvfhusWSTkPKsI=;
        b=crkD52Thf+l/4EnK6R1X6ww1dwkqdBoeoHumWyfjNUE721adNpTeVUBJl+2OB19bs9
         eG2IGpUhftkoFK+V51lAul2iXcEVj/g+2rBWJ23HeojbU5QD529o+yiOD38vlnSPbhNf
         DHAunr/UcgfsZA8D0AgKvyi9VEPWeNRHZ2QWl7bmPKy4JTdO0Amqgm7YWfsk8akfx1q2
         4epBbDl9oDy1eMShPvfLexraUWS4f0lg+Aw62QjVy0bc4Hwl/wFF5G+VnSukpNjDOlfV
         ltYniIer8oVO1+4pb0My57ur8mPRTRcqPnXRc+3mi6Z1hAPHXpF6CnQcI9TeOn7mXtg5
         RXmw==
X-Forwarded-Encrypted: i=1; AJvYcCVaAtQ3mqeJGK1RBUFSj4P9b332RaVTxO/a0hMD2CwqsE2Ezer7E26rmpkreWDLvoy2j+9lXYQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2uU5EfL3YvmI8Di8K0LqjJ+TJZ9nximQUbSFp7MrE4MM16Z1d
	sQETXcH/NeSVPDolKfFaa8gIA4zsS5gnztCQuFONYAgI173TDhVT51mju0YWjZTApAO43LsBRfe
	s1rGkWk54U3O4OaMp7EvzfGJguj8BBNbb66jXvJfFo6RkZ9pVx81BRGbv3mkzdUGF
X-Gm-Gg: ASbGncv4KYN2VRLpQdz+PtoeOpN7IPs4zKDCAGmrnCBLXTFgINuc0d7YZixyQp7bK7M
	HqBt7TOr3ER1hNQod3h9j0b9EIpgozgQ3ywHGQp336w3mo1jEN0YX98BH31NbpJEqjiWagDjxOU
	cQPEGS+61F7sezKwu9JtJ7YjMXeCNgITxIddVrqwSDoDHqY/ScrsOHz4zA+f7XKdAU+S73QqxJb
	AHiKNIedVRFoyjoATBR0ycqHnVCcvc4XnEn//sINtkCSW5Eq4lNnoaGQUWHg8FfQsIYcWC0tdBG
	jR9AWmaDIEqM2d3FoahTJs9AVCWFuAvRhysSYRKVI2eXM2mQwyQJd7liR4feo3z8ATnBjH4T/hm
	Z/uWxKqWmadU4c+dqeM6F2E1pIekhKKL5657jHgEGvRB2
X-Received: by 2002:a17:90b:4d8c:b0:340:f422:fc76 with SMTP id 98e67ed59e1d1-3475eacec4cmr23965821a91.0.1764593007418;
        Mon, 01 Dec 2025 04:43:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEv8B/BJPSnkWjiTMb7xYIiTIMYZhhsAalx82O1NZpK1LC5SmZOTri+p5+kwNW6kRi3n2zqKA==
X-Received: by 2002:a17:90b:4d8c:b0:340:f422:fc76 with SMTP id 98e67ed59e1d1-3475eacec4cmr23965790a91.0.1764593006781;
        Mon, 01 Dec 2025 04:43:26 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b733381sm13146374a91.12.2025.12.01.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:43:26 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/4] bus: mhi: Fix broken runtime PM design
Date: Mon, 01 Dec 2025 18:13:16 +0530
Message-Id: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGSNLWkC/x3MQQqAIBBA0avIrBNSEKOrRITomLPQRCsC6e5Jy
 7f4v0HFQlhhZg0K3lTpSB1iYGCDSTtyct0gR6mEkBOPgbZypZMi5si9NuiUtFYpDb3JBT09/29
 Z3/cD48F2Gl8AAAA=
X-Change-ID: 20251128-mhi_runtimepm-f7aed52cc557
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593001; l=2451;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pcAmflXBLmmiVoJCOG8vI54ZlYxumcRH+gZ9quI/3uc=;
 b=slzoUkXd0LXre+U/uahaSU6CBfrkxDBvVi4QeGDQK13BAyAiueJULdaXVh7J25NweEqG9OK2p
 erBF5E42uRMAb3WmzCyUihVee/TDBYZ7B1BllpmT06WpiCHrcGUQ+TJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfXyIw4MVZmLQEH
 Zck1z4hbLSSuibGShMN92k/uCISB4N8MFtfChtNVUpFxCYq8wQa918wlH6o6XP5oi59RHAgAETU
 Yg8Ttf8IApVfREqiP4vbWGGXKzPBl0U41207UqVXb5BkbnyqJAU5W7Sr4BsLmL7PDa/JZnMK9Fb
 I5l/JjgUqkEVaAsWRGLgTCcq6oXGZzRJQoDlCPh+7dnS/Xip86vJ4Vx6wYbCv26m27FRjXJInHC
 NnpNddqtTQginA2HXvm6GdfHGpeaOYjEfc9OgY4xL0EKmzZ/Eu3hFWZphdYyQjpQc6EP3PL/8Rx
 EGKlaR90d5uLvltb8PX6TqqG1LvZIvVs7cvr8ONr1Wx6ge8YkMd32kXb8P+DeOKtpldQKubV9LF
 Jy8lZ9/UhFraUNBO5TX4d+tuGBOpnw==
X-Proofpoint-GUID: R6C9vGXDrBXzF7LPOzNzvb3XzKWWlcSa
X-Proofpoint-ORIG-GUID: R6C9vGXDrBXzF7LPOzNzvb3XzKWWlcSa
X-Authority-Analysis: v=2.4 cv=EunfbCcA c=1 sm=1 tr=0 ts=692d8d70 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Fm6EAR0vVewXWd2bb8wA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_044330_151820_1CE9576C 
X-CRM114-Status: GOOD (  13.19  )
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

The current MHI runtime PM design is flawed, as the MHI core attempts to
manage power references internally via mhi_queue() and related paths.
This is problematic because the controller drivers do not have the
knowledge of the client PM status due to the broken PM topology. So when
they runtime suspend the controller, the client drivers could no longer
function.

To address this, in the new design, the client drivers reports their own
runtime PM status now and the PM framework makes sure that the parent
(controller driver) and other components up in the chain remain active.
This leverages the standard parent-child PM relationship.

Since MHI creates a mhi_dev device without an associated driver, we
explicitly enable runtime PM on it and mark it with
pm_runtime_no_callbacks() to indicate the PM core that no callbacks
exist for this device. This is only needed for MHI controller, since
the controller driver uses the bus device just like PCI device.

NOTE: As we have dependecies with other subsystems, Mani can you take
these series through MHI tree if other maintainers give a ack for this
series. To all the maintainers please ack to this series after reviewing
so that Mani can take this through MHI branch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (4):
      bus: mhi: Replace controller runtime_get/put callbacks with direct PM runtime APIs
      bus: mhi: Remove runtime PM callback ops from controller interface
      net: mhi_net: Implement runtime PM support
      bus: mhi: Fix broken runtime PM design

 drivers/accel/qaic/mhi_controller.c   | 11 -----------
 drivers/bus/mhi/host/init.c           |  1 -
 drivers/bus/mhi/host/internal.h       |  7 +++++--
 drivers/bus/mhi/host/main.c           | 23 ++++-------------------
 drivers/bus/mhi/host/pci_generic.c    | 24 +++---------------------
 drivers/bus/mhi/host/pm.c             | 18 ++++++++----------
 drivers/net/mhi_net.c                 | 13 +++++++++++++
 drivers/net/wireless/ath/ath11k/mhi.c | 10 ----------
 drivers/net/wireless/ath/ath12k/mhi.c | 11 -----------
 include/linux/mhi.h                   |  4 ----
 10 files changed, 33 insertions(+), 89 deletions(-)
---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251128-mhi_runtimepm-f7aed52cc557

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


