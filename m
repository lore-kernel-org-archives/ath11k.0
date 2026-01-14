Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF206D37E3F
	for <ath11k@archiver.kernel.org>; Wed, 14 Jan 2026 15:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAMa8b+pnjmawngmNFoBkoxVHrQu9nmKZxAfyT5nEVA=; b=2i0sT/5VugULnd0uirdW4ASY/3
	PpVVQI0CZpBpPlWbeuBGEcF4ISbHClL+mubh8nTXTe17upEiTnACL4GF4WYqeUsJBrx74E4BNMhq6
	F0TkoRL0ETT7yLQSkRj0EJoRTH9/mCViXrbz3V/GKyu3EAwe7JvsOUHfhAwndj9mKC/wgr7smIRkh
	gk7bV4+/raazsxWdpJ+Q6SjuT0Fs3uqSUcPkEGKbgXLjxQUd5M0dZ4jHCfuVas8QFyQeKXfctDEbC
	fmy6vElhoGsC1McTsay13XkiBvpTcMci+/1EXfiUUp/5nz5A5ez+WZ3qRLhsSosNkT/6zYtgAvUo1
	rBAgo8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2ZE-00000009dhp-0y5h;
	Wed, 14 Jan 2026 15:13:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2ZA-00000009dg6-3m6z
	for ath11k@lists.infradead.org;
	Wed, 14 Jan 2026 15:13:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EDUvho3550518
	for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 15:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAMa8b+pnjmawngmNFoBkoxVHrQu9nmKZxAfyT5nEVA=; b=OfkRh90kkBzRfjB+
	TrHiZFodm1rMkrXeNAe/ZRfl9nFCqMA5x+w/OX/j9VXzxw3adUx7fFNkIA7vOGK8
	RwhDH/YsnVp5vrI/DQftnHelkAugA8RBHCNOndO1ddcdil0aZn2HTxZKmAMWZs7q
	M4Fhw7y6dY9bn1yd0VHoBi2VjFBImsQ2XU+D25h2zbuHvD3cF1ncnurPxy69kLRU
	FHHQg771egZN4ShHvv1aHismkVJewuV2BDumqxguDgjcJPjxnSfAe1UBxEQAPkoD
	ahuKOtzaJXE1QEz1+WLMbouiAZpXHL2nDuREMaHU69omPmhVnUi3ZyOfatN+ZXd1
	UfT2nQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpc3jr9t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 15:13:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ae25c02e7bso30943585eec.0
        for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 07:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768403627; x=1769008427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAMa8b+pnjmawngmNFoBkoxVHrQu9nmKZxAfyT5nEVA=;
        b=Jqetkn8FD2yb/MRqCffUtJgGNxeKcvLU1ncGX6BQ4AC6uHvKS41ZQdk/hGuO/q50e3
         PglaAEYjyOViTN9UKurJvOefE2uEiQDshlRqck6y9czw17vMP0WMHeaSUwSR+cR4X1yM
         DDHrZ7rXBUuuFGjZS8c8wSR/pUebT1+5+KYk1Xc3mIgm+MxLUzoOUases5tqEPBxStsT
         ytxqCbu6ONyhVmyIm7ifz2zRtEoStHMGvhH+JbmnjGGmQyfvkqo/9WtC+W/QljQv4sdW
         F6zlPdVfGNmEdVK9tw/OT4GOjAM9J+e53dVSauu4hWBcUPOVs1he3RgFpLwMDg65c4qM
         JKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403627; x=1769008427;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAMa8b+pnjmawngmNFoBkoxVHrQu9nmKZxAfyT5nEVA=;
        b=e5LuglG/DH+0BraReAhGDpgqcvvLqSM/XKQwQB8HfjjLInh8CbVJb3i3e+NddHuSwP
         QjgkKLDhABs1+43hm9O00xVVNvEYVbpZGTD6vprKMPJ4YOwx13f/Eo4N3epayh+/rcX5
         rMoFJ8BaIeLuo0kJAje8FmZ2TaZYsbLNwBoHgJ709UUS19ZN++SXd63xr681WYNa46yc
         k9liOeYtzVMnul9Um4VFsGoWeAYgG/7byvxQXRHo5j95FQyqEekZDpug4DRnMitshYvh
         ljKD3YAWgx1BWHUwmY1m5VS2Z3XurwM7T4eZ7KKm52XC/ZBiiHTvQl2oDPJySYeZXiXZ
         /hLw==
X-Forwarded-Encrypted: i=1; AJvYcCXSjMEe6vbf3r54CKK5R+t1JReLvWXgAC6YEwHLmbrfYt66JeNQlqHB3AAFlM0qjaXPM2CeINI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/CoufVYlyszqCnzgqTEYiPyCp+1iqlLcvuumTkxMtGEqlvHMk
	lsHa79zFiGUFMynY9uVxL9Mp9Xe1rrV8yTyrSemdOtU1ngpPwkbln67t7sMNMPj9nFYyJEX2Pmj
	eYQ18wM2QgKEmaVSIn2DvMSLltmKz6QQj6d7Dixi24HhZm26bqSzASoz02OqgmAMZ
