Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78A0CD3427
	for <ath11k@archiver.kernel.org>; Tue,  5 May 2026 15:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ME+2IvQ93Wmyp8JC+wtfoAQTygt6CnvvUExOdXpk9s4=; b=BO4Cc7mMGpXlGmTHat+b7qKKZP
	6iskHIKGmKamqmdswUZ+Fxn97bcb1ngYcStqXow89FFnbuJwCQ3u+6s5SIkOICgp6itgJJi0wwqVW
	pyvo6KBWPig1eoWKoYv05YtADAQ+fXf049yUfZ/5b+mZs/RsPthPYvEbjEzDAcsM/ZnUVBNQ61o9z
	943tOObuv/VyZh4YREHJStgeU5CIB75PseDql2zFGXovu9QSFWz8qsBbCb5L3hdRGzWbnM2s0/DwW
	wz9CWlZsZFd5psb34E4NteKDuHW7dKH1HXrMWMxak/KLWoFNZQzayBFTR1MCqz7DZnT+28V7brTrW
	44CQjpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHSm-0000000Gclq-47tF;
	Tue, 05 May 2026 15:13:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHSj-0000000GclH-3wJB
	for ath11k@lists.infradead.org;
	Tue, 05 May 2026 15:13:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645B6SFX3091492
	for <ath11k@lists.infradead.org>; Tue, 5 May 2026 15:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ME+2IvQ93Wmyp8JC+wtfoAQTygt6CnvvUExOdXpk9s4=; b=Of5DWpmUHuzUUhQ5
	WahggQvtbEdvtgJBO7dEdVI/+ut5/N3BrEpQitYJHZ+iBfsDSi25RR/hpKjpkV75
	aeTqdgCicIKDvPEyJIpwzUFLM/Wvd7Y1KcuSWqJ+ibtSSov3deMZjzUogUbRGUIe
	wdWSnqpPUpLhsCVuNtFCnrtC0mt7E+poOPAjf3m0fSV+DdjdBcxOosYhk4/yIE6n
	yFUBkytfR6b6aUydFimUJFnkXHvWpngZ+b9miGtSAtvAl4OZBrGPoIFiIF7ERp6S
	TTurndtwQtNk/magap/0V9UMnmg70fByNXB7zNibcVc8f7gi4B8jbPV4SfZRh3yV
	0roYaw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyfct0wqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 05 May 2026 15:13:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2eebb099efbso9877813eec.0
        for <ath11k@lists.infradead.org>; Tue, 05 May 2026 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777994008; x=1778598808; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ME+2IvQ93Wmyp8JC+wtfoAQTygt6CnvvUExOdXpk9s4=;
        b=OXAvNSYzJ+fDBsHMx7IjKZl99A4qLWfyfksXgBFYk9xBTz9sVWiSJV5MYNpnJxPOwY
         Xf201ukI9qdYzfCNQHbe+43LXNgeXj2UBinqEZZ8C8eCZ1ch9TwMxQwHcmwpjkG/0ner
         7XtYTfGrZdtPdAydPU+eIpFrVznOWkRZVnobFTWPRniO4NXQLFFNFDitbjYU1AoiS+Ue
         CfxgGtwQVphQQZC8r/nhyT6g8HoxXvkh3JFFRkNaJ2x9fDk+83EOLCb5rtyYi1YsTXp8
         LhlZ7VGvVYYhtXcNQ9iiVdfWMriHeYB0qLPCpJOuG0qvunYq6p6kow8YYCV2ttItipe7
         fFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777994008; x=1778598808;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ME+2IvQ93Wmyp8JC+wtfoAQTygt6CnvvUExOdXpk9s4=;
        b=KDwdjlzXX3l4sksAxnDYrIHYR5pXkLUJz3dhS1NbwmT17TIrcFftlhzoF0hW3Pot5C
         MyxYV4RTGlBxpgAoPyCnbp6QDvRvrMO65xGZRPUrGk4yzsvh/4DQVytnpq18/ePjS1AN
         apr0T+Lxb24KBqnop0b9WivJk+WIpEis/UezypjRo54cwikOQMZctdO6/wZhF8IQEKRV
         nfBankVyBJUhVYz/yoY9CMDHMlk0geVggzrkOJh9uNd6VUVlrHH32i5qFFAAGysz56Ax
         O4j7bSUt6gFBfsPqdVcIsIVIuSVSTaT0HXCNhM0FhEGJPz7wUaU50TdF4xh9rtedmBSk
         MVGQ==
