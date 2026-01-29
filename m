Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2040DD6B076
	for <ath11k@archiver.kernel.org>; Thu, 29 Jan 2026 15:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haVDLFesjUr51ljmdTGJ7aBj2MVT/9USM4sAMmtP5R8=; b=JKZ2WEFYEy4YQ90m1XpwkEQ/FM
	Zvoni8UEMyhZzREB38qYxbtmo/SFKeguzizvwen91YlCJoLcyMk0dqJRekN1zKvj6ngREmLj1p0VE
	FSWGYjyYqavuVjunIHPrRyrxY9U0ZyOJWJuLQ+nOWCpEa+Z+6EQGrfAQTtI7L4yFmE1xuWl86DICr
	qp138RhOksP/A4HslhDXs0siwC0ePEfWBMD2s/oXrCS3sPB0KRfv9+PsGaTVJbvhKssa0dbhwHkpv
	MyPO5G22FDrPNGW9RPhwvA+l9wf/F05ns4gBFsOWzQfVumaiFq4lXysjaRwS8A0pyLbx5vtWuJG5u
	qYLr9PjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlU4h-00000000Hug-3Qk2;
	Thu, 29 Jan 2026 15:36:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlU4f-00000000HuK-0Rnl
	for ath11k@lists.infradead.org;
	Thu, 29 Jan 2026 15:36:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAB0EH2033390
	for <ath11k@lists.infradead.org>; Thu, 29 Jan 2026 15:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	haVDLFesjUr51ljmdTGJ7aBj2MVT/9USM4sAMmtP5R8=; b=KRmviwaim9IAMOS7
	J1RJGYmmnBX+QeCk54Cq169RpzQTQkdCxSTzb7Dm78LMuBXwPi+1m1v+hdmYbI73
	/gyFC0y0WxeBDr2iK6gq2PDyX97q/cC83z2NqkOLZvATIrNA/GTxUcMfdAD2/5wt
	nhNSA5n63c06C31eEQGYFlla6zOZIw1OyQpY8LNwGKn6WdgdAPv3qjT5BqT0y4bP
	vVwr2A56TIzpQQfi/AmXJcXIyZQvPFxZjjmSCjqE63BRms91/SCSsyTcSu89jJF+
	wpflK4zUSZ4va4W3baiMb1cm032i60ftk2kBsd3E4jVeXaRt/XZgon+pnNLiyZCq
	zfJl/A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byna7m77n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 29 Jan 2026 15:36:46 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12337114f3fso1517270c88.0
        for <ath11k@lists.infradead.org>; Thu, 29 Jan 2026 07:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769701006; x=1770305806; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=haVDLFesjUr51ljmdTGJ7aBj2MVT/9USM4sAMmtP5R8=;
        b=h7mKUCXcn0JtsAGSpxOX/zc//n6fkRvQLAP47rBDSVvfQpcX9/3qVcqNwMXukW2Ygv
         1XyfC1p3LJUJ1SMeiCPO0x2eHBc0nA8rR1Ug9iSZWmjPc0KQtefWPFtwnwghM4xEL9Wa
         oRb2oZyz6xaMZpwwERui/P2z2ANZf31zn9CJaEZIgi9QjOKfa8i+MB/lGSjzWpvSs71g
         5QratB+AbYXrpfhmbdZ3B3Ei1bT7Zr8GXo7tsVIBOp5PIneA1jgcPZ0DxMpGBdYmmsCa
         OotpWMmHol6/7O4J32HdxFvuVBPm6AOtym15qJxvSzg7MxNd5wXijLTXOXULr9lMb1yV
         A6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769701006; x=1770305806;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haVDLFesjUr51ljmdTGJ7aBj2MVT/9USM4sAMmtP5R8=;
        b=PLkRFBP08lTWrLn70Yuwm1AansEQgANRAAK0Lr695EbnsegW16agVydshXiIa7m8F6
         wmr5nKH8aiZx3ojLk+8vMTif4bhhmSaZxJrKu56NFUZtxY+3AlnLw1/qNNOuKD8+yXrq
         XvTBvPVX/zyilrouSyG5iBFi3cDbQM47rcVrZcPLHM6NBmUhnLKg0quYEV61aAe8NYqf
         2aYdPxSBjX3jnMLDa7X+RvmvxzAEuS6YjpGFIE7eum8ZXXIgHsngXFNT18JBMA3kUcLp
         5OHA/KDSZzO/rl2LaUU54GMB4Z/jZJvvOwHF0A/0GXalc5cUlfzAL4o9o23sRuPwLPKU
         uFhA==
