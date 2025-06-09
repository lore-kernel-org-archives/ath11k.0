Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCD3C61CE8
	for <ath11k@archiver.kernel.org>; Mon,  9 Jun 2025 11:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPgT8D4IPTgaAa3s6UuMsQfkwr2chND+bSAhzKGs8QU=; b=4EtuN9DjFP3/82YB05YX+HWDBk
	s0G2mtcxlqVVpEOI72r52Fu3bm1xL404f5dPQNVfT1Ss++v7xFJp9eVDI9D313R76qJ85xS/BFImf
	eV00umDD8uk2XFvzisRTI6J1U+o3zeZkGL3FTSWmOOmP/yrFLQjpKm9pq4KTfoWvHltgHchWoa23A
	4z4sZhecBpVFfqzRF50xf+cRKQ4sMzWQpdSnpd3vNkYaUjLapTbY8wIuBbbaYiXFHzHPmxuKhXvus
	ghd/JI1MWg7VUkAuVMi3bb+CMh4M2bDc2gy5TU/HFEB1cBzqmyBc/4upXLoOk+oD7eO5EU7tAzv3C
	uKe5My+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaSt-0000000406x-0kCH;
	Mon, 09 Jun 2025 11:14:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa6w-00000003x3z-3Cyc
	for ath11k@lists.infradead.org;
	Mon, 09 Jun 2025 10:52:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55934wBR020020
	for <ath11k@lists.infradead.org>; Mon, 9 Jun 2025 10:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPgT8D4IPTgaAa3s6UuMsQfkwr2chND+bSAhzKGs8QU=; b=kaTz+2TTUluP90gA
	qb9bfQgIP0wW0hGU3JlT/vLppkNQR67FLVqXxBuPRuqfnyQhOZP4NcMsF/PbBTqt
	YZDhuAMryCkvy4o/Sku6P11w4w5E0pTL262yT19N6n7kuiTu5Wrncy42gwyF3bz7
	Lu+hvPUbMASH0L91vY6gHhE8L2KrkS5hEsx3SToZF00AG7jLRdKgrd8rPofuenl4
	26dwj2pJ/o2Oou4sMJY6KdMwG3BGlAotuUSfQaqRa7miYAWEI+w5yKsRq4WNXVOG
	K0B0TvIZG14yB/0P4B8nITsBYRhRXpTugwAP8LlBc6NSDGmr98nT9adP51dFQ4pQ
	QBLbjw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475qcts61b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 10:52:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2349fe994a9so30491675ad.1
        for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 03:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466332; x=1750071132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPgT8D4IPTgaAa3s6UuMsQfkwr2chND+bSAhzKGs8QU=;
        b=SmwPXT57WbN0sZpnKWSWzsMssKHWZMIhuN2ckgcAKvybnF0HtEKaERb8aMfYjp8ofy
         +xN0ugopGBoNNBOPf/QSSyU/WTdx3rmb377EkAf274RZW/tfoL1gbCeOY4bfNi+JRL6n
         mU2jRUu7r2ZU72RQV12SggFgYqrfOTMqoJONJQ9lgC6lCD9XuRY89t5/WswjkEecVzcJ
         P/zkMNWq3CMJf80VWyUBNBkoSxUiSBiP0mT3epzm48+K/hN/BqIdO93lt8wWVhdSZpyb
         CpPzv9SJzRQgV285qda2cG0T76VSP13i9weROXgExgvYpdrmWhb+AIAQgFOdFBadtvxS
         y1gg==
X-Forwarded-Encrypted: i=1; AJvYcCXvxhR1WozHTRCe6ZOURcpfUX70E/yeTXbwy2vl2gY2jdJ6yCU7HiAdu1ytAUp7seBETGuUo08=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYk4PwWKuxhwROHj5I9Te/2W7jQbt9Z+my8LEfvnSZxzCMB6Ge
	TOslzpnSYruUNnK08ALirC/lmbrr4xyKlAAHoqHV7dNIpGKeFq9VA82/RL54fmEq9dUrdxU8gg1
	XkJhMBfQC7qgI0P3rnYfQk6hZT6X+e7O7oHnnZ+5153fMpLUOb9hxmrjIv2XNVErx
