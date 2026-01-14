Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB697D38FEC
	for <ath11k@archiver.kernel.org>; Wed, 14 Jan 2026 16:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7vEmRLElt6V1C5YVL+pvrB1XgE2fASQ2T+9V1RoiNk=; b=l9JlBZH7j2zqACf+e75BfoK/g9
	tRI0tL8GsN2aMWtbrApECO3+um2dXFvWHb4IXTWkIcnXTwHcJyeRvo+uIFc0KoLr8wEDaPX1TiP1w
	cooZHPrVgowbSRbhqiLTCDG6GgqKKkCWp4a0HwJGhEXcxlBZSvR8e1lYW/jouXII1jBwaGbNXMIEc
	yIBHIQwI4JsvXmk/5V5LudoO4PMLy9JXOGPqWA8Wi0tFo2v1dgdA0Z8+UtqqFiNDThv5u0FuR6FKm
	xzJ9+y5g3XIe5FVka0kCftNHEeZxQW/aA3dWOWVis7ZS5aZ4dbarLa5fqGRVdStQVMwSxmnWprxAa
	yPffa0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg49R-0000000A0le-0SoH;
	Wed, 14 Jan 2026 16:55:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg49O-0000000A0kp-0zhp
	for ath11k@lists.infradead.org;
	Wed, 14 Jan 2026 16:55:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EB34XM3280116
	for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 16:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7vEmRLElt6V1C5YVL+pvrB1XgE2fASQ2T+9V1RoiNk=; b=PnTbokQLttZcTYSd
	UmL/tKfspJzRl710nhcoucam/bYB59yopFNQE45yn+RHwg+smQiImyoN1VF+MmLc
	HmMXzHndzAKYGnj/HyQiu/clolpu0ZUPoGHKd6uvVTtZf61+P/jiQtxL6+U86ElR
	F2Mo/1rY3sCeiRW1sCfbv9MoPCKCYWXDmOCCa1u7behGuKWRUPU9wD8n9lh4eYwR
	Vbe956iTORFgjjZnep2qFbqmbOiVABeLrfoPW0OEyOzHq+5d5xhu8QZXUFruow1B
	E9O/q97CQIkb7nyykqohjJ45t0tKGQbznNNbJBKPJ+jaMIOMszy7cfz1EMH4Ujvm
	j9KP+w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8s6gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 16:55:16 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12337114f3fso1408429c88.0
        for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 08:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768409716; x=1769014516; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7vEmRLElt6V1C5YVL+pvrB1XgE2fASQ2T+9V1RoiNk=;
        b=CqMyk170APnwPD7uQEUBr5fX2zHRtU3RYz++RVprEJIoHzWfupANkWn53wAbZYVExs
         C/I0KEnKe2I23dHYft//oT8KhHPR6TnGFuYTJavmWfOzQwN5ApDaNYQPJkmVWsoQA25O
         sK1+QdJ1qcaVVzGPjQjWHKtM6DsFzPWcSGOXINeP+lV+0crVazJoIfRE4m6LPL1x2S+x
         uRpKO9JF3hmLS6td0kDQFlt0RE0dantFDQmqVH5YHGApOI7iPMx5R8tZBYq2L29ddJhu
         0gFioQOCdtdKq2XRe8rUQPT3CdcDlz7OydWlF0rq7Q6WX5XcdHVVlzLXQ3P7bB9Fk7Oc
         xOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768409716; x=1769014516;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7vEmRLElt6V1C5YVL+pvrB1XgE2fASQ2T+9V1RoiNk=;
        b=cizqgh5g7fHxUtxm4suN3H+V1kBxFRS9Gq63FT5c3hU4QRtFXFyvAJDxkC3vLrEolo
         AEWhe8gYCf+tuXIb4O4QgL7uEPVPSobrmiT/JJcjqwjC80H8M8m+Nf8G9Xs/57RKO1YU
         U/EOhfBFzuchwBE2slDTLndjf3kfWbtyf/siDYkTk/6+1KWLtgA/cTekZfM298oYD8qA
         HhHLnmJnayMDDKp8z3upUZniGYZuNxexz/BXRYbIbDJ+ezxUjiypyMwzknfhPmHbOTxk
         9dIiPXEejxPRUbPFo6uSVAc70hNheN6NyhtCJwHjqYYqkGi9ufxs0W5xtCDV7lj6XJmW
         gexQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3Ns1idWArTm60sDOIzQH07fAHcp/mLlrfHilthJEV9fF77S9uJzaAXNWc0ioRVztYWIO+El8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxjHtHKI9cVYEUw69RNbJBrqc5ewaQOPF4mJiXfTdA7GD3A3YQ
	57mUlKeTrdYiX7Q4mWkM+6JSl3A9UYxPMvw51HBr9yMOPznvIfOx+DZ6prQBbTdPds47Z5eSFRR
	nk8ykb9BzjUZgr8uMlPcHLXV/J/lmuHFsnMMgjBGmrqfl8K4lNxwWIUAmnqruLmcA
