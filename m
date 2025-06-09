Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ECBC5B552
	for <ath11k@archiver.kernel.org>; Mon,  9 Jun 2025 11:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tq24Wrli2Qp9Evrio+qi8qkO57cIWgh+60vTcG6QRNc=; b=T4tM+4qN4pwrGwwqjyt0FRzW50
	dESMBvzOFveWjZroZoOrpAvSIg49dLvpQNhvVhUd37hhBJGSQ9slJhgizX76g4oOqasOvE86N3I4q
	wYShqrlI3OxczflD9m+zS4ZADAAeOJtZnEHAmm8MD1R1dmpdRDqo/PIJHJnXtqX1IR6txCWr22I4/
	0qC+sqJL+pvCxhAoaNCwJgQhHdI5RBsFr8mIbZ2y9TAlwDKmRsmDHEPPUgh9iLVVEC2pmey18bnsf
	4fATCeyIK2EP3efDUJS+csjOWNkKNDxAAJEL8a3jmUKElOmV0o+Lc/kufKtbLxb5MNiypKq+u/QZs
	8BQoLT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaSs-0000000406M-2jin;
	Mon, 09 Jun 2025 11:14:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa6q-00000003x2F-44DU
	for ath11k@lists.infradead.org;
	Mon, 09 Jun 2025 10:52:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598OqtF000710
	for <ath11k@lists.infradead.org>; Mon, 9 Jun 2025 10:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tq24Wrli2Qp9Evrio+qi8qkO57cIWgh+60vTcG6QRNc=; b=MpKYz8voCd14SNZk
	b3H4gwBUmyxfECn4zVOKUdcz3fDqCrVXIeT/2zxj7AtaYAR8A9SRcO8dl01gxUWD
	Pv+jPXtvPEF0pyxMQF3ZRX6e3tRuMBAwdrOsbo7FW2qyhwoCTEq0wfTs+zlYwdla
	fyzHDyhtojphon9hHzFgpIbw3wy1P0lrt01F2Qb6JtKdYkIglJgW53B6s58FMcsn
	4EWuhMpKT9csLJeUe3vUyaKcGNUuD+v6ZAfvqKOeTzyF/YjnlcmcsvW1JvC2/mAQ
	CF7Ozxj2TBIxbtWWVPPk3hS3lTXmzMciAJK/oD/AZf2gQSqXsAo+nHjvBqehcN5h
	LzAlAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2t8g3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 10:52:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e7550f7bso40698155ad.3
        for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 03:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466327; x=1750071127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tq24Wrli2Qp9Evrio+qi8qkO57cIWgh+60vTcG6QRNc=;
        b=uFAgov9MbV7s6yRXWi+zjMoyFoBA4wKhKf+LYcOLObQCvX31NpAGgSxWp/zdkTNomf
         +Jimhkze32x4NjvMm4SyBZYXTvynUDGifCEjpJDWMN2mRIfCXrtRUZVJmyoY3Vv2xRsI
         QkZphZdrx20ZETCLpP9YMxujIOMeUMcAta0CtFik8e/h47oKlMqcGBVzA4/rXFIhgB4w
         Eg+wj8wSnseZ/n8g3Ud0pTP9+nMbpZ+3A6k8DoS3qLw+5L1GjzJPB3/HJsSAURtI+384
         GITIgDlBV8/KsaAVfIQ4F7UoL8uk+PguNTqePj0Ar1aqYEL7w8GGpRh6qTJlktROuK9r
         UjRw==
X-Forwarded-Encrypted: i=1; AJvYcCV7ohW7Zedl5GYI1VGHooVBWMAra0+3pAbyOu7RAN45/c+VAX+OcfTZBcBpSiDUCbz+1C5vKYw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDutPNMxsjB9XOd8iyd1BCg5a4KEbGZ7wde11WE9veqQPt4kO4
	W0GG0DUCbQkZEjEKPcKMU4lfwTPKlO0zqvkb/8cjV79qBFIvJE6zKpoGtQuzgb3HPdUlEoU+aqd
	wAslHFKhlohKbWDDHC72/oaXaPBHXJq3lPI80W3MiYdH8QapDz2fCZKLPSJ8wIhYk
X-Gm-Gg: ASbGncsyJJJeotTnnehj5x2/HUuxvzinXyXUUr5sRHhzGM4IeRXQLR3R/OYqwF0taFI
	24c/gD5FnOVClaw1MIC/kdEgvujGysn4qsIi1YJ8T4JEyZ7OZ9CrME1bRHUbGK+Ci+edArLavH5
	YLP4sawepgQBhETi+cBYQscDYn/ujBynqnbb+7K1Tld71TRoHeEN/XgqCRrSIzHkWeBEq5Juq/F
	iG9uxwnFZQgr1hT+kEdqcQDe9UM2rKhMxgIK0AIRREcqJi0JizkAV0Jvj68FWQ1orRR+Jq/J17F
	zA+5QHLTZyJ0YmY7FEznollI3nXDE3oxa/cvqqClhLO+gn1dxNhBRn4veA==
