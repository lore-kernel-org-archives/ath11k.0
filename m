Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22831C55167
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bj4ThZlfGpcMS5lmLNKuG9A/AzJYlnnmZrEyxllyxiA=; b=itcPjUuJZWmNxENR95BHFjUnfU
	ySCC8o0gccWJHHAULIJWwENAmXs/h7kH95BQUCuiiCMD/nDZV85b/6NIgFMSLN2B+XqHRyXFcq5fR
	UCEUBEfFwjgWVUArOo+QeNoifc69lEbs7SforFaPoTbmdFurh5aFV4pzZ+tCmDotyUskh07UzEYwM
	0j7HcK1RVpMWJHwWnxPoffcf3P3PD2NsZz1mx3aMQHKOmkP0s5qqoCKz84zqzV9nhgowMMp1KjKHa
	F5tq8QR7PRdm+mU3BmhDGPBYZ7gNcqc4BfkvB8betImtPDLtlLXHEgfne6mcNvk03vE6LzWFB0W3V
	szCiCsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqCk-0000000D9ON-3BhO;
	Fri, 31 Jul 2026 16:35:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqCf-0000000D9NG-3jXA
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 16:35:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFO0V0700510
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 16:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bj4ThZlfGpcMS5lmLNKuG9A/AzJYlnnmZrEyxllyxiA=; b=FRMo8kJIKyGD58dY
	Zupc8D83xEDj77c4O8xnfqJvSRJdKkrAXh0xkdJXanwYihzZ/wcuxqXoW4bYAZnC
	/neeb2iDEtqgjMfqdI5hOEqbQeli8/+96jCoc0xWm/5Jw8yh/1MvyQDYP+P04AKa
	uegM1JEJqQyBbjbrxMJeKj4GbfobBDBkom3IgrwFR9HT1Pkv1i0eX8j6JiBLmhzJ
	nDae/Q3AJf1efi+5QlHJXMUCr5TdPnp45H0WGOGqYzyhj23GeqxxHJpnwVyIFt63
	ct63yzLHCkG2eap7AyDgKbICiPefUGJGl1oKA0N0i7GoO0etLU7Au2PuqREnqpho
	StML3A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1u196e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 16:35:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8488ac68185so3050776b3a.2
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 09:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785515720; x=1786120520; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bj4ThZlfGpcMS5lmLNKuG9A/AzJYlnnmZrEyxllyxiA=;
        b=LH94Z//WOP1uMF9fjGl+QxRLIM3qsR3MWWdL9fsevLra7+W1lafUw0LZbGWkIAzsro
         P+qEIMhP1pnyVz+QbLu6jgIUh/6wQggJ6DdcrmPDKBJ5X3dacME6JXhjD0TI9TcAKgEd
         a6YOAcVftq4QL35IJck1tTozhRG//BgqnicennBkWv6du68noSSDkkmyMq0Rjio6QjId
         NRYniUXE6uS8anhCFyYjm5xb3xRirfhGZp9Rev43ovugMOGHoo6oGxMA7Zg/A9N+vqqj
         tiX7OUpoZJBXGbSKmtgtQ648maCDl2KholmuAfjrpkbvEZcmlQQAO7/ni6q3W1jYfDUB
         7zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515720; x=1786120520;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bj4ThZlfGpcMS5lmLNKuG9A/AzJYlnnmZrEyxllyxiA=;
        b=HHeJFHvp0XQToqIOrNalbWOcmfE0A6Dn7tToma0SIwuP6wY3dOJ92qo+nMXTGazCDG
         Be5IiwCzkO4xn8Q0KvBN++gIBjjT21ErDg353bdlgkb8xOyCBTUJwcCJBVZdbsoufLnV
         C+QsTaXstgJIRSlUP7nPqH23cLJdssriwiRPqRonpIwAoBr/Khu/xip0B9i3VlBugWt1
         odlqTAVckNeNaOj9ErhZNEX/QLYbyVELRhMwSkdtpz3KUO2plowtzeuORJW5emRymvnX
         +S3kl8KmZ2ai92s7hl0vLscvVOHX/wJSptgxSgZguwVR913TznxOzn1o8M8kflr+KfYK
         ueow==
X-Forwarded-Encrypted: i=1; AHgh+RrilcXBWS1W1ZJ/7HYrwvtvGUtI9l/mInPOJ5qfBFY64coh7YSH2y2GZJ/pJM+8Y8Qda52Rz0U=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMBSikp5wCtYCYvA2rvEgvVjbgHNt/6i1enYQGo4uVmCtaI3bZ
	41b64QoAfs6RJJdJbzB9P+48RvPrYYpmK265UjomN9cfeMYtzxQWzQTGr/Gpy/rLo2zx2EWjV+3
	WTOVnwVEDU0GBAmBjdFlcKNyzExJBj2qnGeM7OoAfkXxKAE3vQOWu3ayX6gZbmmd9