X-Gm-Message-State: AOJu0YzPXy/5qbWctPYjwC7y4W/sG4h7cf6fcrV9wR1ZlulyWtkx1ijw
	lOA5lswDm9lGfKm7681bRiq5oGQY1Kahv+Fzcw1/vH1+Ke0j+RYIVWFyknNZSto+fsNFvpiTtIX
	vWo1nQT8ssm8WfFWPDn8rUUvo/C6XtwcBjI5hW0RYJaTV6OhFgLkB6p0leEQfIg2z
X-Gm-Gg: AZuq6aLhldGdWiBsF35nf61yqW4579OGMY/fS7y3tprj40ErLqnRKVk7o4j3pkf7HJN
	5hHkvAvNjoFbvKkya17YGH5scQbtJJjOe229/DkZANRco0dZmJmdv4WdLMpKPr8QfYUB42hhTFc
	zUmh7B6gIP+L/4w0Mpl0qHIL4avaD5WaMwbXnMmIn3in+I0HWKJ8aWaH0Mz7i90H78VEaezUMWH
	jXkenLxinnLts1A2lUp7+gs9Tj6KUhNY2fcVMHT0f8eyBDm2JAk2LBDpHom1oUebVvexciBgWp4
	5nyTINJLtIpoLhAm1xac8XPzs+qF0I6d7SgiF1UYviB3KzoyVWbbswj2u7Rw8349+fVly97DYsS
	W1/J5Wj6yDWHfXQWCFH4Vrk5ZyJNxraW2VmXViG5ZBMPdm+a3dmNyChG6geaIUrp6DTHOoWR9XN
	iirg==
X-Received: by 2002:a05:7022:1a83:b0:119:e56c:18ae with SMTP id a92af1059eb24-124a0080fb3mr4849537c88.22.1769701005812;
        Thu, 29 Jan 2026 07:36:45 -0800 (PST)
X-Received: by 2002:a05:7022:1a83:b0:119:e56c:18ae with SMTP id a92af1059eb24-124a0080fb3mr4849504c88.22.1769701005108;
        Thu, 29 Jan 2026 07:36:45 -0800 (PST)
Received: from [192.168.1.38] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9debe5dsm7311579c88.11.2026.01.29.07.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 07:36:44 -0800 (PST)
Message-ID: <97b132e8-d3b2-4e52-aa74-c8aeb0f5d516@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 07:36:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: fix memory leaks in beacon template
 setup
To: Zilin Guan <zilin@seu.edu.cn>
Cc: ath11k@lists.infradead.org, baochen.qiang@oss.qualcomm.com,
        jianhao.xu@seu.edu.cn, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
References: <6cc72c12-6f50-4e91-9b7a-bde8633009c4@oss.qualcomm.com>
 <20260129061330.796429-1-zilin@seu.edu.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260129061330.796429-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E5OJ1fd3RuUkWJxAEy7idKivWP4OnBa0
X-Authority-Analysis: v=2.4 cv=J72nLQnS c=1 sm=1 tr=0 ts=697b7e8e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BJHQ5hLiUQ4w7pZWvIEA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: E5OJ1fd3RuUkWJxAEy7idKivWP4OnBa0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEwOCBTYWx0ZWRfX+h9zUlxgQhiQ
 pEup08b0IoLKNlMjkultHH05nx7AlvRsNmsMssIrXVCXzDfHqBft5dtqpXd7AiG9pggsXzgASsF
 jSomcnQA358lqgY1HXTF238diiKv03K75DFg3+BGgCdnKjTL+MJ+AdLbasjIRNxvfN2gDVrM0Sa
 GdAQ5A1CWPn9tL036ZaAyETIMe5eZanoWMLnSx4MKu8BOjgeoCSPre01CqlljSgpXPXjMYazOrO
 ioU5sdFBWF5Wk7jvZQpYEglfi9PIDvgZA7+MQJCjC3msyoR9hmqkBKCcVgQTVz0ohOraNnIQmI4
 n4w9SqbZyhF7gFbgz1vkrC8NX8BoxMQ65oTOW5l2lpQ5hNXiqV/KJgz3QTb0GyhK1Ha5w9kxMXf
 Fvry2ZnoldM6Gg2HTVcdjQwVHubqAFHuOZ3Ww0uo9ZP3ceaDXqGR8yLCkU4ZEgO0fTBlRDVurnc
 UdX+HuOBsMg+uNQ+hZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_073649_279168_6F6DAA94 
