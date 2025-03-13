Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902FAC35FF2
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 11:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3zJCrBTVQCy9dIu5GFnMtWwOClfbTclT70zN522sBM=; b=nxvVTAZoHP4ydZpwWEfr0bFljQ
	sAZ5dy/ERG8y6f2MW4ZuMZ3FkjRK+p+HW5dbVg7Geb1ot+co/ggJb8jA1KbTwVRGyrrrjHbeVXE1S
	TLUU8mxPQq4GrWoR4bMUqvS0EG4hQD6cZDNeZqt54pN1r/YUl6fphFmURBtMTFFWACXjfPJcmspQD
	07EllCZ9/8RFEwqOysnVyiiqTxpDAsBBwOfPsq4nojmYtdsrKEKiT5L0hm2ElmqVOMBR3aC2CAH80
	2Bng2Of7/kbDSE16oafWKgeU7pHlVswWTh1RquMIquWxDXturHm6psz9ahy/Kzt45HQ7oWk6nQNzB
	Xss6+rBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh2P-0000000B6Mz-0QVl;
	Thu, 13 Mar 2025 11:47:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgwP-0000000B4fS-27RN
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 11:41:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D7RYw6022547
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v3zJCrBTVQCy9dIu5GFnMtWwOClfbTclT70zN522sBM=; b=cDV3EEl6LHcI+tEE
	nYMOuLEt4GrTFu9SKJ1fzC8b3NXiINfTHNbTONXbp9y59vpYsMvHiORnw/t43dUZ
	IMTqFbtxNqZ16inMGFgUWUkxTXOcphj8l/G5Up4ymI8oxBs0SLht0rCNTINqNcz4
	5EvsiCJnt7lGciLVGAYLro0IunvqiaLhgZB3awsjWbe5ecIkia2EUM60mQFwA5ef
	9dgoq7yz2Nef+7VopwENJvkebQDOAvLSyzwTuWWLjiLl5OcvPU3ltsa0VesyD0k7
	M6d6OAH0mtjCWxZcpi5pAheV7crU7/uYKyncmMG00NWW2GY4cpKaoT6WOVa1lb/q
	OQniLA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bu07gq6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:41:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff8340d547so1579654a91.2
        for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 04:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866091; x=1742470891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3zJCrBTVQCy9dIu5GFnMtWwOClfbTclT70zN522sBM=;
        b=rATA0RCq7aSE6LY403CNqpGEUuyLeuPFbaKKAOlV2SD2mvbn86Hc/1s7HNATVZTCza
         BBFa2dVubbaS18KhqukeyvwR2ZcZYnQxVmMDKoxLAWQiyIvBbdQnR+ccF/m6pevcvTdp
         u3/7gU4vjX8Dk/yaFHmGSySscqpoK/dah1iZKcJto0z9FgnBwy3DMGTbNLLRJDrWaKcx
         VvtOa4tXrEH4qYsEtT34zbKMWsGsrdBb1LEW0StQEpvRbizXr1lv8+i/uNwoGL3YlDgA
         oZ5IGJ5u5s5f1TcAV+Jvkedq+oKFAPPYrZqcFQqL3vRQRiBP6/EAyh4PxMz3mYSffbcw
         rD3w==
X-Forwarded-Encrypted: i=1; AJvYcCV76lJpBca88V/BUEvfjOpdocGG4p9uKzYc2haR1uAO7M6Pz0PwLHVvP9hreQVKdBBMJq0ZIUM=@lists.infradead.org
X-Gm-Message-State: AOJu0YylyjT4x9uCS2Kk50XZEch2pezZvXi755BPgTcKRqA7yJWdgV7+
	sB0dg9h/EIhiSpQm3iZ1mkVQhZVDsACr1NOs/vw5KEded4KY9U4j9iCOKPN+fAROveVhth6iGpM
	OMTp7BqEPQ2n2mYc08/D9Cr31JhDi/VFmz0iC768dpByrEtWeoAALL4Yl8UdJ
X-Gm-Gg: ASbGncuqUz2H4wBD37OFsdaKm7EP8bbiczH4EDQvKdXM1CxOVNDKv6diw02wHldVW+0
	v2JXZSDtkgWLiBDrd4u5Byc6Bt9zbNlLIoPdxZm71Dws87AOBCmHLSkN1zkLneuTFQl45kIKRmx
	4jwxrGzRFYIn2nGv1V+q8bdP+NePC9V7RHX7YtV720ytidm7FMrG1Uh9lJS+ypYsCqnIy3tqlcq
	mGJ9he/WhxDqLhEcFdGDKKUYp1VjRfdfNpX77m7ngTAq5JY1+FBsZYdVY+npbX9UkaMwEeJqcUT
	TyB1Kng+2Ffe5koc6XJhQJVdPo9T99LF9myBmrADNHkyN9NOdd4=
X-Received: by 2002:a05:6a20:ac43:b0:1f5:63f9:9ea1 with SMTP id adf61e73a8af0-1f563f9a1a8mr30614385637.13.1741866091330;
        Thu, 13 Mar 2025 04:41:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwj3JmLyPQkLsfI6gJoP4XbctAwSqw8uIKw7LM/Ne531+FcfnFHjbrNVL/Xv6msV1+SwyuBQ==
X-Received: by 2002:a05:6a20:ac43:b0:1f5:63f9:9ea1 with SMTP id adf61e73a8af0-1f563f9a1a8mr30614356637.13.1741866091000;
        Thu, 13 Mar 2025 04:41:31 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:41:30 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 17:10:15 +0530
Subject: [PATCH v2 08/10] PCI: Export pci_set_target_speed()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mhi_bw_up-v2-8-869ca32170bf@oss.qualcomm.com>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
In-Reply-To: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
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
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=676;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3/AZwolXIW5cKbAxXRHbs5DefoIovq9yHb7EehF+eNw=;
 b=zKJq5M4CXyOL37AZbNCDJW0CpM7sEda2QrAhkTjI4dHnWBawjVpXTxfF1TYNjl2s8xVzpobQE
 r29Hg6xPtj8CEjejYXzE5f7H2PNfaT2RgMtYA/DAZvsKxlIqSBZXku3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: E-YX-fQXy4XG1rxdcy_yuXir3fEn2yLa
X-Authority-Analysis: v=2.4 cv=V+F90fni c=1 sm=1 tr=0 ts=67d2c46c cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=JOcJ30pghDwnvxMqNTgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: E-YX-fQXy4XG1rxdcy_yuXir3fEn2yLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=959
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044133_664570_AC50E785 
X-CRM114-Status: GOOD (  10.95  )
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

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index b1d660359553..0f4f68c170cd 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -214,6 +214,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1


