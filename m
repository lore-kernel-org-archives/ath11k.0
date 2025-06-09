Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F18C677C4
	for <ath11k@archiver.kernel.org>; Mon,  9 Jun 2025 11:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7A6tRGMDv2qa8hQq+J0NjE48UHIfnawBC6GPkL/QNI=; b=gia/60TWoC9GV1t90daOIsg6ZT
	HwWR+3zhf+gqCK7mrZ8D7A+y+gbnttt2UKOs+t3HwAp2cV5/3n1nI/NwWj3F0vQHvxMFRccTMYo3r
	k3tF5Dk2gSpcUJJw2TApuMWrS6Igym6QjXx/X56S0nYz5TY9fEIU1uhPpLFb+U4EifKwFgrb4Cq4K
	DzLjnmaA17kqrlnSIA0Bo7b89S7DDFxIT4N4ZZ+OAyyCJSJXTsCbEjdvUyqZ1f9rpcQql/6Svutxn
	6jPOvZzAERlTy6yia2KbbIDuWCesgyPg+PiTP5wTK9y/Q9lxwLGA4vbMLvEnl107QvTfYF+MI+I9i
	FfKXeNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaSq-00000004040-2bCD;
	Mon, 09 Jun 2025 11:14:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa6T-00000003wx1-34Mw
	for ath11k@lists.infradead.org;
	Mon, 09 Jun 2025 10:51:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599BlLJ005646
	for <ath11k@lists.infradead.org>; Mon, 9 Jun 2025 10:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7A6tRGMDv2qa8hQq+J0NjE48UHIfnawBC6GPkL/QNI=; b=OzEaZCQRh5beUg2l
	57uAEDGAK6nHLFQlooM13k0An8SFSSSGT7k8kkNIzAwc0Nv525iQDnxT38oGuY54
	BBw3J59ZmaivQR+F4t0OiTyDSWhAbVtkCZIRU0ssAN0eNYG4JBI/owGjBUhwhSe4
	cZlln4K+91q9uGj+B3GC01j/QzwV316vrqzUrV2O7FodsfvToHgYUQeBzkUTWsrU
	x3iN9YDBmVyS+Xceb3rZf4Z8VgT1JMYasVfEb0SfSS8o6i0p3yzml4U0/AFNZj44
	CnFYC7HokpxN8k5FdlxfXixckwQXNhb0OCm4biOJd9u6XN2qEJUMs6eHan6t+Qxz
	vTnFAg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxp37j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 10:51:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235089528a0so42467025ad.1
        for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 03:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466303; x=1750071103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7A6tRGMDv2qa8hQq+J0NjE48UHIfnawBC6GPkL/QNI=;
        b=ddQ6QhPjXtwYNbJ+3c2JHSZLcU1Vn9wD78Vfm8likrDv76ttm6iDMAOQyeVlU9VLTY
         1nRg14oq7T1xod9XC5QoRHyI55gGNDMMJwe1TtyAJC9+lt4ZywwY/7n9hir3z11p6Ef3
         XqQuvpcQsCqcjkWA8xpXH0VysnUuKh2KWs7ci9qip46M6kxNuc0zbpL5+tgeeto3hUxW
         ZhKMNy+3oz7XIkDqWvZX6IulPmc7XiB0MpqeYrR60ryBLC1MMTOy02fDpAWdpzDHUSJK
         RFj5qroK6uVO8j79Ay3zyehR7PcG7pQdhMOh9U9nTOGhO8iveHxOc6Vk0Q/Unld46d44
         czYw==
X-Forwarded-Encrypted: i=1; AJvYcCVW+ukR81whIQ+XstYY/n0ifM2y1uEP8ujaK5HtdEx0k2CgVbpAH9LE02wdy1Vhdttfhzcnz0A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp/QKtC2BXAQNQr3ASJQ9WfsffzGf/dMSJWWA042Ff+WBT8PoY
	BKavdZ2iab9/GSe8Bt9ZEXGVfEKKkOEgYM8+ScqSHBbt94VS4+CoYF9KHB76WlQtf4V3wAscDSB
	K5SaVDzet8zgFHVr5c09yMica7sJ1VUx44qJs6Ln7SxxEm15Thsv/s5HglVxievd8
