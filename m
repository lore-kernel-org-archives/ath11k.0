Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20B1C0015E
	for <ath11k@archiver.kernel.org>; Wed, 26 Jul 2023 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuCR4sP5nzsf31F7GtbCXVtkRRElAWM+KOVPl40D9U4=; b=xcuGSzQ9TJ1x4H
	Fwskj1BuzwpfqNwkdDTARBcS+cUjQhkW3q+Oyqc6ExFX8usU8om/7iLyewQLtOidxdslqEtIhqRXs
	C/M2jPyf77HPr24u7A7LAv+WWT5PMFlJ6h9XiBn+VImp1HjkqMQyG5nYa10mG9umHvjKOg6qV2zzc
	enE4mXrcOAC85AMODOyR10dK0Hk08CqttGOPIuIUvJ/+8jVrDXIPP/T9kdF6FJKXYuFMa/Hz6gWGa
	s8efrSzfo58KFiscMJa4lS7WTNxbqC85fY081gog7uQCT5IRZResi9eosZnBPS3IDCZbD0oeoCdHR
	xS37Z815dOtwQdaFGP+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOfEF-00Advh-1D;
	Wed, 26 Jul 2023 14:11:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOfEC-00AduN-0x
	for ath11k@lists.infradead.org;
	Wed, 26 Jul 2023 14:11:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36QCpmWf010039;
	Wed, 26 Jul 2023 14:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=PIq1sGfa2rC9FQr1Tm6qDBqE2KAZFIPCIiKPaj3TQ54=;
 b=Nr4IHZq58vf6hhAMCSyWFCCvsONxgtLze4hUGYuo1fPmYxDXfnja3SDxapuU6DLuGr8E
 hbBpnAnil1O6PPqDAbP+MaUOhPMpgf42V2lzLcqLv0utBQ66cOWgEHoR0OWX+lUMFROC
 sBrcezBRYWgNktqFMGvKtl5Y2kxV7LpKbtqgKxJxoWOSqQxkuTJrEytLxI4qON/WZPi9
 Er1IOLvr1Y8YPD97eDLnvTtBq1jrOAyaqoppdFsngD9apE0BMhPceKw2aL/XBhgZD09D
 PJgKznxHgRKoUuoWg004RBlb4jxRNjvf0nAePZwF+qoUlCdalcBjjejnhxeD91ThlFS/ Iw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s32jn0a4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 14:10:59 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36QEAw9I005975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 14:10:59 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 26 Jul 2023 07:10:57 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Seevalamuthu Mariappan
	<quic_seevalam@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH 3/3] wifi: ath11k: Remove cal_done check during probe
Date: Wed, 26 Jul 2023 19:40:32 +0530
Message-ID: <20230726141032.3061-4-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230726141032.3061-1-quic_rajkbhag@quicinc.com>
References: <20230726141032.3061-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7t9rbuEhyfOPQcK8-POzam4yEAefwWCZ
X-Proofpoint-ORIG-GUID: 7t9rbuEhyfOPQcK8-POzam4yEAefwWCZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307260126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_071100_340361_C959973E 
X-CRM114-Status: GOOD (  16.78  )
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

From: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>

In some race conditions, calibration done QMI message is received even
before host wait starts for calibration to be done.
Due to this, resetting firmware was not performed after calibration.

Hence, remove cal_done check in ath11k_qmi_fwreset_from_cold_boot()
as this is called only from probe.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index c4eab5d7f..617abb441 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2844,7 +2844,7 @@ int ath11k_qmi_fwreset_from_cold_boot(struct ath11k_base *ab)
 {
 	int timeout;
 
-	if (!ath11k_core_coldboot_cal_support(ab) || ab->qmi.cal_done ||
+	if (!ath11k_core_coldboot_cal_support(ab) ||
 	    ab->hw_params.cbcal_restart_fw == 0)
 		return 0;
 
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
