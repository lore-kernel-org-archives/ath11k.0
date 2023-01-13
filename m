Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ECDC54EBE
	for <ath11k@archiver.kernel.org>; Fri, 13 Jan 2023 06:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RNuKJAJ6khQBNKHWZaMhTCI+Go5VUiR6hJSMmwy80zQ=; b=OgtdWMZxUPFEL0
	chCHtxxoQv2O1YXwQjRfCti19wFHEvS66nAwM+AEKY9kQbYXkKpfWYULaXjL/HncJRSzMfrjmQQuo
	gO9rpemOYW8MelNSglPpQMzo8MkIqPRb+qiCOPDtZN/al6llRPbNNMhNdwEqg9SvlUZVQMHNAv26q
	y5hdv8fGjJ8J45CvDT1EandgwBlD6rRWCMzRUCrN7eQwNFOUodMeial2OYtSe7iWG69FQj47Dj7UA
	bMqBa8YzmYAZMFBRcAbrGMZy0yQcmIYohQsj1qvnKFDT29UKi/QizlqnOJke9l5USmmKIrSadZe/i
	eVFV1y0DDc77xjbwdmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDcH-000pnA-Uf; Fri, 13 Jan 2023 06:32:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDcE-000plM-IT
	for ath11k@lists.infradead.org; Fri, 13 Jan 2023 06:32:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30D5QudM028183;
	Fri, 13 Jan 2023 06:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=9LEsWiGAH1JvVu7x5nU1PPKfrwB3BA4JfkfVf87NPeA=;
 b=itYOYby+246t2RfKYk/V0GN7KPTEyhFNp1guLq3AYSbMh3AIOdu+dR4ouBrXmsWWOaCn
 ZpF8XpwcKRZ7HOiqsx0yDyvcYAviWUTIsw8MKnNSO2b6fW4bpwPgtEjQHgK+6+sZ/yUf
 y9DBB/38aBoX269fpzQTxQzBFB+SLvR8RqQT+pbumY6DKZYljz3F43AhBWGJtAv6fMXb
 OD5mDMCUzVllg3OQRCXJec01jolOlsxL7xjg4wJRTtN6mZDIML5ezttMSkhNjJU9DEpU
 4RVWjqmG91n6jjl3dsp35jhFM7o2IByjRdx7JcUDU7H+7jFrQuOsrTTxB+Ib4zSYi9bf yA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2wqw0esv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 06:32:33 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30D6WWEP027237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 06:32:32 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 12 Jan 2023 22:32:30 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH] wifi: ath11k: fix ce memory mapping for ahb devices
