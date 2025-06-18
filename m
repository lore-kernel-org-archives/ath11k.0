Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C86C71157
	for <ath11k@archiver.kernel.org>; Wed, 18 Jun 2025 09:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOJroyMKNm7vSUy+fmC7JYV71ihvrx4URxb1UJUiwg0=; b=sHu9kKGbLk2etrAl2rXNIvdYY0
	9sRi+nbn82b15EYAAf1aHQrUSUmnfb0KJBbwxA6Mjxt5P2MteRPLa1ebnvJoz87Vxkrkxm619i0s4
	YddZE4WVmE1RSRwgOEtW+Y0FNMTytZFeyWw1IzPihA7cwP6HGQ7dgX3kXtsRSb/5JPAhjD8Oxbqj4
	xVSQOHCTx0nqLkULeyV7qlnFQ9CVtdGeZO8jaWrgkSi04DmTDP70nYWSTBDnVbVCmx2+rnJ1iTzUs
	gjK2nsJ+OUyfdIgdj+VsTsfPopA4JyGuIuau52en0/YphZxSIjg0EpWfqmPrrAzrEC8/Cij+mE6l5
	MvuOP5LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoyy-00000009Yzu-1fGo;
	Wed, 18 Jun 2025 09:21:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRow0-00000009XiG-0C8Z
	for ath11k@lists.infradead.org;
	Wed, 18 Jun 2025 09:18:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I3FnNi030943
	for <ath11k@lists.infradead.org>; Wed, 18 Jun 2025 09:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fOJroyMKNm7vSUy+fmC7JYV71ihvrx4URxb1UJUiwg0=; b=RR+NqD8sZMb/as38
	gD30LEbfUIlOEhRpq6nBdDvla+v6cUuAJ5NAljP7PwZX/TGq5LysHHkw0O6vrToq
	f6VdfEAkgf6c2i6bTwqsBS+/pglxrQOU0suarFXR7zDPSsaFxG887rhYFhj7pcPh
	AmFdqcrsQm+xSRPDeRXcTvOOStG2TkVB7RcyKdMRVqb9lGrbYvmru2HiaJczaqSf
	WFyxidav5zESnC42tBERaWJr3QGetOLh66kJfGmegqe1UdfnPa7zLfytegT3u2lG
	flpKLGkd4o0/X4EfUuzHQTobi1ofGGEPEtVm9Q9/a6NuveZ5esFX0jiNIFa/Oeh1
	mS6x0w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crubf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 18 Jun 2025 09:18:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a7629475b2so1229471cf.0
        for <ath11k@lists.infradead.org>; Wed, 18 Jun 2025 02:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238298; x=1750843098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOJroyMKNm7vSUy+fmC7JYV71ihvrx4URxb1UJUiwg0=;
        b=gaknB+QqVj9FUEaKU+QZZnLNfsolKBl4nVQPnkmVmltOP26D8DyQnxp/zIHSLK3xLn
         QdkjvlOmq17lXUehsQ49+e5aobnLxrUJjOuS4u5Bcjlz9whbFKAD1zbOh0SsqQs4NKeZ
         tLv0tt3gmSLA6lOHTGtB1+OLbeqps96AOyjaq71/sAbVfHKg4UiiaJXRj1U7JIb1SO1G
         dvilogzlZEqbZD3FnNUur38WhUrbR/E+xgv+NduM0LK4Av4hpozpK7ivxQJcfqWC+hde
         7SwWQZt740HeJLa0F8/f0tidoYxxMdOxDuEgvu4P9KHuR03V6QmwaG8uKZqv+61b/2qC
         Ht9w==
X-Forwarded-Encrypted: i=1; AJvYcCXsPywMoosi4GRGeTO9qTSTz7EqJa7+BlHS4YZ4i05MKsbUO70ICQUNL8W54RTesITig2ES9GI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxiVlRYSFFWOoyGEjkT95vlSypM0SF934Ka6pWFdAWeA/vgzZ2
	KqVnCfAvlog4ggAS1ydm6uYMBseeS38O9H3lFlS03uHqXVnmVRTex4AK9xDk+4Rg1Rb1+65QuSe
	Tchk/s+y1tIPb0AQQbblv7N01yyp29Waov0gOYgjaD3EXFwGN4FOU+otqWtTs94a9
X-Gm-Gg: ASbGnctFwwFlIjPn22I2wOzHojpxHU5Z66ZwBAdIxw8pNmwcoMq+lfcTKztICe0F/JO
	m+oGbcq7MHLE/CRDbIF1HsomF3NJcZnXKRm2VGpt6nvn/oK99A36siB3KLTv3VhXr9wrqfjt+qM
	+cW6cNhJulEFK5WYLAy15EPmxr+SCJ2kj8Xa39jlLcgdWwOWBIWrEbmxmF/HIiBfaSyjuv6SZdG
	uwOvyh78oAoxl0TpIBOkzaKrRihT7SP5q6KrsjYEH0n0zUAIUjkOcD4PbGBLJcvzohxl/tBu3Pp
	Ad7cBeOPLxCcsN40wI3nbaL6S2XmETd2EUFblmnkA4msXeJtJ/A2LXhEMsE4hyjaMxWS8dJdTYI
	lIY8=
