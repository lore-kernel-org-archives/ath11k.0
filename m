Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72B7E8FDCA
	for <ath11k@archiver.kernel.org>; Wed,  4 Oct 2023 04:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BApcS62XBGmli+cMdGklnzFWaQEPaHyI3/hmuB+M92U=; b=Zs5N/Dn868Il6X
	C0Gkky1D4RpRUwQw/X/8FTQok0GQ3CksBpOAGMidsa4XND59l4HyaKmMXNKgO785yxB7CaJUE8ckJ
	e/cRNhkg2WoVtfjdVR9LjxBK2JOo8wlNDbCjUwUzfnX1t3nQBTwwhDd1AuXFc3JqJch0MU9R0wmvF
	gghR0ZuGHqFSJoAyEo8RfUUUfT2wtXZjbqml7VBIzU2UQgdijWQwWDZtO3WfTGu6rGbTXpeMgnfsB
	lYD3YvycP6TGTZ6tiPdKViTMemqsUeM/YHOCGrjdHExVMcE+KimAgx3Ed5it8t1pJQA8nW3iENeOs
	Ehc7aZS1kHQuJSH3Udrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qntuD-00GFHY-15;
	Wed, 04 Oct 2023 04:54:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qntuA-00GFH9-0x
	for ath11k@lists.infradead.org;
	Wed, 04 Oct 2023 04:54:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3944hLf2009576;
	Wed, 4 Oct 2023 04:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZPqbzXIl4xTWgNxkEKbxAdrA9rAJWyjfgYQNamBvFFY=;
 b=Ooacta7kZLSDQXznuDmyzm8X+cgPbqWW5pbr0eyhRozJelSunPz6rOGLCJQj5+Lg6nDy
 rmnKwt9h1SSdRaxPvxRjn2LhC9XQwIaQI1MC5kCkMlB/5Lq0BtTa7STkAALQSLUetySL
 X/n70zXN+/YuSy25li34rMcRZfB1v5OJC6YcLmzZMBEfjtiLGpgK4q8LBAV1rCh8NjyG
 a4vANHgxIGZCXeZeCc+anjtinfruHcXQ9ZdMvQ7AXUzZmGHmXJAnu6fqpQScEJ5DbkDK
 x3tdAoDo8/I6dEr24RLha31uHTFwBggteMP+qC0RaNMTjozsPrM61+gwtx7Wc8jQIppD Wg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3th18jg0j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 04:54:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3944sXfH000647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Oct 2023 04:54:33 GMT
Received: from [10.201.207.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 3 Oct
 2023 21:54:32 -0700
Message-ID: <d3f4094a-2903-4fe5-a75c-15c197f28c26@quicinc.com>
Date: Wed, 4 Oct 2023 10:24:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] wifi: ath11k: fix Tx power value during active CAC
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230912051857.2284-4-quic_adisi@quicinc.com>
 <169634351476.120947.13624704208026863471.kvalo@kernel.org>
 <735c1318-2a6d-4247-8220-868f63f08578@quicinc.com>
 <874jj7htra.fsf@kernel.org>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <874jj7htra.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 78ByI1OYCpqJVAnGrilm5yVh4asqZXIs
X-Proofpoint-ORIG-GUID: 78ByI1OYCpqJVAnGrilm5yVh4asqZXIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=762 bulkscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_215438_473646_C2450EE8 
X-CRM114-Status: GOOD (  15.69  )
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

On 10/4/23 10:24, Kalle Valo wrote:
> Aditya Kumar Singh <quic_adisi@quicinc.com> writes:
> 
>> On 10/3/23 20:01, Kalle Valo wrote:
>>> Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:
>>>
>>>> Tx power is fetched from firmware's pdev stats. However, during active
>>>> CAC, firmware does not fill the current Tx power and sends the max
>>>> initialised value filled during firmware init. If host sends this power
>>>> to user space, this is wrong since in certain situations, the Tx power
>>>> could be greater than the max allowed by the regulatory. Hence, host
>>>> should not be fetching the Tx power during an active CAC.
>>>>
>>>> Fix this issue by returning Tx power as 0 during active CAC since it
>>>> is known that during CAC, there will be no transmission happening.
>>> The returning as 0 doesn't seem to match the code. Should I change
>>> the sentence to:
>>> "Fix this issue by returning -EAGAIN error so that the user space
>>> knows there's
>>> no value available right now."
>> Oops. Looks like only in commit message its still zero. Its changed to
>> return -EAGAIN in code.
>>
>> +	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
>> +		mutex_unlock(&ar->conf_mutex);
>> +		return -EAGAIN;
>> +	}
>>
>> So could you just rectify while applying or should I resend?
> 
> No need to resend because of this. I changed the commit message now to
> this in the pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6eacc3b5a70ab3f92f9410839870edbb21c9d051Sure, thanks!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