X-Gm-Gg: AR+sD12bJEWQ2DZ4akJHeW/cRLlsFvRLqNmYX0rIdaXZMfJQshToECFU89wnnWmGgMY
	FRhfEeR7Tz5bg+AB/d5/CpVOJNbhABNdDRQ8lNKy1PYVA6gcf5OcYhtFEQpweqkcZ0vT+kmnT6V
	MsoGSkw8Zo7T2wekiH6WBzduzW3KpuK+nOIFslAka+6rMWB1qljxW3NinoKWXli2BxWz0hePiSP
	AhvSzQ00cLXdHz+TLOmPOADx6Fvj+RXUBveNzOFEwPiVJUO6ryp9djQ9RwMv//05hhbsLiB+ky3
	fVmKKL/0m6m0vZNrPiz/tWDKCEa1MwHtyZIBoGyt06Tq/7pEnpUAmDVp4FPXeTdLheZZQKvRFq8
	ekF9hG1UrCFkcmcoxWA/brTW18zKNbCFRspPZBufP3RydNM1v/xi6afNeRRTA
X-Received: by 2002:a05:6a21:4e02:b0:3b4:c9d5:cd5b with SMTP id adf61e73a8af0-3c92a53ef40mr463644637.13.1785515720565;
        Fri, 31 Jul 2026 09:35:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:4e02:b0:3b4:c9d5:cd5b with SMTP id adf61e73a8af0-3c92a53ef40mr463612637.13.1785515719982;
        Fri, 31 Jul 2026 09:35:19 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18d9c6sm7855451eec.30.2026.07.31.09.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:35:18 -0700 (PDT)
Message-ID: <272a4819-d966-4be9-a533-eceb7ae0a552@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 09:35:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: reset ar->num_station on
 hardware start
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260730140306.133718-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730140306.133718-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H5vrBeYi c=1 sm=1 tr=0 ts=6a6ccec9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=rlskuJYU9gRkOBZwSjMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNiBTYWx0ZWRfXwOJ+ULdJiLE8
 Iplbkr4mo8bXep2Twh/ZQtvOQAGgkkmjjaZkYORuqh4KKTLXy9/vlh3i4nXw8cV0FXSoKYtZppo
 dt5MZQ1/rP/4WouZOq9Zrs81Iz/ArVJJ7VdhcwS+m8fcUcnmfe7lIzh0TENvDqkmaZVOgv5MR1/
 R1dnEFdI9ST5AjL8JvewaFMDUmuuecxOhk9sampMo6s3GAKABnqN68fo3vNgADgzhAQPLJmfVkK
 hsExHjdruryuRv+4hceZIFPdcT6Bha7AqlBy6epq35gH4GD7f7M8sMmTnz3YTDw9iD3RUSoR4kR
 qTw89kOzBtbUNGTRbgT3wo7guOOGFaM4SHSRC8asDgp1P+xLmircJnCuEXUqji5+yrlCurrHpx+
 rPieTORvHk+hODbclg5O7LYnfOoe+VaEOXkqzzVWGVZS3NCrRCJknxLxyFQiIdSM6UWZ4QhUbrM
 nDSNJDCrmYTAB8Uv7sA==
X-Proofpoint-GUID: QwBLMDSzaUCa3qTNvN3saOA0yBXCLyKi
X-Proofpoint-ORIG-GUID: QwBLMDSzaUCa3qTNvN3saOA0yBXCLyKi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNiBTYWx0ZWRfX1EAc9cofrtYP
 T+uyaFQb55zJ4eNfZHmbmqZavgHfvqnZJqlG7uWpRAMoRTgekHEWOBq7yVNYgPxX+E3TYj1ehDP
 X98QojAhvTA4pDyOHwYVi3KHtiu3zIM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_093522_848356_0BC0C4C1 
X-CRM114-Status: GOOD (  12.51  )
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

