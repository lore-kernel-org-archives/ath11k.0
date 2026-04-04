Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0786FE88D7A
	for <ath11k@archiver.kernel.org>; Sat,  4 Apr 2026 04:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IBOjD1SCE/uWKPBO1BDvYmWOu32r5baQpc1YaXyTiMM=; b=r2mGIZdNoqSmubwTFSX1Xq/JMS
	XHmELN2MbPuuwMr2NA12RA3H/xH89+0vWtkezf86uV5OXYjIsLdZn1wdXgcUcU68ELA1nZKFySMqI
	V/B95qt9s+x8tCbzDEAlWJRgoCW8l3W6FZUTnrmfqXJ97O6uArznW+ZWFi4tUAbJOqH9OhAsfZmYZ
	kfSoM55Hc03PzyGAqEHdkS65XsOV28wPpuDX9vA4xEP038PISR8Rslyw9NT3qNFoCy8zH/7GmwcPT
	iNZU9Vg1iKUvVZgH7Yy5sd/jkQCwSBeVNaemUNWORDsZ8iL7mMgR3B14nO9aXLNgPAtvB+Qf+qoka
	YfFX/tpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8sf7-000000036rd-1ttd;
	Sat, 04 Apr 2026 04:31:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8sf3-000000036rA-3e6S
	for ath11k@lists.infradead.org;
	Sat, 04 Apr 2026 04:31:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342BumZ4114533
	for <ath11k@lists.infradead.org>; Sat, 4 Apr 2026 04:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IBOjD1SCE/uWKPBO1BDvYmWOu32r5baQpc1
	YaXyTiMM=; b=Rhra5k4JaJGSlN/R3BdhSADj2gpyni/r1udJO1qbq7DAHk58suk
	dM71Vo4+w3hqg0vYyjM2v7RPAIi4ezwmMMR6VbwNgivDMOPyCRMygOb4oTAX35Mk
	1zseK9l80iIELX2nlFYtWMZGzsL6CiqFkM04Es7KNtscmdiVAmocYhte+hUOWCYN
	HxerNXwnWE7qhqNkS8Ut+u1phuK8ECzjjZkz7bmhsNV2mCzStgMpDoRkDuIxc/QN
	buKrRDyl+Sv2ZTA05wm7YQrB7KrQP2W/LPPLD6/R3Ma3QA6tBWN/ql7zAiVHABDM
	hlTHVj9d1fP36Vw94Xzc6ZCXENTJHxE7Lpg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5r6b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 04 Apr 2026 04:31:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bda35eab74so2792420eec.0
        for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 21:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775277062; x=1775881862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IBOjD1SCE/uWKPBO1BDvYmWOu32r5baQpc1YaXyTiMM=;
        b=FvBp2e9Zhoy8kY48a7nh9ngDR0yfTrvgvIMWhuHB5oNPRgx88ED5gz1nYYQExUuEI4
         JwdbLQ54ikSlS+a2h6jq9kIsf6mZGwJOjHhsZmODnmuS7UnFdrRhdkrcegomURmg4rP5
         ugzz3O0ejiwyv0S6eb9ZknHv9/SXzDxE7eBng94nTsjCjgI78ngA5qGwfDReV5meXeDA
         UgiIwwtPUQE8wqOWB4EkuBmWEKnEUSoyjjhd15owc6al4I+Zji4/Zc//QSlAy8hZJNAH
         7hhYo4eRTMfpr+hZrJt+W1dXb4P9gbH4HtDKirpBXpeu5BziBOtXDjYufmpP3cDASflE
         oUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775277062; x=1775881862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBOjD1SCE/uWKPBO1BDvYmWOu32r5baQpc1YaXyTiMM=;
        b=Bipgcjd5cwir/f5X9tdIdGmu4lZGgRvypm1TMvkpvPAFUDRyq8nE3y2N6H41VhTAC7
         MAO3271ydOrOLorqVCttvgll8V1Ygq0oqqJLXAEy8UqQOZUhy7yk2apwUyT4wg8wwzvP
         TtoLbpeKSXc4O/mUkbtXaxAT2yTEZEKUOBrNuZW0wXGpvZCPYssrQlEwL50DpEDLg7rc
         5QAaeZaeSW2VYp0LApDk9qZWeZi/k6SuTBNBS3GZiK8b0AVtXOJX0H3uFcbGgyJpZN8g
         e+St5W+hq9foVFkl4q60YtrijJVFVaWd0ZOOGIiS1FZDZBY8+rWHs2cW4w4RKNA9JPbl
         erww==
X-Gm-Message-State: AOJu0YxdJ9/bV8g1PMFSHWUo1fI2aVGQIAX3QX0wRsZ+dX1Q2ll8Djdu
	i1WMvPN2YaeW3CKuRF9O8dIKP/QmPvH8xtt0TJEVLmPjigzQV/i37hz9EcZ+GStQUSKuTWvIGGB
	07ZRXuGi/vUcavMI05QAnkIYRV7wDaOy2icHBvt10TOa3d4y4bRP21gp5RdCB+G/7