X-Forwarded-Encrypted: i=1; AFNElJ95u705uZE4u3BnM3V/5C2JPOMX54ZNRoBL+nmRezkmHvEg/cFek2a4F6jxXcfqX/S79Jq33Dg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1pC1uQP2z3zkFQy1JU54bAMxqsoDBAyNXlbXikhYJaVjKbDij
	RwOa/S0UChE9Pl84Mema43w6YvOaOUpA+Vcfi9kP5buNfbLzJNtfJ+MjJ6TbvgCRU7FNk1q0LG2
	wDFnIj2o7yq26nYB0wdn5WWSm+EXT5xoNo/cxhCtlSFI5FpzJ2aiztRf7KTDFiBTL
X-Gm-Gg: AeBDievTgMNyDIG3Yo+/uDLknB9JP18gfkgc8kPRSm9vcK2iwaju2cuuFQQfzq6ePpA
	fPsEomATOh1Fw0vnB3Px+/DvhjMWHCCJ4PZlUUEPghENd4+BYiCXYcOwXiOwYv9x/+3fcyQfHSf
	jMCUzz8Q0MZwgKe0Ubu4fnqqeIeDJdcbU1VUb8IlEHl5uHrVqWviKsvlZ8XOeJWI0pFv1xpuINL
	QV/cZu+3Vmsz+zPTNqh9rVQ0fNjdD0fpp5KQstnzH/D/qxydBA3YTk/B+nsWF9v326lbFo8CDW4
	wDQSFWGycM9JSemTBCQUX2lQwhgUOR708jknK7MrK8aqi9ywCKjrkxofqeRaP0GPaOd/TeY7iM4
	icRYtGLkDH380lUsC0rLiEbGHuQkRqNFtrmkv1/EsmhUdKIEjAydsGbnq5v1BJCu0s4aWRaD+V6
	PZwoLMmZpERcvDTjZO
X-Received: by 2002:a05:7022:41a1:b0:12c:14df:a510 with SMTP id a92af1059eb24-12dfd849895mr6057474c88.28.1777994008501;
        Tue, 05 May 2026 08:13:28 -0700 (PDT)
X-Received: by 2002:a05:7022:41a1:b0:12c:14df:a510 with SMTP id a92af1059eb24-12dfd849895mr6057450c88.28.1777994007948;
        Tue, 05 May 2026 08:13:27 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8288c07sm21714530c88.6.2026.05.05.08.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 08:13:26 -0700 (PDT)
Message-ID: <693b4d59-d92f-4c07-b060-1c520419e181@oss.qualcomm.com>
Date: Tue, 5 May 2026 08:13:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix use after free in
 ath11k_dp_rx_msdu_coalesce.
To: Willmar Knikker <willmar@met-dubbel-l.nl>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260505143025.234292-1-willmar@met-dubbel-l.nl>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260505143025.234292-1-willmar@met-dubbel-l.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dv9j4eotLvYpaVBE5aWusnOgbMQQhIsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE0NiBTYWx0ZWRfX5hA7zYbA7C8x
 oO/4n/ErIHjkjuq1mHlI5HC/tjHeIYM0lBVMWA1EVKiqsd8tAWxUwvaB/6CtsBm0g+1GOOrTnbr
 vdWB89MzZPSBmoZYah2kbJvvF4uyiSma7xx33ewR2269AOhvJ8kbuqrSLDQrG57D37vd7lc/ksA
 7aLROjp4Y9BPahhgZtNcPU7r9uPHetl3N8koDUrn7FTL3XpchukIKsCOEPHrEj6ekhnbAkDJq/s
 NWo5G/jwWt39uxIO6d+pwkIKdpyFy5s6cVvXxuuftSRe4kn7y7CtlHdzBPOdnSqB0g0GxDXi6mJ
 1MmWmMo/YueBBuo036XgnK/YsnAxpgjvu0rRAN6vu1cWsok6aexabAD598E126IEtTCL1SxSd+i
 cchAv6WSbDo33Sm0laY1H5anqoUfAPeTam536nd/drM9wsLurQx+LO1xnyTH+eDzpJ/or6BtY6e
 Y4bVrn4fjuzlybYUjuQ==
X-Proofpoint-ORIG-GUID: Dv9j4eotLvYpaVBE5aWusnOgbMQQhIsn
X-Authority-Analysis: v=2.4 cv=NtXhtcdJ c=1 sm=1 tr=0 ts=69fa0919 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=9B1uR9gGAAAA:8 a=ZjWAlqguhnwxBXe5j8wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=8R3p93Tjo66ouot214C2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_081330_011003_129357EF 
X-CRM114-Status: UNSURE (   9.45  )
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

On 5/5/2026 7:30 AM, Willmar Knikker wrote:
> In ath11k_dp_rx_msdu_coalesce the loop uses ->is_continuation after
> the dev_kfree_skb_any. This can cause a use after free kfence.
> 
> Move the use after the dev_kfree_skb_any after use of ->is_continuation
> inline with the while in the while loop above this one.
> 
> Signed-off-by: Willmar Knikker <willmar@met-dubbel-l.nl>

This issue is present since day 1...

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")


