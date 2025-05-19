Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81A8C54756
	for <ath11k@archiver.kernel.org>; Mon, 19 May 2025 09:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaEhlMZNRK2NLwdfwilZTHaAPGsfv+pU1e/jm5Z+ob0=; b=inf7Qla63s61USn4JsFRL9lWit
	/dJ8/v2BXmkgfVBCRzo8x3ialaoikdMTTpGtpDWFvzbR/QWMijayBIOKtq3l9Ku1QzxqSIp+Wgdw/
	MYKrJQ45Fp8gPB9i59lsKcwoaRXwqpEgAsBKYR0tDzSdlWj7c+S2ZcfFHxDpA8cC4Uo82QmC1jxgT
	FhpeO1KbANDPzztf5EVKcUuoxfzdaJr91t8FC0n3fWbQOSidCknRlw2dyEXkhrVQm4zgW6dtendoH
	B8tAVuVn1ndqga1qCcymLfKWvQwdoxMJA0MCy+QMsfCY1dI3dNY7ja2a7D22Lb49uszNULZaonlF8
	4YusZohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxER-00000008gtQ-4834;
	Mon, 19 May 2025 09:56:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx1F-00000008cmy-0q4A
	for ath11k@lists.infradead.org;
	Mon, 19 May 2025 09:42:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INjSbd008666
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qaEhlMZNRK2NLwdfwilZTHaAPGsfv+pU1e/jm5Z+ob0=; b=ExbS2gRR+sO6HL9d
	j9rfgQ5wlpGb0F82HJE006JlxlF+RTyNz7lYfsH3p4v+klgFFW7Qbi7UHWbX/+17
	C2DmOvkRrwK6LSo0hsTAy+fHZasoC7n6XF3JagCfnsEhkFX9IRyt23d73+N/phGd
	dfnpE7QAWwYSKt9rw/cXWQv6A5QXcLDah7GzhSVYHK8R4IAYonjD/8CgRsZLcXBt
	VOCoscgIOrvXEGQdhU5ZshNzITpSgE4JHVWlkKoSOfUp0xgNL1X09QMjf49Fm3vf
	mCVSx5lS1+7yf3g4ZDNh1OJto0E52EyFisDBQxPN2gqCkKez/xlgW0Qd4BTotZ4w
	UcdpRA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4ku4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:42:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b26e38174e5so4037424a12.1
        for <ath11k@lists.infradead.org>; Mon, 19 May 2025 02:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647767; x=1748252567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaEhlMZNRK2NLwdfwilZTHaAPGsfv+pU1e/jm5Z+ob0=;
        b=BTdU5gchjz5IYcdngJozMk8Yuiarfrh7zOtz+/Qe5F0G9Dlv4IRARY5YxbwBtyqw4S
         LeFtQLO9ovX+wWSz+LXgNxj+vMlc0htCxTOag6fRdJUBzJS7wgdSyuEPk7l+6Dwd1Uvt
         7UQyy//qE87NRc8S+GAZ2PbV0jxreV7sOT9yfqXVVNVxKJTunjErlapkxRC+Wli5+l3D
         F+KP8XIZHBvdg4SblK2rjAqUCbXxhLgXeoF/mXZni2awDNnoHHRr1/uNd/6YWMpwrRFg
         FOErGi/i9ZuAKkwY811c5lu6Ai5wAAtspahq9nfMlCE1ULk9xetIdcAiZqtRuIJ2gUlm
         BXIg==
X-Forwarded-Encrypted: i=1; AJvYcCUnNlAFuqZ/Zyq6xqAMsae5QS1Y3fvIMe04pF/HxE0JAHu6Bqn+d0s236Qc/WD69x32PuOwSfw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxGxbFha95XxdkVfF9SvVwLdm4b8SrEQATpU0n7eUcp8u0uSdB
	1yBAA/olGXm8bJUCxyrOcpqg62HUjBU0aW90fm+Tu6XBfyc7Oeh6V2Jk+48ogC20NPCT0dudgX7
	8xPWlEhE0sPNGZoqXDPz289Pr1pX2+YTEEehXc+CJ96K/mgnLo0W/XyiQHnLWOfIZ
