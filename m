Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE06D39000
	for <ath11k@archiver.kernel.org>; Wed, 14 Jan 2026 17:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEpuz/P8ogVHyM9urkTZue07YsEhKr5wbkRm7Jdp7Vo=; b=MnFJ/8CgDohc5lSgxLJw8N7L/1
	M3GZ6TtUqcdCAM2tMNqCJ7pA70YX54ueoJ8CRraC2q6agXJG6ddld7KLnyKNUph1gMlBhtyBzUUyC
	O9xGE7guyH9bbLc7qQMVGo9ZoIcnU8N+6nufjH0pwtqJ80DmsyLSjI+bW3JIyUoaGp5lIkWRi+8gs
	GgzC6nUD3HgvWiZ0RMG0i4/LN7lwrX82MbRL3rsNj+hc5npU6INPm9rVCBVQOCPWF28GN+LihYEgP
	qyU5WSEMZtKQDhfmZyp71JbFKOFikl7mZb77eqxc894M1GoewYU3tiBPiRjE5Lp2ErCPL4wBlf9w3
	+byotbbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg51Q-0000000ADFS-07Lp;
	Wed, 14 Jan 2026 17:51:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg51M-0000000ADD9-3JVP
	for ath11k@lists.infradead.org;
	Wed, 14 Jan 2026 17:51:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EEJxtU2081760
	for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 17:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEpuz/P8ogVHyM9urkTZue07YsEhKr5wbkRm7Jdp7Vo=; b=gmgL+lK3KszhCY5E
	qFNPzBhDI+duHbKtpNnxGSIl1bYFgVgSsGEuMacg/B8a8kYn1En/t9o2jegQsCkZ
	OkQ5GLj762nSpe1NJsVcwQi+ZlsGZLb5W8rZm2Rjzxij7p/8yumhlp7ruq6+8Hms
	uHbvC72tfSAzcIpOZlnnSn8ckNJIP2y6qtVG5TxnynrpaEAqZB0h3vO0DXvOxbkg
	uBbTWYulu0YuPeSwFaFfKCIE9p7YFI1wK2TT7LQZDKPoWIQ98HAwZu3rB2a7cBIb
	IvQrBsK8ZFmV53wpfC12TJ2U6ScR959nqLjOP0F243Ua4EZ/7kxUoxoBBgcjuLtg
	cCPzeg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58vhp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 17:51:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b0531e07e3so105116eec.1
        for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 09:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768413063; x=1769017863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEpuz/P8ogVHyM9urkTZue07YsEhKr5wbkRm7Jdp7Vo=;
        b=SM0l2ZGad2I2vwunszKdGabHGs7qq2uO/UH+mSEDLIx6He9L5YKsrfk6M+XnE5EHOH
         xBxcJ7v9ttYLJAWOz+iYd3pwEmbj/gfld2S7OvtydzuiiRmZ27yH+MZhEZE2s1kMZpit
         YM2rPt1OhgF0RvAOKGLdQwOoUreVfN7S58t2rE/5vV7aGR2yPK8y7jjBFgfKmRzZo9PH
         7+GHGtYvAd/Obo6OjYwX9/wPS8QsupJvMqNi8bh+RPUjIf5jeH/cJkl3DtG/+JK07Lmr
         9LH1g1KpikqHgKYdgKPlxzVZMCDhYaMTMvZeADilRiOm5cRFoAtZ6AfQqTMTmpVrWCzh
         Xefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768413063; x=1769017863;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEpuz/P8ogVHyM9urkTZue07YsEhKr5wbkRm7Jdp7Vo=;
        b=vpVHIqqnYMBXE1V5AEtGYHTzqLqqkIQ5moqMa3HOunVJjEVq/8nb/xaKfxh5qTAa79
         jS90piOAJsnfw4H9vFuVX8mnIvBvz/dZtWdC63x+JshSjvN8yU5sn0TantQcF2xDviZG
         f9YruigBzo1tECoWmnzpSf04JPAuZr2S0zVAw3eLQOfxAzsjEFRUsFKsSv1ZkiC3jMoZ
         7rAoguFk9ReLa9l64Fl7QdzAHQ0m1RE8V39gEJZOwsUhSTmJ337xX8lNIC7aZl9GXwSG
         Yh3/upfx3aj0MiXmbgKLsPbdwT6mRv0IEywAk0dNQ5vr/MPldcyo1BLsWd+DIKNAmZSb
         zM9w==
