Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9E1C48286
	for <ath11k@archiver.kernel.org>; Fri,  2 Feb 2024 02:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x3B6yMoNCPrcXyrT5pXAy2ib6QX9PgtK6OglhKLjstE=; b=ZZFcZWOqcWvSV360o++enOKh4p
	O5VprV92R7rupQ/2gmJd6wWVyoxU07R60JU9Xkk/Fr4N5u+mBoteXoXppK5m4VHEC+HGGnCWs17K+
	P50dMMk/8kEvSU+enLVrqmbiHP/oJ88RFu2p1FoIghYVqEK1jsCzP/iWibDVQdtaQ8WVAHCCRvOcy
	NRHHR16hKR7/QLvDVa/pyEgOTpmJ5UPOnVF6Kf0GL8nbEBhoDtjqLOto5kvbyr3WAzQlsmTjl/4SE
	c1mNIT/Z+THo5EBXXGxBoSDnqvGxOqTyJAxwmaOFH+WktMuJW4UIF7hKoERntzf9V0Gj06568Pz5b
	nNzZFXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVjTh-00000009uwI-2cj3;
	Fri, 02 Feb 2024 02:40:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVjTe-00000009uvX-0vZW
	for ath11k@lists.infradead.org;
	Fri, 02 Feb 2024 02:40:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4121a5B5029120;
	Fri, 2 Feb 2024 02:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=x3B6yMo
	NCPrcXyrT5pXAy2ib6QX9PgtK6OglhKLjstE=; b=DTocWw131xcgh7qfGprXsrV
	wEp+tjy50TpKn8iKxgjp9CxroXLvZMzhSbvtiBWwmcqfYqQmPTeGfnpZW835AUUJ
	mpOEXZjKWhlXPNOs60oLld/sVo8fI51/5AlJPfkjQeDo25oQOz/aKUvX6Gzx8dfB
	W83uqId8hIsOQwpmCpLUCR3NLwdbQUAZGhCSPtbmfxR79K8CZh2wS8JGrfOWmrAI
	Wt7pvDCvsr6paMeq7CiWRkzbCCMpcbiaAWjbWCT/aog0EgNmkaBdxx3tG4dpC33j
	r7m2Z+0PzoOzzHrU2gtmLAU23HgkHG22moe0EzR5YL5MxiA8v3Q3k0T5xVKKL+A=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0ptyg3gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 02:40:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4122eO3k032520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Feb 2024 02:40:24 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 1 Feb 2024 18:40:23 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath11k: initialize eirp_power before use
Date: Fri, 2 Feb 2024 10:40:11 +0800
Message-ID: <20240202024011.11341-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: STSX0Rp9myUR-i7J5CeSil7NHcocYZNf
X-Proofpoint-GUID: STSX0Rp9myUR-i7J5CeSil7NHcocYZNf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-01_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2 malwarescore=0 spamscore=2
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=165 lowpriorityscore=0 mlxscore=2 suspectscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_184026_292349_A93D2E5A 
X-CRM114-Status: GOOD (  11.75  )
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

Currently, at the end of ath11k_mac_fill_reg_tpc_info(), the
reg_tpc_info struct is populated, including the following:
	reg_tpc_info->is_psd_power = is_psd_power;
	reg_tpc_info->eirp_power = eirp_power;

Kernel test robot complains on uninitialized symbol:
drivers/net/wireless/ath/ath11k/mac.c:7949
ath11k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.

This is because there are some code paths that never set eirp_power, so
the assignment of reg_tpc_info->eirp_power can come from an
uninitialized variable. Functionally this is OK since the eirp_power
only has meaning when is_psd_power is true, and all code paths which set
is_psd_power to true also set eirp_power. However, to keep the robot
happy, always initialize eirp_power before use.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Fixes: 92425f788fee ("wifi: ath11k: fill parameters for vdev set tpc power WMI command")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index bbf4d1f4d310..310055843ee9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7592,7 +7592,8 @@ void ath11k_mac_fill_reg_tpc_info(struct ath11k *ar,
 	u8 pwr_lvl_idx, num_pwr_levels, pwr_reduction;
 	bool is_psd_power = false, is_tpe_present = false;
 	s8 max_tx_power[IEEE80211_MAX_NUM_PWR_LEVEL],
-		psd_power, tx_power, eirp_power;
+		psd_power, tx_power;
+	s8 eirp_power = 0;
 	u16 start_freq, center_freq;
 
 	chan = ctx->def.chan;

base-commit: d4d13947306ab3c98c84389d9397563b550b71b8
-- 
2.25.1


