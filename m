Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E58FF8868
	for <ath11k@archiver.kernel.org>; Mon, 27 Apr 2026 14:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdgJCYXTadqVZCoTmY66w443jQ8cMGl63cAKZdok2dk=; b=r3V2ExjP4BS/3mg6ahReHh3bVR
	sb9gI2t8xhiQSEkziggikn403hJw+PZlrMwTfa2jyOnGo8JGvv6ZiTTmOEY2IuiUEiQlDqtbjwyHY
	PuwHAAsei/Zjkv9zW3VxHS43qQew0ctXmLEUROBqpL1Dlvku5//q6XogyrIm7wD5cIVkbyeVQ7ULW
	c7FvlKus3dpb2RZ5ul8AeKEXklWnGpsv9vM5pLRHzDTtlvZxYeyWplLPden9PhgdcVAuGI5PPPbj4
	25ocIA8EEzvU9gmVHSOB7fe0I37shimO7GxrQZ+jgPTBMmtY72ZeCRfhGbjFmjoq7VhosKwXn/e0X
	oXBxUAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNL5-0000000H8eQ-0ljw;
	Mon, 27 Apr 2026 14:53:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNL3-0000000H8e0-10pr
	for ath11k@lists.infradead.org;
	Mon, 27 Apr 2026 14:53:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDT1cT665664
	for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 14:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CdgJCYXTadqVZCoTmY66w443jQ8cMGl63cAKZdok2dk=; b=dxKfeTHAlNF9dT52
	tAOWyU42mkCJz+onbxBR/TlrgpnKNh1pwa8k1+8Ko/29yxOMygp/fXWulB3XFlZz
	VN4kUIoOSPTqtcLmmvegKBR7xiADrkBeMn90mH2kBtFgYyJ/v/OqAn2/8N28bXix
	tqCeESlkXC/g8Ze6owvdgIG6hBxQrTmoJmjE3SmjvR9wSfHvvE1WvHzFxEJmBTh9
	Sy0b8ndftTwxAu7F6J+AO5MtdhnWJqT/O9lm3R7+dI/MHgky6cZxtBOdeo1lBOln
	5bcssHEngb9cj9LEkvXC5xEePrHCzXr/X0wi3SpVgMZfPQXaoJtrUNr0xRdkvLvp
	O831Cw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n1wgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 14:53:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so10155830eec.1
        for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 07:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777301611; x=1777906411; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CdgJCYXTadqVZCoTmY66w443jQ8cMGl63cAKZdok2dk=;
        b=VZoSHh77Ed1+Z4wC/S9trTYmGlk6Pntz9Gr6BUjmvT50waC3euG8YDr0oLOVvYgil7
         WBon8gr1rTJHIHdCPWW9avnLyWXShMxOOFKMqWTbfcII1OkVvbXXy0m5nk58OCLF+d07
         6QETaerdS/oB6xypJVR3fjID8eFASUM7F5/RynQuIBBNT+5X4A0ZLnmR2JCWCJ0QHGNF
         AGYv3ZxLtb19KvelSlZ7AzAe/HcdX/eSuTRx3WeodXnGJEsN4Kk9hXDht0fE80LoICe4
         UJE9gn+rWeMAovjGCPJclaH2doCtPttJc79LUXxs5rMB7zjzg5YNEgWu/i3wMNUyfLYI
         XduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777301611; x=1777906411;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdgJCYXTadqVZCoTmY66w443jQ8cMGl63cAKZdok2dk=;
        b=ixBH2crRb6jX1HrvYygfIEXjXt/m9+a5QwU64HLRO9NAJOKrcIQ+03gbU7KCdzZH0y
         h1L7fiJiEvgqvAuHUmvSlFWIpJoNnGOftuoRKD0+7TQi0FnykCx3eDgUo+qylZTbMUBQ
         j7wX9PSedupUe24SBxOCCmnS4EzLSihAf23VaDaim7Va2erJm/Fqr65gyI8Oms1ppNc1
         TW6ZEFvh+5aYK/4uyTLV4jWDTUhEtmjuLhRApngtDRTvxgTZuXs7rfiqiKibsjterosI
         s97FSV0S5PUSNnFesN+ILaT80S+E31hXulllkq8pKSIqIgayNl5F2SFbOOCmoQPMoop5
         d2iw==
X-Forwarded-Encrypted: i=1; AFNElJ9udmlUGnFV5VpEQn+JnVHWW4dXYKP8SnKYte6TQ+V3q8kWlYdDLKtQSCi8v8k96g019CquifU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPkMBGox0TDK56vwE+4Zb36nIDhNBzscreLxh8lxDh0lirLQhA
	8BtFNRgMtMBez7xXN2gaC0gcICZNRJxxDZ3xwlz2lPuBiIu5H6sVg2Z9kXjDzLXR5pyt2YPS7ix
	C2aFQWWd1BbC1uMPcqpECxKoSo+mvCjoa7Cga254XhVZZ89aQDy054M4nbU2EFqpXc5TTkGO2