X-Gm-Gg: AeBDievDbsp1B4/rXE3GDeFI90+H2yEeeL2zcFCu4zVkLzvIs95aQhJQa88e375Whd/
	XUaAJnSrjEpCpS9WrkShh23wx6qSZ9yTro4M24NXFKaXvo71dI/YYTqGi9F3Bgo+Xf7JH2QE1cs
	3bqX0kNkvsGbrlnWZLP1aPcB8i1chXZqTtbagkb4PvEebhtgVeXSZAQfc3Qp/XL5DHTwiRzMDqe
	aOGFMXO+ZPGUeIoF1BWB8pyl2yYMPh7856BRREwf3T/lb/WUkP9oeZSw+piRkHA8Y7ToIpwQNUq
	QP7TBUzYNV7aLbboSw/N7VoexxfyoP6sKzyTeQpDl7I42Y6d8xU03AFTbXFgif7FwpYw6hKZovV
	/K8BPGa0xgJ3CwGM4YhC6eJVTFEcmLS3Gfrbzqz1IFeRvk8uLkJHNz4xdsNLcFzlbixnMybk8gX
	aBlA==
X-Received: by 2002:a05:7022:2219:b0:123:2de5:346e with SMTP id a92af1059eb24-12bfa9cddfbmr2202724c88.0.1775277061444;
        Fri, 03 Apr 2026 21:31:01 -0700 (PDT)
X-Received: by 2002:a05:7022:2219:b0:123:2de5:346e with SMTP id a92af1059eb24-12bfa9cddfbmr2202704c88.0.1775277060868;
        Fri, 03 Apr 2026 21:31:00 -0700 (PDT)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede7f085sm6271622c88.12.2026.04.03.21.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 21:31:00 -0700 (PDT)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Zhang <wei.zhang@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath11k: cancel SSR work items during PCI shutdown
Date: Fri,  3 Apr 2026 21:30:50 -0700
Message-ID: <20260404043050.3433754-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDAzNiBTYWx0ZWRfXz/YM51c1/Lho
 cijS3J0Msg0UBY0Dj217NM7d8sixBCevJHZfRRgtaEBRQKnWF+jYRoVra8fcDHSAs2Acv6nfUjQ
 0mA+ZCLiuTr7uOiRH8oElvVzRI8bnJuNmSHN9ifSQjGlNvMjCHVeNzLp4ZpQPTdepX7kUe66nAS
 l5uYzIUxiOuFS+eppcrLIOn6+sKJWg8zAaFzzSpxUFGfVBsJW7BCIQ7idYLaC2MxkeMhKV62oxN
 GxVHbsu1DZPiDq0XkMcG1I3M7aDEkFFOr7Ur9vWpTjslqwi3wD4/tzt5jaKR/vSoTvAD//SE/n/
 eGVmZT8j678OKh7Ldnqo1MkWzoAGrQXid2z42rSBPZKFmso+VFYrw0cXb4US7LeoIXzEF/HMsVw
 TGJDziu3h6is5yG6MXnvi1lllE/ZRy6JA10FJlv2D3FdAYcL4CSxHwruA+xqmElu/DBcQN/wH+O
 d3eFO4DMksZhIZjHM+w==
X-Proofpoint-ORIG-GUID: n6Urb5FJkIqAKTplEy8BU15rwuPJOVBu
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d09406 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2AV42wVkYpmhdkL2cwwA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: n6Urb5FJkIqAKTplEy8BU15rwuPJOVBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_213106_052439_F51F47DC 
X-CRM114-Status: GOOD (  18.17  )
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

A reboot can crash the kernel if it overlaps with WLAN firmware crash
recovery (SSR). The crash is a NULL pointer dereference in the MHI teardown
path while freeing DMA-backed MHI contexts.

Simplified trace:
  dma_free_attrs
  mhi_deinit_dev_ctxt [mhi]
  ath11k_pci_power_down [ath11k_pci]
  ath11k_pci_shutdown [ath11k_pci]
  device_shutdown
  kernel_restart

On the host side, SSR is driven by the MHI RDDM callback, which queues
reset_work to perform device recovery. reset_work power-cycles the device
by calling ath11k_hif_power_down() followed by ath11k_hif_power_up(). The
power-down phase deinitializes MHI and frees DMA resources.

Shutdown/reboot runs fully asynchronously with this RDDM-driven SSR
recovery flow. As a result, the shutdown path
(ath11k_pci_shutdown() -> ath11k_pci_power_down()) can race with the SSR
recovery sequence.

Fix this by canceling SSR-related work items during PCI shutdown, marking
the device as unregistering, and serializing the RDDM callback path that
checks and queues reset_work. This ensures that no new SSR recovery work
can be queued once teardown has started, and that any in-flight recovery
work is fully synchronized before device power-down, preventing MHI
teardown and DMA resource freeing from running more than once.

Note: This issue only affects PCI/MHI-based devices. AHB-based ath11k
devices do not queue reset_work in normal SSR flows.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Fixes: 13da397f884d ("ath11k: add support for device recovery for QCA6390/WCN6855")
Fixes: 5edbb148bc57 ("wifi: ath11k: Add firmware coredump collection support")
Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 4 +++-
 drivers/net/wireless/ath/ath11k/pci.c | 8 ++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index f994233df2bb..a6c9ff112c68 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/msi.h>
@@ -282,8 +282,10 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 			break;
 		}
 
+		spin_lock_bh(&ab->base_lock);
 		if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)))
 			queue_work(ab->workqueue_aux, &ab->reset_work);
+		spin_unlock_bh(&ab->base_lock);
 
 		break;
 	default:
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 7114eca8810d..35bb9e7a63a2 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1210,6 +1210,14 @@ static void ath11k_pci_shutdown(struct pci_dev *pdev)
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 
 	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
+
+	spin_lock_bh(&ab->base_lock);
+	set_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags);
+	spin_unlock_bh(&ab->base_lock);
+
+	cancel_work_sync(&ab->reset_work);
+	cancel_work_sync(&ab->dump_work);
+
 	ath11k_pci_power_down(ab, false);
 }
 

base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
-- 
2.34.1