X-Received: by 2002:a05:622a:1a15:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a73c55c1c7mr88059871cf.5.1750238297810;
        Wed, 18 Jun 2025 02:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFroTGQ38e7nIabQthNy/Uv5H8RTwz2UgGQOdmYHCVSIwztO+5tMX7dXUQ+pcaxlMq4WUfu4Q==
X-Received: by 2002:a05:622a:1a15:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a73c55c1c7mr88059761cf.5.1750238297388;
        Wed, 18 Jun 2025 02:18:17 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48dd68fsm9525214a12.22.2025.06.18.02.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 02:18:16 -0700 (PDT)
Message-ID: <db65c9f0-334f-43fb-bddf-316bf883a848@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 11:18:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 5/6] wifi: ath11k: choose default PM policy
 for hibernation
To: Johan Hovold <johan@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Takashi Iwai <tiwai@suse.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
 <20250328-ath11k-bring-hibernation-back-v3-5-23405ae23431@quicinc.com>
 <d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com>
 <aFJ-SwT1g500h3kC@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aFJ-SwT1g500h3kC@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o37yOR84AjJrwPwM8LXp_XjQkzSRT-Rz
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=6852845a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ueFis7n8dWqy784j0wMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: o37yOR84AjJrwPwM8LXp_XjQkzSRT-Rz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA4MCBTYWx0ZWRfXwYqawIxc830K
 ry0NHYNx2+iJ5JdkqNMXgtPnbgEeGpVyvXdJZdfpF+oFJzDZ7zisGyUrl/aTtvWxO81rRJxKvWB
 Qb+z7U63/uVnKNlA80wEk0yy91QzxmHGTbJwnDcPC5b3OVImvkqEpAmczV4/1rd9WNmizDisNaJ
 cMr2s549WbxbWSdhFGB0Rt50nYwYPfQZytjqWT4ZcWWN8s9YIYuxPzYAGfqtSR4BrMU59LeVU6d
 9zrE720DP5OQQI8fppYMN3t3HLf70KvwBhPGw3UloHUMjHiszY+8u7xKsaOc6UZd3r8C6i84LjE
 sh/ioz+8Ih9biRlz2a1lyxEd43/owysN0I2kPnpHGw/GBQezLrQX4nLP/P5PDbqjo0/5fbCu9yN
 gi5aoyDiQycjMH4s57N5mD+bllUIF64l74ngB7LJbXiFWok4zaMDogAqwQeh0j3OH0Pwlkv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_021820_277052_EF669413 
X-CRM114-Status: GOOD (  18.53  )
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

On 6/18/25 10:52 AM, Johan Hovold wrote:
> On Wed, Jun 18, 2025 at 02:15:04AM +0200, Konrad Dybcio wrote:
>> On 3/28/25 6:32 AM, Baochen Qiang wrote:
>>> Now WoWLAN mode is chosen for those machines listed in the quirk table.
>>> This works for suspend (S3) but breaks for hibernation (S4), because
>>> WoWLAN mode requires WLAN power to be sustained, which is not the case
>>> during hibernation. For hibernation, the default mode should be used.
>>>
>>> Register a PM notifier with which kernel can notify us of the actual PM
>>> operation: if system is going to suspend, the original PM policy is
>>> honored; while if it is hibernation, overwrite it with default policy.
>>>
>>> To summarize: for suspend (S3), WoWLAN mode is chosen for machines listed
>>> in the quirk table, non-WoWLAN mode for others; for hibernation (S4),
>>> non-WoWLAN mode is chosen for all.
>>>
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>>
>>> Tested-by: Takashi Iwai <tiwai@suse.de>
>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>>> ---
>>
>> I've bisected the following splat to this patch, still happening on
>> linux-next/master, WCN6855 + SC8280XP CRD, 100% reproducibility 
> 
> WFIW, I'm not seeing this with 6.16-rc2 (which has this patch) on either
> the X13s or sc8280xp-crd (ath11k now fails to resume on the latter
> because of missing regulatory data, but that appears to be a separate
> regression).

Do you have CONFIG_DEBUG_NOTIFIERS?


>> [root@sc8280xp-crd ~]# echo mem > /sys/power/state 
>> [   20.267830] fb0: Framebuffer is not in virtual address space.
>> [   39.863070] PM: suspend entry (s2idle)
>> [   39.908067] Filesystems sync: 0.035 seconds
>> [   39.934453] ------------[ cut here ]------------
>> [   39.939259] Invalid notifier called!
>> [   39.939268] WARNING: CPU: 5 PID: 513 at kernel/notifier.c:79 notifier_call_chain+0x84/0x1a4
>> [   39.951566] Modules linked in:
>> [   39.954732] CPU: 5 UID: 0 PID: 513 Comm: bash Not tainted 6.14.0-rc4longbois-01215-g32d93b51bc7e #12177
> 
> 6.14?

g show 32d93b51bc7e2e557771abe4a88da69c609e3d52:Makefile | head

# SPDX-License-Identifier: GPL-2.0
VERSION = 6
PATCHLEVEL = 14
SUBLEVEL = 0
EXTRAVERSION = -rc4

it's been in the tree for a while

Konrad