X-Gm-Gg: ASbGnct1XVL/4/sC6HDlLd4L1uLHVswSoXE7IHr4tYs+BtJES3qfs/G8uGlwLpQYH2+
	PiEuvUENntIX9ypNNEG4m+SZ9/NA30ke+p9HEntllGaOxDYqhrq2EGic/WhsUATzA6Q5YrXSUcV
	LR1jwlUdM/6fyqcijX//Hs6wgYX6mssCzaHWxNSjDyz920jvOmr7PqXqpPyj2w3es0/YZMA9GwA
	P7yTFEZRrs0CeA8qCfatNwHlYuLl3CxJ+VNOmLGNeYw9w0as/niJV7usb4IIn/uPqTHDOrHNMnS
	Sq1fDDQU24W/Z9WaLZe3agJUMXAeHpyF0VmQ7lTI+8m/EW4=
X-Received: by 2002:a17:902:c941:b0:234:986c:66cf with SMTP id d9443c01a7336-236020d715dmr193522575ad.16.1749466303519;
        Mon, 09 Jun 2025 03:51:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGLzOtRKOSJqf7NTxp/jA1tIZZWcn7SzcOC28q5ajezBWgKmY9lqYSDR8i0Dk7f/REuQx1ZA==
X-Received: by 2002:a17:902:c941:b0:234:986c:66cf with SMTP id d9443c01a7336-236020d715dmr193522275ad.16.1749466303160;
        Mon, 09 Jun 2025 03:51:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:51:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:22 +0530
Subject: [PATCH v4 01/11] PCI: Update current bus speed as part of
 pci_pwrctrl_notify()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-1-3faa8fe92b05@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=1335;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=s3BgbObr46Znv5BUzFNNNM+2F0k3oFKX2PcPm3YAn5I=;
 b=ZfB1rQO8asuRz4N6P4tN0plpJ2JrMF1tt5D4/AjjMGr84OpeBvswukdYc5xJoV20WCuxq+p/5
 w/L+uUEC7JdCs9uZ6zUtriA3WQtBD1w122UYq7IZ4ufsrkQ8qgVr/cL
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: K0_tBSPyrK077_uK4Lle8c_cDfkXNPhm
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6846bcc0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=3phiJa3m8EW-4BHYHVwA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: K0_tBSPyrK077_uK4Lle8c_cDfkXNPhm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX9Eaynxs0T1rF
 AlH3OLrzpuF2eIiLt63543RUA/N+LO86V4WGKoiwz3QaG4HdcqfsNz7TWVkYzrS9diVGR77wjxB
 UR1a9YOT7rEYhCgcNT+AUdxArL7k/tQuL8nvAiBtiwQysaLVwAWOfcnfj3OxRbWQjRSlmOAWRX/
 f/dTh4zKbiSyNWxyRkNiUStmaHXAQH9UhiAB+8iTA3ypuc3d+D2VaQg/k23KUNfVFvt5I3PPdht
 wY1+fOifatRijO2Tx94JVIC+uYct2lN/JNnorXXJnq1WX1jjSUV7Pdi2/K4h2fKv+XTJDkEDRMi
 bNl19QlVFbVJhiAPw9Lh3/757rioN8jGm2rTyZX0UUjQORVN9zxhqL3g7/vM2COU+kPpBDPBveI
 mAZjaHB7YFqAoKknTFLMmhLAYIHHw0+cHl9Qu3Jfj8FxjDv16oPiiiKMS++llXjmRLQFTOuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_035145_893912_29DED01D 
X-CRM114-Status: GOOD (  14.70  )
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

As part of rescan, pci_pwrctrl_notify() will be called when new devices
are added and as part of it update the link bus speed.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
index 6bdbfed584d6d79ce28ba9e384a596b065ca69a4..4c1d3832c43503a7e434a3fe5e0bf15a148434dc 100644
--- a/drivers/pci/pwrctrl/core.c
+++ b/drivers/pci/pwrctrl/core.c
@@ -10,16 +10,21 @@
 #include <linux/pci-pwrctrl.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include "../pci.h"
 
 static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long action,
 			      void *data)
 {
 	struct pci_pwrctrl *pwrctrl = container_of(nb, struct pci_pwrctrl, nb);
 	struct device *dev = data;
+	struct pci_bus *bus = to_pci_dev(dev)->bus;
 
 	if (dev_fwnode(dev) != dev_fwnode(pwrctrl->dev))
 		return NOTIFY_DONE;
 
+	if (bus->self)
+		pcie_update_link_speed(bus);
+
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
 		/*

-- 
2.34.1


