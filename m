Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E12AF33829
	for <ath11k@archiver.kernel.org>; Tue, 17 Mar 2026 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=; b=ws01iiq+KLbp4EU4meqenPeMCi
	sVVJg5M9DhykJAYC4xSxq5HiSi6hhkIdHzXbDxamqWDwVk8nBACTnj/m5k71VkZzDd3omsEkIusCF
	L5EzhEY7JBW2ExdN3+3ecBFBF+oFr8abhH3sNOWA0fgqOcFQuAuTz4AlbEzIRVSHKW5riVzymoeMl
	PEoFpfIpY1YHqhNX6+CeG0bG5iFLEGUJrU9LltaLvVxo7UXOleKVbhBEzYc9sgmUiw9D3ajao58zd
	nppt431IOlj6IFUv0Qk2OBTZk/t+nBFCr0NMAaOZaQBrROfKsRpFyoI2d0lb7z+l3PM1iDyiaJlaP
	UCplz+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qrx-00000005u8d-386B;
	Tue, 17 Mar 2026 09:37:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qrw-00000005u8L-39eY
	for ath11k@bombadil.infradead.org;
	Tue, 17 Mar 2026 09:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=; b=hBBMHdHJQoK+KCiCO5w0KzZuUQ
	RtTQT+T0R7NuGpSbTQ8LM+iQGWXLRI0zAxdy6Pz65DCxPjgMO60z800q7RR+yOEi2ByNY15lOOQGm
	5PqiX7zESDw0v2qoMMglZXMpi48yqEMYWNHLzAPsRYC6+9jtGUCSkUQozPMlGEExQKp4nLpwkXl0D
	/1iab7QQbsko1cXZPYGLMkTTq6obPXDY5ppCU7m8ThR0dt/haUS+f5fI1a6NLGsk/+2AIbIRAIKGq
	JzUL1IwbKfjGQyuBI2EF3x/uyiXWosnwNPpUmkbTS5dbWvsyYie6xjCVN1Y/kLaMoumGk15kD2nf8
	6zNpOHPA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qrq-00000008Z5T-1P0E
	for ath11k@lists.infradead.org;
	Tue, 17 Mar 2026 09:37:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H96VF63124561
	for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 09:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=; b=U0028KqXKvwf6SWU
	C7xG0NhalfELkLxjnlY0jMUkk/Sa7dX27XKQdENvxt/FgMDmZz4ygjw1+VVNZJXX
	Ugbj9gC1dADoAXhut/GKm3gdJnS7WHa78d2Ghj00V/SQI51Zxvor3fRPZ9/JSeZJ
	h9/Ov8Qud++CaLO7cD8t4RzzqOxumIX56xhzbNH/GVM4Egbk1L+U+wCFsyNAJ31q
	xg4XOE+3jp785PrF3zYAuPqjeUQcGjMpo3QSpgYVVjXpYC1b1mISG8TCRiIsRHcN
	efGJYzc7mrQPt6+ySZSMU/IEHSX/xTm0mPMrejpZ2Y7aDOcQXWZXtE1SU4NiVOe3
	NATj5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmmhgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 09:37:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77e5e187so3178130885a.1
        for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 02:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773740255; x=1774345055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=;
        b=gkciYpdA/K8mWc9aQogtFGAqM6wqPOJGAAmgB7vxG3rRDjY2USCDsKvnkkjfTGdGs0
         LtUf15hrFAle2CtENerRyFlWzJNz93F2uRNH1S2QhrEaLwLZQ9aXNt2RIVNPvp/90DBV
         9NSuWe/BTzyseed3bLOOGejUZ0QK8hlklZWbbNDn4fvjjc0gOjjD+9ERzZvIwkjmtLrf
         7iSxc1OaDZ3ooVN56MrA2xfp10ur1tvoDwxuMHzBCXtarGiNTi9PxM7TWUFkhtbfmug6
         IePg3r7EmQRGaKlE/LRVLj1Sh2ErSy/yDSwPUDSOLBmqh2srhWEF4zOzF8qAWbJyOcBt
         gmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773740255; x=1774345055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=;
        b=oV/sgFeyCOlZHSO9ujzaoXFZNQO5blLJ3NJbfqSGSK5r074PB7z8/A7ggYorwQDmcD
         TlhHwB/0RKP2/ZZzaPk4iA+zgRJpYUxf/VMjiQSt0gg+q4AmOgVozzVU2w/YsQDX9HmV
         BnmXzNe6qgEU9sgMcYC+hqIVt0j2rLrMB+GGLg6XlGJLLQBhbeOJNipJqhQaoA+Mq3g+
         /eo1F8vAn0Xwh7LMaytI4vxBv+Hyz2TWqhUCPq8WFN/IpVm2eOLYkDeIh3xFLA7CthWu
         kJlO5JKulo5pA3ZUCpZSQ0nqjauiI8YuE2KZ5DQ8NT1KbMNXRzwwCbiKh6MNaglHB5Gb
         4waQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB9pvBJs8vSN9byUlmqr9VIvJ4YIoRks3XC8nHJcYaQyIMxh4YmCRovxrrI6Csl7k/S0/gQtk=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywla9wEULtVKQmeVEvJuKVHbKhsZF+noecI6JMivFeh+/NtdTEo
	eaK6oCJ0gtXg4n5I0PxqCoResdppCQlXMelMgpnxg3NH5urG8hBwUC5uN8UMIXJD/w/z1MzHFPr
	D9dqLDdIiPVnguM4lkM51/LsjpFVS6KEpscx11MzbaJOgQP1H9X3PZ5JcQrPnGEhv
