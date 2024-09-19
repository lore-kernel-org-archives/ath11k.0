Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AA1CF3962
	for <ath11k@archiver.kernel.org>; Thu, 19 Sep 2024 19:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LlHmBuJhnI0mJjpFJ8fk1fOR2r24z0SUFaihPrgAoQ=; b=ohkI/28kiX8cADV2oWJp8XSgAX
	4KI2Xa2e06Y9qcEz9nvNEiVOQaz6eMYeQxmvYdiyrUxsfnAnZgSLUXvPR9hs4SM5FEP5RPvOR3hzM
	J5OvH/dk1H2cm1RQM6nRtRMnDkQHEb/zZpq4tibb9zoh2mCNNzxmSp7YJPmDr1z3CDedfalsf0agc
	t0yT+vxG0uhVSnJz63lv4SyCiL1GPQKGXuR/DwQ3bdEg6GPK34BDENENcs+odXPJooSJ5wcddmgin
	uGcsK7AoyLUZo9i9cb49ie0vA2LLS1ynoEX+cBzdvJ/PHFhlvY7Sd5vA9SvPOiBMuWbgxI2z2b5ge
	/rvGODPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srN3q-0000000AvVg-3IOe;
	Thu, 19 Sep 2024 19:43:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srN3n-0000000AvUv-0l75
	for ath11k@lists.infradead.org;
	Thu, 19 Sep 2024 19:43:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JJ3sqT022731;
	Thu, 19 Sep 2024 19:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2LlHmBuJhnI0mJjpFJ8fk1fOR2r24z0SUFaihPrgAoQ=; b=Hcc4vcFYbQIYhjj6
	iBcPFWwQkS8GFeZB2HHMVTCp+bBaJ8V3Vfg/6l29gfqYq4kpw3AKclTt58jRxJeL
	DMxApIzok6zVNZ/11uW5k/d+07jGnrsYsPKactkTGp4QEEIkTkLTjYZidyEMMI2I
	BtD558yO6CbVJ2z4qkgrqNR6ew+f5wacw2mdnT1DxfZ1ioPK252buBoOrkMPvO4j
	xJK59bcpOhaqL7bmyuI+G+vIP0lJOHQSE1/aV8KNvy7aULfYA3U23tWBLvKdP6DX
	NiuH7CgwRp91NYpDw74zZknbiVeLsGSg6E8S1k6r/BJdFnAD0BGfEvuKEa9G4aRs
	I5/s6w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gnxjsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 19:42:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48JJglDA002356
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 19:42:47 GMT
Received: from [10.111.182.77] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 12:42:46 -0700
Message-ID: <9ebea291-df1e-4d2d-8f86-9a089542d895@quicinc.com>
Date: Thu, 19 Sep 2024 12:42:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: modify null check logic in
 ath11k_ce_rx_post_pipe()
To: Kalle Valo <kvalo@kernel.org>, Mikhail Lobanov <m.lobanov@rosalinux.ru>
CC: Jeff Johnson <jjohnson@kernel.org>,
        Govindaraj Saminathan
	<quic_gsamin@quicinc.com>,
        Miles Hu <milehu@codeaurora.org>,
        Sven Eckelmann
	<seckelmann@datto.com>,
        Rajkumar Manoharan <rmanohar@codeaurora.org>,
        John
 Crispin <john@phrozen.org>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <lvc-project@linuxtesting.org>
References: <20240909150824.28195-1-m.lobanov@rosalinux.ru>
 <172676437762.281449.1201751345434084726.kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <172676437762.281449.1201751345434084726.kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AK9etUJtDTTEjLSj3FxHT8qDWQpJHqA5
X-Proofpoint-ORIG-GUID: AK9etUJtDTTEjLSj3FxHT8qDWQpJHqA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=489 malwarescore=0 suspectscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409190132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_124327_371538_153B08F1 
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

On 9/19/2024 9:46 AM, Kalle Valo wrote:
> Mikhail Lobanov <m.lobanov@rosalinux.ru> wrote:
> 
>> The previous logic in ath11k_ce_rx_post_pipe() incorrectly required both 
>> dest_ring and status_ring to be NULL in order to exit the function. 
>> This caused the function to continue even if only one of the pointers 
>> was NULL, potentially leading to null pointer dereferences in 
>> ath11k_ce_rx_buf_enqueue_pipe().
>>
>> Fix the condition by modifying the logic so that the function returns 
>> early if either dest_ring or status_ring is NULL.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> 
> Jeff, what do you think?
> 
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

(could have just s/||/&&/ but this change is also ok)