X-Gm-Gg: AY/fxX7+JPkbI4bdIrbkepk2joDv2f7ov1eUKuKo5SWk2bQYt6LP4QVkl4HGtA5Bxkk
	QmOqZLEPDrm6NFj2rMcYH3JKXWrH5V2HsqhsusCUQ/1UAYxP2JuqF4SYKqyn7tyb6R1MqMZ5f5o
	c85/V3tFWQ/sj96e1jtHr8cunLvWzWpVVquyOPFCe9W/2dHS1ODYVI/QPq5+V6fR0DX4C4O2yKG
	lJVkupmVD/77uHJyFEgPP1dF3IurK/J/2hZtOjKT8Hy86LhEP5Xidrud04bosbDL9/7dG0TcM+t
	LcfuoN+6ArzJk5akcJT0Ab0CHgZrh6M5MEqQL4+o0oWyEiV9Ba0y+36/iTXCTXoev6CFpeMuTE2
	NOO9v1cF+D/x+oFAi6ZlWXHrK3OLgjWNTJtVWhPWGHY/YdII11TzQVsfMKcwOxoGFZRiM1Q==
X-Received: by 2002:a05:7300:23ce:b0:2ae:2c27:fc0e with SMTP id 5a478bee46e88-2b4870bd16fmr4248641eec.22.1768403627329;
        Wed, 14 Jan 2026 07:13:47 -0800 (PST)
X-Received: by 2002:a05:7300:23ce:b0:2ae:2c27:fc0e with SMTP id 5a478bee46e88-2b4870bd16fmr4248586eec.22.1768403626617;
        Wed, 14 Jan 2026 07:13:46 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b175bee31dsm17962169eec.32.2026.01.14.07.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:13:46 -0800 (PST)
Message-ID: <f12c186c-c76a-4d39-8591-4c8d7d04d307@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 07:13:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260113
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <98386125-c0bb-495e-b2ba-2765aaed19d8@oss.qualcomm.com>
 <33d998cc225a7aeef4731ebc53c28a32b241ca7e.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <33d998cc225a7aeef4731ebc53c28a32b241ca7e.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyNyBTYWx0ZWRfXyYq/Tqv0HL/x
 MgeonIMtPQ9neY6wGk1QyhTZOlPMKzF5m+JVy8/C6QeXO6vekV1LGEIcDa6SQ0mNa9GIheYkvRd
 vf2duIR2hFm+wypje8kTAKY2+3hHFvTRQUzyAfRkWIAHEL23gakvEWP9tjS1IAzXykVV6Td6mNQ
 whkbvCkAZMBwqNZ/mAULxBK6I1PrKP9iXc9emcgbXPmd+QpRmw9GabnkJ02ggiti1JzNxJJH8WD
 JPVEM24KnV3QsXYri5hw9QarULIn2BAGIfxNLvyn4Ai2DaNfvEtC73z5JngwR/VeLuqWClcuo1d
 H4di7h1RhpaQY508icrvqkKuLUHw1H+ATeRz8Uwqjxd+MD4QreO653gKot8VA18hBoYZ1Px8FhG
 U22immUU0LVyqRSM0lwdBeBFFokoMJBZsWiY+K6Aa8SL+0AbjuVPa6USGiNyyMKguNFpjLZUwrt
 HALhGm3mEGteNdXVEdw==
X-Authority-Analysis: v=2.4 cv=RLO+3oi+ c=1 sm=1 tr=0 ts=6967b2ac cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=s_ggy6vDphFXL1rJ9sYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: lDZbCB8PcOUEpXU-HvDZdt4iOkEaAJUv
X-Proofpoint-ORIG-GUID: lDZbCB8PcOUEpXU-HvDZdt4iOkEaAJUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_071348_979753_4AC66EFF 
X-CRM114-Status: GOOD (  21.40  )
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

On 1/14/2026 1:47 AM, Johannes Berg wrote:
> On Tue, 2026-01-13 at 09:33 -0800, Jeff Johnson wrote:
>>
>> Note to maintainers:
>>
>> This tag includes:
>> 31707572108d ("wifi: ath12k: Fix wrong P2P device link id issue")
>>
>> That commit contains the following:
>>
>> Note to linux-next and netdev maintainers:
> 
> I'm a bit on the fence about this, I hadn't thought about it on the
> prior -next PR much, but I feel like this is a process thing that
> shouldn't get recorded in the tag for posterity?
> 
> I do appreciate the inclusion of this (*especially* when I won't notice
> the merge conflict myself), but I tend to think it should be in the
> email rather than the tag message, since the latter is something I use
> for the merge commit message and it gets recorded.
> 
> Either way I have to preserve it manually to the next level, so it
> doesn't really help all that much, although I guess in the tag there's a
> chance I could see it again when preparing my PR.
> 
> I'll just edit it out this time I think since it's so long, but you can
> complain and convince me otherwise for the next time ;-)

In retrospect I made one bad decision. I modified the commit text of that
patch in my "pending" branch to add the conflict resolution information.
Instead of that, I should have reposted the "pending" version with that
conflict resolution embedded in the "basement" of the patch so that then it
would be part of the email record on lore but not part of the patch record in
git. And then for the tag I could have referred to that lore link in the PR
email. So this was a good learning lesson for me.

Hopefully these merge conflicts will be much fewer once the refactored ath12k
lands in Linus' tree in the next merge window.

/jeff

