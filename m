Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C372CA0EC4
	for <ath11k@archiver.kernel.org>; Mon, 11 Aug 2025 23:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGsgGPBgImInUSa/S/a/bgy2SN3F+qWPRbzs8M9qZRg=; b=pq1JgqE97bRGJxgmD6qC1yP0ga
	s1SvFs2+LikspPw4wkQDaTKoWleG5de6SVDIMNtmqYnoJtCC9KT393W9TO4TL+5ESq9bMF8Bei4kl
	cx66IPCr0pcSRG0DFzv0g4S8MMuMrseYgtyBdFuuJZ3LDNUr6LFPJ9Y4Vohg2TX4lsUPQhQFhDl0B
	OcDQE+GXN3qRay5zrdHd6QEm6coGiG2z/T8jfLTlSEykk/nQg0RQ7VLJ4+YV1mAWzp8p2BNwy5MH+
	rzLAHs5cgGyLHVsfpvjUAls0g99aQ9i8Q9NSYGfbB5ZhgBsv/bY/hDIeIyP0mPruIM8XPoZpeG2gm
	G7BLsUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulc2d-00000009Osn-2244;
	Mon, 11 Aug 2025 23:34:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulc2a-00000009OsG-3LyL
	for ath11k@lists.infradead.org;
	Mon, 11 Aug 2025 23:34:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BH6bwX021817
	for <ath11k@lists.infradead.org>; Mon, 11 Aug 2025 23:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGsgGPBgImInUSa/S/a/bgy2SN3F+qWPRbzs8M9qZRg=; b=UfYdKDzCVDorIY0f
	xZNFXRoF5OdEb2TIZvoEbG+JXGHeCs8yC3cGXVZjXV/DkqNoQxnzv65xisMCazu3
	2qPgnQNf5jWSzy77dWrYzEdtuOgsKksWeSQ1loWAER/fS3KbPbe2SAWupUEmpoc0
	rcHpjsbhZdutypSSa7OaAV8C8JeLMuD06levYT6geCAsouvg0yYI/WYMJ0qCSRgh
	joZBpsG7HQYGOeORFuNv57+esVD9V0VkWogsU7tlLSXRv10RjK1UEkkeMbz8lRHz
	cHPFU37LyUZcUZSfca6WlCsJDLQKkwNa04q8bWlfqxIQ+l4gIXh7gXc9wBRRv6lF
	ukYgaQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g628m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 11 Aug 2025 23:34:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76bf2f8ba3aso3964384b3a.1
        for <ath11k@lists.infradead.org>; Mon, 11 Aug 2025 16:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754955294; x=1755560094;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dGsgGPBgImInUSa/S/a/bgy2SN3F+qWPRbzs8M9qZRg=;
        b=Nq6YWr9aZw0zXhtuDt35l6ZhfF4d1rilB5wdc9/73BmMB4lMFPBw75bDYxGazKx2rR
         AOyR1zbrQlMZzpI7R1qPBmsQBbM2uwpE6LpbGCSOhLWubFsso6BTTnNcLF3mUbhSTd7V
         B9/m97a8OTAhC1EW5KouZlkx6lyKQy8U6qyo/FmFMglk9l0nyylEu8ozabkQIxhhyl/W
         ss3dBfpJUNsSEiSiyeBV+NI6I/6xAGCn7czjk7ZEyJfVbFzukg7ay348zmzNcqvq7Nhe
         wqeSRJSLhXvwYd3cM7Z0nUsOrR32XzNI2fdYb0eCrTcmszWzKfppSVmfdowYKS7PEvca
         e/Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWbhiBGjoL1nqCbT80juR4TaPQhhaA05XdYBJADKxj+XJPKBr39fDUUaXC+H3nXnAZ23NYcec0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyV/wBlbw4ckYEXEJSaUJ0NbTWPtnLysxPaCwnUf65VxYU1LXZS
	MVl2iMY4n3Dbgc6Fd5oxnAgKB/9IfJXhyj0HGk0Z9Xl0BEjfTuyhZ8FyVmBE4lcn6NYQtnkm1Sm
	sH+taRWditDTw5E1tcAl7+jy0tV9Ee9H/9rwn4lNHQ49fLMmvERqB+PSNzfoWBZ3G6uujCTBC