X-CRM114-Status: GOOD (  28.70  )
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

On 1/28/2026 10:13 PM, Zilin Guan wrote:
> On Wed, Jan 28, 2026 at 08:30:22AM -0800, Jeff Johnson wrote:
>> On 1/19/2026 10:37 PM, Zilin Guan wrote:
>>> The functions ath11k_mac_setup_bcn_tmpl_ema() and
>>> ath11k_mac_setup_bcn_tmpl_mbssid() allocate memory for beacon templates
>>> but fail to free it when parameter setup returns an error.
>>>
>>> Since beacon templates must be released during normal execution, they
>>> must also be released in the error handling paths to prevent memory
>>> leaks.
>>>
>>> Fix this by adding the missing deallocation calls in the respective
>>> error paths.
>>>
>>> Compile tested only. Issue found using a prototype static analysis tool
>>> and code review.
>>>
>>> Fixes: 3a415daa3e8b ("wifi: ath11k: add P2P IE in beacon template")
>>> Fixes: 335a92765d30 ("wifi: ath11k: MBSSID beacon support")
>>> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>>> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
>>> ---
>>> Changes in v2:
>>> - Use unified exit paths for cleanup.
>>>
>>>  drivers/net/wireless/ath/ath11k/mac.c | 25 +++++++++++++++----------
>>>  1 file changed, 15 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>>> index 4dfd08b58416..42edcc5e9e49 100644
>>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>>> @@ -1561,8 +1561,10 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif,
>>
>> while looking to apply this patch I noticed the following logic earlier in the
>> function:
>>
>>  	beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
>>  							 tx_arvif->vif, 0);
>>  	if (!beacons || !beacons->cnt) {
>>  		ath11k_warn(arvif->ar->ab,
>>  			    "failed to get ema beacon templates from mac80211\n");
>>  		return -EPERM;
>>  	}
>>
>> I did not look at ieee80211_beacon_get_template_ema_list()
>> But if it is possible that this can return a valid beacons pointer with
>> beacons->cnt == 0, then won't this also leak the beacons allocation?
>>
>> Given that ieee80211_beacon_free_ema_list(beacons) can handle a NULL
>> beacons pointer, perhaps this should also goto free?
> 
> Hi Jeff,
> 
> Thanks for pointing that out.
> 
> I looked into the allocation chain for 
> ieee80211_beacon_get_template_ema_list():
> 
> ieee80211_beacon_get_template_ema_list()
> 	|__ __ieee80211_beacon_get()
> 		|__ ieee80211_beacon_get_ap_ema_list()
> 
> It seems that ieee80211_beacon_get_ap_ema_list() only returns a valid 
> pointer when ema->cnt is non-zero. Therefore, a valid beacons pointer with 
> beacons->cnt == 0 is likely unreachable under the current mac80211 
> implementation, making the existing check more of a defensive programming
> measure.
> 
> However, for the sake of strict logical consistency, it would make sense 
> to use the goto path there as well.
> 
> Do you think it's worth updating this in a v3, or is the current v2 
> sufficient given the current call logic?

I prefer strict logical consistency so I prefer either adding the goto or
removing the beacons->cnt check.

Or a completely different approach would be to use cleanup.h functionality and
annotate beacons with __free(ieee80211_beacon_free_ema_list) so that no
explicit calls to that function are required. If you try this approach then
beacons must be defined at the point of allocation:

	struct ieee80211_ema_beacons *beacons __free(ieee80211_beacon_free_ema_list) =
		ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
						       tx_arvif->vif, 0);

Note that I have not tried this approach with allocations other than from the
kmalloc() family with __free(kfree), but in theory this should work.

/jeff

