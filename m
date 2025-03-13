Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCFAC28B2E
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 11:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDJhVDK2s1wMdCivo+PnGOHqGOzFfulqMDQxzsMg+uQ=; b=adQC3JpdHSDXM1WBSMMZiLHQDR
	VEg/PzYi81fY46HJH68I3JWuKO7gdMnh+Kn1Bdm/jVlzv5epNH7xett7IWutupYJYYsA8HRd0Ncoz
	YHlZZypnK2MAsnWydhOHudXnoQspAhYzDueWkWNYOpD3AHQWy7T3JFLMx1EKqYsq0cQHDwSQzL/GS
	daNIMIz2BeIpxPkgyiL1iHsQMwFoKvo2DLHF45qOFrzCJUvbSYQB9TL46OteAVQO4ixV1SiWIkSsp
	B4TCrALffOZHFFU5xzyWHOmsVD7wF4PlKF0TtDjh6Kmq43+JRUWvHio7wBx71bDfeWEOxCjzHapfx
	gf808bNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgz3-0000000B5Ab-0vNN;
	Thu, 13 Mar 2025 11:44:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgvk-0000000B4Pa-18pC
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 11:40:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DAtAsR031553
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDJhVDK2s1wMdCivo+PnGOHqGOzFfulqMDQxzsMg+uQ=; b=HmXvMXzUoTP8Q8hI
	I3LttVypEv90ARIUfTW+7FEwKadDufSkIiWfgbb/CQwlr1WPnWZPczd92TM1LSIJ
	NRyLQZxKmth2DPuaCpl4bCWFN/LRvbjystJkWPKpYwpC1MYL9UHnw3uXy+IOzcvh
	11myRbTGdnhRs9kzgNl58CdZC7o7DNbELWlEbQMUFiPtzXB0xFNo/nJqpkqOGVcR
	QsaXNNPXbTas55XxnNlXuWnlTqk1Ox92eMJjj6h4Xq82VE8KeL2uK2NlHRyBnLtR
	Asl+hJ3aF5S2twK2tlEk/cW3noS8QR0P+ceF8rEKVX6fb7F4VZu/GBweQhBXYw0/
	90/HzA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bx1jg417-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:40:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff55176edcso1645542a91.1
        for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 04:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866051; x=1742470851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDJhVDK2s1wMdCivo+PnGOHqGOzFfulqMDQxzsMg+uQ=;
        b=X5mpzjMQ1iJrVXWjOB6C64eA3aozDsmMHyRercTyQUxUAO9vKlF7YnNhiY2ggRrJm0
         X4WOai5aUo/4cEdnrXnjGu12Eqn27OxjgWLw4M59I2fjnGqwk/2T5bLHMnZna5lNfLF3
         nuRRMQg/KXDKcMVVUgB8ldgGvNkCRzSluBULauZpAhzKt1QzxVwMD9uORvdPGSSmQsN+
         10dXgETRhx3oQKQ2G8p1/Qcm9iLidJpUJVeB861GJgHvmHjIspU+PF4k8i6SpEUR66ha
         9Js6HMsZ3YXmZAMFGI8PkvXaQwCfBgBrIjTUF/eHzuJxIUjlXnR8BawzDpSQhVnZJVsa
         D/Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWr2bv+jyBGAjUYNWlf/+nMy0EbGfVVjNPHFXvmUbnX20yGXAVz1hoxwiGpn5VYPMirI3QYpj0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBSWQzS5NDrP7XQbftUpHfLAEUu3zzeTcAXsjr2x7ArqBPOJuS
	DrqomDLt0RwkGVXl8ymCYg+3vWRRCmcFL3EgBjm/QS88k3xUwP1NaFUHm0Uj0hiP6glo5d4TMZB
	14f2VmYTKBysiQf2Ty2xeU7QY9lUTUKUGqBtlNRHYYzKcu5ty+6Cho5hj6v9i
X-Gm-Gg: ASbGncvQj3fAHWL7ynY1t93O+9EGZ54Xxe1KFX1sF3eRrL7l3LdlwxpqHOsId/zZeo3
	vfdJ33b88tRUW8eQB7F/X16hUgj+H5U0pcSnQiMb19LZ7iLIfpDSAguUONkHF7iLd2ZkJLmyFrp
	UCnPMIELuP5yNa7iTQfQnnj7RrESpBHrlMsc8nkMVPyf0yYngTGO03YqQqHUnRd5Djasnjoyi4B
	O56pH2wWJAAHwJ1zNIJclEk5QMm/FN+Lw+zw3Cjab5/nNcYLoY8MAJ2uKF/x5xYAva5qRcNQ1Na
	GkO5dZJ/Cmv3j9Dt4Mq78F6huEM0IkDKZtjQaQEIpQt7ae8yH3I=
X-Received: by 2002:a05:6a21:a8a:b0:1f5:535c:82d6 with SMTP id adf61e73a8af0-1f5535c862cmr38690640637.35.1741866050739;
        Thu, 13 Mar 2025 04:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX0osURi3EPGsBhGonuGqBQDJB5s6R9Ee/fm3sZrU83VNV9iwXDBptbFr6kXXFDh+i9IOGIQ==
X-Received: by 2002:a05:6a21:a8a:b0:1f5:535c:82d6 with SMTP id adf61e73a8af0-1f5535c862cmr38690595637.35.1741866050366;
        Thu, 13 Mar 2025 04:40:50 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:40:50 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 17:10:08 +0530
Subject: [PATCH v2 01/10] PCI: update current bus speed as part of
 pci_bus_add_devices()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mhi_bw_up-v2-1-869ca32170bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=865;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kC8jbRyoGWHcr5F6bMdpdYEPmSroHXkD/t16CewXuhA=;
 b=ahY6Y0A168tVls7xeIA9KMyOy4DdXUlaSCT4aLtCvCoOwCqtVuPLJB4oihUbL9V6lKzs0jMIr
 YbHNVpW7tlaAw2nG6V5+CebfmNfg9kEZrPSIm76H9fmD5LPSKow5ily
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=CNQqXQrD c=1 sm=1 tr=0 ts=67d2c443 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=u3yxjsl3ZikD_R2semEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Pvpc5y9PzlseYDwwdyIM9OAGnelS4vyJ
X-Proofpoint-GUID: Pvpc5y9PzlseYDwwdyIM9OAGnelS4vyJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044052_327640_5F90CEBB 
X-CRM114-Status: GOOD (  11.48  )
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

If the link is not up till the pwrctl drivers enable power to endpoints
then cur_bus_speed will not be updated with correct speed.

As part of rescan, pci_bus_add_devices() will be called and as part of
it update the link bus speed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/bus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index 98910bc0fcc4..994879071d4c 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -432,6 +432,9 @@ void pci_bus_add_devices(const struct pci_bus *bus)
 	struct pci_dev *dev;
 	struct pci_bus *child;
 
+	if (bus->self)
+		pcie_update_link_speed((struct pci_bus *)bus);
+
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		/* Skip already-added devices */
 		if (pci_dev_is_added(dev))

-- 
2.34.1


