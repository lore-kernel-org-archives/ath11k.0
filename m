Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660B1C4345F
	for <ath11k@archiver.kernel.org>; Mon, 22 Apr 2024 20:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GomIZghFLffr51ynVf3yJ+CpSLkv8zchnlTHz1ijFY=; b=CCNU1HruipbmedTgCPFxpHS82l
	D4xEHFpJbtAxEQVESCT7OWawUyd36SmM3pYBwR+9lfosXWTJsKGUfxUgixoeRy0IBmi4afG+Hylbf
	F9TyMihWibP4IFzCOg91OsnGzKu1Lt1HCM9/ODlwIOLcHMc01HpbWO3R8Ph2A9CRfO+pPIx/or663
	A25IM6nZkQDIZysIhP4C0MsyQKMn6opVeq/hlMVx+7dIsCts0m9vK7BR8o4zfQVS2HKNS1jf3cqge
	GZL+vbj/fWBHpDLY/0Maap4t5lbqabBoqTDSeAWLb8Zq3y8hKWuN2AEjL8DJoe6gcNbMqCu5aNybO
	9jS2F8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz0JD-0000000EyY6-2USX;
	Mon, 22 Apr 2024 20:30:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz0JA-0000000EyXG-3mEz
	for ath11k@lists.infradead.org;
	Mon, 22 Apr 2024 20:30:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43MELQxO026536;
	Mon, 22 Apr 2024 20:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=0GomIZghFLffr51ynVf3yJ+CpSLkv8zchnlTHz1ijFY=; b=Nh
	31reGnCdm7pPnH5NR+uz09P5IeIyvif7wlH1awF0k8/WN4OhzadBA7C5NVBY/cTv
	5PvTXN1ftDHNOK6i+0cBjakTqQShe6Xmu6YRznR5lVkujD2n5wuooeuMoawuriDu
	fttmgLf9rvqHNeNsCs8s7shJvp8B4mYqQeXG537KpEYJ42bLGGNktkZPD9rYWjbZ
	Y1pWfkkOhQIm6HGKBaOWxHnKLxzxDzFwhx3qdZzpcaD1rup0ljsVXzW16FMtsMJq
	vCqde8/D+9lJOEc9vX/bd21TwT8+wJXz5WXrRjQPZi/BO63DusRxOwp6gU3dhjH8
	aOUm1SG26GxKKpsZnE5g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnsjggwrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 20:30:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MKUWLG018723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 20:30:32 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 13:30:31 -0700
Message-ID: <e5998899-2774-4f95-b35c-084fa38cc341@quicinc.com>
Date: Mon, 22 Apr 2024 13:30:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: move power type check to ASSOC stage when
 connecting to 6 GHz AP
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240420015632.2869-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240420015632.2869-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j0y2MYnm7Xpr-Y6s6BsY63q0pRPgrZQy
X-Proofpoint-ORIG-GUID: j0y2MYnm7Xpr-Y6s6BsY63q0pRPgrZQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_14,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404220086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_133037_102314_C705C612 
X-CRM114-Status: UNSURE (   9.65  )
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

On 4/19/2024 6:56 PM, Baochen Qiang wrote:
> With commit bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
> ath11k fails to connect to 6 GHz AP.
> 
> This is because currently ath11k checks AP's power type in
> ath11k_mac_op_assign_vif_chanctx() which would be called in AUTH stage.
> However with above commit power type is not available until ASSOC stage.
> As a result power type check fails and therefore connection fails.
> 
> Fix this by moving power type check to ASSOC stage, also move regulatory
> rules update there because it depends on power type.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