Date: Fri, 13 Jan 2023 12:02:09 +0530
Message-ID: <20230113063209.7256-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fUsR4x27zNqHQkxfKaai9bNBCR0iERDr
X-Proofpoint-ORIG-GUID: fUsR4x27zNqHQkxfKaai9bNBCR0iERDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_14,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_223238_771771_EAB913FE 
X-CRM114-Status: GOOD (  21.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Currently ath11k_ahb module is not loaded successfully and the wifi
interface is not created. Kernel trace is seen while loading the
ath11k_ahb module. The issue is seen in all ath11k AHB devices except
in IPQ5018.

This happens because in ath11k_ahb_probe(), ab->mem_ce is initialized
with the value of ab->mem. However, at this instant ab->mem is not
yet set.

Later, during write to a particular memory via ath11k_ahb_write32()
this ab->mem_ce is used with particular offset. Since ab->mem_ce is
not set properly this possibly leads to memory conflict to handle
kernel paging request and the below trace is seen.

[   93.035047] Unable to handle kernel paging request at virtual address ffff800100a00000
[   93.035083] Mem abort info:
[   93.041869]   ESR = 0x0000000096000045
[   93.044561]   EC = 0x25: DABT (current EL), IL = 32 bits
[   93.048377]   SET = 0, FnV = 0
[   93.053840]   EA = 0, S1PTW = 0
[   93.056704]   FSC = 0x05: level 1 translation fault
[   93.059745] Data abort info:
[   93.064603]   ISV = 0, ISS = 0x00000045
[   93.067729]   CM = 0, WnR = 1
[   93.071287] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000042219000
[   93.074409] [ffff800100a00000] pgd=100000007ffff003, p4d=100000007ffff003, pud=0000000000000000
[   93.081195] Internal error: Oops: 0000000096000045 [#1] PREEMPT SMP
[   93.089598] Modules linked in: ath11k_ahb ath11k_pci ath11k qmi_helpers
[   93.095851] CPU: 2 PID: 66 Comm: kworker/u8:3 Not tainted 6.1.0-rc8-wt-ath-658126-g58e4b9df840c-dirty #2
[   93.102454] Hardware name: Qualcomm Technologies, Inc. IPQ8074/AP-HK14 (DT)
[   93.112171] Workqueue: ath11k_qmi_driver_event ath11k_qmi_driver_event_work [ath11k]
[   93.118856] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   93.126838] pc : ath11k_ahb_write32+0xc/0x18 [ath11k_ahb]
[   93.133520] lr : ath11k_hal_srng_setup+0x860/0x8f0 [ath11k]
[   93.139075] sp : ffff80000aaebb70
[   93.144452] x29: ffff80000aaebb70 x28: 0000000000000020 x27: ffff80000aaebc50
[   93.147934] x26: ffff000004923750 x25: ffff000004921200 x24: ffff000004928000
[   93.155051] x23: 0000000000000020 x22: ffff000004930000 x21: ffff000004923200
[   93.162170] x20: ffff000004920000 x19: 00000000eea00000 x18: ffff0000049200f0
[   93.169288] x17: 0000000000000000 x16: 0000000000000000 x15: 000000000000025e
[   93.176405] x14: ffff000003c414f0 x13: 0000000000000000 x12: 0000000000000008
[   93.183524] x11: ffff000003c41488 x10: 0000000000000040 x9 : 0000000000000000
[   93.190641] x8 : ffff80000a9dd100 x7 : 0000000000000000 x6 : 000000000000003f
[   93.197759] x5 : ffff800100a00400 x4 : ffff8000031f4018 x3 : 0000000000000004
[   93.204877] x2 : 0000000047b62000 x1 : ffff800100a00000 x0 : ffff800012000000
[   93.211996] Call trace:
[   93.219104]  ath11k_ahb_write32+0xc/0x18 [ath11k_ahb]
[   93.221366]  ath11k_ce_init_ring+0x184/0x278 [ath11k]
[   93.226576]  ath11k_ce_init_pipes+0x4c/0x1a0 [ath11k]
[   93.231610]  ath11k_core_qmi_firmware_ready+0x3c/0x568 [ath11k]
[   93.236646]  ath11k_qmi_driver_event_work+0x168/0x4f8 [ath11k]
[   93.242376]  process_one_work+0x144/0x350
[   93.248275]  worker_thread+0x120/0x430
[   93.252352]  kthread+0xf4/0x110
[   93.255997]  ret_from_fork+0x10/0x20
[   93.259043] Code: d503201f f94e1c00 8b214001 d50332bf (b9000022)
[   93.262863] ---[ end trace 0000000000000000 ]---

However, for the device IPQ5018 ath11k_hw_params .ce_remap is
defined. This parameter is used to recalculate ab->mem_ce and hence,
this issue is not seen in IPQ5018.

Hence, fix this by initializing ab->mem_ce after ab->mem is set.
ab->mem is set inside the ath11k_ahb_setup_resources() therefore
initialize ab->mem_ce after ath11k_ahb_setup_resources().

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Fixes: b42b3678c91f ("wifi: ath11k: remap ce register space for IPQ5018")

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 085e99633951..cd48eca494ed 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1157,12 +1157,16 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 		goto err_core_free;
 	}
 
-	ab->mem_ce = ab->mem;
-
 	ret = ath11k_core_pre_init(ab);
 	if (ret)
 		goto err_core_free;
 
+	ret = ath11k_ahb_setup_resources(ab);
+	if (ret)
+		goto err_core_free;
+
+	ab->mem_ce = ab->mem;
+
 	if (ab->hw_params.ce_remap) {
 		const struct ce_remap *ce_remap = ab->hw_params.ce_remap;
 		/* ce register space is moved out of wcss unlike ipq8074 or ipq6018
@@ -1177,10 +1181,6 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = ath11k_ahb_setup_resources(ab);
-	if (ret)
-		goto err_core_free;
-
 	ret = ath11k_ahb_fw_resources_init(ab);
 	if (ret)
 		goto err_core_free;

base-commit: e51980bf88c65f6ad4916baf720ad1234de01791
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