On 7/30/2026 7:03 AM, Nicolas Escande wrote:
> When (multiple) hw restart occurs, we end up in a situation where we
> cannot accept new stations / mesh peers. This seems to be the
> 'num_stations' in 'struct ath11k' that did not get reset properly in
> this case. In ath11k_mac_op_start(), it was indeed the only accounting var
> that did not get reset so let's clear it too.
> 
> This avaoids problems like those:
> 
> 	[1248828.088023] WARNING: CPU: 0 PID: 12281 at net/mac80211/util.c:1682 ieee80211_reconfig_stations+0x98/0xc0
> 	[1248828.088029] Modules linked in: ath11k_pci XXX [last unloaded: ath11k_pci]
> 	[1248828.088053] CPU: 0 UID: 0 PID: 12281 Comm: kworker/0:0 Tainted: G        W          XXX
> 	[1248828.088058] Tainted: [W]=WARN
> 	[1248828.088059] Hardware name: XXX (DT)
> 	[1248828.088060] Workqueue: events_freezable ieee80211_restart_work
> 	[1248828.088064] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	[1248828.088068] pc : ieee80211_reconfig_stations+0x98/0xc0
> 	[1248828.088070] lr : ieee80211_reconfig_stations+0x94/0xc0
> 	[1248828.088073] sp : ffffff800025bc10
> 	[1248828.088074] x29: ffffff800025bc10 x28: 0000000000000001 x27: ffffff8027b19640
> 	[1248828.088078] x26: ffffff802a5619c8 x25: ffffff8027b199f0 x24: ffffff8027b19880
> 	[1248828.088082] x23: ffffff802a560e40 x22: ffffff8027b18880 x21: ffffff802a560800
> 	[1248828.088087] x20: 0000000000000001 x19: ffffff8027c71000 x18: ffffffffffffffff
> 	[1248828.088091] x17: 128c0801a9c37469 x16: 766e692d32464545 x15: ffffffffffffffff
> 	[1248828.088095] x14: 000000000000001f x13: 00000000000000b1 x12: 0000000000000001
> 	[1248828.088099] x11: ffffffc081061518 x10: ffffff800025baf0 x9 : ffffffc0808097f8
> 	[1248828.088103] x8 : 00000000ffffffd0 x7 : 0000000000000000 x6 : 000000000000003f
> 	[1248828.088107] x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffff8011ef2e80
> 	[1248828.088110] x2 : 0000000000000000 x1 : ffffff8011ef2e80 x0 : 00000000ffffff97
> 	[1248828.088115] Call trace:
> 	[1248828.088116]  ieee80211_reconfig_stations+0x98/0xc0 (P)
> 	[1248828.088119]  ieee80211_reconfig+0x774/0x1438
> 	[1248828.088123]  ieee80211_restart_work+0x10c/0x178
> 	[1248828.088127]  process_one_work+0x178/0x3c0
> 	[1248828.088130]  worker_thread+0x280/0x440
> 	[1248828.088133]  kthread+0xe0/0xf8
> 	[1248828.088137]  ret_from_fork+0x10/0x20
> 	[1248828.088141] ---[ end trace 0000000000000000 ]---
> 	[1248828.090658] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 0
> 	[1248828.090667] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 3
> 	[1248828.090670] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 4
> 	[1248828.090689] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 0
> 	[1248828.090694] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 1
> 	[1248828.090697] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 5
> 	[1248828.090700] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 6
> 	[1248828.090704] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 0
> 	[1248828.090707] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 1
> 	[1248828.090710] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 6
> 	[1248836.686596] ath11k_warn: 39 callbacks suppressed
> 	[1248836.686604] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
> 	[1248836.686609] ath11k_pci 0000:04:00.0: Failed to add station: e8:51:9e:d6:93:22 for VDEV: 1
> 	[1248941.120126] ath11k_pci 0000:04:00.0: failed to flush sta transmit queue, data pkts pending 2
> 	[1248941.120186] ath11k_pci 0000:04:00.0: failed to clear all peer keys for vdev 2: -2
> 	[1248941.120190] ath11k_pci 0000:04:00.0: Failed to disassociate station: 92:14:23:65:57:fc
> 	[1248941.120196] ath11k_pci 0000:04:00.0: failed to lookup peer 92:14:23:65:57:fc on vdev 2
> 	[1248941.120200] ath11k_pci 0000:04:00.0: failed to find peer vdev_id 2 addr 92:14:23:65:57:fc in delete
> 	[1248941.120204] ath11k_pci 0000:04:00.0: Failed to delete peer: 92:14:23:65:57:fc for VDEV: 2
> 	[1248941.120207] ath11k_pci 0000:04:00.0: Failed to remove station: 92:14:23:65:57:fc for VDEV: 2
> 	[1248941.121319] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
> 	[1248941.121326] ath11k_pci 0000:04:00.0: Failed to add station: 92:14:23:65:57:fc for VDEV: 2
> 	[1248941.123036] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)

In addition to Baochen's comments please review the guidelines on trimming
backtraces at:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#backtraces-in-commit-messages


