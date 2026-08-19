Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235A3C5DF81
	for <ath11k@archiver.kernel.org>; Wed, 19 Aug 2026 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA7vzClWeSwWPtSLmTimBFoLovSegooKkc2VbhIOLI4=; b=gPZ7+NfDZ9/C+tpUK+RxWusdGJ
	XJ3Lg4x2yUn/O1RWgbtIXFahdkJmwfVHodMKtq8AtxsnoLEFS4OFi3UI/gYJRYzgDwbNqRL7nKECx
	80e+oakgciFdSd9cHhCq2NwS6S0La5vabNJcHZeUlv681O2z53QkxeSWLGHHxK8CAfykD6VrMWhL2
	tTezOUls0cOzSsceQX3y30MhDeigyR9nXBLdlu+N5Lh2foaYmfc65sU1D5bOT7RjQe+vb9OjeN09+
	BZupXlBkK+aSzTisXtiAgcJtZ9jI8uJy5V/elQGk6fcwLkZ0YI3SX5jT22UnpLlCCjnUwfl5daXoI
	n34WOifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJN-00000009rm6-2WIb;
	Wed, 19 Aug 2026 13:26:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJL-00000009rkz-3wGM
	for ath11k@lists.infradead.org;
	Wed, 19 Aug 2026 13:26:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JDLlkt399308
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GA7vzClWeSwWPtSLmTimBFoLovSegooKkc2VbhIOLI4=; b=o/OiSXexN8V1G/qJ
	gWfaMRTTi5zuo3GeCBei+dNNHGcXWkq0R/MUJHYxoAhrN03eGN+Jp3kh3qF/zcox
	vL0l4Cz40c+Ii+79dFKJaoH7efydHgAv4BWPgLZ4yuYZjk6S+Nq9Np8M5aVhsKhw
	cQp5JAeB0SJrrTWTpU9cghboyHUnTgOI/fjXVklnMZ+Y9mnpJZiHL7KV4mxl+z1M
	lzQLtlsFn/KXYcEhYHCA7bAK4jlXgwUoyTTJcFU7XG+vXrm8NIFTg5Ts7DAujsO7
	KY6sgbhELpDqErttvjV8NxGfuAb4sUObP9ePsNE0vZSoONBpko29SadPBXsY8mqo
	qZ0iLw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa00mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so22666885ad.1
        for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145991; x=1787750791; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GA7vzClWeSwWPtSLmTimBFoLovSegooKkc2VbhIOLI4=;
        b=Aq8yN0/cQ4VCoDugypBDL64KtoyxZ9qFTQNa4TumVK0wuezy7Sz3qjXtvOLn2P8hy1
         2YZNt0FH2tjqFyOGoEnoAxH5UsDsaw8u4+wS2u+iC7cPzGPQtyEW085BVh5ivBtd8DUB
         BEIULWZKEPtYPI3ZoRUHRDb6jFFxrBV8KX2TbIpiw/eEXeIafmzhKEli/fzezCISf01k
         UUPvZsarBhYZBE53poBsRrihQ/itC8TMCpoyucVMLbyg6mmAAfHpiF0zwuFkh9UEI/RD
         znqnhqMQe0GyPQMEjauZjBSvHxlRA/6GGMwf1HuiTnRpWb5opLm/DikRHCKOX1T1SAuu
         GEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145991; x=1787750791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GA7vzClWeSwWPtSLmTimBFoLovSegooKkc2VbhIOLI4=;
        b=PzILF9s7kmgrAKp4azswaoX7O1pbTiWWbNmFhOgV5FPdPaYbQCy2FDG4eJu2wlEjl6
         A3Tll6lw8WpUaKUA38Dj94gjxjyt4AhxisGkCcHqgqLSnFl3Hi8im/diFJGsN9MflLIE
         AQlv+Pmnurr4t3mVfqunUm0TXYmpCAAD23GTHsvzHb31Eo6F4KZ7AawylKeJ4gNc1i6v
         YlVv66L8b0NbVUfrj5P+EaCCEQutuOxaZJoDcQKugac5R6tqUZ+QUMVu9uddXe6UgWEb
         AhnI8QV5sACdzF7BpSR2cpT1pulCSK17Sfoq259F6jcPgBpbu29IbzaOg7Vq/6MAQ7Xc
         5mpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFjK7HqrRPLjZDGnQJM5JxOo2DcHvGVTcgYIlDbzj5fAqFkx3ZL3UqVbdoeX8Ol1OCu5njJKk=@lists.infradead.org
