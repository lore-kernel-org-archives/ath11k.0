Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B121C35FF1
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 11:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b66c7trNFzZoQyrgHszRHq0+mVYbdCkWT7Z8WHwPyWo=; b=cgUkMv4bcWDU2yOdfuU+WvFvJV
	R/eB8xy3eob7sV8nev6CpzCqDzndry058zkanz2jVWccLckAhe7VFnX7gAasccJobTY/LjdqOxrjo
	twF3HRdmit4MTvcll7XyI+xWw2tygEVf5MuTy/Na0M1Q0RSyuvyxYiI5pRxARaw3NPXseshftBXmu
	qiN4qZoWn5UDdiE+KcG8pjY1RYMpywn/7WDZ1YSIwiQhHd7J+yp9RN7+UOO6PVO3q/eJ9J6rW588k
	UPqCpWjEy9gF7fzaeVtJIZ9THaxCUzGiGvcFvh5SYJk4cD/j7V0GAcTxMCDiR4MRxkFl8pSwFfMw4
	t8y15D0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh2O-0000000B6Lg-0bHu;
	Thu, 13 Mar 2025 11:47:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgwC-0000000B4bR-43Oj
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 11:41:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D9K3cQ027310
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b66c7trNFzZoQyrgHszRHq0+mVYbdCkWT7Z8WHwPyWo=; b=Eg5R5OUdQy8jNCEN
	0VRV4pCIdH2ZAv4vYoi8UxipxY+HxxUIvBIxlkFhfNyJLpZ++iaUASj9L7nnAKuk
	9agqdC9uTJnmnfiTgx8boHYqwtafRDLhGII1MBBD+Cf46BUB/+L+8cXelXc7tUCh
	0gB6G+j1Wo55WTPJZbU2JGfy7tlR0MMWMeS4qtBCqGVz7oOHctsA6KQQYS9nQJT/
	yM5UWOizBiQo8K+5Hh54P0xzQiCBHLiyBL77UxjHcjUSvlWX1bNMGnltvV0drNT4
	ntTGelCrpYvOLN1wKu+yDx+i5bSt1j02XN90i4+GJyqOqItDeCVBWyj59vcN7Ek/
	RCdQZA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2pwph7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:41:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff581215f7so1566290a91.3
        for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 04:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866079; x=1742470879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b66c7trNFzZoQyrgHszRHq0+mVYbdCkWT7Z8WHwPyWo=;
        b=kTC1sM+XeMzmPy7r1QojP3JC/QpkSCvx3KZK4uEPYjz0DpvAtr5dUOIgrUXSIxA0qN
         s2uAGYfTpGHxRV/mRSPL+L6KryrLMp8ZkQSegcsIAZMapxH/P2k5f6BHbNtM6YumscNZ
         NuvdTkfNAcWe3prIDL09IHMyjUZSSxZI83/iOF+FSEm26nxevhVkihvC1TiCO6PAFAXX
         i9DgEVeNT0hbpoN5Z7JJDCJFJOOAOioSykyGdLA/GVG95JkHUORttkPDAmQW/ySwURpx
         9cMojVTFmG5zWWcXtADH6Tfch0YmcucVXROOi5f4ZJvcyqH26BHHHEjxXyYdlW68M1Cx
         ux/g==
X-Forwarded-Encrypted: i=1; AJvYcCW05adHjdyiIbxahDWRf4jHFhL2XqUwYC838G66Y3guRBzISsAijdTFrg9Uc2s5wLX6ihzboxs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvpSb0PLUaYFZSeMS+YZOqFSUy1FUgI8WV/1igby3GQ6PW0iwQ
	jC0Rm2z4s4fxRxl4rkGtBwwTrr2SYTDYYm9BzpxFk4lh3z9Ge1RNVE/Ryav6IkXDq9fI3cOmCnc
	rLIdDR1MRyTdsSbt526dgXTKyXZxrDoCBKCaIhyY65i2i6h14ovOTDT0KjKUF
