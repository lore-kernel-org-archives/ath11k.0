Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42962F33817
	for <ath11k@archiver.kernel.org>; Tue, 17 Mar 2026 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=; b=qbJuQ7W29LLrehzsgvcXvNHCSw
	VmzBiSKAKDcraMyFoeMWWYo5onVeZp1FhBXGspQiHkqDme7/vvz53KU0CGxrDQOZVvWay9iySIdOg
	yw1wAiKnNbpt36igZG6knM0FGKEaYy+JPyecZ40sWF+Aq15oaOjRudHoiJWkGn3PS9CiVnM5Qb6++
	waDJSMT839T2ffmAFgaHjGNPQO5G69dGzv1lHTHzZgqwGdQiJNbKvOMH6e3QS8PgIPWRmm/6+/e/x
	J2zuum0eN6V9JIA2tzJ8NzwkhbdAQYu7aAQGukxH1OqcE1GMhHLGfxwusleFBlwv6h7OZhSoWWMDP
	6UKA2SVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q9Q-00000005laj-203m;
	Tue, 17 Mar 2026 08:51:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q9P-00000005laE-1nEP
	for ath11k@bombadil.infradead.org;
	Tue, 17 Mar 2026 08:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=; b=cVpbab0TsgD5PVVRKFL8gmnZk2
	qqCiN5ICZD3qrdU7O4YuGKw3cQgzM5oPXWHziNj95kFlJmpWngG5V5H3kW7z2ryFCguK/RQbaI5c3
	WyMpSDXf9BLSFdf+mjbLkOvKxqwetOUepFu2X1T010yyebbj3qzZmBAzbZ/QmZ/MBZcrf7z5cbjKH
	mWPZf4SyNNOZ3cDSsF3H5rcK6EaR5RG34WVdc7MfMD17pWuk9DOnh+BVNuCYhoLY3NCpRvt2c6rIQ
	mY88b1MYGdOxcbR60X9Fr+GuuSQs2ZH7Iw3X2lJtE6ChId/Cvxefk1R3+chNwsfumu347bzL4k9vn
	lLebgBIw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q9L-00000008S8f-3b3l
	for ath11k@lists.infradead.org;
	Tue, 17 Mar 2026 08:51:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8n37E3103092
	for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 08:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=; b=ASZ/MVVeGtJMu1Fc
	XLhAANnTMxH1a/V03vG/LTkSxc0F4h1bFIMtAPhjCNfhnr3REamoVzaRvJ/Ifm5q
	DWpnOtIKVZ2lztx3+oTq0s6N3eKWOBuea9uI0iDZ/3DENDJ2W4IrKaTj0qitnYsP
	PTKVUSzhCM3E4DrZZcryCru4YuPS/gsXqVf5pYvK1u5TnwI4y6JlvXMSeP2McicD
	+oZUlt7pYG43FnWbT6wLNcih1Qj/3DZZC3c8zJFvrpMgtwdfF/FtCG5S9fRhbnGF
	JD5kglBhyIBwiy5g50f9b51gKOOlJnxwyhF91X4sV0+pn+xbASdGOs+h0EFSpdzf
	YmkcHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb7ayws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 08:51:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd767c51efso654295085a.2
        for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 01:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773737496; x=1774342296; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=;
        b=CJj95CQK4UuPpCKyO+v2PzkJRTRh2Sh+tRZDSzfdaj/FHo1M8PAYRBOSdxjtsmLcZk
         uYrXLd9o3hsbhHxupyMftEhFvRRke4xyw9SXuFQZgkKvnxaN6rcMB4yF7HFOFkGIRPwA
         hFYEZP9jPvylpKek4fKKM9/KB1KC/VWEnJhZd1ift8AZQrWpSJbXWWUqhnqYqXrclb4X
         qIx6BtH32fyBjY/a5R34aZOz23enaxCWUN6nEU1nC+pODLk0Yc2VBbtzmZom3hr42CPa
         /j6jRkjxLJ4vYny3LuYK0WqI4fpbo4iTAAznKvIJen2Y97iiZUghjP1WsAlFgPji0XFH
         swgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773737496; x=1774342296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=;
        b=R0qTavKcTeBr4xrOSAfSUHSoow6fIMSw1/YoPuOBDJSxrEwyXzThsQC9QCtHBrSiey
         Jlte8/atJc5xprF9QyffErXlER69dvS4iYSWHKjTdCxYROjRBNl1mKGQ+apIMUsPHTG7
         mXKTB2b60u0eVrDI8jXOSSmOf3gI3Duxr520Ry6JnGPv+YYpjYeGS4dE6a2nKiuyYTDo
         1x+q2Y+fuHzzdXI2lxvnO/0G5ns2IYlDh73DMd0c/bgf2/lsuXq2dp/sZ7yGl45wAG/j
         EfV73z0QL0u3fIdWuNzVPsBIA7rDVQjZM4U7l3A58fubw0EYOMv5ZMECM1AF02kodjdt
         7d9w==