X-Gm-Message-State: AFuF++nUJNfziEWeCZzTpu2BBGjvjW833uGgJ2HXDnKNAXUrWZw1mFG+
	KCOYEWAR3hq/adwNk77sa0+Mjza2gU/03TCCTv86QdRyjDiozKHB3vZTKRCANbLz6zAWL83i+vt
	ubYy7YB9oUzjZSltAOkbgUKlUuhn0CC3tT6dAFkCb8+M4ruHPH4hJK04T/GJSd6yN
X-Gm-Gg: AR+sD10Nhv4lFOxALL0//+aWJtBowVjgJE70Gdg7FqUZjBBEwuEisZnu6uNFtA82WrI
	8Wg+mQJIqBHx+yOjN70ETy2gIY4Q7KuAYKSVVx1YG+tebOXUn5dg7B8IbMWUWI3Wwv8H7LHvvXA
	0hOGyv93MUEcJ4EaKU9h/FtD2Jhf+AdmxzdiEG5oHE3aDwh64vVfSAlen3uTG4gFpLnFDtv2cIC
	LSVFncgo2oPWNUINwnm56ybizrLhNYCvF9b/U6kPvdHeiDC6oAmP7JQhdAkbJeX+G8bNbFuTXbO
	jVXPqN/fJ3IaIAUz2b5nJqNt87RglQROSfBPrXRB1+LBipwjhIPrBx8KOnYndhL9p599++xGTd3
	VN2vfK/EKuV3CY5RRT1WJvg93H9atyqWMZhQ=
X-Received: by 2002:a17:90a:ec83:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3957f86d960mr7218194a91.4.1787145990622;
        Wed, 19 Aug 2026 06:26:30 -0700 (PDT)
X-Received: by 2002:a17:90a:ec83:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3957f86d960mr7218129a91.4.1787145990140;
        Wed, 19 Aug 2026 06:26:30 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm6126465eec.11.2026.08.19.06.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:26:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:55:53 +0530
Subject: [PATCH v5 2/6] PCI: Export pci_set_target_speed()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260819-bwscale-v5-2-6dea79786b37@oss.qualcomm.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
In-Reply-To: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787145973; l=734;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=WyEzptVv7uRVS+fTWzoU6Xos6GT52swB3MLhrEXcDEg=;
 b=Ck/CEbFLWH7VTG9uktRjIhO+x0ADX2v3SpS1gJJH7UzHym4rKnJTUhEfeNLXMl2jzTD885c9j
 O0ztEcXozknDPDijfAx6Myn/TJhPpQpE+bnqryQw6/AfJURhBkxpzdQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a85af07 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=5E3R6_0bZ0f_H1kkCjQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: efAPuYnRUSeyrXsXJDfEnvBFWJ8jWxhG
X-Proofpoint-ORIG-GUID: efAPuYnRUSeyrXsXJDfEnvBFWJ8jWxhG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX0b3OlPuQUEnH
 yaaZByFvn3nlTM/UftV67q6Hzm456TGFBYFwOTVqulD50wZ2EE4xcVjWNWYlGIjUsekFmA88xk6
 Ciir+j4sxRaggXKcUgIlcpF8veowWHw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfXz2/vxOx8p/Kf
 RdZWl/oxC79itvti4wgGCKdDfupzchUvHXaFc+tooMDJPhKSVh8KZyvYKeY3X009tltpRC0VMPT
 EmmZogAgIaC/yvfnjH36lf8qpaRVF4agm+1mYQrW2uRTMGQooz6nObUo+HZQfsTzoNUtQfE6cHf
 PUMhfdUqZiNTV6h9ojBmntX2yxepFhyrNjs91K/xLvM/Zixu/Z0Kt4kgqrTcERtJXqO4oULmG08
 C4QbQWq17+tZ2bpdQ7XF5T2A8Gs8QjI2dV+gkOVc4g1f0aQQaXI6lpmMTXOsTdg1zKCZbz7ZXCB
 VECheqFkL1uP7pbxsunzjY3NiQ8zpecJxUPscw4mIVcMdmnCBC+GS81W0QrN7J2S/O9pWCSnCqB
 ttA7L7MrHRdQd4rTTVkK3DOp99PZADSdkcy+FD2vF6Du5bct22XI6L0iAisjRkAs4u6Ouggzcf/
 70BoWom8WFm2sIY9rLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_062631_983800_DE637F3D 
X-CRM114-Status: GOOD (  10.78  )
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
Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 6fa1522c47db..a337f166465e 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -239,6 +239,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1


