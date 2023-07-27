Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7EFC0015E
	for <ath11k@archiver.kernel.org>; Thu, 27 Jul 2023 12:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xq9G5iPOorMekazp8ffvKhOOBOkPPohqp5sw2K+KqaM=; b=cX6IFplhFeZv/O
	DeIsKkKrvWTrspIzYamX7SXM276DRqEJMrYREsad2YAvGIUnq0WgYrNXakU3gGXB19NfFyOd++/q/
	3m62q40P03dUjqWNYeclWxvuF1Yxrw2fc7oJal3RgBlsGtEZU/q189sY0jMYq8VP6E52Ky1gEhwqh
	uDjUdglo2w2kHFcMnkQeoKJ+f12L0EbSPXIL0e/lSFloLRD16QwbcUd+b+z/amYGrZmBD/gsFt7/1
	2I0SYh4F4HLe7rgRL0F9/Nic6ygnzORSihp93T2W7RJ0dND3wRu8AAFE05UJy90mGHyhILnnRUnUl
	gs5sr9zytH9N7IMpwEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOzhA-00DeV4-1E;
	Thu, 27 Jul 2023 12:02:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOzh8-00DeT9-1C
	for ath11k@lists.infradead.org;
	Thu, 27 Jul 2023 12:02:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36RBcmAO005273;
	Thu, 27 Jul 2023 12:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=c66rH81/HvZjMXr16HEDVeDfgT0JblMNYw7eC+TZXx4=;
 b=anI0DAvRdGtLhkMJW62O4x62ogZH/h+7EslLaSMN8zgez3OcqgrzQCV0zDXv4xrLnp+k
 5IogBDaCGVlaL6QgGJfDnmg64G4ztPoDyARSnjGkff0OhaMDTwKLHhv17By0uwC3Gj6P
 VOxjn2gWoc7Pi0/RUcx4Xcp3SHfNKpGTOst4wCV1OKHmtHByAyRlX6ARA99L3o5aX6GW
 lcZQNlGdDptQyiyosZfFvaDD5gfywcyJxDC+CR/MWnuxTD4uPirSCMBTSYrpsygdkj6f
 wD+RSxbLltEarPASrHFlKiZCt8IK903CyQe3RnxRy5XRVvxPy6D2iG9b2dlofPJdqcoy kQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s336t2mvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 12:02:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36RC2BtM001578
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 12:02:11 GMT
Received: from [10.201.207.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 05:02:10 -0700
Message-ID: <dd61c69b-793c-2842-c7c9-698323e5b1a6@quicinc.com>
Date: Thu, 27 Jul 2023 17:32:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] wifi: ath11k: fix band selection for ppdu received in
 channel 177 of 5 GHz
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230726044624.20507-1-quic_adisi@quicinc.com>
 <8fe1a927-14da-445c-4c48-e3f4b4c324d4@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <8fe1a927-14da-445c-4c48-e3f4b4c324d4@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LDVbyughAX2OQnrlx5_WyLL7jC1vxfxN
X-Proofpoint-GUID: LDVbyughAX2OQnrlx5_WyLL7jC1vxfxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 mlxlogscore=934 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_050214_416728_449A5E10 
X-CRM114-Status: GOOD (  10.20  )
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

On 7/26/2023 22:24, Jeff Johnson wrote:
> On 7/25/2023 9:46 PM, Aditya Kumar Singh wrote:
>> 5 GHz band channel 177 support was added with the commit
>> "wifi: ath11k: add channel 177 into 5 GHz channel list". However,
> 
> I'd use the same syntax here as in the Fixes tag:
> e5e94d10c856 ("wifi: ath11k: add channel 177 into 5 GHz channel list")
> 
Sure, I'll keep in mind from next time.

>> during processing for the received ppdu in ath11k_dp_rx_h_ppdu(), channel
>> number is checked only till 173. This leads to driver code checking for
>> channel and then fetching the band from it which is extra effort since
>> firmware has already given the channel number in the meta deta.
> 
> nit: s/meta deta/metadata/
Oops! Thanks for pointing out.

Thanks Jeff for your comments.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