X-Gm-Gg: AeBDievgssotlomZBxCDhdbs1Eh/8PsFwdrHpQzEBpzPksSafrbpr5Vz6MuZQ8k2EUe
	eBjNXt5ygmbkZILZwfatz9oTOu8FlVcuEb58Pt5gUZGdl8twEZ0Hne//Ovm827djVz/uk7MIK7G
	CI5cVe859lgurYWOOPloiQ2zUB224/9bn8EEo0bewbCopBtmmUey4h0DpN8hSj+sVQNzxLFv84Q
	9IeHDtghgJ6OhpBaozJNr4ZW8QdKEbP9Q5MEOaV8qov7kXjlW2+yC9emFbqAFAeGIzTs7FWakWk
	WB92Obf+67eX53IJ0XFKnaJg/4u3Uq8VOD0K3gxt/9dClgsLoSe+kZVAjmApAgJJgZVGDPvkfXY
	+YspAkDe/NTyweOsVEp05x3hPeWABnockGNwgcxBrFWgNJP5h37oBUWsFHNm+81Ysd5tUUL7Vc7
	MXaxh1Vj3cPcVoSZej
X-Received: by 2002:a05:7022:6886:b0:12a:6e97:c21f with SMTP id a92af1059eb24-12c73d32ce4mr22862678c88.0.1777301611414;
        Mon, 27 Apr 2026 07:53:31 -0700 (PDT)
X-Received: by 2002:a05:7022:6886:b0:12a:6e97:c21f with SMTP id a92af1059eb24-12c73d32ce4mr22862656c88.0.1777301610733;
        Mon, 27 Apr 2026 07:53:30 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c837f7feasm52990741c88.0.2026.04.27.07.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:53:29 -0700 (PDT)
Message-ID: <f77ebaf4-820c-4527-b2ba-8325735b2340@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 07:53:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Multiple radios/single phy - should the wiphy struct radios[] be
 set?
To: Adam Hill <sidepipeuk@gmail.com>, ath11k@lists.infradead.org
References: <CALgbQMzF65j7n+R6MEftB-uSgmxtcH4dq7tSt4Os_jnwrZirVw@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <CALgbQMzF65j7n+R6MEftB-uSgmxtcH4dq7tSt4Os_jnwrZirVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1NyBTYWx0ZWRfX6eQQvcaSTMRD
 +6YqegEAkwXjxe0ISRKnbMGU8e8le1ynbKSX5cjb/vJVc+73bvqOlm48b+a95yAChDOSxnK0N+s
 04E9rU6QuLRh0EISeZvzEs3DzIMNn/OUPfCsOxbdGQwcrfLfA64FsLOQ2xVyi3WJR6VjmjTOmFR
 XxW0f4ylTr216I3lbEsGov76fSRyNc34Yifrcepq8iHd74WSHsiyQUcqWtUnrp867nAtdFBPcL/
 Hozkb0rPFnnlde/z7PxiN/CfXiGnOa5KnznwxZCG+pjD50Ik/oHs7BAKBNK3QanXQqSyp35Hqvl
 tN4GFkXVlzxze5rWmL6SCzaBfyPcPE/WiWrhaYyn67uVb3C+h/mmaBGm2Au/npXq9NzcOlBYRG3
 g+W61u6UFFZeb7n7zmWd6lnLmpfIR9yPCvNLhJk9aqMRoKpu3/hF9sCNaJ7luk7dVUyZ5tn0k2A
 vswewQelnDTn0/fMKxA==
X-Proofpoint-GUID: sdZ8XKCOlm9o4oh3WySTS7PctoJIoXzg
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef786c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=nBfvW9Ry9FqCkJiq-wcA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: sdZ8XKCOlm9o4oh3WySTS7PctoJIoXzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_075333_295497_3D447102 
X-CRM114-Status: GOOD (  20.15  )
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

On 4/21/2026 6:35 AM, Adam Hill wrote:
> I've been trying to get a WCN6856 card working as an AP on OpenWrt (
> but using a custom kernel and build ) and was hitting a brick wall
> getting DBDC to work. I was starting from almost zero knowledge of
> Linux WiFi in general which made it harder ( and means I might be
> barking up the wrong tree ) - however, it seems that OpenWrt ( at
> least ) relies on netlink returning a radio array to detect devices
> that have multiple radios on a single phy, which doesn't seem
> unreasonable to me.
> 
> I've hacked my OpenWrt build to assume that num_channels = 2 on a
> second interface combination is the same thing ( which is what ath11k
> seems to do when support_dual_stations is true) and confirmed that the
> DBDC setup works with this mod. Shouldn't the ath11k driver be changed
> to populate the radio list the same way ath12k does? What I've done
> with OpenWrt is a bit of a hack, and who knows what else relies on
> radios being defined!

The radio array exists to support Wi-Fi 7 Multi-link operation, and since
ath11k doesn't support Wi-Fi 7, it should not populate the radio array.

Also note the WCN series of devices are tailored for mobile station usage, and
the firmware and driver are designed to model the hardware as a single
multi-band radio that is capable of concurrent operation on multiple channels.

If you want to work with OpenWrt then I suggest working with a chipset already
supported by it such as QCN9074.

I'll let Baochen add any additional observations.

/jeff

