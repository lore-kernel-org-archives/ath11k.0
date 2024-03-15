Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F028C54E5D
	for <ath11k@archiver.kernel.org>; Fri, 15 Mar 2024 01:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RTbjxZIOMviRH3aUzis16GaSM/Y+0ZKj9CvJ6VLKnZs=; b=yfc9Skk9nUoKsfG88U9s7PnPTC
	v+F2ORCwiiyDvNq5mQULx1gC1PGTdJCrxKo3SSCKLU1HlacPXyxamCDxtWSeEti5WCnR9SYrC5GpQ
	ps5vPsqHPEqJ2XlN3mnUnI0qXMpZpA1Fq/PoI/VFgGsWRFFz6/yLqg13HyBgyYykfPZIPYRLjeH4K
	iugO4ec9M6ZcEgQPIBnM3ui3nlG/bcObPG50ICGcbHM232nfgMRM+zye0oHdBn0Ek9zgqVRrHp/ZU
	N3v9LS8p7TQqKzqeOFqJY9m8NbTPt2Llji7W5PcFp4+DwWbi1QoKjRaiewcIafF81MwemiMh2p5nm
	W6xMvrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkwcO-0000000GLKm-0i18;
	Fri, 15 Mar 2024 01:44:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkwcK-0000000GLK8-0JWm
	for ath11k@lists.infradead.org;
	Fri, 15 Mar 2024 01:44:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42F0rj8n007011;
	Fri, 15 Mar 2024 01:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=RTbjxZI
	OMviRH3aUzis16GaSM/Y+0ZKj9CvJ6VLKnZs=; b=TE06+Pid3fXdXgUndikRCvE
	lZcx96JtqUGIDt5ROL3RAQKCicGB+3r1DfdZTTJwJmhKB4QywoM5MRTKNlpr/yYk
	5EwegHTDK/24u56ZpuPmg8/Y/QmI8PtvDwBFH/uvjcHVPeqdPSLrflf4SIrgKtYm
	Sdm7AdNaw5fjLQ5XWOtSi3ep3sjkmPrpiGJ8cPwIaDgUUJNEy+irT8eI/iV0rdMc
	+c4Fs1BVYZsWAZeSP+sG7xIaQpaq8RudAxGYCj6jGo6vRYmknCxuXskOhNKhcjOT
	e9J/KYKbrQy2xlY5MhswzAgHGxg+vzXJ2yyGIC06DUQ3YpBveHZjeWc0bP6a0Ig=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wva0609d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 01:44:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42F1i74U028555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 01:44:07 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Mar 2024 18:44:05 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <kvalo@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH] wifi: ath11k: fix memory leak in ath11k_xxx_remove()
Date: Fri, 15 Mar 2024 09:43:07 +0800
Message-ID: <20240315014307.3132980-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 22b0kfWFUIDFYEBMIersIueYpjbfAZNA
X-Proofpoint-ORIG-GUID: 22b0kfWFUIDFYEBMIersIueYpjbfAZNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 adultscore=0 mlxlogscore=834
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403150010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_184416_266685_52D50C23 
X-CRM114-Status: GOOD (  10.98  )
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

The firmware memory was allocated in ath11k_pci_probe() or
ath11k_ahb_probe(), but not freed in ath11k_xxx_remove() in case
ATH11K_FLAG_QMI_FAIL bit is set. So call ath11k_fw_destroy() to
free the memory.

Found while fixing the same problem in ath12k:
https://lore.kernel.org/linux-wireless/20240314012746.2729101-1-quic_miaoqing@quicinc.com

No functional changes, compile tested only.

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 1 +
 drivers/net/wireless/ath/ath11k/fw.c  | 1 +
 drivers/net/wireless/ath/ath11k/pci.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 7c0a23517949..6bc4e55c6c2b 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1259,6 +1259,7 @@ static void ath11k_ahb_remove(struct platform_device *pdev)
 		ath11k_ahb_power_down(ab);
 		ath11k_debugfs_soc_destroy(ab);
 		ath11k_qmi_deinit_service(ab);
+		ath11k_fw_destroy(ab);
 		goto qmi_fail;
 	}
 
diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
index 4e36292a79db..22327d5f9680 100644
--- a/drivers/net/wireless/ath/ath11k/fw.c
+++ b/drivers/net/wireless/ath/ath11k/fw.c
@@ -166,3 +166,4 @@ void ath11k_fw_destroy(struct ath11k_base *ab)
 {
 	release_firmware(ab->fw.fw);
 }
+EXPORT_SYMBOL(ath11k_fw_destroy);
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index be9d2c69cc41..6099d02d5f65 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -973,6 +973,7 @@ static void ath11k_pci_remove(struct pci_dev *pdev)
 		ath11k_pci_power_down(ab);
 		ath11k_debugfs_soc_destroy(ab);
 		ath11k_qmi_deinit_service(ab);
+		ath11k_fw_destroy(ab);
 		goto qmi_fail;
 	}
 
-- 
2.25.1


