Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F7EC433FE
	for <ath11k@archiver.kernel.org>; Fri, 21 Oct 2022 09:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gENTR2C8EsVhs0epfdM5NFdgQ0dEZ3it91WRQDd3c6A=; b=neDvYG+h1vxjH7
	78Sf5XAPjUaXxQmu47oOK3+wSr40W6SGgKFAwoYsZ/YHEkpGbK4Zh+lQBynWLjGVfC4w9xCPPi8Gk
	XGzAd/WI2i19a7lG3msaGqwJjOmI7UVWwPvevQcXRV4LkYCroc/SLqx2bpYr8Pyu+WzEF0L1Rf5xA
	wp5V9LJPUipCntykUO4GmaLeOj30Uc7PTATzO8XDQ2Mv7dhTvMmr6+SDQoaT/GUWRDglHG5PG04JR
	pEQ4WoY35nkABD9PoVeCItJ8iMg1C4/2lzUYHmBekugzyCTpHlw6nM5QcK0lIr3N6F5d/bpAcVEjY
	lWfHBulKyAHKLmdrYMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnuY-006clN-De; Fri, 21 Oct 2022 09:01:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnuV-006cdJ-8w
	for ath11k@lists.infradead.org; Fri, 21 Oct 2022 09:01:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29L784gN000629;
	Fri, 21 Oct 2022 09:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=nx+bgSZzf59VKx7qmt+78u2THS80DFLehXCuYuBTseM=;
 b=jpFyuOQv4yA78a4wCCGiFLR4UCDIC5VFdioUhaRA1iqNLjAJiLnFj2Vju46mGkOJj5o1
 Tv8fx9poG1fBrFJJ2XNmqDRvmXRb2a7EHDULFSO1bOIGjXtvHcYJzInfdgMNbMsYlTCj
 X3LQTorgQrGSPL47feJJ9fsqhdMoOYp/pks3qImLtK2D+Jif792TvXf39eNQLaj7tfaI
 67yoSajaK5+ePtoN713rgt/6xbzTExHPwLuoubK0jRDiMj3XOvz8pDQSKn3AwJpXRQ41
 9VEysEDrvm/Xp0mBL29xYxdgSQI5GD4QxfOT9IC6E4yoWI25TZeNpsKqsKTXNYkR25rD Hw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kb2c635tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 09:01:40 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29L91eHg003840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 09:01:40 GMT
Received: from rbhattac-linux.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 21 Oct 2022 02:01:38 -0700
From: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rahul Bhattacharjee
	<quic_rbhattac@quicinc.com>
Subject: [PATCH] wifi: ath11k: Fix qmi_msg_handler data structure initialization
Date: Fri, 21 Oct 2022 14:31:26 +0530
Message-ID: <20221021090126.28626-1-quic_rbhattac@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Qi_AnLDNa6awUOAZVQAu1qEecr0iBYcD
X-Proofpoint-ORIG-GUID: Qi_AnLDNa6awUOAZVQAu1qEecr0iBYcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_03,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 mlxlogscore=941
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_020147_450684_E59A1505 
X-CRM114-Status: GOOD (  13.57  )
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

qmi_msg_handler is required to be null terminated by QMI module.
There might be a case where a handler for a msg id is not present in the
handlers array which can lead to infinite loop while searching the handler
and therefore out of bound access in qmi_invoke_handler().
Hence update the initialization in qmi_msg_handler data structure.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 145f20a681bd..bda4921208cc 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3090,6 +3090,7 @@ static const struct qmi_msg_handler ath11k_qmi_msg_handlers[] = {
 			sizeof(struct qmi_wlfw_fw_init_done_ind_msg_v01),
 		.fn = ath11k_qmi_msg_fw_init_done_cb,
 	},
+	{/* end of list */}
 };
 
 static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,

base-commit: 087c436cbc8b1bf3d3bc7ea94d6757d74ea2f470
-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
