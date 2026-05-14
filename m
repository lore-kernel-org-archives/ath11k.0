Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F18CD4851
	for <ath11k@archiver.kernel.org>; Thu, 14 May 2026 06:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wz6dvE8LGwOUZGMUJOvXpxjfIIF55LCZblzwZIa6w8s=; b=1YpHLhw4xRLTby1vKRXuWqK7iD
	VzbGxBax/HXH4mPedtwWw6jc7viGt67hWoBrKRCp8rZ9X4w8F7/Lf8+fUVcMss5ol6JNFn9LcT5rG
	Nkog4GMQe/VSIOiDjKYNl4qqewT0F24B5rX0IE2/8cPZZxea6Tg8k16jP8MG9tB4fO1PRKaWxw8Ot
	URRnJxgsjYXgDYOo4zMp6D8LbvU/Fcv9FO5usEOrfSe10+3GEiugPueeYoMK0XfCrHTTVUuz3VDGA
	5mli8RgXT6vx/l6TwNXdyfE2efICCsWLlP/SXm+EIqa1OFj3ch03rJHCXiRVFT+qobBM3Pk14M1bZ
	0AXI5tVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQ0K-00000004ljo-0653;
	Thu, 14 May 2026 06:57:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQ0I-00000004ljM-1lDw
	for ath11k@lists.infradead.org;
	Thu, 14 May 2026 06:57:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E6Yiwn360349
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 06:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wz6dvE8LGwOUZGMUJOvXpxjfIIF55LCZblzwZIa6w8s=; b=oiF7XGDW2xjVtxEZ
	jc1sy6T1dwL2hkP+Ln27H09ExZVGJCKp5/9oRr6Zz8Ra/CE57av6cASdYeA59OHz
	p2Rzn2YxE25Qw6sYgX2oQmefoWbno5GZIlKr8v0sgJQ1po3uuFK1APu9sJg6jlzR
	oT0M8W1Dv/e001ZBy9MxPuuOuRdLE3aXyBLXy1cUQqDY3CsfDxb2fAP1P/OHrDIo
	omAhBtL1/w2kvf6S5BHwGH2blHqNC/JsFlcVlvA18EEy5m5jD9+7rTyhA5lX20p8
	KeVO2nnP24PIgJkmjYm7jMrxq5bb++hjJVg/0hyfs8L7vuZUrRW2L8ltXL5w2q89
	n8MnEw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513g9gp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 06:57:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd00a65673so26376525ad.1
        for <ath11k@lists.infradead.org>; Wed, 13 May 2026 23:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778741825; x=1779346625; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wz6dvE8LGwOUZGMUJOvXpxjfIIF55LCZblzwZIa6w8s=;
        b=ShuuSlh2eUGc2IdjQhox6FYd7KSKhBkRWEJKJdQxS9jp8Clm2ETjdZ+Jg1I6XtG2Oh
         xdx3ditumW8azjOEq/W7YMVq/U0pwKggpLYYNL3Qa0hL+66949KqlC6zBRuoDOfCbYAB
         rwjicGEfy13/qKMApRjjdQFyXemnzm/WA2l3WssdnH2CHc0ZxAk0BR7NokFA6FrRddKb
         C4TpnShMfyu7Nu705lLFRiVxd12dBLmAQpGBgjFMlQ00ZhVXZjkWBdx9jMbB/g1y3FWI
         mAhnXYw3ni8yHpkMgRi497KR+RW82hsbEcl3yaMYeh/GBGkcpIhU/P0Jvgj3Bv0EKmSi
         KEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741825; x=1779346625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wz6dvE8LGwOUZGMUJOvXpxjfIIF55LCZblzwZIa6w8s=;
        b=CGtI/VJFud6IJR9PXjkCixQCkWVx9gZrfff+0mlEdScte+q4xmY1j2WzbMTq+hEn5N
         eX+LjABFdpS1rMnDSCxsC/VKKlaJX6JQDlsbLrtiIMKKts2b3DiXi5g3eMt6+Lgeqq1G
         8eiA8COFQATv3+pujdPxMcGq3RGLZkRZEJvcrZHPPVscNlUMW36rbsoi0l2x7JlMvqAP
         5KScelyLlvC0+hQTxm4UZKUs4Vi03FmkMmcQRQ14WoKtEbgkk+u53x0eicK9UFj8rKVA
         C+VCV6BvGRi++55nE/yBtCFTtijHLS7ZNtLDUEBZgeI54s7HFjw3tkQ4Ookeukm1twze
         7zQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/I92uDBeilm4kr3k/TDDwPBMCxN7CP8QSFYfudxn1Zkk1vc0rjc8tvraQMsYZ9q4Lg8M+uC6U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWRDIl/feiNkuta1gPr1djizJOuLmH7g1++No5qgP31eb6f4jF
	kE9uYSKoMBxggS+7RsOiNFe5e5XoZyVF6KiZP7VPETwQr0uiginjtDsrvRIokVYRh/RSey1gTm2
	EP/0KNZcEWM4we97uG7WqpPGLpUmQR11a9w2L+m36mqIZLEto5gKUKv3QyVUjr0vI
