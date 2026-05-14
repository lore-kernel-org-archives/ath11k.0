Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67BFCD4F39
	for <ath11k@archiver.kernel.org>; Thu, 14 May 2026 22:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpHjBeDGHzNDOy9dbVQ2YOk7VWW2/RGBa4Tmtno8w1k=; b=G2veRbM7dcwI9YDB/j7qE/Dli7
	7U0LqnT7TRes52i1iK87hepmlDcqtX2XHFb7xqiSLrIVVdyCyWLbTtVOyrK7HRcwRzjuY4XnkVSHo
	8bKuNLnTlyki/I9L8S3GI79iXAx7cbxTZn9uptWfYEp5OHJftava74kZUL2+CLF+zuCqX0FV6Og0/
	uWZ9+JKXt0us3w1UVtQ3iTTks/AqgZxSh0u6wQ+PXj4W07LEe+mTy1a66wkPnbY6qJDGVaeYAWV4D
	CvdaC6wxbEwTrnZ5dedTIZZD7/LRTQOnBnwMZCcL22S7LTqtODbRQOUGcT+x4wNiNPC/1cEiokMmP
	Km92wPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNex7-00000006lTa-49eW;
	Thu, 14 May 2026 22:54:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNex5-00000006lTA-2fCE
	for ath11k@lists.infradead.org;
	Thu, 14 May 2026 22:54:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpx4J3513635
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 22:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MpHjBeDGHzNDOy9dbVQ2YOk7VWW2/RGBa4Tmtno8w1k=; b=Nx5FoWJvd5v89gZM
	48c8IU7tmuw3OcJM4gr0WF9gTq98/wF9hZ5SYkbulVprYU4V67F263wDBeUmxTYu
	m3CfzV0CKmQ408Rfo9YEyib1wVdwgZRpkrhKOqTZDVw8U601wM3vMFWIlAxyFPOa
	N26Ytij/r03rJQoI3k2cUZ3AnyLF3riblfIsqybx0pbw0FUTSPtQWEsIJbLk4uob
	pMFovlkSFQeCyJ+Uus50+ZZjQmN97Sicrfv/f+qU70qaYh8VNBzcFdGD5F6t5cfc
	GJOwqX3rzI/pdzx3cB0HtPA4WUM66aLP716hzWcpXjKUaQaSKkCYmO2QA2GWlkhW
	Odel6w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1v8p25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 22:54:46 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-13312be8a31so7795790c88.1
        for <ath11k@lists.infradead.org>; Thu, 14 May 2026 15:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778799285; x=1779404085; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MpHjBeDGHzNDOy9dbVQ2YOk7VWW2/RGBa4Tmtno8w1k=;
        b=HuDQHdy05ewCfqCEUt2inRBmQVKhpKsgdN23VIS3aKPDMLyiXHmhZnUM8Z7deEeju3
         UE9z01vLjLHlufol3eNPmsylBYiEPupSPRZtfPNc1HzkJA7X0XH5Ww3g1Wo0P0e/uWDd
         jYP3PeT8nJ/wCyBehPzPEAYBSle35iBj9Df7DtRfpDOxSGNUrav2G1ev8ASRN2TTbjLL
         eoANO1OmPhnTISuZz/P2Tex0NUwMG7oJDVxD+JzbIg2NOllYZyaKFO9AEgfrwk0Pk0KR
         /O7P+7Op9ugO6trV+TPX8yatW4wDSyZ4V0OxdQxihOMVotJKwiLQ6k7J4GUBzq22BXTl
         4kIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799285; x=1779404085;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpHjBeDGHzNDOy9dbVQ2YOk7VWW2/RGBa4Tmtno8w1k=;
        b=Ltxz44wIYJWxRbWlJz2pUgvbCKcMdS7VrXkeq8ZKCGlp6GFI+zC+sqXZktD9KSD4H9
         2LiWAfEpVhGNbJ8ip+lleTCx5c//kT1wRxCpwQfjWZ40P3sh6In6D0KXEQbfRO07j4kE
         t4yOsd8ByTL8wgUv1feB/LhEVl6ONYRKz0SYgpJFcByXfmeTuuXIvRkqLS3IJCBM9sA0
         4aO8I/IELnHFtc+aNgHZ5LXqA6Byo7UmA81HnB4BJAbXBoYcc0J/NJ6CWdvqp8YK9SGx
         9RsOe0TTdxZaD7ugOUKhw0hEoESEDPlJdfOSxRSRCQrB7wsGQvkgt/EA4oOKJO/J+SrA
         885w==