X-Gm-Gg: ASbGncv7ZQTZd4hMom5eKgOITNuRqXWR4Aj6nk8R40odBtZNbED36zaJ+VzSDJZSIDB
	U3H5Z5qpEeAXkvmo5wZ1WZg8ZYI8cilgEh3lPOO1rGvUmpZFUpi5bFbX84l+e8q5dto/IfYEpuH
	qg7pMGGTVkHWOHX0f/ui3lsS/jiqNXEAiqTUkoom3fG8UhZTxtTPe0C3puxLQP5x7QvwU1jpu1C
	+OBDAJmrM5h/cgDos3spTQEc+uERWZJenFrqun6Yq3cRwd12nvQnPwQfKVs+tqgCzM/QUXs+ZfT
	OQ8HBn8uhXXRsOwONan4uErKI7QYrgg5Mi9JYXcH41iqfX82LWscydY+fg==
X-Received: by 2002:a17:902:db0f:b0:234:f182:a734 with SMTP id d9443c01a7336-23601d24a79mr172681375ad.31.1749466332583;
        Mon, 09 Jun 2025 03:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo/wXnrK3iji5yZk8aH4OcOGyMUm+fPqYmD5eHGzL0faoq492bZ37GElru7QLbpXFgJf0IYw==
X-Received: by 2002:a17:902:db0f:b0:234:f182:a734 with SMTP id d9443c01a7336-23601d24a79mr172681045ad.31.1749466332182;
        Mon, 09 Jun 2025 03:52:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:11 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:27 +0530
Subject: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-6-3faa8fe92b05@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=1156;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ZDtM21/VpYgUVrvDvFCvhbVFgnDB7/qixYXvJx5tN8c=;
 b=LirUNXKSmX3ebHFBXXCn4igrV12r9SfiTvWKTR2nB6rgsDGG8kxtC4uNmZtMHaceWbMcscgcs
 fEN00pM7t4NAA6x0mbb4IpyHc7lmWammFasxXqtmtx8STYc7YUguKj6
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: znQp_NI38eN1TsH1AhStFLAbFvtDdhtN
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=6846bcdd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX9/LXMApVFtku
 fOcHNjDefxXJ19kASgQHA/F5B5uB36JTnMwUJ2/3FHG3EFuc3PXlGf9fryC18+Gmb4/Jx77FAul
 BdZwWSuiTjw/fk9R/e9CnNOY/HFsO481jAm+//cf4KIG7Se903p2FMwFyo8nGJMccU/L6Eul6Mz
 FnSfQ9HXLXcv3L7qYh4fawYw7vcRzGYp3tlq3d5UEMwl/MkrrtHf5ULeY73SbNKeibVQ6vzUG2g
 I4kY9uFfLe7nDejMgKWksGQDhP0X6MoOLAqQpkp5ZJo4sJbb0pg1shJ0d/BEQzzLX4zPbb4HUR7
 617Kwhz3+NhZOoqOBB5K7cOwJa3hO6sGxQm7hY/BFxBSSea2k/7+akxrJqG5WokLuXL5jLMey7x
 w93DCuaSd4Ntpy5+p4GDvwFIi1mUo0YEUcs+Rbw46q2XOAXjjbaX2iL7smwZrgP4w2QMCA4S
X-Proofpoint-ORIG-GUID: znQp_NI38eN1TsH1AhStFLAbFvtDdhtN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=941 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_035214_928823_ACC74EF0 
X-CRM114-Status: GOOD (  11.03  )
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

ASPM states are not being enabled back with pci_enable_link_state() when
they are disabled by pci_disable_link_state(). This is because of the
aspm_disable flag is not getting cleared in pci_enable_link_state(), this
flag is being properly cleared when ASPM is controlled by sysfs.

Clear the aspm_disable flag with the requested ASPM states requested by
pci_enable_link_state().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/aspm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 94324fc0d3e650cd3ca2c0bb8c1895ca7e647b9d..0f858ef86111b43328bc7db01e6493ce67178458 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1453,6 +1453,7 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
 		down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
 	link->aspm_default = pci_calc_aspm_enable_mask(state);
+	link->aspm_disable &= ~state;
 	pcie_config_aspm_link(link, policy_to_aspm_state(link));
 
 	link->clkpm_default = (state & PCIE_LINK_STATE_CLKPM) ? 1 : 0;

-- 
2.34.1