X-Gm-Gg: ASbGnctOdQl+fa/94tEoOXZJoHDmRC/r03ukXbUuJXEAAbjWEQ8LZzIY84oH82IClDh
	WqbC0Qnt6Dcw9Aetx5V3mOQbh9MXNI2IwxXfMcPyYxFuekUhJpnJQIWa4y74Gxxo84QipO86bVp
	in1v/kUp72FBC7mQDCxNHb/nP6MGkgPB3VQorLScSNZFPt1cim3Jek6RG4UplBn8ZDYyY9HrFhX
	8mF3beImiBVOKummD9fNR2CHY8NoudJlDfZNp3oggDaRw68MNVVWNK/xWmFnFThCm7SsEQybYZH
	5ySNgZ0zUji/zp8K1mcreoeY892MTzWrcTfYqWI44JyRmKg=
X-Received: by 2002:a05:6a20:2d21:b0:1f5:8eec:e516 with SMTP id adf61e73a8af0-216219c83c7mr20960844637.32.1747647766998;
        Mon, 19 May 2025 02:42:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPivW2uuHer/futXB6CATvxy78IsEmfKwkUhEBc2jqHppm0UtJRVQovLwVfQwoCRtaYVtxaA==
X-Received: by 2002:a05:6a20:2d21:b0:1f5:8eec:e516 with SMTP id adf61e73a8af0-216219c83c7mr20960821637.32.1747647766601;
        Mon, 19 May 2025 02:42:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:42:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:16 +0530
Subject: [PATCH v3 03/11] PCI/ASPM: Return enabled ASPM states as part of
 pcie_aspm_enabled()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-3-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=2254;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=LW6uUZFGqD1UyYUFU68Xi6WQWlLczbA/2FzJMIC0YvA=;
 b=CeH1rqozNMSAmO9N8S8eg5Dl36biG9HcHhnJfMpzs/VU2cnmb7kh/fdVzeA1DzlaweGbH0UQg
 KwlHYmQmjGXABbM8yXmUPJRmsh+iFpFd/GgRSJ5Np41KR2CV1JFVSLP
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: AKmO7M9L0XbkShzIXZVTYer0eGbmoxpR
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682afd18 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=wuQQqu7ThqwHlQwkt1oA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: AKmO7M9L0XbkShzIXZVTYer0eGbmoxpR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX6npAPzr/kQM7
 7o+YycmOstuwGSpjgf/uXSW2y29zZYICoDXrC06kvvwcnf+PjIxIFTRZlKCaPuWcuEiQBwFDV6S
 uvdSBotkKIS22VBXqLFWQ6Ipzz1RdhsWm2COY02HBIzLhUmp2KbvS3wr4l57sQkTxnWHU1Z3JHn
 /jGBsqW3otB2HY56W9gYUjF7KUMChIocp0MEoLsJf0Oa+/zZdFm4CY9eN/85AQPs7TDHnAxm6Pu
 G0wcmf8A4bpYKETwI0g7LeNOMIyWfl7+mr6V+EwMbkeYTk9fmr8X7OC4L+VAUHtrlFcmPKfbjga
 GRHbQOGY1gaMJ59AwfN6ziEDzZxlFQDs+uDe42UuOOvNURvIG3cm71h+uBscBuryzTedxJzGlzN
 xBQ5D/8N5w90LIIUdf9QAcOSmp6ZjMcC8SGWQZuyOvrCTHNeUS6pz2wR2fAH6MCzwsJI3OhH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_024249_365443_8671EF93 
X-CRM114-Status: GOOD (  15.67  )
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
index 7eb0856ba0ed20bd1336683b68add124c7483902..ce9d0812a61c2337ba533ef246393a0101e617ee 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1849,7 +1849,7 @@ int pci_enable_link_state(struct pci_dev *pdev, int state);
 int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
 void pcie_no_aspm(void);
 bool pcie_aspm_support_enabled(void);
-bool pcie_aspm_enabled(struct pci_dev *pdev);
+int pcie_aspm_enabled(struct pci_dev *pdev);
 #else
 static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
 { return 0; }
@@ -1861,7 +1861,7 @@ static inline int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
 { return 0; }
 static inline void pcie_no_aspm(void) { }
 static inline bool pcie_aspm_support_enabled(void) { return false; }
-static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
+static inline int pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
 #endif
 
 #ifdef CONFIG_PCIEAER

-- 
2.34.1


