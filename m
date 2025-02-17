Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DCFC021A4
	for <ath11k@archiver.kernel.org>; Mon, 17 Feb 2025 06:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b66c7trNFzZoQyrgHszRHq0+mVYbdCkWT7Z8WHwPyWo=; b=j4D7gW0wwIEX18m4EA1+HKkto/
	BsPFEyTYYUaI7Y4gwJBcNppKn4dlYcsH6onwHe8JBg3xHzn1vwEgpQXQAhX+b/dVW8Nb7Rhiz+wv4
	kx1352auCCnFqpH1WvQHu3sZe8To3SHfLiuQMTRCwU9eZ3S2Mq4yju/K8dv0TXruxzQE9BrASflzf
	0OgnhXdO2fCQWJzZyi+FysiT9GQ6Dj8uZHJ8oua7Ht6nxgcIVUYw2/I3rplPjoI/ovHi/gUAqoJGs
	rG3A+K7SvNnngbCIGJmJ3bJvdko43Dsccof6bXsTrv+GMymnBGtA3QuzvGAbcyrNa314qRtzGG8CL
	E9YzCU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuiO-00000003Uog-1fYa;
	Mon, 17 Feb 2025 06:34:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuiM-00000003Umt-0UJp
	for ath11k@lists.infradead.org;
	Mon, 17 Feb 2025 06:34:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H04AYf025290
	for <ath11k@lists.infradead.org>; Mon, 17 Feb 2025 06:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b66c7trNFzZoQyrgHszRHq0+mVYbdCkWT7Z8WHwPyWo=; b=Sl0iAd/MnSjsbO6p
	RaioFwWYm6cYTh9hVO6NZl4cDpzwKVbYGPcXz5j19NjL7sqRha4E8hlm1QIa+HWJ
	WWpRoqNnY+kQ+la4rP57zDUmBIHXB8vRrCxLhaT1BUXAw+lXaOY5OEFieaPZMUjc
	3qQByfSPIONTSoYGZSZ3RYb1f7vUlvXSoTW5QtZnvU/HXvaYCpD9NjTn249AsZeC
	77YIsVY/ixRcluhKjgpn+CxTbzMw77aMrJj3WCEcznNrCOXKPo5Xk4qm4LZGzgdK
	1m/kpI3vFPvrkd7bWJEwd2HSgvXlMf4RQxkZ0bgqcibSlSkj1VMgp3iMrKyOrZKq
	FVKQGA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7vgpm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Feb 2025 06:34:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso13507157a91.2
        for <ath11k@lists.infradead.org>; Sun, 16 Feb 2025 22:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774085; x=1740378885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b66c7trNFzZoQyrgHszRHq0+mVYbdCkWT7Z8WHwPyWo=;
        b=nooxhqyMBmSieQECONX0x6jg5lWYh02K/iuZxjV0fNFx3iGoi+6w2ZqcjxrMRjt15v
         QeKxyCkJfnSeU+rchu/F/3J2A/8T3j2+briBgkU3OJZpQ9Sk4v33TwOGlcZU3zE6sPMP
         +rHl8JHcSqgJR6FEGrSg/NS4BTeV60XtMom6mfQd0Cfbfpr84RGGKQNL4nWcFG/qYVoM
         I1gYtrBu3pZDPNYzAr/RUY+NUybzFbMG3bUVzbFfcKcjdXxkYCiJPY7/Hj+KjvllH5to
         5/yjiNN54Ey1pOeKsphMlg3HeTv9Vbr6dt2TxCS3WmMfZab5J/+XjAL3UqDp3WPCVeef
         2xTA==
X-Forwarded-Encrypted: i=1; AJvYcCUqUKNPX2uB8wK77eddUpzfPC/wv4B6rTDaCQul4H8S+mBmgZxQ7tpDvNX6yitcJOd91PmZAzw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMeDlslVL2m4JzsnCNkVMjmev92o3Yb97fpS75HS4yF8oMlEO+
	j5WYZ+q++WtmgcOhqyG6+K4lkQ7fozPeZKlQganL33BZYlKRLKVNpN9OsDn5KBxY7E8Fj99esJQ
	oHBa48hylM1SLqyK4fgPf1cgIT5DRZvPkxiGFZCLx9sN9xbRV4TieQF1dqboL
X-Gm-Gg: ASbGncv5edYaRdtqwjBazZCzfxLP5kkDKw3JLz43UpDeHRn1o/iMp5QCaVq1BHGlnpr
	5NLAN7gHsLK0EA94fUQmq5tSi70+tP8OD853dw8hLbmjV5UTZAuUlO/aHazRBx6VwZmPKtKktiq
	kp3fUxTTuA0h4O53d0LFEN1ANBwPfTsctpTT7H4ZExaqup6pExqdKnqtJ+3F6KNBPcCEyx6eqH3
	0+PmO+TABKCx93D/8i+OvZ/tYsQC2lVCCQfYwfMYuVEiRoafGm+DENvISBVqS9hb9cneBI4Gldr
	TOWLmRIVZsftOaOdy3+/x5lIYHJAym7yGedHYNMC
X-Received: by 2002:a05:6a00:3c84:b0:730:9a85:c940 with SMTP id d2e1a72fcca58-732618fa927mr13972164b3a.20.1739774084846;
        Sun, 16 Feb 2025 22:34:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IET9NqXu9YhEF4OUJJNSE1yb6BAX22gJvAdfV1pFSU2HIsvMZxp0MWtpRcG1/tuk9BYS1lpew==
X-Received: by 2002:a05:6a00:3c84:b0:730:9a85:c940 with SMTP id d2e1a72fcca58-732618fa927mr13972118b3a.20.1739774084409;
        Sun, 16 Feb 2025 22:34:44 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73263b79287sm3771800b3a.29.2025.02.16.22.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:34:44 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 17 Feb 2025 12:04:12 +0530
Subject: [PATCH 5/8] bus: mhi: host: Add support to read MHI capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-mhi_bw_up-v1-5-9bad1e42bdb1@oss.qualcomm.com>
References: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
In-Reply-To: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739774050; l=2486;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=nMXDxyNhjI58pEdLUQqctmcAdSRLINO8la+ypV3eSj8=;
 b=MQ6N/YxmXdZYM/h4EXUzjf7ED6A+e2TCUQqHV1U9ZjjlxWMDTUC6Zyc4oEzb++zTAGffYYHXK
 JcJtOZl/Yj6BrrVo1R/a0YARbkQE2A6ijYMZGz/E1wb3DcClbyjOwF9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: dra2V8za00ClkRpungfOrYrJU5eQ4xYF
X-Proofpoint-ORIG-GUID: dra2V8za00ClkRpungfOrYrJU5eQ4xYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_223446_169129_F0DCC46F 
X-CRM114-Status: GOOD (  15.69  )
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