X-Gm-Gg: ATEYQzwwtvffXGZ0xdaqe1RQgE2Wr6gpPRziigVkNRCWR1W3mQXhpDzRAUwd4u6aRC6
	Klu6CibhF+ClozmH2eFf8CQ6zaHqX+vp+zTYUwtF2t5DXG6PASjMgFvgTSL/ibagc+rJKBiKXqO
	Iq+F0y46Gtuv4TmWZinTxG6K8Pua7C+6Rn3E2mkuYYrvxQDSBBYXj0eis9mTbaPxBWucY4jLiHC
	4pU4zxpxGYqLKwpFK9B7YA8P+nz+zE68MvZLjjZ1KxLSiEC9wc8dxw/B7GHlVOELeIYYrvVd2Zv
	PupQWM7tltgYSr9nK+qPrVCmBhnH8ke3UJIvqGfzgM6RTtZcyAYlnUxVDD8F5luigEhsVMI+zTX
	4ot3sbgm1Thh3sEMs7rfyR2JZYmdwv/jPBuDaETQoN1JDNiXKJUt6y7zCgfpetF1VJJMfKaGCg/
	0jSKH+wxPq
X-Received: by 2002:a05:620a:29d5:b0:8cd:b317:a0b4 with SMTP id af79cd13be357-8cdb5a6ea0emr1991591385a.27.1773740254714;
        Tue, 17 Mar 2026 02:37:34 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:8cd:b317:a0b4 with SMTP id af79cd13be357-8cdb5a6ea0emr1991586485a.27.1773740254241;
        Tue, 17 Mar 2026 02:37:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:67fb:53f6:20ba:ff45? ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b42bd696dsm16981086f8f.37.2026.03.17.02.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 02:37:33 -0700 (PDT)
Message-ID: <e25754a0-edd2-48a0-abc4-9b45d119ede5@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 10:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>, konradybcio@kernel.org,
        andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316172251.2d57d0aa@kernel.org>
 <8757aec7-8c36-446a-9a34-f0717f64202a@oss.qualcomm.com>
 <2026031717-ethanol-zoning-80b5@gregkh>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <2026031717-ethanol-zoning-80b5@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4NCBTYWx0ZWRfX6IY5wmrFJ4NZ
 LbGwMMfrjtmXUmhH6IhK2jmXw+KhvSNzZIXnxV79kMZAsqTzOtmvW0V/TDdXg5XNHFQtkLgyC37
 /qtMSp9JRgNnw6bDs+Xt0QjdUyDzI6qyS/Akxi5khF4Rxg7SkZd9GvSq8+UwDkGkcCl3a/UMhix
 ymgM5hnYNOB0YWrP19iEBMeOnfkJs5iP/yynoN/U8WGwjeH17kXiQCfBYjurSdjDLorsfLXouUL
 bxMjLTIRYACyZNECn6PRyj8s2pExYgB50Wae+ojK7SY2vDfYHDp1NfEDkF5SYFeI8GWLldFydE7
 5I297N2GuRnANarayqWFbOPx+SW9kO5WBscMSeRTHJAl9ao9Zj90Qyj+j2M+uTHIiJE6H63pdMk
 xh11urj7aA/kUVPEdNRFE6ZktmTI8gjsagEmz1Az0USJl3sEsMQlzwl++ZhA4BZ3FD+d1MobQlY
 d487qsxR64KZo5KpI9Q==
X-Proofpoint-GUID: susn8rYnUZnUXKenZH2cyxHvvAECglSJ
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b920df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6xCDiqM1XSE8sYu1eLsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: susn8rYnUZnUXKenZH2cyxHvvAECglSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_093738_772473_09FCE6AB 
X-CRM114-Status: GOOD (  19.22  )
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


Hi Greg,

On 3/17/26 10:07, Greg Kroah-Hartman wrote:
> On Tue, Mar 17, 2026 at 09:51:32AM +0100, Daniel Lezcano wrote:
>> On 3/17/26 01:22, Jakub Kicinski wrote:
>>> On Mon, 16 Mar 2026 18:14:10 +0100 Daniel Lezcano wrote:
>>>> This series is based on the immutable branch [1] containing the QMI
>>>> service id definitions along with some drivers using them.
>>>>
>>>> How a patch can be merged ?
>>>
>>> Wait for the dependency to appear in respective trees after the merge
>>> window then repost the patches individually. I'm starting to get
>>> annoyed with all this cross-tree QMI/MHI noise.
>>
>> An ack is simpler for everyone, especially when they are trivial
> 
> Why isn't this 4 different patches, all for different branches/trees as
> there does not seem to be any dependencies here?
> 
> confused,

The dependency is on the definitions posted in v1 in patch1/8 [1]

The first version of this series was bigger. The definitions were in the 
first patch of the initial series. It has been picked up by Bjorn in the 
corresponding tree along with 4 other patches for subsystems he is in 
charge of and let the other patches left.

He put in place an immutable branch for those who want to pick the 
corresponding patch in their tree [2]

I sent this v2 with a subject prefix fixed and a pointer to the 
immutable branch. So people can just ack the patch or use the branch if 
they want to pick it through their tree.

   -- Daniel

[1] 
https://lore.kernel.org/all/20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com/

[2] https://lore.kernel.org/all/abdkE2qWX5Amf5Jo@baldur/