X-Gm-Gg: ASbGnctokqkkKV4TiWVZBOcc3FAD6zrf3Y8cjMycEx7612pBoBmuSvzCoSdSdqmHxv8
	+CeiWaKzmvRD9oMTabm4mCYANK6ZdIblg8aWGsPZfJ0qMFDTjnvIAvngfbPXzFPVqo/U2ejyeam
	fnrLHT/+Dq9wl01MG2Lfzy5a1LDv5M+aXH2eGHlFNIt+hSWWVmLYyrePpKVqIOf4w9MtWyxE6RL
	gfU64d4Z2QWp5FZF/6r3ikzGA6jMGUxBumVBpDfS+9O/QDD50hY1c+/FooxqinLRC8q3W6d0BdA
	d89Lb+o++47a9tv0xgrSKvJdNNv3V2eb3yUlckGflwCc/9fSuSY=
X-Received: by 2002:a05:6a21:150d:b0:1f5:51d5:9ef3 with SMTP id adf61e73a8af0-1f551d5a599mr32029779637.20.1741866079472;
        Thu, 13 Mar 2025 04:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyqb7Zqga/alnBVVjkfYTwBJb/FL7B8cMycyybsa0F6n3AwQrzJM7hwVPKpY5cioC6dQOrZQ==
X-Received: by 2002:a05:6a21:150d:b0:1f5:51d5:9ef3 with SMTP id adf61e73a8af0-1f551d5a599mr32029748637.20.1741866079107;
        Thu, 13 Mar 2025 04:41:19 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:41:18 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 17:10:13 +0530
Subject: [PATCH v2 06/10] bus: mhi: host: Add support to read MHI
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mhi_bw_up-v2-6-869ca32170bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=2486;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=nMXDxyNhjI58pEdLUQqctmcAdSRLINO8la+ypV3eSj8=;
 b=IQFrsWjbiSFkhhFBnz/9ECFoXIf7GbLmM1L6/nMA8GY8bq3hdf6o2GCxsl0IkRddYfEnufKMF
 7l0la06C7++BPXkI71ClW+XSU+tDbkr2gtqK0EIF/oHROpwpoeEt/nS
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=P506hjAu c=1 sm=1 tr=0 ts=67d2c460 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8tVK0NU1EB3xojDYR3gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pwA9WqqgxTpdy5-dAzsAIMjh5D2A8R7W
X-Proofpoint-ORIG-GUID: pwA9WqqgxTpdy5-dAzsAIMjh5D2A8R7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044121_017970_4D83AA47 
X-CRM114-Status: GOOD (  14.99  )
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

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

As per MHI spec sec 6.6, MHI has capability registers which are located
after the ERDB array. The location of this group of registers is
indicated by the MISCOFF register. Each capability has a capability ID to
determine which functionality is supported and each capability will point
to the next capability supported.

Add a basic function to read those capabilities offsets.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h    |  4 ++++
 drivers/bus/mhi/host/init.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index dda340aaed95..eedac801b800 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -16,6 +16,7 @@
 #define MHICFG				0x10
 #define CHDBOFF				0x18
 #define ERDBOFF				0x20
+#define MISCOFF				0x24
 #define BHIOFF				0x28
 #define BHIEOFF				0x2c
 #define DEBUGOFF			0x30
@@ -113,6 +114,9 @@
 #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
 #define MHISTATUS_SYSERR_MASK		BIT(2)
 #define MHISTATUS_READY_MASK		BIT(0)
+#define MISC_CAP_MASK			GENMASK(31, 0)
+#define CAP_CAPID_MASK			GENMASK(31, 24)
+#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
 
 /* Command Ring Element macros */
 /* No operation command */
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index a9b1f8beee7b..0b14b665ed15 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -467,6 +467,35 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 
+static int mhi_get_capability_offset(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
+{
+	u32 val, cur_cap, next_offset;
+	int ret;
+
+	/* get the 1st supported capability offset */
+	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF,
+				 MISC_CAP_MASK, offset);
+	if (ret)
+		return ret;
+	do {
+		if (*offset >= mhi_cntrl->reg_len)
+			return -ENXIO;
+
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
+		if (ret)
+			return ret;
+
+		cur_cap = FIELD_PREP(CAP_CAPID_MASK, val);
+		next_offset = FIELD_PREP(CAP_NEXT_CAP_MASK, val);
+		if (cur_cap == capability)
+			return 0;
+
+		*offset = next_offset;
+	} while (next_offset);
+
+	return -ENXIO;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;

-- 
2.34.1


