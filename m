Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602ACFA373C
	for <ath11k@archiver.kernel.org>; Fri, 13 Sep 2024 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iXUNVmeaFT0h/18epsogM6Zum1NUrf14kSHlNYHMCnA=; b=FKx5lAKkvQ+IFIWJyaDQe0PLjX
	ExHcaXDGk24cuQHsLxWl5qUj+iAFRfPdf24HTVb+mUqTXB63keY99dEAkkWPJOWYmi+83bX2WqjqO
	CHC6mKwN8qloOdjUuQXtUqRbJT2BNt2tuNVKGd2gXLhg9mv+gjGAEWtHXfJS9fGoAxmZvANnSI2HX
	AkM8dAeJBOwinLsbvutIC+pr05BoIuD1qWf162JzFOzR3ibbHxxetyQM8IWm1Jf69tTmlyuz2fe+G
	TgDeKyOiLGrHO5WI0y6uLFsHOjVEq6Yc7PzuLZtqovkC0KcjxSkvABTHiZEdbvdxJv62Jq+bDAqv/
	vv7184og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3E9-0000000FZQf-2Gau;
	Fri, 13 Sep 2024 10:08:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3DN-0000000FZKC-1nSS
	for ath11k@lists.infradead.org;
	Fri, 13 Sep 2024 10:07:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48D9iJgK004004;
	Fri, 13 Sep 2024 10:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iXUNVmeaFT0h/18epsogM6
	Zum1NUrf14kSHlNYHMCnA=; b=E75AKj5b0mfSOy35nuYxREsOmzCJR1AjeCw+YU
	ElrmJmcp03Ee0zDbadKnHp93m0+zkiqoB56iZE1jpi9krZO+FTpLj6fbZVdKB5Ib
	5yDQznaO927Y2YQc+Hw6azizy4sWbkCZW/Nkn0tMJcVdAb5XYkRz/74R5XO6AFjk
	oWkuZ3vdkNkyJWYZIbPqdo5qjMqoWR/7yaA9JCWryE6Z709aIlObraHMoYg4uPVg
	35F3EV7Vzqoxjy6mEqL60++Krff/jVzf+AQ8S6G2zDCs8t6xtVBzPDyxQk5iWH6x
	AtQyQjdIRIYEGL7BCG4fkiey+Q7xpsgy7GmIzYETr4ufo+pw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41kvma3yb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 10:07:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DA7gev016199
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 10:07:42 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 03:07:40 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 0/2] wifi: ath11k: fix full monitor mode
Date: Fri, 13 Sep 2024 18:07:06 +0800
Message-ID: <20240913100708.756-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mR92xQyFFtEWQHuRBfRV4SMuaq5tOd-8
X-Proofpoint-GUID: mR92xQyFFtEWQHuRBfRV4SMuaq5tOd-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=723 bulkscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409130070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_030745_608050_58E5386B 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
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

Fix a warning and a bug for full monitor mode. With these two fixes,
full monitor mode can work properly to capture packets.

Kang Yang (1):
  wifi: ath11k: add srng->lock for ath11k_hal_srng_* in monitor mode

P Praneesh (1):
  wifi: ath11k: fix RCU stall while reaping monitor destination ring

 drivers/net/wireless/ath/ath11k/dp_rx.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)


base-commit: 0606024b89d4ba59586cc7023d361a22065da8fa
-- 
2.34.1