X-Forwarded-Encrypted: i=1; AJvYcCW17DHJpcS6eO6AOepw3vcJPef1t+wEdwE8q2PpakBanIdJQhJwlm4ZAYJs0nzNl9J9xXfT19A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzYFIv8I3yR2FoePdimJqfTvrDm+5pmylQtxgziAXpX0i7ltiR
	u8HIefOJWHOJF5zRs/j54gHrq86yhSDkCe/bM7LgxWMUY8L3egVD0sSQ4pUEVXhcL3Fyw4DCYw5
	gg4VSTYshr9GfRbRsK5pQTaeMTBSaBD3uoVk1PLGkqL8RFiyH/BFs9JuCUd8xIGay
X-Gm-Gg: AY/fxX6Q6pEw4W6IRqhmXdTv3BXn+9QP29LwhzfUaiVEEETPK/n1GPQrHkn8nABAm9m
	LyF6Qhl2Z5sSs1utD46hUblFJ7kACssI6BchZSAfG0N1U6n0Rh9UHmZeQK1DCqDiloBi/7xVwBu
	kFx+C5snoSVgXeMc/AJLdd5nZXgFhztjxiylmK1LNeZ6+CZflP/VTYn3XRgZ7U8wvJZlnz/e3zM
	kC08d+KOH2bbL0qwUkwQta22CSK3FS5pl/VrCFEHFTzvzlEIKnE8bpuHqIzxabjpLPJwBlO3dNd
	zdrotWgm9ylOZb4VHGGXA5OLO7u/ZSrWbIWmSot7q+153lH43P7amJLv4pAkscZKQBlUT1CwAyA
	cVm+NakmKOaS0n845JHp7q4nsm+c5wGp75M9vYr8skFj8LOsAFfG/oWtp7NPIXO1pcubxiw==
X-Received: by 2002:a05:7300:5388:b0:2b0:5306:1773 with SMTP id 5a478bee46e88-2b486b72cfamr4211575eec.1.1768413063448;
        Wed, 14 Jan 2026 09:51:03 -0800 (PST)
X-Received: by 2002:a05:7300:5388:b0:2b0:5306:1773 with SMTP id 5a478bee46e88-2b486b72cfamr4211533eec.1.1768413062713;
        Wed, 14 Jan 2026 09:51:02 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673b2esm20529879eec.6.2026.01.14.09.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 09:51:02 -0800 (PST)
Message-ID: <e78d25d8-8741-4061-ac9c-606f3654b98f@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 09:51:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260113
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <98386125-c0bb-495e-b2ba-2765aaed19d8@oss.qualcomm.com>
 <33d998cc225a7aeef4731ebc53c28a32b241ca7e.camel@sipsolutions.net>
 <f12c186c-c76a-4d39-8591-4c8d7d04d307@oss.qualcomm.com>
 <22746c254c4c43561e2e3deaf49dadf7c57dae17.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <22746c254c4c43561e2e3deaf49dadf7c57dae17.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE0OCBTYWx0ZWRfX2MuyFeN1lg/a
 yasuWve7Wyx/udlDTO+vrW4rZO5B9yeE4J3iJ3QDHctqydEphBBdRPDd1KNRu/2g6rsXlD73zG4
 J8xMcODXlRI7wNHVsEhTBP6q7Bd/jzLPeYHmjN1PUksHPyjxvT121LHv7FqOZm1TMzc/8nhE5dQ
 DEHQI7WbWZvjMe853w2Fld+AOIaj+nf5VkTJX+VzRa0v2x3qGu1vnh2hl7kUa5YZmwgJSwFZ8PC
 9GjfpGWXFLtZKHw9RxNMbG+eOA/agyva5RH3LOXGCTHUEjAsTATGKP4BTnWn2X5gGaOP+1/qEWy
 MCjLW4vrcokPL/vnpbBnn84ixO+Wf2c5possdc4pQUJHvsD9RZBm4YupBqgoDo683X2BkXCbLZI
 uNqCJcjbpXitLB6vpSvVluQ48muPDggZXOG5ycq3+uGnmmXwEpBN6UX3dlViwNCP+EMXMuAMFBS
 xterflQH6iM32DMLCWA==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6967d788 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iu6Z6aglds9mpAdrEcIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: fsX34gtzBSVEy_4MJMox__JipVGW57_v
X-Proofpoint-GUID: fsX34gtzBSVEy_4MJMox__JipVGW57_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_095104_854833_CFA37529 
X-CRM114-Status: UNSURE (   6.02  )
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

On 1/14/2026 9:08 AM, Johannes Berg wrote:
> Do you just want to redo it? I don't mind backing it out, nobody pulled
> my tree yet I'd think?

My opinion is to leave it as is.
let's not add extra work unless netdev or Linus says otherwise :)

/jeff