X-Gm-Gg: Acq92OHNX94JSbB/vLE4eYwkDA6fi+daSBNS4udCqU+gyEearhGGAMcbSi54xT43rPI
	GjONc9WXuM/eGHeZ9ZFCsx2Yp113K1tuVWkQ7qe8mo8iNjEfbh8zKYeJ6o+oJaTnOE+BeNOx9Oz
	fEHhlGS+MPlkV8mTTxo/+s327C4P9VwmxEj0Gy5Pi7xZH/F5WGtKb2HmgDenS7GsnV62c96K+FW
	yHc85kzgKywNWyctgmg1ShxWhhgNlo8luELcFyWSEFzBYkOnxPBDg4iPJp3Q8oLgfic+bi3qygc
	7HJ+aucwK2HTk1vL0LA5qG2UJsPectwAUmoqXov2NX4hSJnnQTFSetjsMm4cE567d3Gewkg0Ea3
	Rv2MtBvVIDjCe0bTyf+fu8cnJoTcPUoXSI1Dd9oOpqtd/6FRiLj54DJ6dMj/31Q==
X-Received: by 2002:a17:903:2ecd:b0:2bd:3c21:a053 with SMTP id d9443c01a7336-2bd5283e0c5mr21138805ad.24.1778741824882;
        Wed, 13 May 2026 23:57:04 -0700 (PDT)
X-Received: by 2002:a17:903:2ecd:b0:2bd:3c21:a053 with SMTP id d9443c01a7336-2bd5283e0c5mr21138275ad.24.1778741823967;
        Wed, 13 May 2026 23:57:03 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb062695sm1283497a12.4.2026.05.13.23.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 23:57:03 -0700 (PDT)
Message-ID: <c20aee84-d9a1-432c-9cf4-f5fb2219c966@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:26:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260420110130.509670-1-jtornosm@redhat.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260420110130.509670-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2NyBTYWx0ZWRfX6zuFSzv/qPcK
 U0iiqXvywwPNQFWfpseEzg3ucAXMrZtZwfUCtBHzZisyzZrO63c3lJGe4RG6rH5eBjUIRm35H/8
 8zMgVil9q5JCdvNV4UIfOGxLIUO6P9aIaOEoWoJC2KhYVnZ4GH1b5JbttANr6dqqakdspEKWbE5
 6vh09F3y7GKv41qR8Y7tzU3gmSkm1+cwQuW922yhAcABn1EHaVsjjA2BH+t4HsBPbC43lzzs9yG
 2NMx3iHHiv2/1rdDkWIX5Od2Dm0jMkW5trqWLgLmA6KNhtfBB+lub6B4tdA2fFUsyjfkHxahkzr
 rbLxJpr2z9o1JyBNmAKD15v3vE7wcpsu7i6NbiM8mIaJDWv5bjMDIu9rQaqEgntr6FycvjKendt
 W7KLqwNkmk4pES9ka3uA4xNLm6Ri4SbVPfRiEDZFxEP1m4UQCm8KD5kv7fNANOVX/NuykpFbL4m
 jPhqmXUmjsY1xL6ni8Q==
X-Proofpoint-ORIG-GUID: -OlNcQxDzFZxHxYyFmA20cl9rCkfb6Bp
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a057241 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=qhnAyV4-s4WfS2nNwg8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: -OlNcQxDzFZxHxYyFmA20cl9rCkfb6Bp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_235706_468475_9983FCEE 
X-CRM114-Status: GOOD (  13.69  )
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

On 4/20/2026 4:31 PM, Jose Ignacio Tornos Martinez wrote:
> If there is an error during some initialization related to firmware,
> the buffers dp->tx_ring[i].tx_status are released.
> However this is released again when the device is unbinded (ath11k_pci),
> and we get:
> WARNING: CPU: 0 PID: 6231 at mm/slub.c:4368 free_large_kmalloc+0x57/0x90
> Call Trace:
> free_large_kmalloc
> ath11k_dp_free
> ath11k_core_deinit
> ath11k_pci_remove
> ...
> 
> The issue is always reproducible from a VM because the MSI addressing
> initialization is failing.
> 
> In order to fix the issue, just set the buffers to NULL after releasing in
> order to avoid the double free.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

