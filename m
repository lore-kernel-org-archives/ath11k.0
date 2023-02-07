Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE88C636CD
	for <ath11k@archiver.kernel.org>; Tue,  7 Feb 2023 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5J39vifOoaKzOSmDGj6sBZ3HxErgHpwKTrlf/Yzr/WM=; b=U1zytZPgMH2c8C
	d0VUB1vt5GN4k1WCEYgFM2pTbb6UE7ZEKRPOxWu9IIPUkhrm0jPMnCvEnDNHGh3YJIqxOEHS1ubSm
	e3CiIl9rosc/EmJIgNTNfohzPUNTCmwR54/rkf5gUKJD6MTF0BhKCBbDF1XMSkpTrW9In5kYdXPXs
	g+ODap7XrWivVpE8Gwio6s/EEjUI1cGGkm1hnVHy0i9nz+W1+x+N72f14+yPZ+y9t9WWxZLTJ/01x
	ZkKmaL4qAjTR/WnezdG95Qnmd3uflotb3e/GCtZHxgQJgBMJQrbha3l+4cn3f/XFVFEZ9znSUokgS
	5/dfmDmHwCAgD5v9zGPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLHh-00Bj9L-CR; Tue, 07 Feb 2023 10:33:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLHd-00Bj7C-A2
	for ath11k@lists.infradead.org; Tue, 07 Feb 2023 10:33:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 317ACb7C018719;
	Tue, 7 Feb 2023 10:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=sNyspbgSQavAe6hhen9QEwZiWWvxgslE5XAUFkc5gjE=;
 b=gdkbgPhdnhOWX9MnyzVOijUFy2Bnw7O+Js5uW9GngWHsopcKF498R1OH5sm1QQzWKoL2
 RYG94JyIylpMl+7vPaetlv8U4+GXmgMPdZprDVv5VfzVTaaN7p8VQSDLeNfbz+DAjhNz
 fq0MNcdL0Vu0vX1C8mo73P4w/+vHksQFx5CELN6KJFFZoiZCZppJkfi/qdIt8Lc/JrWy
 hb3PBpHsv6bltY9gMi0kKxA4C2S3cbiGDBmO3jMYh2A4HABu1EIbsY0bOuHqJuJ8hIH5
 o6l5IwoBeMPPcArNrB5PxE7dDq77VfXC9E8eAVV99yucB84i15uyJCwoBpyLwLeT4cyn tA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkmnnr1n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 10:32:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 317AWrsn021504
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Feb 2023 10:32:53 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 02:32:49 -0800
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
Date: Tue, 7 Feb 2023 16:02:04 +0530
Message-ID: <20230207103207.759-1-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0onCTaO76oW5QmPXpixOUAYzNUQzDKzq
X-Proofpoint-GUID: 0onCTaO76oW5QmPXpixOUAYzNUQzDKzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_02,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=838 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_023305_378642_D0ED7546 
X-CRM114-Status: GOOD (  13.00  )
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