X-Received: by 2002:a17:903:228a:b0:234:986c:66f9 with SMTP id d9443c01a7336-23601d2485dmr182543795ad.22.1749466326747;
        Mon, 09 Jun 2025 03:52:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDh+coUuKtWGJZpFtogDmaKOAu2e7dpBqqLmg6/yIehhTMpFOXeREwgQnJUjxOnFZLxpXf1w==
X-Received: by 2002:a17:903:228a:b0:234:986c:66f9 with SMTP id d9443c01a7336-23601d2485dmr182543445ad.22.1749466326366;
        Mon, 09 Jun 2025 03:52:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:26 +0530
Subject: [PATCH v4 05/11] PCI/ASPM: Return enabled ASPM states as part of
 pcie_aspm_enabled()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-5-3faa8fe92b05@qti.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
In-Reply-To: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
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
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=2258;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Oy5xhLR0GTbxXIyGSehq2C1m7jHsrRB+NLo3OFoCcpU=;
 b=FsGVVNU4bBpjH/bLJkqhzBlwA7pBTdKA29oGrWjW1VZGoNcZ5tmxRnyiCdmxxfmQ0EcHrbZCt
 jOaYiPUbZ5RBI4TM1CIEZmIONqihPCbrpnBazbboLIEdYWTK8S6/0Zo
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: MJ0yWUs6cxzfQKg7n2dcFGNrCyY7Z1JN
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6846bcd8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wuQQqu7ThqwHlQwkt1oA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: MJ0yWUs6cxzfQKg7n2dcFGNrCyY7Z1JN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX4YjhwwIepz7B
 vU5oSa5Mk0exUtgEAqqzYshqrO+Fj4JQq2BGBwR4+U0G/W6cvL6RSLDbRb3vT6ZBTdlXAYpjqgK
 2DHKFNqBS50yR/XNvU4PxFVLJR/3Ht6DCzIho/3iGnOT4L9u7/FCQ3is1lK+L8NxyBkbs1fWO2+
 Y6wABoS6YKdyWznWn7RpPoU2SKu5esPKHDI0ebyj+/nEW7lt7DTP+bxOXxMCVRgfAwe9JJfFFfY
 KC8R6oNMj48SFHgxLmSv5qiJEbJSLrxVblT1BACA171ANITfyPSqR1aaC2e3Q4/K4NdFJ9FRLRx
 s9fkYx5rg0Jh5w7WpM24iB5WArkQeME6kokZRph+85Pgi8u25JYao2enmhjroUztM5TfaVJilzd
 xezxMmZ3wKbweXLM5tkLcZt33KDkNPQ0c1Jq6Sj6JarbVVXITDm3hAwIsibNNNN18qNKoDph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_035209_130908_DAB54153 
X-CRM114-Status: GOOD (  14.68  )
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

PCIe ASPM states can be also controlled by userspace using exposed sysfs
entries, if drivers wants to disable and enable ASPM at runtime they
need to know enabled states for correctly enabling them back.

So return the enabled aspm states as part of pcie_aspm_enabled().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/aspm.c | 4 +++-
 include/linux/pci.h     | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 29fcb0689a918f9cb123691e1680de5a1af2c115..94324fc0d3e650cd3ca2c0bb8c1895ca7e647b9d 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1555,8 +1555,10 @@ module_param_call(policy, pcie_aspm_set_policy, pcie_aspm_get_policy,
  * is deallocated only when the last child of the bridge (i.e., @pdev or a
  * sibling) is removed, and the caller should be holding a reference to
  * @pdev, so this should be safe.
+ *
+ * Return: Enabled ASPM states
  */
-bool pcie_aspm_enabled(struct pci_dev *pdev)
+int pcie_aspm_enabled(struct pci_dev *pdev)
 {
 	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1740bab514b0a9a61c027463a1fb154843312a22..cb703443290a013c8372333fc8d547d190d9f3b4 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1848,7 +1848,7 @@ int pci_enable_link_state(struct pci_dev *pdev, int state);
 int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
 void pcie_no_aspm(void);
 bool pcie_aspm_support_enabled(void);
-bool pcie_aspm_enabled(struct pci_dev *pdev);
+int pcie_aspm_enabled(struct pci_dev *pdev);
 #else
 static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
 { return 0; }
@@ -1860,7 +1860,7 @@ static inline int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
 { return 0; }
 static inline void pcie_no_aspm(void) { }
 static inline bool pcie_aspm_support_enabled(void) { return false; }
-static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
+static inline int pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
 #endif
 
 #ifdef CONFIG_HOTPLUG_PCI

-- 
2.34.1


