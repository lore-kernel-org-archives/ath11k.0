Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD67C4453F
	for <ath11k@archiver.kernel.org>; Wed, 22 Jul 2026 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOS8C9O2mpDSWwcI2U+Die3+r9YuIRHaNSGUW96C7PU=; b=M/CxakLt4sfTPTsb9/MT2ztuAQ
	cy1E62mQIRFXr4lVlgPwepf/XJEscqBFwMTLUMQQoRMneZJGwCzgSPP2lBE2MOLPNzDI1LVmldR4Z
	PplAGQd9W9x/OSN5YO6N6tZyndQ+W5AG2gEFfi/1jDK5gv72J9aqfeBH9YLJYx5ND2IPrHPDL5qAL
	XY8ryTeO5iFS59vCWKMiqv157v29vVBRhDGQVB5kGMOECeAtrTuZPpJOdwiDQkaJrOASPW9Gp5C0R
	nqDC8pCGnAvQ4P8jg2rutrWenJyprFIwviGBX32b7hDp+Ag/TUmZf0/8fS7kkh+UNo51Gfpg/6V5d
	v5kU2P9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZEZ-0000000CG5Q-30zL;
	Wed, 22 Jul 2026 15:51:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZEW-0000000CG3d-1ALX
	for ath11k@lists.infradead.org;
	Wed, 22 Jul 2026 15:51:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFXoI21441281
	for <ath11k@lists.infradead.org>; Wed, 22 Jul 2026 15:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOS8C9O2mpDSWwcI2U+Die3+r9YuIRHaNSGUW96C7PU=; b=UXD4in6lEx65asPm
	4IOzpayhTLQ0PJAfzip4L2A1hYHhdMy+4AXS34TJkQr1ptkgob8lqPuPFd0IBa0G
	Awf0peLgEYF9hncGxu8Tx+vggFPcE7rK8w6eYxthHV2+vQFPfREC9L6o4GlUmUne
	Wy6aCMkCXk8c8XEjf6D4wasmul7r4duMeFmpJPZgv6DyLQPxi92eUcddLrL1+ZHs
	rJ8NkgleV8u76dlkzHo4ko4ubT2uD2F8mRjp2+Kik5eKBQtu0VguAGVxlW7rbKVj
	1wssL+hD0alBP8JS5A40Z0YkERo94/7ugJa57xOr5GgEAvT5b+skLXT/9zBto2cn
	FnySQA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt29jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 22 Jul 2026 15:51:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so8955761a12.1
        for <ath11k@lists.infradead.org>; Wed, 22 Jul 2026 08:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784735502; x=1785340302; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hOS8C9O2mpDSWwcI2U+Die3+r9YuIRHaNSGUW96C7PU=;
        b=WyavTzVq+OT1sZon89K5bZGhW3tZWwlxjCzIHy8zo9pqM5tdfu/Js+Ae5Q7tivce/0
         dAwzzUpFcxB0NhT0MqLyT0WW3+39WgSVDbMNnO8ZJbwhFAWWiUZp2BQcgvg8HL8fc+Gi
         NzcnYqCrGAKuQpWCzle0jRWFrXTbetUrude+mdte12gYMt9rK6j+8/gvF9f6yh0qSrMd
         2c+bBEMkM+yrxpz1oKPh1rnx/RMTgvTD+0v9RPKupRqT0EwdKIzHgTgrs/8+g+iST6R4
         NR/IHwBE0MIvUvvUeK7YQ1OD72W4RhcnSTza1BLFzy7IgcmRcXn9hynrzbB9aoZrQ1a/
         qN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784735502; x=1785340302;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOS8C9O2mpDSWwcI2U+Die3+r9YuIRHaNSGUW96C7PU=;
        b=ae4JGG5QvcB/2LwzocwvLsJxTfpgs5Mnzl5aybpIr+bE6ef4FgnjjD4JgSnCaahEVg
         fOU0w0KRFD58YTDyhYgk9FRkeTCwLb1MuaTLsVLMTN9kR2qRop6wcnGu8h5HKUtv9+fI
         5KQTBkVrlW5T7f1ShjuW7OeJRQbntQTUXZ7I1pO+8xvdy2AAGsrwHo2EXClXV4zFzABT
         vYqLYUuZwXg9stgIvVpz/9iaNlDPZYAfHat9JwWg99LOaC4oFqWNDSQrdJmDfQq5a/TI
         9Y62ia825U+MmIPaMpM7+qHqNRIbe+DHoBLEnI3EQB3GMXoKM3eNMZRYyDiUihc+hBCH
         msvg==
