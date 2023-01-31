Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3838CC38142
	for <ath11k@archiver.kernel.org>; Tue, 31 Jan 2023 14:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5J39vifOoaKzOSmDGj6sBZ3HxErgHpwKTrlf/Yzr/WM=; b=lz1zWGry/rJ3iA
	H2rUPma5W0pjEuLW+QdRIFxLT+XXjJhLKm5eu6bv9XNxgc7lKqmmiR65VYIqSGaVFppndGL8xVhjg
	pw4CHfdcglg+GFj7e47P+zanAXBsXRoAnETJM0+wq75zeR/lyiscWMO1avUdO5N8xVFfhKWguIzJu
	yO015NahY1UGwpe+BObKIS//TfBxtDGME9VqxpgOD/BtNgOcy8syHshtCbMIurvtZBQpOqVZU4Kvs
	JKA9gJHe3t1omKrYDC3Gc0iJTQZlGWOr8tjI6MXJx+masWINZsMA+gEXkGtALzW70ACLuhOfqtDfS
	DlKsOCA0ZzSJiuMHWGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMrFd-008EIh-2t; Tue, 31 Jan 2023 14:04:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMrFa-008EGu-G3
	for ath11k@lists.infradead.org; Tue, 31 Jan 2023 14:04:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VDlsPZ016449;
	Tue, 31 Jan 2023 14:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=sNyspbgSQavAe6hhen9QEwZiWWvxgslE5XAUFkc5gjE=;
 b=KAaWnWAbEpDJLHVjJyhRhiCJB2lnn7SDeVxf0SDL98nN0vad/6t2th7Pesnd2J0aZyFt
 t8Y0waQWI094pd138o4NqmzRWKjSNjLVN65PXZrfoug5+5MdlhOandKeI4hlaK2r/Vew
 /HCqCGCOWmqLUpBHY3cM9F7NsnLf2p7ifyLAUiNd22AIETgn3Pz9K+3tJOwcHz5enECV
 H05lqHnbJTCCiOvfymMvALzTTpRL+03kHFhAVR8pLEQXrAf5OTgX8q1aKiAoE3nwO4ci
 X6GR3SHj9j5lLhSyqdVDzyGkttN590jT8XqFZRcMTnrMsbeI4JayfN17gqueFJTAJThz TA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nefmftvrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 14:04:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30VE4Q13028516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 14:04:26 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 31 Jan 2023 06:04:21 -0800
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Youghandhar Chintala
	<quic_youghand@quicinc.com>
Subject: [PATCH v2 0/2] dt: bindings: add dt entry for XO calibration support
Date: Tue, 31 Jan 2023 19:33:43 +0530
Message-ID: <20230131140345.6193-1-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: keooHaK5NLQm3oVQb0nRrG6fo6HCXO2b
X-Proofpoint-GUID: keooHaK5NLQm3oVQb0nRrG6fo6HCXO2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 priorityscore=1501 mlxlogscore=816 suspectscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301310125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_060442_748728_581DD478 
X-CRM114-Status: GOOD (  13.79  )
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

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>

Changes from v1:
 - Sending the series to right list

Youghandhar Chintala (2):
  dt: bindings: add dt entry for XO calibration support
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
