Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D623ECAAD3
	for <ath11k@archiver.kernel.org>; Thu,  1 Sep 2022 07:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0BfxbyuIj6UW0wTK6w3WTU6YDP/fTch8cg6I1byB+Y=; b=CVFpOki5zJ0+Op
	px0LrwHmVdsDlPrK8fNXYh++ayEPBiGZjDn7SvPdLB1yFchDuvQtAok++X/qiBzudPLNZE7gNXxXW
	WGaKQVo3Dxm5CAQXKtzIJeQl0PKYgidouoNdF3cXaUbXY7jwdj1x8JS0dSiihscY9lB+brEWYjFBG
	nZ4X6yVHhanTeAgjOqSd3/tZGx/qNhoGi23sFX66y/33UATEdL6kr9zUc6zOtIAKnIwMBxmR4ICqi
	ZHgre+g3S1EYb6y+FfCcinm/Yul6vaPoTxpYGheeo+TAukSIIHNNZh/ZpfZyIJd9CWN329a0R5YWd
	yA0NIS8yWnK2cFhoyc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTeyy-00APHR-OF; Thu, 01 Sep 2022 07:51:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTeyw-00APFm-Fw
	for ath11k@lists.infradead.org; Thu, 01 Sep 2022 07:51:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2814lSeL028048;
	Thu, 1 Sep 2022 07:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PcFyK6KGvGq4mC0icOyp05Smy4J3x1RKSnP8L9zS3fM=;
 b=cktMftbNcxpl9bqD5z4mOL97ICxfQVDkmRqeHMdLBcMcA7r0ktGh9OPmBcMtl8ekyAoG
 t7mpdFze/x3/ixr5RlZkA3dqHbExVQX7jbblPbadXGjRRGpKVGdt3n/INtfvBhn3gm4u
 bafq2ZhB57N5YqIHQjE/M/Kc00IXjkkoD+nAqpDpE3VbTQRnv11p6tnK2pYutlcxHymR
 a7UubsQvs5coswmyew40Lzz4ATaMsnBXB+N3T8kYLHjeHfnDWvXcejIUIJcdq1eWLtcS
 apCCCEEdp1vCX2w5HVv1oGpNdS9GAIdpZF9cMVQlr9wZZoiNHUntLrEe/WZ/lq25tr7E Ig== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ja79kk82x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 07:51:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2817oqg3029994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Sep 2022 07:50:52 GMT
Received: from [10.216.18.118] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 1 Sep 2022
 00:50:50 -0700
Message-ID: <e2127462-faf5-e22b-642c-9d012142326e@quicinc.com>
Date: Thu, 1 Sep 2022 13:20:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] ath11k: Enable remain-on-channel support on WCN6750
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220720134331.14832-1-quic_mpubbise@quicinc.com>
 <166192548485.26203.10728415761503127962.kvalo@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <166192548485.26203.10728415761503127962.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Pzfu7f81S28qp74zK202tHXgNEpatYd4
X-Proofpoint-ORIG-GUID: Pzfu7f81S28qp74zK202tHXgNEpatYd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_05,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=715 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_005122_700910_15F6DEA6 
X-CRM114-Status: GOOD (  10.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 8/31/2022 11:28 AM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:
> 
>> Enable remain on channel support on WCN6750 as it is needed for
>> GAS, Passpoint.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> 
> Failed to apply. And please use --base when submitting ath11k patches.
> 

Sure, thanks!

Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
