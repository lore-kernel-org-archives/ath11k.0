Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D149C32771
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 08:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MqkyfOPLpdEQffevSPIyW35DwR7xEKS5kMKctRUZjEU=; b=sBYyqk6l6WquGK
	47eREBDrqtq0aWp0E913ovXzeg6tdHT+0EjpYdr5NERfqYmCxrH9wTY9kkXQTHHsouSN/p+uJpZOR
	zKxcmdur5fa6Myufn/1mFA9cnleEjuzfJHbVrUbQWLor7GtR4ECpSiHro8Ybj82il0PB1XSnhcL+l
	oZ0z3SB2FJ4v/0DobjtJDKzcX1BsG39wS5PZFcqtvfd6ZA0jQT9/aRRok8+d+xlULzUvOa/FDj5Sy
	WEGrbvFobQzDOI6ajVCSt8TYB0DEyJv8UkXlcQXfKblg/M1e6jHsVn6/c/sHW7muNgSw3ZzpYg04q
	7iWPG2FAexu5urScLYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSDF-00Ep9i-Ku; Wed, 28 Sep 2022 08:14:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSDC-00Ep5N-IU
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 08:14:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S5XP2b012413;
	Wed, 28 Sep 2022 08:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Q1iHjZ27nnbdTmkae/B1TUP+c75TPKX6ACNPufstok0=;
 b=MwELVL+J1TSsvyUQFNgA2EMwwEF8Ry+NODnvjcc8+CklRXZiF2BJOnK7kr3JzpXDUjjb
 AISNNf0J9rN6OtWdpnKRYn69fvRpWEQanQTDCLR/aO6YAW8wXM+HZ4T+F93Bld0/HWbz
 jB6mlJgL1IKrfE+yX/wOZlKlwjtCIbORX82Fud2+z4MJ4E7NumESJDol2c//GxAsNiIc
 dvJyEstL7mpWy85HMIb2HISytCrH4aVUJN6EpE6aaG9ouMHhefNOI4RC5/DYvnBO85na
 9BUgjrxFDjJ2xaT26Mhe8UshlVmsEITF2pgW0mgBFtaVf7rNY+7xusUFz9edtqWVhRGP Tg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jv28a3dk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 08:14:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28S8EVds024766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 08:14:31 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 28 Sep 2022 01:14:30 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2 0/2] wifi: ath11k: reduce the timeout value for hw scan
Date: Wed, 28 Sep 2022 04:14:11 -0400
Message-ID: <20220928081413.27339-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cERUvsyD_1yFqhrUHD2r5W9_zPhPpyay
X-Proofpoint-GUID: cERUvsyD_1yFqhrUHD2r5W9_zPhPpyay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=566
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209280050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_011434_626581_AE0BE6F7 
X-CRM114-Status: GOOD (  11.50  )
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

v2: 
add "wifi: ath11k: change to set 11d state instead of start 11d scan while disconnect"

Reduce the max timeout for hw scan started.

Wen Gong (2):
  wifi: ath11k: change to set 11d state instead of start 11d scan while
    disconnect
  wifi: ath11k: reduce the timeout value back for hw scan from 10
    seconds to 1 second

 drivers/net/wireless/ath/ath11k/mac.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)


base-commit: c6d18be90f9b0c7fb64c6138b51c49151140fb57
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