X-Forwarded-Encrypted: i=1; AHgh+RpawEMvD9jC2PhKe84hRZmsw3ctfyv4edM1R9YfuOcve74vPulhJyfiWMI31OAsekaunnYdqq8=@lists.infradead.org
X-Gm-Message-State: AOJu0YykwNwkgv75MKkrnW96KoDxNZJ/hSM0LdhW4A9Ff8JdwA0M+6Ze
	3g1W3gwIgNScihxPh0+6gRwCBU4v7aZEgXRv3qDj7iDlRoJaYapAtW9Zadh9gDHMD/Ze8sf0jeq
	uTbE+oQ8O36y3XO590AlH8+oyDykAe9jtv3HPPtZRygvVZy4VSosX6xWOi3jnLRY0Q0auPF5F
X-Gm-Gg: AR+sD11Vhip+jaXYGDOq3qy1i5eTDKwBX8CrAcKpEo+WwkdW69tZMiMKs0ci7m3gvGh
	2bBj1iame7dvqDB6v+wAFCklBgSDGUNfCcDwf/WSeM8JsC3c4JkO1pbG4aqFLC5NtIiQ9oWSk7p
	FQp0Z9cGxuLivrVCWoADF5/2brMyvohUrGlvibE/Dh6Y2zr7yXuTtHXW4/oGX+zmCZxC7M3Jnwv
	UWyMEoS7lwlVxCibKbP933PBBy48cGBYI0mUILmDmLupBwGaChVaMwJGXKL4m0zCesv33PveY+l
	TAFWZfMY0Co6Km5LnVxbIR7qlU1AmXTMIJ7UZ+1y3R632gjR/wpWGSZ2vPEFVQUivFkl/XIUZRX
	599PeJiAB9eflWAaELnQWg4Q6pn2rgXtf1MXtYRSPxLVK94EFDwnZ88lM/rxg
X-Received: by 2002:a05:6a20:2d07:b0:3c4:3112:45 with SMTP id adf61e73a8af0-3c431120182mr4018434637.1.1784735502577;
        Wed, 22 Jul 2026 08:51:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d07:b0:3c4:3112:45 with SMTP id adf61e73a8af0-3c431120182mr4018400637.1.1784735502119;
        Wed, 22 Jul 2026 08:51:42 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm10913111eec.25.2026.07.22.08.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 08:51:41 -0700 (PDT)
Message-ID: <0833afbd-4a25-4e7d-8e77-ab9fac9d36cf@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 08:51:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-next-20260721
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <f73b76bb-dc27-42d0-8e47-b617eec766a6@oss.qualcomm.com>
 <67b88a3cc68473a1ee9d2816c4b5fe07c378434f.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <67b88a3cc68473a1ee9d2816c4b5fe07c378434f.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9PH8Zj-ZfqwqPMnYRW23bdgYyBUvgALK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE1NiBTYWx0ZWRfXzdGhOgqJJTW4
 r/PBg8zqgWB8S6aoMuelOwlXIP/twtHSeZA17JuCK19c1nEpDh53UrIDOdwKAT1H3mGeXvDNFmz
 mB8aH9MmXwMeclWsgpT3uaI+POVdApAhgbkeNE+pGz5X1RiciU8z1oIq7EK7lOKnny/sdEetPpa
 +x/Nu1eEBeUAULYsTq8UP2CFuqxQUsYfdsaez8J4vgHXprCbX9n1bHPlU58wqyCWWNM3/1vtQTY
 bcC1+Wjya6wWYfM99UPBL5r9uMVBAd/l5AE+kQ9+UI3Fpr5Ooip/pVPJYYc7r8Js2+K8eu56iqv
 dnEoXG3wLmli4bNFZ/7pN3u42aPzR9vuLko1TYGgBJCC/JCIwuHWoqVAgiJNavNsxLkV+ssPnQt
 ivHozkft3dYezX4MvAFfkhoiItxRN2wEkbADLt+4SVtu/bodEAzrKkXsq3glj6mGHT4AN0UL3Sy
 XVtlpk7KRs0htmfWcwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE1NiBTYWx0ZWRfX7STaohgVP56J
 Ipjwg24+gFXlVRpPdMTWq90hXLzIu6pxwS/grjqUgf0bzQ8/LD+J8VKhsv/3xwepEVNlyFPzHsf
 oEwUVBUlxCk3xpTQJMnBaEo+nQ2aIxY=
X-Proofpoint-GUID: 9PH8Zj-ZfqwqPMnYRW23bdgYyBUvgALK
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a60e70f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=XsDMgvtJpxJmlFumrWkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_085144_341609_68389946 
X-CRM114-Status: GOOD (  18.58  )
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