X-Forwarded-Encrypted: i=1; AFNElJ81zn1gJm6zExpFw3g3f/KNY/99T+9TM17Dy+BMSDMEkYPWZ6RluKPHLly/OSgANHYU93GyZl8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNZ++EkpXxbkwMWJLt1OM3ykKRrK7RZUhYRXnTaj81fvNy1Rrt
	TGoQmp5k+KbKMyuEv0HdeFiTR5wkSiHIsbPi8p4ut5eYHnBwDGrU/FiPHQZGfxH0SxBy00DHBLy
	E6NSPgb6jpr8pKk4zQyOWCYrV8dbOuLgg6JLfoKbhmamq5okuIy8m2zDLHqlYIV0m
X-Gm-Gg: Acq92OHL2ML2jV/mKCJsNVatWnoBND2UmvN0EKL1ugX7UD82QLfT/vO53TZB+qMihZA
	G7XA3xKjrw9gU5fh+UFufG/zex/tmk6KZPf756UKDq5KaWoI75Z9GzcGydb2sn/sAGbMce5vI3P
	TYtaMm8atfgcoL747TFHE+ngXvpIIPbHaA2fkR1CKvOfGKTRDgXbfPoXrC9TBp8AAyyRCQ/B1OT
	2RsEOEUb8he8cdjuHzf/fLiURTNTQSAJgRa15OLawUrt3YB9/zrhZwy0voeP2goI4sHLY/9YHIp
	R6mNqGeu3kQjAnMCrMfD+DrIHNq1kciB0a+Z08OAjq0Xmgx23/TDpIJWN+so2r33R1nkh5qkjA/
	B/nfDDxY4+yc+68SVOPT2ZilFYP/Etfb3LmZ5ZnTCQAPQOFyjIOB9a56EBUNuYA5O1zn2WgNvjC
	gpG5lGw3yii0vpZ/Zrozf1wZCB
X-Received: by 2002:a05:7300:8b95:b0:2f2:5c68:5052 with SMTP id 5a478bee46e88-3039817fe1fmr697850eec.13.1778799285233;
        Thu, 14 May 2026 15:54:45 -0700 (PDT)
X-Received: by 2002:a05:7300:8b95:b0:2f2:5c68:5052 with SMTP id 5a478bee46e88-3039817fe1fmr697835eec.13.1778799284735;
        Thu, 14 May 2026 15:54:44 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500a97sm5423975eec.9.2026.05.14.15.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 15:54:43 -0700 (PDT)
Message-ID: <930c0363-74e2-41dc-9aae-2af431ae441d@oss.qualcomm.com>
Date: Thu, 14 May 2026 15:54:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Add two missing Lenovo IDs to the quirk
 table
To: Kyle Farnung <kfarnung@gmail.com>,
        =?UTF-8?Q?Santiago_Ruano_Rinc=C3=B3n?= <santiagorr@riseup.net>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kfarnung@outlook.com, Mark Pearson <mpearson-lenovo@squebb.ca>,
        koike@igalia.com
References: <20260506200249.317690-1-santiagorr@riseup.net>
 <45f1c979-ea8d-4118-8551-eff93966b4e1@oss.qualcomm.com>
 <CAOPSVF29ofKi8fpmJxuq9F5uQXHe4RrFvGb2V-odGMNA77NWXw@mail.gmail.com>
 <agS7fr8mDI9TLpvh@voleno>
 <CAOPSVF2xwpR63MmngbG06_wPtQe2tOoVe87fanzXGRHBeJGYUA@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAOPSVF2xwpR63MmngbG06_wPtQe2tOoVe87fanzXGRHBeJGYUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDIyNCBTYWx0ZWRfX1SI9YfAC+jUi
 gVqTIP9cH2hHniNihWX8bA5XUciEh8nhLplwLs+ziOdHfwoUY6XO4GyBTFNlUlkNTFvLQwwfczo
 v72iGaPE6rrGkFxNuq4KbJSSVvXoUdmiBs0S2RDWvRFhyLaA4SGMDBjHG2VDofoO6l2kqGC2Bmj
 Iccuvgiw4OkQxtxzN9E76FoVOf7SNWJdExaZSe1esbRE5abIDTi1cMr2i65dkGXTFxJRodXkcsn
 tkHjn1TbuGxXREEiPw07eQCznoBa3+1vDhoPpuZJVZCCL/mlEowMQ7Az4AeuYQTC74MI2ZR/Q0g
 +3O/Iy3tjtOkylun45SUEqpxwOoXjKgrxLkQYRml6SGTfd9gHq1qqNgP6k5aph17xOE4nXBRy3K
 eUHZinGS/rljOn+Ne0IXGaA2hyaBSQgNcD9pOQNz0qMUrYjgAQUC6C1RQv9gVmvXU8/9vwef1iB
 AbBCHgsbjJrlHa+JGZg==