X-Gm-Gg: AY/fxX4pX8mHru9wN9OUcC9kZIT3jhLKMlI3Ialoz+O2HZgnmugmrJIGXujeHOjFZJf
	Ajeo+QeSMASlMozswtnm0gzwi+SAd+5GX3hGUpCNUongSsc/sZOKi00El7SJ/Wa2JDJW9rE/Bzp
	3aEU+0Nv4AJHXc1+tjDFnH/4390fqlGt43jMEpTnpioyeTl9Ijrw1nZJqebmxnqgTyNp2uINKPq
	fR+qlqSI5fhFPDqwTQXIKOgDM8hmctX1WIGuUjBB6a+sOwyoeiPr4bjcI3nBRXrWeMjsPXPcQ3s
	SWOGmbQ75tMWQ4Le1qh4s7ueXemGIU9zrS6QAEeGVFVhWZd5Gmu8xaRkF+9dJ0Qv2GkhrSNSfEP
	y+Q3r+xrtZbWo7zMai/plxpO3KnHl1CTz03q01qbidU4W5CQqlZzVH81N2+EpTffjt6Zv4w==
X-Received: by 2002:a05:7022:458f:b0:11b:78e6:8323 with SMTP id a92af1059eb24-123377561f6mr3636468c88.37.1768409715827;
        Wed, 14 Jan 2026 08:55:15 -0800 (PST)
X-Received: by 2002:a05:7022:458f:b0:11b:78e6:8323 with SMTP id a92af1059eb24-123377561f6mr3636418c88.37.1768409715016;
        Wed, 14 Jan 2026 08:55:15 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24984a3sm31963299c88.13.2026.01.14.08.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 08:55:14 -0800 (PST)
Message-ID: <f0e98751-8fed-4cb8-9cc6-59a691f172b5@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 08:55:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 0/6] wifi: ath11k: Add single shot/periodic
 CFR capture support
To: Qian Zhang <qian.zhang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Yu Zhang <yu.zhang@oss.qualcomm.com>
References: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
 <717658b7-91da-4073-a746-a389319aac2d@oss.qualcomm.com>
 <a7a73ad1-0761-4abc-acc9-fc94a4e77348@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a7a73ad1-0761-4abc-acc9-fc94a4e77348@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yROEmlRYrs2_XUwRMeaZ6u-oDSl2ciBI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE0MiBTYWx0ZWRfX4zfOTmNK2uVs
 jGnMryM2iC/YaySf1/2awgNBisMok9g6abDoYeI9Qe/hChXd5T/3Tdn3GUWDwSeYxGYsG3MAL2y
 41lFeSzWtqRH+60OmXDGEUE2v+9s8wVBJ/M4Vhi0yq1dE6nlULTcN0896C2kdLXiOJJZ+GzpCCQ
 UQvh/RXyfWtLAzba0gYtbxeU4+NiAiLB4Ch7z5tdYYwXM+G6MbQJWmUEjPzzga+wH+hRzLKJfPL
 TDakFNWEgff58aAMsSre5j3PSOJUU8XVgK/h6IWZfU0N+DUrTOfuuCqwgX6ZwAaQET0129W7nV6
 GiUJIbcKvxBuOryPFDTvwJbxfFvg4gHG5hazuGH3faH4+bW0Y7JbNEZOGfMMtNEG76B8boK6fs0
 w+AgsJUIv6YkDqTip0PYqRSrH3fOBT8/a3qxlTQNv2PxQ63Fqjt1KE9J4rB3hZ2TQ0Kqj68vv/D
 qFMAdLDMIDQ9kLSNlfw==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=6967ca75 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6sVShl-GBsVrLMKkQ7sA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: yROEmlRYrs2_XUwRMeaZ6u-oDSl2ciBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_085518_466990_D72DD936 
X-CRM114-Status: UNSURE (   8.89  )
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

On 1/5/2026 3:51 AM, Qian Zhang wrote:
> On 1/5/2026 10:22 AM, Baochen Qiang wrote:
>> On 12/30/2025 4:25 PM, Qian Zhang wrote:
>> what are these dependencies? They are not present in old revisions.
>>
>> BTW, if you indeed has dependencies, in addition to these prerequisite-patch-id's, please
>> also list them explicitly in the cover letter above.
>>
> 
> These dependency details were added by mistake, and I will remove them.

Was that the only known problem with the v5 series?

My automation flagged a checkpatch issue in the 6/6 patch:
WARNING:LINE_SPACING: Missing a blank line after declarations

If there are no other issues with v5 then I can fix this in my pending branch.
Or you can submit a v6. Just let me know.

/jeff