On 7/22/2026 7:08 AM, Johannes Berg wrote:
> On Tue, 2026-07-21 at 16:46 -0700, Jeff Johnson wrote:
>>
>> ----------------------------------------------------------------
>>
>> NOTE TO UPSTREAM MAINTAINERS
>> This PR includes the merge of an immutable branch from the qcom tree
>> https://lore.kernel.org/all/178362521364.2422497.1305957434056184382.b4-ty@kernel.org/
> 
> That's annoying, it added a kernel-doc warning that now shows up on our
> output... I guess we need to ignore that.
> 
>> New warnings added:
>> Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for return value of 'qcom_scm_is_pas_available'
>> Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for return value of 'qcom_scm_is_pas_available'
>> Per-file breakdown:
>>      2 drivers/firmware/qcom/qcom_scm.c

:(

I run kernel-doc on the patches I process, but since I didn't directly process
that series I didn't see it.

Bjorn/Sumit: looks like there are a lot of those that need cleaning up...
% scripts/kernel-doc -Wall -Werror -none drivers/firmware/qcom/qcom_scm.c
Warning: drivers/firmware/qcom/qcom_scm.c:317 No description found for return value of 'qcom_scm_call'
Warning: drivers/firmware/qcom/qcom_scm.c:343 No description found for return value of 'qcom_scm_call_atomic'
Warning: drivers/firmware/qcom/qcom_scm.c:440 No description found for return value of 'qcom_scm_set_warm_boot_addr'
Warning: drivers/firmware/qcom/qcom_scm.c:453 No description found for return value of 'qcom_scm_set_cold_boot_addr'
Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for return value of 'qcom_scm_is_pas_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1147 No description found for return value of 'qcom_scm_restore_sec_cfg_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1325 No description found for return value of 'qcom_scm_assign_mem'
Warning: drivers/firmware/qcom/qcom_scm.c:1396 No description found for return value of 'qcom_scm_ocmem_lock_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1413 No description found for return value of 'qcom_scm_ocmem_lock'
Warning: drivers/firmware/qcom/qcom_scm.c:1437 No description found for return value of 'qcom_scm_ocmem_unlock'
Warning: drivers/firmware/qcom/qcom_scm.c:1767 No description found for return value of 'qcom_scm_hdcp_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1792 No description found for return value of 'qcom_scm_hdcp_req'
Warning: drivers/firmware/qcom/qcom_scm.c:2526 No description found for return value of 'qcom_scm_is_available'
Warning: drivers/firmware/qcom/qcom_scm.c:317 No description found for return value of 'qcom_scm_call'
Warning: drivers/firmware/qcom/qcom_scm.c:343 No description found for return value of 'qcom_scm_call_atomic'
Warning: drivers/firmware/qcom/qcom_scm.c:440 No description found for return value of 'qcom_scm_set_warm_boot_addr'
Warning: drivers/firmware/qcom/qcom_scm.c:453 No description found for return value of 'qcom_scm_set_cold_boot_addr'
Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for return value of 'qcom_scm_is_pas_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1147 No description found for return value of 'qcom_scm_restore_sec_cfg_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1325 No description found for return value of 'qcom_scm_assign_mem'
Warning: drivers/firmware/qcom/qcom_scm.c:1396 No description found for return value of 'qcom_scm_ocmem_lock_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1413 No description found for return value of 'qcom_scm_ocmem_lock'
Warning: drivers/firmware/qcom/qcom_scm.c:1437 No description found for return value of 'qcom_scm_ocmem_unlock'
Warning: drivers/firmware/qcom/qcom_scm.c:1767 No description found for return value of 'qcom_scm_hdcp_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1792 No description found for return value of 'qcom_scm_hdcp_req'
Warning: drivers/firmware/qcom/qcom_scm.c:2526 No description found for return value of 'qcom_scm_is_available'
26 warnings as errors

> 
> I also get two fixes tag reports:
> 
>> Commit: b127f79a4933 ("wifi: ath12k: Correctly copy the hint BSSID in WMI scan request")
>> 	Fixes tag: Fixes: f40abb4788a2 ("ath12k: New driver for Qualcomm 11be hw family")
>> 	Has these problem(s):
>> 		- Target SHA1 does not exist
>> Commit: fde37c064641 ("wifi: ath12k: Set IEEE80211_OFFLOAD_ENCAP_4ADDR after tx_encap_type vdev param")
>> 	Fixes tag: Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode support for eth offload")
>> 	Has these problem(s):
>> 		- empty lines surround the Fixes tag
> 
> Note that the first of those ... the commit exists, but not in the right
> tree. It's in some ath12k-bringup-start tag in your tree, but not in
> mainline, got a different sha1 there. So checking locally is confusing.

Let me rewrite those and send another PR

> 
> johannes


