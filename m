Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135D0C636D3
	for <ath11k@archiver.kernel.org>; Tue,  7 Feb 2023 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMXwCFHZXKV5r9hsk791iwdUaG1ZDdRlOY3L4Oqu1fQ=; b=VT+4soDQAnlJXD
	7TcW1miSOytcftSb/zN3nQKoeQ+LqmALVN6Df5OEJiXzD+cAydN2sK/QhCwP9q7LrZBNcLIuazZav
	Pk55RSS3La29TWAbgFHSgHqws1L+YXPzFOaBoQTVAL9c7bmLAYNobuFr8ouQ7fUn2JCBMmu9Dw4lD
	1Zq5lfzUc27ED6N/sZs6hAeGDwvm9qyfKItGn4z8bRdC18L1FvFzzg9e9jR3sKuwZnMi+j/EUFAJJ
	EPV1pg/gmAuP4w4iOhWtoQjl+EsdfU5vGtbLOgEjK4p1nRm1cDYZZlW/ZtkL84/+Tgok5au9ZDI5j
	oUK0sBYBEBtK42+chxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLHh-00Bj9X-S7; Tue, 07 Feb 2023 10:33:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLHd-00Bj7p-Nk
	for ath11k@lists.infradead.org; Tue, 07 Feb 2023 10:33:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 317ARs4k009617;
	Tue, 7 Feb 2023 10:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=XYWGTMx8nkY55fjz80XdD7trT0iRpLykxSOelem5Nkw=;
 b=RUDsD7aKAKl+MrfFk2uA5GtvlalJ0O3gt/deEJ927dJPL5QaA8p3vAWCzzLbcSyQ3cDI
 p2yG9mOdBxZGcRkVgTwnvTS3d9j3MSaED7D0Ybmklo2Dt2MNX8NyjnN+QRGMby8wS5ZR
 aqyqs/axAdLY+PS9qlfLYS3aDQJvNKeXrTcMtmeDLo3axF9Yo7lmmayaRRpDN8tSiNJb
 sUnGmG8MvCTcsiAozNPLVaL8atvkMim3dYr4fzqX9EmtKvoOn7gKoE5yLkLu5LDIOVsi
 DA5fTAXqtYGsNB67mpTlBW9cSLD2tD16wXlnTd1xY0ld7xm0AV/OOlyWDYwa8i13aOOT bw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkmwqg0bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 10:33:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 317AX0Ur024120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Feb 2023 10:33:00 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 02:32:56 -0800
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Youghandhar Chintala
	<quic_youghand@quicinc.com>
Subject: [PATCH v3 0/2] dt: bindings: net: ath11k: add dt entry for XO calibration support
Date: Tue, 7 Feb 2023 16:02:05 +0530
Message-ID: <20230207103207.759-2-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230207103207.759-1-quic_youghand@quicinc.com>
References: <20230207103207.759-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0lH507nvLbsFx7aD0I1rvX35yoKJQTvl
X-Proofpoint-GUID: 0lH507nvLbsFx7aD0I1rvX35yoKJQTvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_02,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_023305_811161_2960FB7D 
X-CRM114-Status: GOOD (  14.71  )
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

Add dt binding to get XO calibration data support for Wi-Fi RF clock.

Retrieve the XO trim offset via system firmware (e.g., device tree),
especially in the case where the device doesn't have a useful EEPROM
on which to store the calibrated XO offset.
Calibrated XO offset is sent to firmware, which compensate the RF clock
drift by programing the XO trim register.

Changes from v2:
 - Added proper commit text

Changes from v1:
 - Sending the series to right list

Youghandhar Chintala (2):
  dt: bindings: net: ath11k: add dt entry for XO calibration support
  wifi: ath11k: PMIC XO cal data support

 .../bindings/net/wireless/qcom,ath11k.yaml    |  4 ++++
 drivers/net/wireless/ath/ath11k/ahb.c         |  8 +++++++
 drivers/net/wireless/ath/ath11k/core.h        |  3 +++
 drivers/net/wireless/ath/ath11k/qmi.c         | 24 +++++++++++++++++++
 drivers/net/wireless/ath/ath11k/qmi.h         |  4 +++-
 5 files changed, 42 insertions(+), 1 deletion(-)

-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
