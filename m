Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A13C6FA82
	for <ath11k@archiver.kernel.org>; Tue, 13 Sep 2022 07:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcSZ9gZFMFHue/zzBSEBVAb0FRXmkRm60eT0r9in1Tw=; b=Dz9k9P4AsAvLC/
	hQ43WcMGILN3v/sWkP5IL4QoJXwMeqq4ZaslsTnv2jcIX96b0cLI6uPLm1DUivhS/lXdWaXtevUPe
	HwuJsP4W4Hyvsi6yzd4UslXq8X7bpfkYF5ETDWxHqyfTP2jI0JE9R9D36TFNuYTWfiWsHNETZqRJK
	C0rdrCUozs2TiqILOUv50krVT3wcpgJ156vSk4rj/SpfJ97135XG85fu+lON+Cn8LoV+dj8ifHa/s
	NNSNLG9gylANkdtPO0Y2VDKmypJyk+o2fPqedexjVFTNCMBmiFLfb5CgZCw9GZBGg2ohNiTqo8kvD
	16wNKGTHIpt84R977ejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY0PP-003auf-MO; Tue, 13 Sep 2022 07:32:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY0P5-003aiJ-In
	for ath11k@lists.infradead.org; Tue, 13 Sep 2022 07:32:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D5nUjc015254;
	Tue, 13 Sep 2022 07:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VZexL1FZCEAp4Pjz4fDVX9RU38e2PCSwwVn1c+b9fN8=;
 b=dzdb/OXbQ/V1mEgNtHPjwgyhD2nh+KGpklNRHMCEMdihz547LddR/czEJi+elvhEvy4j
 2c979AgJWnT2ChQ84FK7HrAEijD3CmzIkOXL/Gm6Tuzix8jRYIasEBlyTIdLNgnB6Osl
 JkaDslLokOiAZ0BmAS06jaLo8wgRqNgjjqHArQU7EOmDC9uDo7jZGG/CwNu+ziamWTDe
 bQZQqeWSCTC1CuzfQIS+KIipzV0SduDLlqf3u2zbhoWOZM0yFtRXhf7pOI9+tXXh/xXI
 GP89RHB5ZVPOkJLRRZzcQHakFbz+WSojGqbiQKOoX+MiMeC5tBjpLt5hCvs8aiM4Zjiq +A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjm1wr882-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:32:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28D7WEhH007414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:32:14 GMT
Received: from [10.253.33.199] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 13 Sep
 2022 00:32:13 -0700
Message-ID: <cfef10f1-9b1d-091e-da66-a724e3fbe204@quicinc.com>
Date: Tue, 13 Sep 2022 15:32:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] wifi: ath11k: Implement sram dump interface
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220802075533.1744-1-quic_bqiang@quicinc.com>
 <20220802075533.1744-3-quic_bqiang@quicinc.com> <87fsh0962e.fsf@kernel.org>
 <0e64e270-77c3-5c1a-08bc-577a82c8abac@quicinc.com>
 <87pmfz7nll.fsf@kernel.org>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87pmfz7nll.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0YfKRH_MoTBPdt9TMUjHo0YkYiFNqQOi
X-Proofpoint-ORIG-GUID: 0YfKRH_MoTBPdt9TMUjHo0YkYiFNqQOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_02,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_003223_730678_3CB4E4C4 
X-CRM114-Status: GOOD (  17.01  )
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


On 9/13/2022 3:14 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>
>>>> +	u32 i;
>>>> +
>>>> +	/* for offset beyond BAR + 4K - 32, may
>>>> +	 * need to wakeup the device to access.
>>>> +	 */
>>>> +	wakeup_required = test_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags) &&
>>>> +			  end >= ATH11K_PCI_ACCESS_ALWAYS_OFF;
>>>> +	if (wakeup_required && ab->pci.ops->wakeup) {
>>>> +		ret = ab->pci.ops->wakeup(ab);
>>>> +		if (ret)
>>>> +			ath11k_warn(ab, "%s: failed to do wakeup: %d\n", __func__, ret);
>>>> +	}
>>> I changed the error handling so that if wakeup() fails we do not
>>> continue and just return an error.
>> I prefer to keep the original design, because in that case we still
>> have something to check after firmware crashes.
>>
>> I admit that the dump content may be invalid if wakeup fails, but we
>> can know that by checking kernel log, so we can avoid misleading.
> Too late now, I already applied the patch. You need to submit a new
> patch to change the logic. And if we really want to ignore the wakeup
> failure there should be a proper comment in the code explaining the idea,
> and maybe improve the warning message to make it more understandable for
> the user.
Sure Kalle, I will send a new patch for that.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
