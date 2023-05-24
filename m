Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566C9C77B73
	for <ath11k@archiver.kernel.org>; Wed, 24 May 2023 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WH07idpPYaOslp4erltqw+JWv5lulC7gq8lnWvEWkCQ=; b=hm6Skr6OECKdon
	T4osgxILhnu7F15mMiVxtdl69zyc2O+ukjHWT6imlEfYgYzUeB+OTIdJt5dkPYXI4rJP7TdR0LUjO
	bpGWEEUKxzXLL6iCOT6/x0HW9k/6L5cXomMk8eGlYVX1Spr5iFQbohrk6NtzGrpPly8ngWY0Dlk/2
	yZVriZRZfEUUMqgR1nGSGABWYkf23Kq1MlcdPJU1IjNTklcOW0il2eigUxFUNFIZxZt0u1u0SOC6L
	oIwds900OOhsuFDA8Z79kOeA+qKJh7iH25UVRX/OY3WoHzSEKp6csP5FTV+oz+UZdy0pTncVooZnx
	3E2RMrbFcvFQvxQXZIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kOp-00CspH-03;
	Wed, 24 May 2023 09:03:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kOm-00CsoY-1l
	for ath11k@lists.infradead.org;
	Wed, 24 May 2023 09:03:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34O6abYO017530;
	Wed, 24 May 2023 09:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=N/p+dePJSk7D0FoMiKsWRSRYPh86mqh1AROoetvQcv0=;
 b=VljOIB+V6uTJIzBaJCDXiHFK2hX8B20O0kKI5xrq8hya4/tKuuRgzgaRjkd6p1KL7Rje
 rR5YhK0HKIw3SrsybUB98+f7qx8h38xu6sB6jXZvPJEs5mAVuvbV7GE7P0GKdsZ/PD6z
 4i+hmu9eJW4n0OYlMsKRqdFeRs4fOIc4x3ReR3pMCUd9Ph9JV8cIxWT/iGVg1ncsAcXP
 KNskyI2G9+rcb2/7b5F5g138bJ+ou9N8QxMZmxH6MGPbB8/5HCmrK5rooH7YoTNVNp51
 L/GQlcp9uiwVQcjQ9ReloqLCsD8I96qb9ngoNxXhNLKAzmML3T1bE0jo7ZdhRs8oY/9k 2g== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qs69811r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 09:03:09 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34O9380s026108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 09:03:08 GMT
Received: from [10.201.165.164] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 02:03:06 -0700
Message-ID: <d6f794e3-7463-da7d-721e-00869faf4c17@quicinc.com>
Date: Wed, 24 May 2023 14:33:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3] wifi: ath11k: Add rx histogram stats
Content-Language: en-US
To: Tyler Stachecki <stachecki.tyler@gmail.com>
CC: "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
	<ath11k@lists.infradead.org>,
        "open list:NETWORKING DRIVERS (WIRELESS)"
	<linux-wireless@vger.kernel.org>,
        <quic_akalaise@quicinc.com>, <quic_mpubbise@quicinc.com>
References: <CAC6wqPVvke=Gy59yvYcaps2dwVzO=wfwdSTGNxFzAOWc5OpoDw@mail.gmail.com>
From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
In-Reply-To: <CAC6wqPVvke=Gy59yvYcaps2dwVzO=wfwdSTGNxFzAOWc5OpoDw@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gGsXZOF5rSkMptCEG_6FLT_dTCWHdPNj
X-Proofpoint-GUID: gGsXZOF5rSkMptCEG_6FLT_dTCWHdPNj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_05,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=775
 impostorscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305240076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_020312_734611_EDDB7EDA 
X-CRM114-Status: GOOD (  19.21  )
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


On 5/21/2023 11:21 PM, Tyler Stachecki wrote:
> Was this really tested on QCN9074 as the commit text suggests...?
>
>> const struct ath11k_hw_ops ipq6018_ops = {
>> @@ -1132,6 +1147,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
>>   .rx_desc_get_msdu_payload = ath11k_hw_qcn9074_rx_desc_get_msdu_payload,
>>   .reo_setup = ath11k_hw_wcn6855_reo_setup,
>>   .mpdu_info_get_peerid = ath11k_hw_ipq8074_mpdu_info_get_peerid,
>> + .mpdu_info_get_mpdu_len = ath11k_hw_qcn9074_mpdu_info_get_mpdu_len,
> ...
>
>> +static u32 ath11k_hal_rx_mpduinfo_get_mpdu_len(struct ath11k_base *ab,
>> +       struct hal_rx_mpdu_info *mpdu_info)
>> +{
>> + return ab->hw_params.hw_ops->mpdu_info_get_mpdu_len(mpdu_info);
>> +}
> I think you want to put this under qcn9074_ops. As of now, when
> QCN9074 is present, it attempts to jump to a NULL pointer as
> mpdu_info_get_mpdu_len remains uninitialized for qcn9074_ops.
>
> And, do you not need to define mpdu_info_get_mpdu_len for all the
> other hw_ops? If so, please be careful about defining it for
> WCN6855/WCN6750 as there was a recent regression due to how the RX
> MPDU info is provided by those firmwares as it differed from
> IPQ8074/QCN9074. I personally do not have the appropriate literature
> to determine whether or not this is consequential or not here as well,
> though it seems like it would be:
> https://lore.kernel.org/linux-wireless/20230404072234.18503-3-quic_youghand@quicinc.com/
>
> Tyler

Thanks for your comments. Will fix this in the upcoming patchset.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
