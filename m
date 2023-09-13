Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1808FCA5531
	for <ath11k@archiver.kernel.org>; Wed, 13 Sep 2023 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFwwm0LFUoboSocRdpaXSs7rCXsNKRAFGsfmJrppYwQ=; b=DEvmMPQvPxPd7M
	UopD8JOP61F59dXcrj7uYbYNZtf9tD4UIiSTWjjeA0UsCSrKeXs1xI7xdKw6EPE3Lf78sxEQith1E
	4U2/26j3UcWnDVH83HxLDb+dClg88Y/lh/cY3u5FhchaVJqINWUpDQBBVMqfg0SzKxIB5y82CyB3v
	set5W7Deoyv66v2KTLSHHIsFQbPruGncDcSrcNloQy13pYNWGr6IHEQPt87lzzgrIc7fdbeoEFJ47
	OzaH/eXT1/c4LZL1c9h3eiBs+3/+Oc8Li+J9nOW09bY3vb/q2a6A2l0qyzhq07Q7tDY6WLkmK2Dc8
	DsX3erhNEIWTw40IwXOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgMvg-005OJJ-2Y;
	Wed, 13 Sep 2023 10:17:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgMve-005OIA-0o
	for ath11k@lists.infradead.org;
	Wed, 13 Sep 2023 10:17:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38D9ldBA012425;
	Wed, 13 Sep 2023 10:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HKEQrBNFyvJI/zD44cJ2pqhpQw50EUobihvK3AaXJUg=;
 b=GLak9UzSLx5lQs6gxyB6WTUzZITi9bd8D3Ob/62kkfG97iN9z3JxmJC8OB5nDjsd/9hG
 89ThziDuzOcf9bRiT2hlBvkGQM8l72rYquB9jN+lo/jjqPwBhZzH5YMwtUfvwPKOZg/R
 +2igqyeKlzeo+U649lKCx+2Vu/J2cuc9qcOy2KWwzvkJLNTKMD3TpHczXkw7qecxEN6u
 mf5rT+7I7+sbAdE+VzM7r04NzyJj6brxZCfQXMUMnZz1abX+jdZo39LJma4aMQ3spiQA
 f6RoPJyTybnGAcK4pguhOP0GxWOL19j4dp9vLVeWxNw5zRZ7W6hLTA6M+iHjThGht8b7 Vw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t3ar3g2bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 10:16:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38DAGu9W007622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 10:16:56 GMT
Received: from [10.50.29.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 13 Sep
 2023 03:16:54 -0700
Message-ID: <511f23be-7b7b-42d9-9c3e-25edfa5d7323@quicinc.com>
Date: Wed, 13 Sep 2023 15:46:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] wifi: cfg80211: export DFS CAC time and usable
 state helper functions
To: Johannes Berg <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20230912051857.2284-1-quic_adisi@quicinc.com>
 <20230912051857.2284-2-quic_adisi@quicinc.com>
 <f436ea028da7b016241f307348286be6cfe7df65.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <f436ea028da7b016241f307348286be6cfe7df65.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LT7zZJggEuwtyh_hu58Y1mBPjY6zVH0z
X-Proofpoint-ORIG-GUID: LT7zZJggEuwtyh_hu58Y1mBPjY6zVH0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_04,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=699
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309130080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_031702_336013_5E707552 
X-CRM114-Status: GOOD (  12.44  )
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

On 9/13/23 14:58, Johannes Berg wrote:
> On Tue, 2023-09-12 at 10:48 +0530, Aditya Kumar Singh wrote:
>> cfg80211 has cfg80211_chandef_dfs_usable() function to know whether
>> at least one channel in the chandef is in usable state or not. Also,
>> cfg80211_chandef_dfs_cac_time() function is there which tells the CAC
>> time required for the given chandef.
>>
> 
> Should we really export the time function just for a debug messages?
> That seems like a waste of space?
>
Yes absolutely. But actually as a follow up of this patch, we have 
Background DFS patch in pipeline which requires us to send the CAC time 
to firmware. So its actually needed there. And may be once we do this, 
other drivers also may start using this?


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