X-Gm-Gg: ASbGnctVga55OCeAIReyU2pK5LFzFvb0QN1Lf2v/a+cAI5p1AfSIRzbFeb8frtZutaB
	efvs/ByOVWZGJGfKJId+6tR/Pqq2h+DmcW18DfZs4VzxMVSAxUmqE2Ni/Ogho1Gp5AvQB0i/Ped
	BDR5MLQOxDHcy5yE2/UvOLBo2NBMaf69ghKXypCZn4pQlwcy9jZ3iIO3URvo0zA2agk2gL7aIdN
	m9fVq7t2HlbylApX8nBzRxOresQle/Z/05Cxc3K8p5gDKBfQA4IaNuWSBV61IS1YKDf6bElJlTu
	ywtixcKIUcqqQ6cGIQIS5VLJTRRltjuJy3v2rLawnEwEIcbBPcz+3IXf9QdsGLQuRv4mqQZzAQZ
	nsu6I3/RercSymFYrR6u3nR3z7mgH7CmB
X-Received: by 2002:a17:903:2392:b0:237:e3bc:7691 with SMTP id d9443c01a7336-242fc351ad6mr23924415ad.13.1754955294206;
        Mon, 11 Aug 2025 16:34:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcAf6wG5Jrq1BlaBArK3/b+PZCCmoqHFiS1lwy/yi8xLa5GpCpUXgaZCTQAjPMSBzhPwNRzA==
X-Received: by 2002:a17:903:2392:b0:237:e3bc:7691 with SMTP id d9443c01a7336-242fc351ad6mr23924115ad.13.1754955293808;
        Mon, 11 Aug 2025 16:34:53 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef674bsm281745595ad.17.2025.08.11.16.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 16:34:52 -0700 (PDT)
Message-ID: <5b769b75-df2a-4dba-a41b-198851b61b9c@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 16:34:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "ath11k: clear the keys properly via DISABLE_KEY"
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Steffen Moser <lists@steffen-moser.de>
References: <20250117191455.3395145-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250117191455.3395145-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689a7e1f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WobwCshsJSUAwqENw7MA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=fsdK_YakeE02zTmptMdW:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX71H14szpHlSA
 Vd+HIqlmWtv2aW7GlXyeciinSsQSsaPQGI5edyrECqKlEBCWrxBlTUJKg0fMo1vV3pe9GLm7tHV
 h5dz5bzr3ui94iXraZPk/UfdUuc4MjGJxZKKMdG4aao2BRW+lj9qkAUWx3h2fjBVBweI95Gmwzt
 7v9nobiKkisJWz8Mq6ZngR+dtfObmI9Ytn70rJi0JrJ/nD6RaLiY8o546Qa60TN0Q5w776muwdw
 QaOGQZUejGX0T0llo4DVm+Z1p+UvPoBXlBjpnjGoUFEAoLL/BtxTa79/f+fE3Z58BpUQ4EHfzKL
 eb5IBmqfPH7UGPTzidoctOquY1gNYMGLaQrifc4/fB2LPP5LyYEMInBC7cC5luLaXH/r4Z5Imkw
 dJs1OFA3
X-Proofpoint-GUID: 2w3ouxXvmNkvFn0rQD-buNs9URTQ05bu
X-Proofpoint-ORIG-GUID: 2w3ouxXvmNkvFn0rQD-buNs9URTQ05bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_05,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_163456_848368_E9042431 
X-CRM114-Status: GOOD (  10.59  )
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

On 1/17/2025 11:14 AM, Nicolas Escande wrote:
> This reverts commit 436a4e88659842a7cf634d7cc088c8f2cc94ebf5.
> 
> This as been reported by multiple people [0] that with this commit,
> broadcast packets were not being delivered after GTK exchange.
> Qualcomm seems to have a similar patch [1] confirming the issue.
> 
> [0] https://lore.kernel.org/linux-wireless/Z2Q9POuV-6MIdzRf@pilgrim/
> [1] https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.wlan_host_opensource.3.0.r24/patches/ath11k/350-ath11k-Revert-clear-the-keys-properly-when-DISABLE_K.patch
> 
> Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
> Reported-by: Steffen Moser <lists@steffen-moser.de>
> Closes: https://lore.kernel.org/linux-wireless/c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---

Can you please check if this alternative addresses the issue:
[PATCH ath-current v4] wifi: ath11k: fix group data packet drops during rekey
https://msgid.link/20250810170018.1124014-1-rameshkumar.sundaram@oss.qualcomm.com

Any Tested-on/Tested-by tags would be appreciated!

/jeff

