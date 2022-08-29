Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F845ECAAD4
	for <ath11k@archiver.kernel.org>; Mon, 29 Aug 2022 05:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWvKEiZ330R1Q4gkV066yVDS3jHZzydNSqZ2dMcWufU=; b=bxWNqLGrHSxbI6
	4gCml8blCepOZAIyywriefs3SaDnoFmbll1aQR4JXlVl0JcA9Eu09sweSfnndTEgZhxhnDmb+/5aq
	YeRDuhE0xhfiImHCNMhGYoHVO/pa/GiUpJ+ZYElaUeUrUjbHS8LwNzHuE8Hl0a7djr3sYwHAauWev
	Rf9Br2aFSJ2gALin8GsGeWBO6ivAb2bYA5qAC6Y3H9MRW1JKo7ySrrq/9/Mz3UfsdcqWDJpNHcFTi
	QPsLwLint1P9hKfnoWSzxZ0ciJv88hpWq45m0NYS+LVE0836wiQwghWG3NRfraKD2KxkOae0DACiG
	rKDsCoYW3cRESRwq8c1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSXMq-004tgw-RA; Mon, 29 Aug 2022 05:31:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSXMn-004tfW-PV
	for ath11k@lists.infradead.org; Mon, 29 Aug 2022 05:31:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T5QKom012414;
	Mon, 29 Aug 2022 05:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Eaj+5Ee2OVv42snYIv6RjUIVV6uwsW+Zj/AkLYh1dS8=;
 b=C4l1aA4DLwbnGrMkQ05SQySVRo5eh9R54v1CLrEYEiK+Qj7ntvu/yEIeTL9MWaUs3e1m
 nPV6De2u2/AXY132CIyCk3ppq2EaDFzeBtrdq2SOhY51QWPfBMyumaNA2AeFpB+1VJI8
 gBBUPJHuMfisfyxnprWk4khYpJgVlzMwe3iWi7McL9WIo0F1ofxTEKKoEnx/7lblzi16
 43VleJnXg7RryYh4xJUh+lvKX3KPP6kJH4Yxj9YFt4uu+CnEnltYNA1i6N+X7d35Igw8
 +Ik0Xt/F0oq6iQAu/Lb5KKBy1eW73/XQypMiv/ubfGC9aqNeFfCg9SREcX3E4f4UKi5X qQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j7a7ym82e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:31:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27T5VKNO026545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:31:20 GMT
Received: from [10.204.117.202] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 28 Aug
 2022 22:31:18 -0700
Message-ID: <2b46bca8-4cdc-700c-bd94-058bb2e65868@quicinc.com>
Date: Mon, 29 Aug 2022 11:01:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/4] ath11k: Fix double free issue during SRNG deinit
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220825111818.30869-1-quic_mpubbise@quicinc.com>
 <20220825111818.30869-2-quic_mpubbise@quicinc.com>
 <44b3af84-1a83-7ff0-b826-8532bee0b4c0@quicinc.com>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <44b3af84-1a83-7ff0-b826-8532bee0b4c0@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CyBmMniIOY0R-RSAD8aZiL-4kLfu1tdW
X-Proofpoint-GUID: CyBmMniIOY0R-RSAD8aZiL-4kLfu1tdW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 clxscore=1015 mlxlogscore=744
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_223121_871541_5D8C3A02 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 8/25/2022 8:29 PM, Jeff Johnson wrote:
> On 8/25/2022 4:18 AM, Manikanta Pubbisetty wrote:
>> Currently struct ath11k_hal::srng_config pointer is not assigned
>> to NULL after freeing the memory in ath11k_hal_srng_deinit().
>> This could lead to double free issue in a scerario where
> 
> nit: s/scerario/scenario/
> 

Thanks Jeff, I'll correct this in next revision.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