X-Forwarded-Encrypted: i=1; AJvYcCWAYLkT7QnheZIqCryFPLk17LKnXMmdoU99atCxTX8WOf8t0ZwCqzwpserzg6lhjLKmfE79HBY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsRS1y0/t9KJ8fo+AACmaT9exjiVNy46iocGO1jVJ6q8KOEuzt
	rIpOCyApIbS2AOYYRVdY8o9ayAKnR1zQSr0JoTpSwN4KzGbq3PT7EMA++X4r5ih6WbNwDeMn8Ce
	9Nc5Ygr1HrrYGNPoMyb2gawDg1zb43KG8tlea+X53wZuZAcJqDxFhCv9sjhcAEUZ7
X-Gm-Gg: ATEYQzzULxinFV53l/hN0Ed1VazciipqV9nb3fp6py1Mn9rKLIkx7G0LNpZY97goAqd
	I1UPzp9OC7cetP92Y4Xz2mOB47ypReG9Myeb4TLV5VHzmHMMdlwB0QJFxfniiSPX226/GUYW/Oz
	JVVkLlEDABN6hxStVTRV7bovpwaMUZDOpzB2c4NVAiLCqcsUKMC9UEQXIUiEyQUm3S8IBF9fa3f
	y6gYKIGRDDqyS6t1wvDZN1YVZ7OD0HZMmpsX1MXTEMD6Qx5sPeZmO/p6jO2TRjs41P1uJedL6q/
	Ygr6jSAabJmZFjQLR6pG6HnYP7mNAxvL4rOlskb23HNQt0JgdsemDuVxFrAMtXY1uiHvpkTe1/q
	obMOaXOKmnAa6QHTjPf3hY409lEumFcpkdt8SfQfUkmNsY/FZNc5O0Ffz6kaXuVT0b95EYpsldR
	escL4ZQv9e
X-Received: by 2002:a05:620a:2915:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cdb5b0a024mr1966586685a.41.1773737495231;
        Tue, 17 Mar 2026 01:51:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cdb5b0a024mr1966583785a.41.1773737494732;
        Tue, 17 Mar 2026 01:51:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:67fb:53f6:20ba:ff45? ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3322sm46732245e9.10.2026.03.17.01.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:51:34 -0700 (PDT)
Message-ID: <8757aec7-8c36-446a-9a34-f0717f64202a@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 09:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
To: Jakub Kicinski <kuba@kernel.org>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316172251.2d57d0aa@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260316172251.2d57d0aa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA3NyBTYWx0ZWRfX86isA3Gx9ptJ
 OsEyeJoYwq2XjwFAaiqSKNGxiYDjYcWW/HQafn5mhvBHLsNzy5rIVuAgU8mlyZICX/snxE9RJeJ
 8tyeF9Z85X5dqqiPV3j8GZe+SThm5n7Niq5D831bhRl8T/LnB/IXBP2M0M8x9cI0K5/VUQHdzbS
 C83cEa0Nx8NzUvVYeQ1COzW2U1bT5qou/QCdEk2YOKLC8nMpVY9yc8r9SbnwtmJlk7ZmJJzsu04
 S5TegL7HiEnR8yBAfjSVb+AtAJhEeBxDfCDXjI9sKIeL7gslI9ZRcPk6QpLn02pjoR5XOPVGXPn
 TvY04sXtR+hQ3CgmeaI3OKp9TMOBL93CaHbGdQ2kRQRPdHIHWNa4Io8Cj/7XhDi1SUKRxptxx/w
 2k8NyhrByViRKflN80365q45V7e9PUbNn5gsPsQ9GLkSUVNGvAOPwONQNNeYxiMVD14oqrWkmBC
 sAUBCjVhNms1SRz7iQQ==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b91619 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=rySjVtX6Rl8zv02YFYoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: EyTOKK4Erd7y1RIMW_h0Eie3sLylIo-g
X-Proofpoint-GUID: EyTOKK4Erd7y1RIMW_h0Eie3sLylIo-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_085140_470423_37B8B136 
X-CRM114-Status: GOOD (  13.74  )
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

On 3/17/26 01:22, Jakub Kicinski wrote:
> On Mon, 16 Mar 2026 18:14:10 +0100 Daniel Lezcano wrote:
>> This series is based on the immutable branch [1] containing the QMI
>> service id definitions along with some drivers using them.
>>
>> How a patch can be merged ?
> 
> Wait for the dependency to appear in respective trees after the merge
> window then repost the patches individually. I'm starting to get
> annoyed with all this cross-tree QMI/MHI noise.

An ack is simpler for everyone, especially when they are trivial