X-Proofpoint-GUID: fRN8YFwMZdLy5gcgY3-ddAQzOxrw9BSO
X-Proofpoint-ORIG-GUID: fRN8YFwMZdLy5gcgY3-ddAQzOxrw9BSO
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a0652b6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=xNf9USuDAAAA:8 a=bBqXziUQAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=nagzklUHWQTCT_ILTRoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155447_806740_86299F87 
X-CRM114-Status: GOOD (  23.90  )
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

On 5/13/2026 10:01 PM, Kyle Farnung wrote:
> On Wed, May 13, 2026 at 10:57 AM Santiago Ruano Rincón
> <santiagorr@riseup.net> wrote:
>>
>> El 12/05/26 a las 20:30, Kyle Farnung escribió:
>>> On Tue, May 12, 2026 at 5:03 PM Jeff Johnson
>>> <jeff.johnson@oss.qualcomm.com> wrote:
>>>>
>>>> On 5/6/2026 12:54 PM, Santiago Ruano Rincón wrote:
>>>>> Commit 0eb002c93c3b4 ("wifi: ath11k: Add missing platform IDs for quirk
>>>>> table") added some Lenovo platform IDs to the quirk table to address a
>>>>> wakeup from suspend issue [1].  However, at least P14s Gen 5 AMD, as
>>>>> reported by Kyle Farnung [2], and P14s Gen 3 AMD are missing in the
>>>>> table.  This commit adds the two corresponding Lenovo version IDs for
>>>>> each.
>>>>>
>>>>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=219196
>>>>> [2] https://bugzilla.kernel.org/show_bug.cgi?id=219196#c23
>>>>>
>>>>> Tested-on: P14s G3 AMD running 7.0.3.
>>>>>
>>>>> Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on machine model")
>>>>> Co-authored-by: Kyle Farnung <kfarnung@gmail.com>
>>>>
>>>> This is not a standard Linux kernel commit tag.
>>>> Co-developed-by: could be used, but I'd need a Signed-off-by: from Kyle
>>>>
>>>> Kyle, if you'd like these added please reply with both a Co-developed-by and
>>>> a Signed-off-by tag
>>>
>>> I re-tested the bug behavior on the v7.0.4 tag and found that I'm not able
>>> to reproduce it on my device. I put the device to sleep and then unplugged
>>> and replugged power; it never woke up until I intentionally woke it.
>>>
>>> Based on discussion in [3], I narrowed my issue with wi-fi disassociation
>>> on wake to a suspect commit [4]. I'm developing a patch that clears the rdp
>>> and wrp buffers during wake to clear out any stale state in the LMAC rings.
>>> I'll submit that once I'm done testing it.
>>>
>>> Santiago: Are you seeing the sleep/wake bug from [1] or something similar
>>> to what I was seeing around disconnections on wake?
>>
>> I was seeing wifi issues after wake-up, including disassociations, as
>> described at https://bugs.debian.org/1132343.
> 
> Thanks for the confirmation. I went ahead and submitted a patch for the
> suspected SRNG restart issue in [5].
> 
> For my P14s Gen 5 AMD, I don't think the PM quirk is the right fix at
> this point, so please don't include the 21ME/21MF IDs on my account for
> now. This new patch seems like a better match for the disassociation
> issue I was seeing after resume.

Based upon this I'm dropping this patch.

Santiago, if Kyle's patch doesn't fix your problem feel free to resubmit
adding just the quirks needed by your machine.

/jeff

